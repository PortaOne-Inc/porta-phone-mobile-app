import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/repositories/user_info/user_repository.dart';

// Store-level behaviour only. The fetch-compare-store cycle and its failure
// and backoff handling belong to UserInfoSyncWorker, which owns the refresh;
// they are covered by test/features/user_info/user_info_sync_worker_test.dart.
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
  setUpAll(() => registerFallbackValue(_cachedUser));

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

  test('getAndListen replays the cached value, then every stored update', () async {
    final updates = <UserInfo>[];
    final subscription = repository.getAndListen().listen(updates.add);
    addTearDown(subscription.cancel);
    await pumpEventQueue();

    expect(updates, [_cachedUser]);

    await repository.storeInfo(_updatedUser);
    await pumpEventQueue();

    expect(updates, [_cachedUser, _updatedUser]);
  });

  test('getAndListen with an empty cache waits for the first stored value', () async {
    cached = null;
    final updates = <UserInfo>[];
    final subscription = repository.getAndListen().listen(updates.add);
    addTearDown(subscription.cancel);
    await pumpEventQueue();

    expect(updates, isEmpty);

    await repository.storeInfo(_updatedUser);
    await pumpEventQueue();

    expect(updates, [_updatedUser]);
    expect(repository.getLocalInfo(), _updatedUser);
  });

  test('storeInfo awaits persistence before publishing and completing', () async {
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
    final store = repository.storeInfo(_updatedUser).then((_) => completed = true);
    await pumpEventQueue();

    // The write is in flight: no subscriber may see a value the cache still
    // does not hold, and the caller may not treat the store as finished.
    verify(() => local.setInfo(_updatedUser)).called(1);
    expect(completed, isFalse);
    expect(repository.getLocalInfo(), _cachedUser);
    expect(updates, [_cachedUser]);

    persisted.complete();
    await store;
    await pumpEventQueue();

    expect(repository.getLocalInfo(), _updatedUser);
    expect(updates, [_cachedUser, _updatedUser]);
  });

  test('a failed write keeps its error, publishes nothing and leaves the cache', () async {
    final error = Exception('persistence failed');
    final stackTrace = StackTrace.fromString('persistence failure origin');
    when(() => local.setInfo(_updatedUser)).thenAnswer((_) => Future<void>.error(error, stackTrace));
    final updates = <UserInfo>[];
    final streamErrors = <Object>[];
    final subscription = repository.getAndListen().listen(updates.add, onError: streamErrors.add);
    addTearDown(subscription.cancel);
    await pumpEventQueue();

    await repository
        .storeInfo(_updatedUser)
        .then<void>(
          (_) => fail('A failed write must not complete normally.'),
          onError: (Object actualError, StackTrace actualStackTrace) {
            expect(actualError, same(error));
            expect(actualStackTrace, same(stackTrace));
          },
        );
    await pumpEventQueue();

    expect(repository.getLocalInfo(), _cachedUser);
    expect(updates, [_cachedUser]);
    expect(streamErrors, isEmpty);
  });

  test('getRemoteInfo returns the remote snapshot without touching the cache', () async {
    final info = await repository.getRemoteInfo();

    expect(info, _updatedUser);
    expect(repository.getLocalInfo(), _cachedUser);
    verifyNever(() => local.setInfo(any()));
  });

  test('deleteRemote deletes remotely', () async {
    when(() => remote.delete()).thenAnswer((_) async {});

    await repository.deleteRemote();

    verify(() => remote.delete()).called(1);
  });
}
