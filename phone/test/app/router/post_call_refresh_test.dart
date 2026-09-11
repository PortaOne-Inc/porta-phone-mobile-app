import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/app/router/post_call_refresh.dart';
import 'package:webtrit_phone/features/cdrs/cdrs.dart';
import 'package:webtrit_phone/features/user_info/user_info.dart';
import 'package:webtrit_phone/services/services.dart';

class _MockUserInfoSyncWorker extends Mock implements UserInfoSyncWorker {}

class _MockCdrsSyncWorker extends Mock implements CdrsSyncWorker {}

class _MockPollingService extends Mock implements PollingService {}

class _MockPollingTaskHandle extends Mock implements PollingTaskHandle {}

class _FakePollingRegistration extends Fake implements PollingRegistration {}

const _postCallDelay = Duration(seconds: 1);

/// The owners are `final`, so the shell composition is exercised with real
/// owners over a mocked polling service: the request must reach each owner's
/// own task as a deferred invalidation.
void main() {
  setUpAll(() {
    registerFallbackValue(_FakePollingRegistration());
    // `any(named: 'after')` below matches a Duration argument.
    registerFallbackValue(Duration.zero);
  });

  late _MockPollingService pollingService;
  late _MockPollingTaskHandle userTask;
  late _MockPollingTaskHandle cdrsTask;
  late _MockUserInfoSyncWorker userWorker;
  late _MockCdrsSyncWorker cdrsWorker;

  _MockPollingTaskHandle handle() {
    final task = _MockPollingTaskHandle();
    when(() => task.isRegistered).thenReturn(true);
    when(() => task.state).thenReturn(const PollingTaskState(phase: PollingTaskPhase.idle));
    when(() => task.states).thenAnswer((_) => const Stream<PollingTaskState>.empty());
    return task;
  }

  setUp(() {
    pollingService = _MockPollingService();
    userTask = handle();
    cdrsTask = handle();
    userWorker = _MockUserInfoSyncWorker();
    cdrsWorker = _MockCdrsSyncWorker();
    when(() => userWorker.dispose()).thenAnswer((_) async {});
    when(() => cdrsWorker.dispose()).thenAnswer((_) async {});
    // Each owner registers its own worker and must get its own task back.
    when(() => pollingService.register(any())).thenAnswer((invocation) {
      final registration = invocation.positionalArguments.single as PollingRegistration;
      return identical(registration.listener, cdrsWorker) ? cdrsTask : userTask;
    });
  });

  UserInfoSync userInfoSync() {
    final sync = UserInfoSync(
      worker: userWorker,
      pollingService: pollingService,
      interval: const Duration(seconds: 10),
    );
    addTearDown(sync.dispose);
    return sync;
  }

  CdrsSync cdrsSync() {
    final sync = CdrsSync(worker: cdrsWorker, pollingService: pollingService, interval: const Duration(seconds: 10));
    addTearDown(sync.dispose);
    return sync;
  }

  test('with call history enabled, a finished call refreshes both the history and the user record', () {
    final refresh = PostCallRefresh(userInfoSync: userInfoSync(), cdrsSync: cdrsSync());

    refresh();

    verify(() => cdrsTask.invalidate(after: _postCallDelay)).called(1);
    verify(() => userTask.invalidate(after: _postCallDelay)).called(1);
  });

  test('without call history, a finished call still refreshes the user record', () {
    final refresh = PostCallRefresh(userInfoSync: userInfoSync());

    refresh();

    verify(() => userTask.invalidate(after: _postCallDelay)).called(1);
    verifyNever(() => cdrsTask.invalidate(after: any(named: 'after')));
  });

  test('repeated call endings request one deferred refresh each, leaving debounce to the task', () {
    final refresh = PostCallRefresh(userInfoSync: userInfoSync(), cdrsSync: cdrsSync());

    refresh();
    refresh();

    verify(() => userTask.invalidate(after: _postCallDelay)).called(2);
    verify(() => cdrsTask.invalidate(after: _postCallDelay)).called(2);
  });
}
