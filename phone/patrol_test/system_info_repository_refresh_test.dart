import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:patrol/patrol.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:webtrit_phone/data/app_preferences.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../test/mocks/fake_connectivity_service.dart';
import '../test/repository/system_info_repository_integration_harness.dart';
import 'subsequences/wait_until.dart';

/// Uses native preferences and the real API/datasource/polling pipeline.
/// HTTP and the failure before a cache write are controlled; no OS disk fault
/// or live backend is required to exercise the repository's error contract.
void main() {
  patrolTest('system-info write failure backs off and recovery publishes only persisted data', ($) async {
    final preferences = await AppPreferencesImpl.init();
    final previousInfo = preferences.getSystemInfo();
    addTearDown(() => previousInfo == null ? preferences.removeSystemInfo() : preferences.setSystemInfo(previousInfo));
    final harness = SystemInfoRepositoryIntegrationHarness(preferences);
    addTearDown(harness.dispose);
    await harness.local.setSystemInfo(SystemInfoRepositoryIntegrationHarness.cachedInfo);

    final error = StateError('controlled cache-write failure');
    final stack = StackTrace.fromString('system-info write boundary');
    harness.preferences.beforeWrite = () => Future<void>.error(error, stack);
    final started = <DateTime>[];
    harness.respond = (_) async {
      started.add(DateTime.now());
      return SystemInfoRepositoryIntegrationHarness.successResponse();
    };
    final updates = <WebtritSystemInfo>[];
    final streamErrors = <Object>[];
    final subscription = harness.repository.infoStream.listen(updates.add, onError: streamErrors.add);
    addTearDown(subscription.cancel);
    final connectivity = FakeConnectivityService(initialConnected: true);
    addTearDown(connectivity.dispose);
    final polling = PollingService(connectivityService: connectivity, options: const PollingOptions(jitterRatio: 0));
    addTearDown(polling.dispose);
    final task = polling.register(
      PollingRegistration(listener: harness.repository, interval: const Duration(seconds: 1)),
    );

    await waitUntil(
      $,
      () => task.state.phase == PollingTaskPhase.failed,
      timeout: const Duration(seconds: 10),
      description: 'a failed cache write was not reported as a failed polling cycle',
    );
    final failedAt = task.state.lastFailureAt!;
    expect(task.state.error, same(error));
    expect(task.state.stackTrace, same(stack));
    expect(updates, isEmpty);
    expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.cachedInfo);

    final write = Completer<void>();
    // Release a pending write before polling/repository teardown even on failure.
    addTearDown(() async {
      final pending = task.isRegistered && task.state.phase == PollingTaskPhase.running ? task.runNow() : null;
      if (!write.isCompleted) write.complete();
      if (pending != null) await pending;
    });
    harness.preferences.beforeWrite = () => write.future;
    await waitUntil(
      $,
      () => started.length >= 2 && task.state.phase == PollingTaskPhase.running,
      timeout: const Duration(seconds: 10),
      description: 'the backed-off refresh did not start',
    );
    expect(started[1].difference(failedAt), greaterThanOrEqualTo(const Duration(milliseconds: 1900)));
    expect(updates, isEmpty, reason: 'a successful HTTP response is not yet a persisted update');
    final nativePreferences = await SharedPreferences.getInstance();
    await nativePreferences.reload();
    expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.cachedInfo);

    write.complete();
    await waitUntil(
      $,
      () => task.state.phase == PollingTaskPhase.succeeded && updates.isNotEmpty,
      timeout: const Duration(seconds: 10),
      description: 'recovery did not persist and publish the new system info',
    );
    task.unregister();
    await nativePreferences.reload();
    expect(harness.local.getSystemInfo(), SystemInfoRepositoryIntegrationHarness.updatedInfo);
    expect(updates, [SystemInfoRepositoryIntegrationHarness.updatedInfo]);
    expect(streamErrors, isEmpty);
    expect(harness.requests, hasLength(2));
  });
}
