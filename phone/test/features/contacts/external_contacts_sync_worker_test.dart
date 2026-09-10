import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

import 'package:webtrit_phone/features/contacts/contacts.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/repositories.dart';
import 'package:webtrit_phone/services/services.dart';

import '../../mocks/fake_connectivity_service.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockExternalContactsRepository extends Mock implements ExternalContactsRepository {}

class MockContactsRepository extends Mock implements ContactsRepository {}

class MockExternalContactsSyncWorker extends Mock implements ExternalContactsSyncWorker {}

class MockPollingTaskHandle extends Mock implements PollingTaskHandle {}

class MockPollingService extends Mock implements PollingService {}

class FakePollingRegistration extends Fake implements PollingRegistration {}

final _testUser = UserInfo(
  numbers: Numbers(main: '1000', additional: []),
  balance: Balance(amount: 0, currency: 'USD'),
);

final _contactSelf = ExternalContact(
  id: '1000',
  firstName: 'Self',
  lastName: 'User',
  number: '1000',
  registered: true,
  userRegistered: true,
);

final _contactOther = ExternalContact(
  id: '2000',
  firstName: 'Other',
  lastName: 'User',
  number: '2000',
  registered: true,
  userRegistered: true,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => registerFallbackValue(FakePollingRegistration()));

  late MockUserRepository userRepository;
  late MockExternalContactsRepository externalContactsRepository;
  late MockContactsRepository contactsRepository;
  late ExternalContactsSyncWorker worker;

  setUp(() {
    userRepository = MockUserRepository();
    externalContactsRepository = MockExternalContactsRepository();
    contactsRepository = MockContactsRepository();

    when(() => userRepository.getLocalInfo()).thenReturn(_testUser);
    when(() => userRepository.getAndListen()).thenAnswer((_) => Stream.value(_testUser));
    when(() => externalContactsRepository.fetchContacts()).thenAnswer((_) async => [_contactSelf, _contactOther]);
    when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) async {});

    worker = ExternalContactsSyncWorker(
      userRepository: userRepository,
      externalContactsRepository: externalContactsRepository,
      contactsRepository: contactsRepository,
    );
  });

  tearDown(() => worker.dispose());

  group('ExternalContactsSyncWorker', () {
    test('one refresh cycle fetches, filters out the current user and syncs', () async {
      await worker.refresh();

      verify(
        () => contactsRepository.syncExternalContacts(
          any(
            that: isA<List<ExternalContact>>()
                .having((list) => list.length, 'length', 1)
                .having((list) => list.first.id, 'id', _contactOther.id),
          ),
        ),
      ).called(1);
    });

    test('a failed fetch is rethrown to the polling task', () async {
      when(() => externalContactsRepository.fetchContacts()).thenThrow(Exception('offline'));

      await expectLater(worker.refresh(), throwsException);
    });

    test('a failure log keeps the original stack trace', () async {
      final records = <LogRecord>[];
      final subscription = Logger('ExternalContactsSyncWorker').onRecord.listen(records.add);
      addTearDown(subscription.cancel);
      final error = Exception('offline');
      final stackTrace = StackTrace.current;
      when(() => externalContactsRepository.fetchContacts())
          .thenAnswer((_) => Future<List<ExternalContact>>.error(error, stackTrace));

      await expectLater(worker.refresh(), throwsA(same(error)));
      await Future<void>.delayed(Duration.zero);

      final record = records.singleWhere((record) => identical(record.error, error));
      expect(record.stackTrace, same(stackTrace));
    });

    test('an unchanged list does not touch the local store again', () async {
      await worker.refresh();
      await worker.refresh();

      verify(() => contactsRepository.syncExternalContacts(any())).called(1);
    });

    test('a changed list is merged again', () async {
      await worker.refresh();
      when(() => externalContactsRepository.fetchContacts()).thenAnswer((_) async => [_contactOther, _contactSelf]);
      await worker.refresh();

      // Same filtered content -> still one merge; now change it for real.
      when(() => externalContactsRepository.fetchContacts()).thenAnswer((_) async => []);
      await worker.refresh();

      verify(() => contactsRepository.syncExternalContacts(any())).called(2);
    });

    test('a user-info stream that never emits fails the cycle instead of wedging it', () {
      fakeAsync((async) {
        when(() => userRepository.getLocalInfo()).thenReturn(null);
        final silent = StreamController<UserInfo>.broadcast();
        addTearDown(silent.close);
        when(() => userRepository.getAndListen()).thenAnswer((_) => silent.stream);

        Object? failure;
        worker.refresh().catchError((Object e) => failure = e);
        async.elapse(const Duration(seconds: 15));

        expect(failure, isA<TimeoutException>(), reason: 'the cycle must give up, not hang the shared future');

        // The next cycle is a fresh run, not the timed-out future.
        when(() => userRepository.getLocalInfo()).thenReturn(_testUser);
        var recovered = false;
        worker.refresh().then((_) => recovered = true);
        async.flushMicrotasks();
        expect(recovered, isTrue);
      });
    });

    test('a write failure propagates immediately without local retries', () {
      fakeAsync((async) {
        final error = Exception('store unavailable');
        final stack = StackTrace.fromString('failed store attempt');
        var attempts = 0;
        when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) {
          attempts++;
          return Future<void>.error(error, stack);
        });

        AsyncError? failure;
        worker.refresh().then<void>(
          (_) => fail('a failed write must not complete successfully'),
          onError: (Object error, StackTrace stack) => failure = AsyncError(error, stack),
        );
        async.flushMicrotasks();

        expect(failure?.error, same(error));
        expect(failure?.stackTrace, same(stack));
        expect(attempts, 1);

        async.elapse(const Duration(minutes: 1));
        expect(attempts, 1, reason: 'only a new polling cycle may retry a failed write');
      });
    });

    test('the next cycle writes previously failed data and then skips unchanged data', () async {
      final error = Exception('store unavailable');
      when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) => Future<void>.error(error));

      await expectLater(worker.refresh(), throwsA(same(error)));
      verify(() => contactsRepository.syncExternalContacts(any())).called(1);

      when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) async {});
      await worker.refresh();
      verify(() => contactsRepository.syncExternalContacts(any())).called(1);

      await worker.refresh();
      verifyNever(() => contactsRepository.syncExternalContacts(any()));
      verify(() => externalContactsRepository.fetchContacts()).called(3);
    });

    test('disposal while waiting for user info prevents a new write', () async {
      final pendingUser = Completer<UserInfo>();
      final userRequested = Completer<void>();
      when(() => userRepository.getLocalInfo()).thenReturn(null);
      when(() => userRepository.getAndListen()).thenAnswer((_) {
        userRequested.complete();
        return pendingUser.future.asStream();
      });

      final failure = expectLater(worker.refresh(), throwsStateError);
      await userRequested.future;
      await worker.dispose();
      pendingUser.complete(_testUser);

      await failure;
      verifyNever(() => contactsRepository.syncExternalContacts(any()));
    });

    test('a pending write failure still propagates after disposal', () async {
      final pendingWrite = Completer<void>();
      final writeStarted = Completer<void>();
      final error = Exception('pending write failed');
      final stack = StackTrace.fromString('pending store attempt');
      when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) {
        writeStarted.complete();
        return pendingWrite.future;
      });

      final outcome = worker.refresh().then<AsyncError?>((_) => null, onError: AsyncError.new);
      await writeStarted.future;
      await worker.dispose();
      pendingWrite.completeError(error, stack);

      final failure = await outcome;
      expect(failure?.error, same(error));
      expect(failure?.stackTrace, same(stack));
      verify(() => contactsRepository.syncExternalContacts(any())).called(1);
    });

    test('disposal before the required write does not report success', () async {
      final pendingFetch = Completer<List<ExternalContact>>();
      when(() => externalContactsRepository.fetchContacts()).thenAnswer((_) => pendingFetch.future);

      final outcome = worker.refresh();
      final failure = expectLater(outcome, throwsStateError);
      await worker.dispose();
      pendingFetch.complete([_contactOther]);

      await failure;
      verifyNever(() => contactsRepository.syncExternalContacts(any()));
    });

    test('a successful pending write remains successful after disposal', () async {
      final pendingWrite = Completer<void>();
      final writeStarted = Completer<void>();
      when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) {
        writeStarted.complete();
        return pendingWrite.future;
      });

      final outcome = worker.refresh();
      await writeStarted.future;
      await worker.dispose();
      pendingWrite.complete();

      await outcome;
      verify(() => contactsRepository.syncExternalContacts(any())).called(1);
    });

    test('refresh after disposal is rejected before fetching', () async {
      await worker.dispose();
      await worker.dispose();

      expect(worker.isActive, isFalse);
      await expectLater(worker.refresh(), throwsStateError);
      verifyNever(() => externalContactsRepository.fetchContacts());
    });
  });

  group('ExternalContactsSync', () {
    test('a joined manual caller receives the write failure after owner disposal', () {
      fakeAsync((async) {
        final connectivity = FakeConnectivityService(initialConnected: true);
        final polling = PollingService(
          connectivityService: connectivity,
          registrations: [],
          options: const PollingOptions(jitterRatio: 0),
        );
        addTearDown(polling.dispose);
        addTearDown(connectivity.dispose);
        final error = Exception('store unavailable');
        final stack = StackTrace.fromString('joined store attempt');
        final pendingWrite = Completer<void>();
        when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) => pendingWrite.future);
        final sync = ExternalContactsSync(
          worker: worker,
          pollingService: polling,
          interval: const Duration(minutes: 1),
        );

        async.flushMicrotasks();
        expect(sync.state.phase, PollingTaskPhase.running);
        AsyncError? failure;
        var succeeded = false;
        sync.runNow().then<void>(
          (_) => succeeded = true,
          onError: (Object error, StackTrace stack) => failure = AsyncError(error, stack),
        );
        unawaited(sync.dispose());
        pendingWrite.completeError(error, stack);
        async.elapse(const Duration(minutes: 5));

        expect(succeeded, isFalse);
        expect(failure?.error, same(error));
        expect(failure?.stackTrace, same(stack));
        expect(sync.state.phase, PollingTaskPhase.stopped, reason: 'late completion must not revive the task');
        verify(() => externalContactsRepository.fetchContacts()).called(1);
        verify(() => contactsRepository.syncExternalContacts(any())).called(1);
      });
    });

    test('a failed write backs off the next cycle and recovery restores normal cadence', () {
      fakeAsync((async) {
        final connectivity = FakeConnectivityService(initialConnected: true);
        final polling = PollingService(
          connectivityService: connectivity,
          registrations: [],
          options: const PollingOptions(jitterRatio: 0),
        );
        addTearDown(polling.dispose);
        addTearDown(connectivity.dispose);
        final error = Exception('store unavailable');
        final stack = StackTrace.fromString('failed store attempt');
        var writes = 0;
        var shouldFail = true;
        when(() => contactsRepository.syncExternalContacts(any())).thenAnswer((_) {
          writes++;
          return shouldFail ? Future<void>.error(error, stack) : Future<void>.value();
        });
        final sync = ExternalContactsSync(
          worker: worker,
          pollingService: polling,
          interval: const Duration(minutes: 1),
        );
        addTearDown(sync.dispose);

        async.flushMicrotasks();
        expect(writes, 1);
        expect(sync.state.phase, PollingTaskPhase.failed);
        expect(sync.state.error, same(error));
        expect(sync.state.stackTrace, same(stack));

        shouldFail = false;
        async.elapse(const Duration(seconds: 119));
        verify(() => externalContactsRepository.fetchContacts()).called(1);
        expect(writes, 1, reason: 'failed persistence must not use the normal 60-second interval or retry locally');

        async.elapse(const Duration(seconds: 1));
        expect(sync.state.phase, PollingTaskPhase.succeeded);
        expect(writes, 2, reason: 'failed data must not have been cached as already synced');
        verify(() => externalContactsRepository.fetchContacts()).called(1);

        async.elapse(const Duration(seconds: 59));
        verifyNever(() => externalContactsRepository.fetchContacts());
        async.elapse(const Duration(seconds: 1));
        verify(() => externalContactsRepository.fetchContacts()).called(1);
        expect(writes, 2, reason: 'a successfully persisted unchanged list needs no new write');
      });
    });

    test('registers its worker and releases both owned parts', () async {
      final syncWorker = MockExternalContactsSyncWorker();
      final pollingService = MockPollingService();
      final task = MockPollingTaskHandle();
      when(() => syncWorker.dispose()).thenAnswer((_) async {});
      when(() => pollingService.register(any())).thenReturn(task);
      final sync = ExternalContactsSync(
        worker: syncWorker,
        pollingService: pollingService,
        interval: const Duration(minutes: 1),
      );

      final registration = verify(() => pollingService.register(captureAny())).captured.single as PollingRegistration;
      expect(registration.listener, same(syncWorker));
      expect(registration.interval, const Duration(minutes: 1));

      await sync.dispose();
      await sync.dispose();

      verify(() => task.unregister()).called(1);
      verify(() => syncWorker.dispose()).called(1);
    });
  });
}
