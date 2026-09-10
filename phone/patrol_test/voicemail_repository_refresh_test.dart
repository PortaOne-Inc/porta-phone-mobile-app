import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:drift/native.dart';
import 'package:http/http.dart' as http;
import 'package:patrol/patrol.dart';

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../test/mocks/fake_connectivity_service.dart';
import '../test/repository/voicemail_repository_integration_harness.dart';
import 'subsequences/wait_until.dart';

/// Component integration on the device: real API mapping, polling and isolated
/// file-backed SQLite. HTTP/cache-boundary faults and connectivity are controlled;
/// this is not a live-backend E2E or an OS network/disk-failure test.
void main() {
  patrolTest('voicemail shared failure backs off and recovery awaits SQLite persistence', ($) async {
    final harness = await _createHarness();
    final response = Completer<http.Response>();
    harness.respond = (_) => response.future;
    final task = _register(harness);
    final write = Completer<void>();
    addTearDown(() async {
      if (!response.isCompleted) response.complete(VoicemailRepositoryIntegrationHarness.listResponse(empty: true));
      if (!write.isCompleted) write.complete();
      if (task.isRegistered && task.state.phase == PollingTaskPhase.running) {
        await task.runNow().catchError((Object _) {});
      }
    });

    await waitUntil(
      $,
      () => harness.requests.isNotEmpty,
      timeout: const Duration(seconds: 10),
      description: 'the automatic voicemail request did not start',
    );
    final failures = <(Object, StackTrace)>[];
    final joined = Future.wait([
      _recordFailure(task.runNow(), failures),
      _recordFailure(harness.repository.fetchVoicemails(), failures),
    ]);
    // A secondary cache error must not mask the failed HTTP request.
    harness.dao.beforeRead = () => Future.error(StateError('controlled fallback read failure'));
    response.complete(http.Response('adapter unavailable', 503));
    await waitUntil(
      $,
      () => task.state.phase == PollingTaskPhase.failed && failures.length == 2,
      timeout: const Duration(seconds: 10),
      description: 'the failed cycle stranded a refresh joiner',
    );
    await joined;
    final failedAt = task.state.lastFailureAt!;
    expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', 503));
    for (final failure in failures) {
      expect(failure.$1, same(task.state.error));
      expect(failure.$2, same(task.state.stackTrace));
    }
    expect(harness.requests, hasLength(1));
    expect(await harness.dao.getVoicemailById('message-1'), VoicemailRepositoryIntegrationHarness.cached);

    harness.dao.beforeRead = null;
    DateTime? recoveryStartedAt;
    harness.respond = (request) async {
      recoveryStartedAt ??= DateTime.now();
      return request.url.path.endsWith('/message-1')
          ? VoicemailRepositoryIntegrationHarness.detailsResponse()
          : VoicemailRepositoryIntegrationHarness.listResponse();
    };
    var writing = false;
    harness.dao.beforeWrite = () {
      writing = true;
      return write.future;
    };
    await waitUntil(
      $,
      () => writing,
      timeout: const Duration(seconds: 10),
      description: 'the backed-off retry did not reach persistence',
    );
    expect(recoveryStartedAt!.difference(failedAt), greaterThanOrEqualTo(const Duration(milliseconds: 1900)));
    expect(task.state.phase, PollingTaskPhase.running);
    expect(await harness.dao.getVoicemailById('message-1'), VoicemailRepositoryIntegrationHarness.cached);
    write.complete();
    await waitUntil(
      $,
      () => task.state.phase == PollingTaskPhase.succeeded,
      timeout: const Duration(seconds: 10),
      description: 'the persisted retry did not finish successfully',
    );
    task.unregister();
    final persisted = (await harness.dao.getVoicemailById('message-1'))!;
    expect(persisted.sender, '1001');
    expect(persisted.seen, isTrue);
    expect(harness.requests, hasLength(3));
  });

  patrolTest('voicemail 401 releases polling and mutation joiners through the same failure', ($) async {
    final harness = await _createHarness();
    final response = Completer<http.Response>();
    harness.respond = (_) => response.future;
    final task = _register(harness);
    addTearDown(() async {
      if (!response.isCompleted) response.complete(VoicemailRepositoryIntegrationHarness.listResponse(empty: true));
      if (task.isRegistered && task.state.phase == PollingTaskPhase.running) {
        await task.runNow().catchError((Object _) {});
      }
    });
    await waitUntil(
      $,
      () => harness.requests.isNotEmpty,
      timeout: const Duration(seconds: 10),
      description: 'the voicemail request did not start',
    );
    final failures = <(Object, StackTrace)>[];
    final joined = Future.wait([
      _recordFailure(task.runNow(), failures),
      _recordFailure(harness.repository.removeVoicemail('message-1'), failures),
    ]);
    response.complete(http.Response('{"code":"token_invalid"}', 401));
    await waitUntil(
      $,
      () => task.state.phase == PollingTaskPhase.failed && failures.length == 2,
      timeout: const Duration(seconds: 10),
      description: '401 did not complete every waiting operation',
    );
    await joined;
    expect(task.state.error, isA<api.UnauthorizedException>());
    expect(harness.sessionGuard.errors, [same(task.state.error)]);
    for (final failure in failures) {
      expect(failure.$1, same(task.state.error));
      expect(failure.$2, same(task.state.stackTrace));
    }
    task.unregister();
    expect(harness.requests, hasLength(1));
    expect(await harness.dao.getVoicemailById('message-1'), VoicemailRepositoryIntegrationHarness.cached);
  });
}

Future<VoicemailRepositoryIntegrationHarness> _createHarness() async {
  final directory = await Directory.systemTemp.createTemp('voicemail-refresh-');
  addTearDown(() => directory.delete(recursive: true));
  final harness = VoicemailRepositoryIntegrationHarness(NativeDatabase(File('${directory.path}/voicemail.sqlite')));
  addTearDown(harness.dispose);
  await harness.initialize();
  return harness;
}

PollingTaskHandle _register(VoicemailRepositoryIntegrationHarness harness) {
  final connectivity = FakeConnectivityService(initialConnected: true);
  addTearDown(connectivity.dispose);
  final polling = PollingService(connectivityService: connectivity, options: const PollingOptions(jitterMaxMs: 0));
  addTearDown(polling.dispose);
  return polling.register(PollingRegistration(listener: harness.repository, interval: const Duration(seconds: 1)));
}

Future<void> _recordFailure(Future<void> future, List<(Object, StackTrace)> failures) => future.then<void>(
  (_) => fail('A failed refresh completed normally.'),
  onError: (Object error, StackTrace stack) => failures.add((error, stack)),
);
