import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:fake_async/fake_async.dart';
import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/sip_subscriptions/sip_subscriptions.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../mocks/fake_connectivity_service.dart';

class _MockLocal extends Mock implements SipSubscriptionsLocalDataSource {}

class _MockRemote extends Mock implements SipSubscriptionsRemoteDataSource {}

final _subscription = SipSubscription(
  type: SipSubscriptionType.blf,
  number: '1001',
  contactUserId: 'contact-1',
  subscribedAt: DateTime.utc(2026, 9, 10),
);
const _action = SipSubscriptionOutboxAction(
  action: SipSubscriptionOutboxActionType.upsert,
  type: SipSubscriptionType.blf,
  number: '1001',
  contactUserId: 'contact-1',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockLocal local;
  late _MockRemote remote;
  late FakeConnectivityService connectivity;
  late SipSubscriptionsRepositorySyncableImpl repository;
  late List<SipSubscriptionOutboxAction> outbox;

  setUpAll(() {
    registerFallbackValue(_subscription);
    registerFallbackValue(SipSubscriptionType.blf);
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
    when(() => local.upsert(any())).thenAnswer((_) async {});
    when(() => local.remove(any(), any())).thenAnswer((_) async {});
    when(() => local.getAll()).thenAnswer((_) async => [_subscription]);
    when(() => local.setOutboxAction(any(), replacePrevAction: any(named: 'replacePrevAction')))
        .thenAnswer((call) async {
          final action = call.positionalArguments.single as SipSubscriptionOutboxAction;
          outbox = [action];
        });
    when(() => local.removeOutboxAction(any())).thenAnswer((_) async => outbox.clear());
    when(() => remote.getSipSubscriptions(ifNoneMatch: any(named: 'ifNoneMatch')))
        .thenAnswer((_) async => SipSubscriptionsPullResult(notModified: false, etag: 'v1', items: [_subscription]));
    when(() => remote.batchSyncSipSubscriptions(any()))
        .thenAnswer((_) async => SipSubscriptionsBatchSyncResult(etag: 'v1', items: [_subscription]));
    repository = SipSubscriptionsRepositorySyncableImpl(
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
          when(() => remote.getSipSubscriptions()).thenAnswer((_) => Future.error(error, stack));
        case 'push':
          outbox = [_action];
          when(() => remote.batchSyncSipSubscriptions(any())).thenAnswer((_) => Future.error(error, stack));
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
      when(() => remote.batchSyncSipSubscriptions(any())).thenAnswer((_) => Future.error(error, stack));
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
    when(() => remote.batchSyncSipSubscriptions(any())).thenAnswer((_) => Future.error(error));

    await expectLater(repository.refresh(), throwsA(same(error)));

    expect(outbox, isEmpty);
    verify(() => local.removeOutboxAction(_action.copyWith(sendAttempts: 6))).called(1);
  });

  test('refresh waits for failed-attempt bookkeeping before returning the original error', () async {
    outbox = [_action];
    final error = Exception('remote unavailable');
    final stack = StackTrace.fromString('remote origin');
    final write = Completer<void>();
    when(() => remote.batchSyncSipSubscriptions(any())).thenAnswer((_) => Future.error(error, stack));
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
      when(() => remote.getSipSubscriptions(ifNoneMatch: 'v1'))
          .thenAnswer((_) async => SipSubscriptionsPullResult(notModified: true, etag: 'v1', items: []));
      await repository.refresh();

      expect(completed, isTrue);
      verify(() => remote.getSipSubscriptions(ifNoneMatch: 'v1')).called(1);
      verify(() => local.batchReplace([_subscription], removePrevious: true)).called(1);
    });
  }

  test('failed persistence does not advance the ETag and can be retried', () async {
    when(() => local.batchReplace(any(), removePrevious: true)).thenThrow(StateError('write failed'));
    await expectLater(repository.refresh(), throwsStateError);
    when(() => local.batchReplace(any(), removePrevious: true)).thenAnswer((_) async {});

    await repository.refresh();

    verify(() => remote.getSipSubscriptions()).called(2);
    verifyNever(() => remote.getSipSubscriptions(ifNoneMatch: 'v1'));
  });

  test('refresh does not perform a connectivity preflight or hide an offline attempt', () async {
    connectivity.setConnected(false);
    final error = Exception('transport unavailable');
    when(() => remote.getSipSubscriptions()).thenAnswer((_) => Future.error(error));

    await expectLater(repository.refresh(), throwsA(same(error)));

    expect(connectivity.checkCalls, 0);
    verify(() => remote.getSipSubscriptions()).called(1);
  });

  test('disabled remote sync completes without remote or outbox work', () async {
    repository = SipSubscriptionsRepositorySyncableImpl(
      localDataSource: local,
      remoteDataSource: remote,
      connectivityService: connectivity,
      remoteSyncEnabled: false,
    );

    await repository.refresh();
    await repository.upsert(_subscription);

    verify(() => local.upsert(_subscription)).called(1);
    expect(outbox, hasLength(1));
    verifyNever(() => local.getAllOutboxActions());
    verifyZeroInteractions(remote);
    expect(connectivity.checkCalls, 0);
  });

  for (final edit in ['upsert', 'remove', 'removeWithContactUserId']) {
    test('$edit remains successful after a failed opportunistic sync', () async {
      when(() => remote.batchSyncSipSubscriptions(any())).thenAnswer((_) => Future.error(Exception('offline')));

      await _edit(repository, edit);

      expect(outbox.single.number, _subscription.number);
      expect(outbox.single.type, _subscription.type);
      expect(outbox.single.contactUserId, _subscription.contactUserId);
      expect(
        outbox.single.action,
        edit == 'upsert' ? SipSubscriptionOutboxActionType.upsert : SipSubscriptionOutboxActionType.delete,
      );
      expect(outbox.single.sendAttempts, 1);
      if (edit == 'upsert') {
        verify(() => local.upsert(_subscription)).called(1);
      } else {
        verify(() => local.remove(_subscription.type, _subscription.number)).called(1);
      }
      if (edit == 'remove') {
        verify(() => local.getAll()).called(1);
      } else {
        verifyNever(() => local.getAll());
      }
      verifyNever(() => local.batchReplace(any(), removePrevious: true));
    });

    test('$edit still propagates a failed local mutation', () async {
      final error = StateError('local mutation failed');
      when(() => local.upsert(any())).thenThrow(error);
      when(() => local.remove(any(), any())).thenThrow(error);

      await expectLater(_edit(repository, edit), throwsA(same(error)));

      expect(outbox, isEmpty);
      verifyZeroInteractions(remote);
    });

    test('$edit still propagates a failed initial outbox write', () async {
      final error = StateError('outbox persistence failed');
      when(() => local.setOutboxAction(any(), replacePrevAction: true)).thenThrow(error);

      await expectLater(_edit(repository, edit), throwsA(same(error)));

      verifyZeroInteractions(remote);
    });
  }

  test('failed contact lookup prevents removal and reports the local failure', () async {
    final error = StateError('contact lookup failed');
    when(() => local.getAll()).thenThrow(error);

    await expectLater(repository.remove(_subscription.type, _subscription.number), throwsA(same(error)));

    verifyNever(() => local.remove(any(), any()));
    expect(outbox, isEmpty);
    verifyZeroInteractions(remote);
  });

  test('an outbox read failure during opportunistic sync does not fail a persisted local edit', () async {
    when(() => local.getAllOutboxActions()).thenThrow(StateError('sync read failed'));

    await repository.upsert(_subscription);

    verify(() => local.upsert(_subscription)).called(1);
    expect(outbox.single.sendAttempts, 0);
    verifyZeroInteractions(remote);
  });

  test('an offline local edit remains queued without attempting HTTP', () async {
    connectivity.setConnected(false);

    await repository.upsert(_subscription);

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
        when(() => remote.getSipSubscriptions(ifNoneMatch: any(named: 'ifNoneMatch'))).thenAnswer((_) async {
          requests++;
          if (requests <= 2) Error.throwWithStackTrace(error, stack);
          return SipSubscriptionsPullResult(notModified: false, etag: 'v1', items: [_subscription]);
        });
        when(() => remote.batchSyncSipSubscriptions(any())).thenAnswer((_) async {
          requests++;
          if (requests <= 2) Error.throwWithStackTrace(error, stack);
          return SipSubscriptionsBatchSyncResult(etag: 'v1', items: [_subscription]);
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

Future<void> _edit(SipSubscriptionsRepository repository, String edit) => switch (edit) {
  'upsert' => repository.upsert(_subscription),
  'remove' => repository.remove(_subscription.type, _subscription.number),
  'removeWithContactUserId' => repository.remove(
    _subscription.type,
    _subscription.number,
    contactUserId: _subscription.contactUserId,
  ),
  _ => throw ArgumentError.value(edit),
};
