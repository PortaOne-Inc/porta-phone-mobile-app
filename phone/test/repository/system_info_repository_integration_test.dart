import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:fake_async/fake_async.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/data/app_preferences.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/system_info/system_info.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../mocks/fake_connectivity_service.dart';
import 'system_info_repository_integration_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SystemInfoRepositoryIntegrationHarness harness;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    harness = SystemInfoRepositoryIntegrationHarness(await AppPreferencesImpl.init());
    addTearDown(harness.dispose);
    await harness.local.setSystemInfo(SystemInfoRepositoryIntegrationHarness.cachedInfo);
  });

  test('refresh publishes only after the mapped system info is persisted', () async {
    final write = Completer<void>();
    harness.preferences.beforeWrite = () => write.future;
    final updates = <WebtritSystemInfo>[];
    final cacheAtNotification = <WebtritSystemInfo>[];
    final subscription = harness.repository.infoStream.listen((info) {
      updates.add(info);
      cacheAtNotification.add(harness.repository.getLocalSystemInfo());
    });
    addTearDown(subscription.cancel);
    var completed = false;
    final refresh = harness.repository.refresh().then((_) => completed = true);

    try {
      await pumpEventQueue();
      expect(harness.requests, hasLength(1));
      expect(completed, isFalse);
      expect(updates, isEmpty);
      expect(harness.repository.getLocalSystemInfo(), SystemInfoRepositoryIntegrationHarness.cachedInfo);
    } finally {
      write.complete();
      await refresh;
    }
    await pumpEventQueue();

    expect(updates, [SystemInfoRepositoryIntegrationHarness.updatedInfo]);
    expect(cacheAtNotification, updates);
    final preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.updatedInfo);
  });

  for (final entry in ['refresh', 'networkOnly', 'preload', 'cacheFirstMiss']) {
    test('$entry preserves a persistence failure without publishing uncommitted data', () async {
      if (entry == 'cacheFirstMiss') await harness.local.clear();
      final error = StateError('controlled storage failure');
      final stack = StackTrace.fromString('system-info storage origin');
      harness.preferences.beforeWrite = () => Future<void>.error(error, stack);
      final updates = <WebtritSystemInfo>[];
      final streamErrors = <Object>[];
      final subscription = harness.repository.infoStream.listen(updates.add, onError: streamErrors.add);
      addTearDown(subscription.cancel);

      await _update(harness, entry).then<void>(
        (_) => fail('A failed cache write must not complete normally.'),
        onError: (Object actualError, StackTrace actualStack) {
          expect(actualError, same(error));
          expect(actualStack, same(stack));
        },
      );
      await pumpEventQueue();

      expect(updates, isEmpty);
      expect(streamErrors, isEmpty);
      expect(
        harness.local.getSystemInfo(),
        entry == 'cacheFirstMiss' ? isNull : equals(SystemInfoRepositoryIntegrationHarness.cachedInfo),
      );
      expect(harness.requests, hasLength(entry == 'preload' ? 0 : 1));

      harness.preferences.beforeWrite = null;
      await _update(harness, entry);
      await pumpEventQueue();
      expect(updates, [SystemInfoRepositoryIntegrationHarness.updatedInfo]);
      expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.updatedInfo);
    });
  }

  for (final failure in ['remote', 'persistence']) {
    test('$failure failures back off and a persisted success restores the interval', () {
      fakeAsync((async) {
        final error = StateError('controlled write failure');
        final stack = StackTrace.fromString('cache write origin');
        harness.respond = (_) async => failure == 'remote' && harness.requests.length <= 2
            ? http.Response('adapter unavailable', 503)
            : SystemInfoRepositoryIntegrationHarness.successResponse();
        harness.preferences.beforeWrite = () async {
          if (failure == 'persistence' && harness.requests.length <= 2) Error.throwWithStackTrace(error, stack);
        };
        final task = _register(harness.repository);
        async.flushMicrotasks();

        expect(task.state.phase, PollingTaskPhase.failed);
        expect(task.state.error, failure == 'remote' ? isA<api.RequestFailure>() : same(error));
        if (failure == 'persistence') expect(task.state.stackTrace, same(stack));
        expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.cachedInfo);
        async.elapse(const Duration(seconds: 19));
        expect(harness.requests, hasLength(1));
        async.elapse(const Duration(seconds: 1));
        expect(harness.requests, hasLength(2));
        expect(task.state.phase, PollingTaskPhase.failed);
        async.elapse(const Duration(seconds: 39));
        expect(harness.requests, hasLength(2));
        async.elapse(const Duration(seconds: 1));
        expect(harness.requests, hasLength(3));
        expect(task.state.phase, PollingTaskPhase.succeeded);
        expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.updatedInfo);
        async.elapse(const Duration(seconds: 9));
        expect(harness.requests, hasLength(3));
        async.elapse(const Duration(seconds: 1));
        expect(harness.requests, hasLength(4));
      });
    });
  }

  test('cache policies still skip remote work and persistence when a value is available', () async {
    final writes = harness.preferences.writes;
    expect(await harness.repository.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.cachedInfo);
    expect(
      await harness.repository.getSystemInfo(fetchPolicy: FetchPolicy.cacheOnly),
      SystemInfoRepositoryIntegrationHarness.cachedInfo,
    );
    await harness.local.clear();
    expect(await harness.repository.getSystemInfo(fetchPolicy: FetchPolicy.cacheOnly), isNull);
    expect(harness.requests, isEmpty);
    expect(harness.preferences.writes, writes);
  });
}

Future<void> _update(SystemInfoRepositoryIntegrationHarness harness, String entry) async {
  switch (entry) {
    case 'refresh':
      await harness.repository.refresh();
    case 'networkOnly':
      await harness.repository.getSystemInfo(fetchPolicy: FetchPolicy.networkOnly);
    case 'preload':
      await harness.repository.preload(SystemInfoRepositoryIntegrationHarness.updatedInfo);
    case 'cacheFirstMiss':
      await harness.repository.getSystemInfo();
    default:
      throw ArgumentError.value(entry);
  }
}

PollingTaskHandle _register(SystemInfoRepository repository) {
  final connectivity = FakeConnectivityService(initialConnected: true);
  addTearDown(connectivity.dispose);
  final polling = PollingService(connectivityService: connectivity, options: const PollingOptions(jitterMaxMs: 0));
  addTearDown(polling.dispose);
  return polling.register(PollingRegistration(listener: repository, interval: const Duration(seconds: 10)));
}
