import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:fake_async/fake_async.dart';
import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/repositories/user_info/user_repository.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../mocks/fake_connectivity_service.dart';

class _MockUserLocalDatasource extends Mock implements UserLocalDatasource {}

class _MockUserRemoteDatasource extends Mock implements UserRemoteDatasource {}

const _cachedUser = UserInfo(
  numbers: Numbers(main: '1000'),
  balance: Balance(amount: 10),
);
const _updatedUser = UserInfo(
  numbers: Numbers(main: '1000'),
  balance: Balance(amount: 20),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockUserLocalDatasource local;
  late _MockUserRemoteDatasource remote;
  late UserRepository repository;
  late UserInfo? cached;

  setUp(() {
    cached = _cachedUser;
    local = _MockUserLocalDatasource();
    remote = _MockUserRemoteDatasource();
    when(() => local.getInfo()).thenAnswer((_) => cached);
    when(() => local.setInfo(_updatedUser)).thenAnswer((_) async => cached = _updatedUser);
    when(() => remote.getInfo()).thenAnswer((_) async => _updatedUser);
    repository = UserRepository(localDatasource: local, remoteDatasource: remote);
  });

  test('refresh waits for persistence before publishing and completing', () async {
    final persisted = Completer<void>();
    when(() => local.setInfo(_updatedUser)).thenAnswer((_) async {
      await persisted.future;
      cached = _updatedUser;
    });
    final updates = <UserInfo>[];
    final subscription = repository.getAndListen().listen(updates.add);
    addTearDown(subscription.cancel);
    await pumpEventQueue();

    var completed = false;
    final refresh = repository.refresh().then((_) => completed = true);
    await pumpEventQueue();

    verify(() => local.setInfo(_updatedUser)).called(1);
    expect(completed, isFalse);
    expect(repository.getLocalInfo(), _cachedUser);
    expect(updates, [_cachedUser]);

    persisted.complete();
    await refresh;
    await pumpEventQueue();

    expect(repository.getLocalInfo(), _updatedUser);
    expect(updates, [_cachedUser, _updatedUser]);
  });

  test('initial refresh populates an empty cache and its waiting stream', () async {
    cached = null;
    final updates = <UserInfo>[];
    final subscription = repository.getAndListen().listen(updates.add);
    addTearDown(subscription.cancel);
    await pumpEventQueue();
    expect(updates, isEmpty);

    await repository.refresh();
    await pumpEventQueue();

    expect(repository.getLocalInfo(), _updatedUser);
    expect(updates, [_updatedUser]);
    verify(() => local.setInfo(_updatedUser)).called(1);
  });

  test('equal remote data completes without another write or stream update', () async {
    final unchanged = UserInfo(numbers: _cachedUser.numbers, balance: _cachedUser.balance);
    when(() => remote.getInfo()).thenAnswer((_) async => unchanged);
    final updates = <UserInfo>[];
    final subscription = repository.getAndListen().listen(updates.add);
    addTearDown(subscription.cancel);
    await pumpEventQueue();
    clearInteractions(local);

    await repository.refresh();
    await pumpEventQueue();

    expect(repository.getLocalInfo(), _cachedUser);
    expect(updates, [_cachedUser]);
    verifyNever(() => local.setInfo(unchanged));
    verify(() => remote.getInfo()).called(1);
  });

  for (final failureSource in ['remote', 'persistence']) {
    test('$failureSource failure preserves the original error and cached stream, then recovers', () async {
      final error = Exception('$failureSource failed');
      final stackTrace = StackTrace.fromString('$failureSource failure origin');
      if (failureSource == 'remote') {
        when(() => remote.getInfo()).thenAnswer((_) => Future<UserInfo>.error(error, stackTrace));
      } else {
        when(() => local.setInfo(_updatedUser)).thenAnswer((_) => Future<void>.error(error, stackTrace));
      }
      final updates = <UserInfo>[];
      final streamErrors = <Object>[];
      final subscription = repository.getAndListen().listen(updates.add, onError: streamErrors.add);
      addTearDown(subscription.cancel);
      await pumpEventQueue();

      await repository.refresh().then<void>(
        (_) => fail('A failed refresh must not complete normally.'),
        onError: (Object actualError, StackTrace actualStackTrace) {
          expect(actualError, same(error));
          expect(actualStackTrace, same(stackTrace));
        },
      );
      await pumpEventQueue();

      expect(repository.getLocalInfo(), _cachedUser);
      expect(updates, [_cachedUser]);
      expect(streamErrors, isEmpty);
      if (failureSource == 'remote') verifyNever(() => local.setInfo(_updatedUser));

      when(() => remote.getInfo()).thenAnswer((_) async => _updatedUser);
      when(() => local.setInfo(_updatedUser)).thenAnswer((_) async => cached = _updatedUser);
      await repository.refresh();
      await pumpEventQueue();

      expect(repository.getLocalInfo(), _updatedUser);
      expect(updates, [_cachedUser, _updatedUser]);
      expect(streamErrors, isEmpty);
    });

    test('$failureSource failures engage polling backoff and success restores the base interval', () {
      fakeAsync((async) {
        final error = Exception('$failureSource failed');
        final stackTrace = StackTrace.fromString('$failureSource failure origin');
        var requests = 0;
        when(() => remote.getInfo()).thenAnswer((_) async {
          requests++;
          if (failureSource == 'remote' && requests <= 2) Error.throwWithStackTrace(error, stackTrace);
          return _updatedUser;
        });
        when(() => local.setInfo(_updatedUser)).thenAnswer((_) async {
          if (failureSource == 'persistence' && requests <= 2) Error.throwWithStackTrace(error, stackTrace);
          cached = _updatedUser;
        });
        final connectivity = FakeConnectivityService(initialConnected: true);
        final polling = PollingService(
          connectivityService: connectivity,
          options: const PollingOptions(jitterRatio: 0),
        );
        final task = polling.register(PollingRegistration(listener: repository, interval: const Duration(seconds: 10)));
        addTearDown(polling.dispose);
        addTearDown(connectivity.dispose);
        async.flushMicrotasks();

        expect(requests, 1);
        expect(task.state.phase, PollingTaskPhase.failed);
        expect(task.state.error, same(error));
        expect(task.state.stackTrace, same(stackTrace));
        expect(repository.getLocalInfo(), _cachedUser);

        async.elapse(const Duration(seconds: 19));
        expect(requests, 1, reason: 'the first failure delays the next request by 20 seconds');
        async.elapse(const Duration(seconds: 1));
        expect(requests, 2);
        expect(task.state.phase, PollingTaskPhase.failed);

        async.elapse(const Duration(seconds: 39));
        expect(requests, 2, reason: 'the second failure delays the next request by 40 seconds');
        async.elapse(const Duration(seconds: 1));
        expect(requests, 3);
        expect(task.state.phase, PollingTaskPhase.succeeded);
        expect(repository.getLocalInfo(), _updatedUser);

        async.elapse(const Duration(seconds: 9));
        expect(requests, 3);
        async.elapse(const Duration(seconds: 1));
        expect(requests, 4, reason: 'recovery restores the 10-second base interval');
        expect(task.state.phase, PollingTaskPhase.succeeded);
      });
    });
  }
}
