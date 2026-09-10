import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:drift/native.dart';
import 'package:http/http.dart' as http;
import 'package:patrol/patrol.dart';

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../test/repository/sip_subscriptions_repository_integration_harness.dart';
import 'subsequences/wait_until.dart';

/// Component integration with real API mapping, polling and file-backed SQLite.
/// HTTP and connectivity eligibility are controlled. No app bootstrap, account,
/// live backend, OS connectivity changes or application database are involved.
void main() {
  patrolTest('sip-subscriptions pull backs off after 503 and persists recovery on the device', ($) async {
    final harness = await _createHarness();
    final started = <DateTime>[];
    harness.respond = (_) async {
      started.add(DateTime.now());
      return started.length <= 2
          ? http.Response('adapter unavailable', 503)
          : started.length == 3
          ? SipSubscriptionsRepositoryIntegrationHarness.successResponse()
          : http.Response('', 304, headers: {'etag': 'v1'});
    };
    final task = _register(harness);
    await _waitForPhase($, task, PollingTaskPhase.failed);
    final firstFailureAt = task.state.lastFailureAt!;
    expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', 503));
    expect((await harness.local.getAll()).single, SipSubscriptionsRepositoryIntegrationHarness.cached);

    await waitUntil(
      $,
      () => started.length >= 2 && task.state.phase == PollingTaskPhase.failed,
      timeout: const Duration(seconds: 10),
      description: 'the second sip-subscriptions pull did not fail',
    );
    final secondFailureAt = task.state.lastFailureAt!;
    expect(started[1].difference(firstFailureAt), greaterThanOrEqualTo(const Duration(milliseconds: 1900)));
    await _waitForPhase($, task, PollingTaskPhase.succeeded);
    final recoveredAt = task.state.lastSuccessAt!;
    expect(started[2].difference(secondFailureAt), greaterThanOrEqualTo(const Duration(milliseconds: 3900)));
    expect((await harness.local.getAll()).single, SipSubscriptionsRepositoryIntegrationHarness.updated);

    await waitUntil(
      $,
      () => started.length >= 4 && task.state.phase == PollingTaskPhase.succeeded,
      timeout: const Duration(seconds: 3),
      description: 'sip-subscriptions recovery did not restore the base interval',
    );
    task.unregister();
    expect(started, hasLength(4));
    expect(started[3].difference(recoveredAt), lessThan(const Duration(seconds: 3)));
    expect(harness.requests.last.headers['if-none-match'], 'v1');
    expect((await harness.local.getAll()).single, SipSubscriptionsRepositoryIntegrationHarness.updated);
  });

  patrolTest('a saved SIP subscription survives failed push and polling drains its native outbox', ($) async {
    final harness = await _createHarness();
    await harness.local.batchReplace([], removePrevious: true);
    harness.connectivity.setConnected(true);
    harness.respond = (_) async => http.Response('adapter unavailable', 503);

    await harness.repository.upsert(SipSubscriptionsRepositoryIntegrationHarness.updated);
    expect(harness.requests, hasLength(1));
    expect((await harness.local.getAll()).single.number, '1001');
    expect((await harness.local.getAllOutboxActions()).single.sendAttempts, 1);

    final task = _register(harness);
    await _waitForPhase($, task, PollingTaskPhase.failed);
    final failedAt = task.state.lastFailureAt!;
    expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', 503));
    expect((await harness.local.getAllOutboxActions()).single.sendAttempts, 2);
    expect((await harness.local.getAll()).single.number, '1001');

    DateTime? recoveryStartedAt;
    harness.respond = (_) async {
      recoveryStartedAt = DateTime.now();
      return SipSubscriptionsRepositoryIntegrationHarness.successResponse();
    };
    await _waitForPhase($, task, PollingTaskPhase.succeeded);
    task.unregister();
    expect(recoveryStartedAt!.difference(failedAt), greaterThanOrEqualTo(const Duration(milliseconds: 1900)));
    expect(harness.requests, hasLength(3));
    expect(harness.requests.every((request) => request.method.toUpperCase() == 'POST'), isTrue);
    expect(await harness.local.getAllOutboxActions(), isEmpty);
    expect((await harness.local.getAll()).single, SipSubscriptionsRepositoryIntegrationHarness.updated);
  });
}

Future<SipSubscriptionsRepositoryIntegrationHarness> _createHarness() async {
  final directory = await Directory.systemTemp.createTemp('sip-subscriptions-refresh-');
  addTearDown(() => directory.delete(recursive: true));
  final harness = SipSubscriptionsRepositoryIntegrationHarness(
    NativeDatabase(File('${directory.path}/sip-subscriptions.sqlite')),
  );
  addTearDown(harness.dispose);
  await harness.initialize();
  return harness;
}

PollingTaskHandle _register(SipSubscriptionsRepositoryIntegrationHarness harness) {
  harness.connectivity.setConnected(true);
  final polling = PollingService(
    connectivityService: harness.connectivity,
    options: const PollingOptions(jitterRatio: 0),
  );
  addTearDown(polling.dispose);
  return polling.register(PollingRegistration(listener: harness.repository, interval: const Duration(seconds: 1)));
}

Future<void> _waitForPhase(PatrolIntegrationTester $, PollingTaskHandle task, PollingTaskPhase phase) => waitUntil(
  $,
  () => task.state.phase == phase,
  timeout: const Duration(seconds: 10),
  description: 'the sip-subscriptions task did not reach $phase',
);
