import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/features/user_info/user_info.dart';
import 'package:webtrit_phone/repositories/repositories.dart';
import 'package:webtrit_phone/services/services.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockPollingTaskRunner extends Mock implements PollingTaskRunner {}

void main() {
  const info = UserInfo(
    numbers: Numbers(main: '555002'),
    aliasName: 'User 555002',
  );

  late MockUserRepository userRepository;
  late MockPollingTaskRunner syncRunner;
  late StreamController<UserInfo> updates;

  setUp(() {
    userRepository = MockUserRepository();
    syncRunner = MockPollingTaskRunner();
    updates = StreamController<UserInfo>.broadcast();
    when(() => userRepository.getAndListen()).thenAnswer((_) => updates.stream);
    when(() => syncRunner.runNow()).thenAnswer((_) async {});
  });

  tearDown(() => updates.close());

  UserInfoCubit build() => UserInfoCubit(userRepository, syncRunner: syncRunner);

  test('the record keeps arriving through the repository stream', () async {
    final cubit = build();
    addTearDown(cubit.close);

    updates.add(info);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.userInfo, info);
  });

  test('refresh runs the shared polling task and reports success', () async {
    final cubit = build();
    addTearDown(cubit.close);

    expect(await cubit.refresh(), isTrue);
    verify(() => syncRunner.runNow()).called(1);
  });

  test('refresh reports a failed cycle without escaping the cubit', () async {
    when(() => syncRunner.runNow()).thenThrow(StateError('task was unregistered'));
    final cubit = build();
    addTearDown(cubit.close);

    expect(await cubit.refresh(), isFalse);
    verify(() => syncRunner.runNow()).called(1);
  });

  test('refresh stays pending until the polling cycle completes', () async {
    // A pull must not report success before the task has actually run;
    // an early return would close the indicator on a fetch still in flight.
    final cycle = Completer<void>();
    when(() => syncRunner.runNow()).thenAnswer((_) => cycle.future);
    final cubit = build();
    addTearDown(cubit.close);

    bool? result;
    unawaited(cubit.refresh().then((value) => result = value));
    await pumpEventQueue();
    expect(result, isNull);

    cycle.complete();
    await pumpEventQueue();
    expect(result, isTrue);
  });

  test('a cycle that fails asynchronously is reported as false, not thrown', () async {
    when(() => syncRunner.runNow()).thenAnswer((_) => Future<void>.error(StateError('backend unavailable')));
    final cubit = build();
    addTearDown(cubit.close);

    expect(await cubit.refresh(), isFalse);
  });
}
