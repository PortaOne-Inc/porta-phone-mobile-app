import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:fake_async/fake_async.dart';
import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/favorites/favorites.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../mocks/fake_connectivity_service.dart';

class _MockLocal extends Mock implements FavoritesLocalDataSource {}

class _MockRemote extends Mock implements FavoritesRemoteDataSource {}

const _favorite = Favorite(
  number: '1001',
  sourceType: FavoriteSourceType.pbx,
  sourceId: 'contact-1',
  label: 'main',
  position: 0,
);
const _action = FavoriteOutboxAction(
  action: FavoriteOutboxActionType.upsert,
  number: '1001',
  sourceType: FavoriteSourceType.pbx,
  sourceId: 'contact-1',
  label: 'main',
);
const _phone = ContactPhone(id: 1, number: '1001', label: 'main', favorite: false);
final _contact = Contact(
  id: 1,
  sourceType: ContactSourceType.external,
  sourceId: 'contact-1',
  kind: ContactKind.visible,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockLocal local;
  late _MockRemote remote;
  late FakeConnectivityService connectivity;
  late FavoritesRepositorySyncableImpl repository;
  late List<FavoriteOutboxAction> outbox;

  setUpAll(() {
    registerFallbackValue(_favorite);
    registerFallbackValue(_action);
  });

  setUp(() {
    local = _MockLocal();
    remote = _MockRemote();
    connectivity = FakeConnectivityService(initialConnected: true);
    addTearDown(connectivity.dispose);
    outbox = [];
    when(() => local.getAllOutboxActions()).thenAnswer((_) async => List.of(outbox));
    when(() => local.batchReplace(any(), removePrevious: true)).thenAnswer((_) async {});
    when(() => local.add(any())).thenAnswer((_) async {});
    when(() => local.remove(any())).thenAnswer((_) async {});
    when(() => local.shift(any(), any())).thenAnswer((_) async {});
    when(() => local.setOutboxAction(any(), replacePrevAction: any(named: 'replacePrevAction')))
        .thenAnswer((call) async {
          final action = call.positionalArguments.single as FavoriteOutboxAction;
          outbox = [action];
        });
    when(() => local.removeOutboxAction(any())).thenAnswer((_) async => outbox.clear());
    when(() => remote.getFavorites(ifNoneMatch: any(named: 'ifNoneMatch')))
        .thenAnswer((_) async => const FavoritesPullResult(notModified: false, etag: 'v1', items: [_favorite]));
    when(() => remote.batchSyncFavorites(any()))
        .thenAnswer((_) async => const FavoritesBatchSyncResult(etag: 'v1', items: [_favorite]));
    repository = FavoritesRepositorySyncableImpl(
      localDataSource: local,
      remoteDataSource: remote,
      connectivityService: connectivity,
    );
  });

  for (final source in ['pull', 'push', 'read', 'pullWrite', 'pushWrite', 'acknowledge']) {
    test('$source failure preserves the original error and stack', () async {
      final error = StateError('$source failed');
      final stack = StackTrace.fromString('$source origin');
      switch (source) {
        case 'pull':
          when(() => remote.getFavorites()).thenAnswer((_) => Future.error(error, stack));
        case 'push':
          outbox = [_action];
          when(() => remote.batchSyncFavorites(any())).thenAnswer((_) => Future.error(error, stack));
        case 'read':
          when(() => local.getAllOutboxActions()).thenAnswer((_) => Future.error(error, stack));
        case 'pullWrite':
          when(() => local.batchReplace(any(), removePrevious: true)).thenAnswer((_) => Future.error(error, stack));
        case 'pushWrite':
          outbox = [_action];
          when(() => local.batchReplace(any(), removePrevious: true)).thenAnswer((_) => Future.error(error, stack));
        case 'acknowledge':
          outbox = [_action];
          when(() => local.removeOutboxAction(any())).thenAnswer((_) => Future.error(error, stack));
      }

      await _expectFailure(repository.refresh(), error, stack);

      if (source == 'push') {
        expect(outbox, [_action.copyWith(sendAttempts: 1)]);
        verifyNever(() => local.batchReplace(any(), removePrevious: true));
      }
      if (source == 'pull') verifyNever(() => local.batchReplace(any(), removePrevious: true));
    });
  }

  for (final exhausted in [false, true]) {
    test('outbox ${exhausted ? 'drop' : 'attempt update'} failure does not replace the sync error', () async {
      outbox = [_action.copyWith(sendAttempts: exhausted ? 5 : 0)];
      final error = Exception('original remote error');
      final stack = StackTrace.fromString('remote origin');
      when(() => remote.batchSyncFavorites(any())).thenAnswer((_) => Future.error(error, stack));
      if (exhausted) {
        when(() => local.removeOutboxAction(any())).thenThrow(StateError('secondary outbox failure'));
      } else {
        when(() => local.setOutboxAction(any())).thenThrow(StateError('secondary outbox failure'));
      }

      await _expectFailure(repository.refresh(), error, stack);
    });
  }

  test('exhausting the existing outbox attempt limit still fails the cycle', () async {
    outbox = [_action.copyWith(sendAttempts: 5)];
    final error = Exception('remote unavailable');
    when(() => remote.batchSyncFavorites(any())).thenAnswer((_) => Future.error(error));

    await expectLater(repository.refresh(), throwsA(same(error)));

    expect(outbox, isEmpty);
    verify(() => local.removeOutboxAction(_action.copyWith(sendAttempts: 6))).called(1);
  });

  test('refresh waits for failed-attempt bookkeeping before returning the original error', () async {
    outbox = [_action];
    final error = Exception('remote unavailable');
    final stack = StackTrace.fromString('remote origin');
    final write = Completer<void>();
    when(() => remote.batchSyncFavorites(any())).thenAnswer((_) => Future.error(error, stack));
    when(() => local.setOutboxAction(any())).thenAnswer((_) => write.future);
    var completed = false;
    final refresh = _expectFailure(repository.refresh(), error, stack).then((_) => completed = true);
    await pumpEventQueue();

    verify(() => local.setOutboxAction(_action.copyWith(sendAttempts: 1))).called(1);
    expect(completed, isFalse);
    write.complete();
    await refresh;
    expect(completed, isTrue);
  });

  for (final pushing in [false, true]) {
    test('${pushing ? 'push' : 'pull'} waits for persistence before completing or advancing the ETag', () async {
      if (pushing) outbox = [_action];
      final write = Completer<void>();
      when(() => local.batchReplace(any(), removePrevious: true)).thenAnswer((_) => write.future);
      var completed = false;
      final refresh = repository.refresh().then((_) => completed = true);
      await pumpEventQueue();
      expect(completed, isFalse);

      write.complete();
      await refresh;
      when(() => remote.getFavorites(ifNoneMatch: 'v1'))
          .thenAnswer((_) async => const FavoritesPullResult(notModified: true, etag: 'v1', items: []));
      await repository.refresh();

      expect(completed, isTrue);
      verify(() => remote.getFavorites(ifNoneMatch: 'v1')).called(1);
      verify(() => local.batchReplace([_favorite], removePrevious: true)).called(1);
    });
  }

  test('failed persistence does not advance the ETag and can be retried', () async {
    when(() => local.batchReplace(any(), removePrevious: true)).thenThrow(StateError('write failed'));
    await expectLater(repository.refresh(), throwsStateError);
    when(() => local.batchReplace(any(), removePrevious: true)).thenAnswer((_) async {});

    await repository.refresh();

    verify(() => remote.getFavorites()).called(2);
    verifyNever(() => remote.getFavorites(ifNoneMatch: 'v1'));
  });

  test('refresh does not perform a connectivity preflight or hide an offline attempt', () async {
    connectivity.setConnected(false);
    final error = Exception('transport unavailable');
    when(() => remote.getFavorites()).thenAnswer((_) => Future.error(error));

    await expectLater(repository.refresh(), throwsA(same(error)));

    expect(connectivity.checkCalls, 0);
    verify(() => remote.getFavorites()).called(1);
  });

  test('disabled remote sync completes without remote or outbox work', () async {
    repository = FavoritesRepositorySyncableImpl(
      localDataSource: local,
      remoteDataSource: remote,
      connectivityService: connectivity,
      remoteSyncEnabled: false,
    );

    await repository.refresh();
    await repository.addByContact(_phone, _contact);

    verify(() => local.add(_favorite)).called(1);
    expect(outbox, hasLength(1));
    verifyNever(() => local.getAllOutboxActions());
    verifyZeroInteractions(remote);
    expect(connectivity.checkCalls, 0);
  });

  for (final edit in ['add', 'removeByContact', 'remove', 'shift']) {
    test('$edit remains successful after a failed opportunistic sync', () async {
      when(() => remote.batchSyncFavorites(any())).thenAnswer((_) => Future.error(Exception('offline')));

      await _edit(repository, edit);

      expect(outbox.single.number, _favorite.number);
      expect(
        outbox.single.action,
        edit.startsWith('remove') ? FavoriteOutboxActionType.delete : FavoriteOutboxActionType.upsert,
      );
      expect(outbox.single.sendAttempts, 1);
      if (edit == 'shift') expect(outbox.single.position, 2);
      switch (edit) {
        case 'add':
          verify(() => local.add(_favorite)).called(1);
        case 'removeByContact' || 'remove':
          verify(() => local.remove(_favorite)).called(1);
        case 'shift':
          verify(() => local.shift(_favorite, 2)).called(1);
      }
      verifyNever(() => local.batchReplace(any(), removePrevious: true));
    });

    test('$edit still propagates a failed local mutation', () async {
      final error = StateError('local mutation failed');
      when(() => local.add(any())).thenThrow(error);
      when(() => local.remove(any())).thenThrow(error);
      when(() => local.shift(any(), any())).thenThrow(error);

      await expectLater(_edit(repository, edit), throwsA(same(error)));

      expect(outbox, isEmpty);
      verifyZeroInteractions(remote);
    });
  }

  test('a failed initial outbox write still fails the local edit', () async {
    final error = StateError('outbox persistence failed');
    when(() => local.setOutboxAction(any(), replacePrevAction: true)).thenThrow(error);

    await expectLater(repository.addByContact(_phone, _contact), throwsA(same(error)));

    verifyZeroInteractions(remote);
  });

  test('an outbox read failure during opportunistic sync does not fail a persisted local edit', () async {
    when(() => local.getAllOutboxActions()).thenThrow(StateError('sync read failed'));

    await repository.addByContact(_phone, _contact);

    verify(() => local.add(_favorite)).called(1);
    expect(outbox.single.sendAttempts, 0);
    verifyZeroInteractions(remote);
  });

  test('an offline local edit remains queued without attempting HTTP', () async {
    connectivity.setConnected(false);

    await repository.addByContact(_phone, _contact);

    expect(outbox.single.sendAttempts, 0);
    verifyZeroInteractions(remote);
  });

  for (final pushing in [false, true]) {
    test('${pushing ? 'push' : 'pull'} failures engage polling backoff and success restores its interval', () {
      fakeAsync((async) {
        if (pushing) outbox = [_action];
        final error = Exception('remote unavailable');
        final stack = StackTrace.fromString('sync origin');
        var requests = 0;
        when(() => remote.getFavorites(ifNoneMatch: any(named: 'ifNoneMatch'))).thenAnswer((_) async {
          requests++;
          if (requests <= 2) Error.throwWithStackTrace(error, stack);
          return const FavoritesPullResult(notModified: false, etag: 'v1', items: [_favorite]);
        });
        when(() => remote.batchSyncFavorites(any())).thenAnswer((_) async {
          requests++;
          if (requests <= 2) Error.throwWithStackTrace(error, stack);
          return const FavoritesBatchSyncResult(etag: 'v1', items: [_favorite]);
        });
        final polling = PollingService(
          connectivityService: connectivity,
          options: const PollingOptions(jitterMaxMs: 0),
        );
        addTearDown(polling.dispose);
        final task = polling.register(PollingRegistration(listener: repository, interval: const Duration(seconds: 10)));
        async.flushMicrotasks();

        expect(requests, 1);
        expect(task.state.phase, PollingTaskPhase.failed);
        expect(task.state.error, same(error));
        expect(task.state.stackTrace, same(stack));
        async.elapse(const Duration(seconds: 19));
        expect(requests, 1);
        async.elapse(const Duration(seconds: 1));
        expect(requests, 2);
        expect(task.state.phase, PollingTaskPhase.failed);
        if (pushing) expect(outbox.single.sendAttempts, 2);
        async.elapse(const Duration(seconds: 39));
        expect(requests, 2);
        async.elapse(const Duration(seconds: 1));
        expect(requests, 3);
        expect(task.state.phase, PollingTaskPhase.succeeded);
        expect(outbox, isEmpty);
        async.elapse(const Duration(seconds: 9));
        expect(requests, 3);
        async.elapse(const Duration(seconds: 1));
        expect(requests, 4);
      });
    });
  }
}

Future<void> _expectFailure(Future<void> future, Object error, StackTrace stack) => future.then<void>(
  (_) => fail('A failed refresh must not complete normally.'),
  onError: (Object actualError, StackTrace actualStack) {
    expect(actualError, same(error));
    expect(actualStack, same(stack));
  },
);

Future<void> _edit(FavoritesRepository repository, String edit) => switch (edit) {
  'add' => repository.addByContact(_phone, _contact),
  'removeByContact' => repository.removeByContact(_phone, _contact),
  'remove' => repository.remove(_favorite),
  'shift' => repository.shift(_favorite, 2),
  _ => throw ArgumentError.value(edit),
};
