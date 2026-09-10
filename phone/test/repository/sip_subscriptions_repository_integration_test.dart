import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:drift/native.dart';
import 'package:http/http.dart' as http;

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/sip_subscriptions/sip_subscriptions.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../mocks/fake_connectivity_service.dart';
import 'sip_subscriptions_repository_integration_harness.dart';

final _cached = SipSubscriptionsRepositoryIntegrationHarness.cached;
final _updated = SipSubscriptionsRepositoryIntegrationHarness.updated;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SipSubscriptionsLocalDataSourceDriftImpl local;
  late SipSubscriptionsRepositorySyncableImpl repository;
  late FakeConnectivityService connectivity;
  late List<http.Request> requests;
  late Future<http.Response> Function(http.Request) respond;

  setUp(() async {
    final harness = SipSubscriptionsRepositoryIntegrationHarness(NativeDatabase.memory());
    addTearDown(harness.dispose);
    await harness.initialize();
    local = harness.local;
    connectivity = harness.connectivity;
    requests = harness.requests;
    repository = harness.repository;
    respond = (_) async => _success();
    harness.respond = (request) => respond(request);
  });

  test('HTTP data is mapped to SQLite and a later 304 preserves the persisted snapshot', () async {
    final task = _register(repository, connectivity);
    await task.runNow();

    expect(task.state.phase, PollingTaskPhase.succeeded);
    expect(await local.watchAll().first, [_updated]);
    expect(requests.single.method.toUpperCase(), 'GET');
    expect(requests.single.headers['if-none-match'], isNull);

    respond = (_) async => http.Response('', 304, headers: {'etag': 'v1'});
    await task.runNow();

    expect(requests, hasLength(2));
    expect(requests.last.headers['if-none-match'], 'v1');
    expect(task.state.phase, PollingTaskPhase.succeeded);
    expect(await local.watchAll().first, [_updated]);
  });

  for (final status in [401, 429, 503]) {
    test('HTTP $status pull fails polling without replacing cached SIP subscriptions, then recovers', () async {
      respond = (_) async => _failure(status);
      final task = _register(repository, connectivity);

      await expectLater(task.runNow(), throwsA(isA<api.RequestFailure>()));

      expect(task.state.phase, PollingTaskPhase.failed);
      expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', status));
      expect(task.state.stackTrace, isNotNull);
      expect(await local.watchAll().first, [_cached]);
      expect(requests, hasLength(1));

      respond = (_) async => _success();
      await task.runNow();

      expect(task.state.phase, PollingTaskPhase.succeeded);
      expect(await local.watchAll().first, [_updated]);
      expect(requests.last.headers['if-none-match'], isNull);
    });

    test('HTTP $status push keeps a local edit usable but fails a polling retry until recovery', () async {
      await local.batchReplace([], removePrevious: true);
      respond = (_) async => _failure(status);
      connectivity.setConnected(true);

      await repository.upsert(_updated);

      expect((await local.getAll()).single.number, '1001');
      expect((await local.getAllOutboxActions()).single.sendAttempts, 1);
      expect(requests.single.method.toUpperCase(), 'POST');
      final action = (await local.getAllOutboxActions()).single;
      expect(jsonDecode(requests.single.body), {
        'actions': [
          {
            'action': 'upsert',
            'type': 'blf',
            'number': '1001',
            'contact_user_id': 'contact-1',
            'subscribed_at': DateTime.fromMicrosecondsSinceEpoch(action.timestampUsec!).toUtc().toIso8601String(),
          },
        ],
      });

      connectivity.setConnected(false);
      final task = _register(repository, connectivity);
      await expectLater(task.runNow(), throwsA(isA<api.RequestFailure>()));

      expect(task.state.phase, PollingTaskPhase.failed);
      expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', status));
      expect((await local.getAllOutboxActions()).single.sendAttempts, 2);
      expect((await local.getAll()).single.number, '1001');
      expect(requests, hasLength(2));

      respond = (_) async => _success();
      await task.runNow();

      expect(task.state.phase, PollingTaskPhase.succeeded);
      expect(await local.getAllOutboxActions(), isEmpty);
      expect(await local.watchAll().first, [_updated]);
      expect(requests, hasLength(3));
      expect(requests.every((request) => request.method.toUpperCase() == 'POST'), isTrue);
    });
  }

  test('a failed delete preserves the resolved contact ID and retries the durable outbox', () async {
    connectivity.setConnected(true);
    respond = (_) async => _failure(503);

    await repository.remove(_cached.type, _cached.number);

    expect(await local.getAll(), isEmpty);
    final pending = (await local.getAllOutboxActions()).single;
    expect(pending.action, SipSubscriptionOutboxActionType.delete);
    expect(pending.type, SipSubscriptionType.presence);
    expect(pending.contactUserId, _cached.contactUserId);
    expect(pending.sendAttempts, 1);
    final body = jsonDecode(requests.single.body) as Map<String, dynamic>;
    expect((body['actions'] as List).single, {
      'action': 'delete',
      'type': 'presence',
      'number': _cached.number,
      'contact_user_id': _cached.contactUserId,
      'subscribed_at': DateTime.fromMicrosecondsSinceEpoch(pending.timestampUsec!).toUtc().toIso8601String(),
    });

    connectivity.setConnected(false);
    final task = _register(repository, connectivity);
    await expectLater(task.runNow(), throwsA(isA<api.RequestFailure>()));
    expect(task.state.phase, PollingTaskPhase.failed);
    expect(await local.getAll(), isEmpty);
    expect((await local.getAllOutboxActions()).single.sendAttempts, 2);

    respond = (_) async => http.Response(
      '{"subscriptions":[],"conflicts":[]}',
      200,
      headers: {'content-type': 'application/json', 'etag': 'v2'},
    );
    await task.runNow();

    expect(task.state.phase, PollingTaskPhase.succeeded);
    expect(await local.getAllOutboxActions(), isEmpty);
    expect(await local.getAll(), isEmpty);
    expect(requests, hasLength(3));
    expect(requests.map((request) => request.body).toSet(), hasLength(1));
  });

  test('malformed SIP subscriptions payload fails refresh without discarding the cache', () async {
    respond = (_) async => http.Response('{"subscriptions":42}', 200);
    final task = _register(repository, connectivity);

    await expectLater(task.runNow(), throwsA(isA<TypeError>()));

    expect(task.state.phase, PollingTaskPhase.failed);
    expect(await local.watchAll().first, [_cached]);
    expect(requests, hasLength(1));
  });
}

http.Response _success() => SipSubscriptionsRepositoryIntegrationHarness.successResponse();

http.Response _failure(int status) => http.Response(
  status == 401 ? '{"code":"token_invalid"}' : '{"code":"backend_unavailable"}',
  status,
  headers: {'content-type': 'application/json'},
);

PollingTaskHandle _register(SipSubscriptionsRepositorySyncableImpl repository, FakeConnectivityService connectivity) {
  final polling = PollingService(connectivityService: connectivity, options: const PollingOptions(jitterRatio: 0));
  addTearDown(polling.dispose);
  return polling.register(PollingRegistration(listener: repository, interval: const Duration(seconds: 10)));
}
