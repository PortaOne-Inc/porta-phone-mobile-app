import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:api/api.dart' as api;
import 'package:app_database/app_database.dart';

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/sip_subscriptions/sip_subscriptions.dart';

import '../mocks/fake_connectivity_service.dart';

/// Real API mapping, repository and SQLite, with controlled HTTP/connectivity.
/// Host tests use in-memory SQLite; Patrol supplies an isolated database file.
class SipSubscriptionsRepositoryIntegrationHarness {
  SipSubscriptionsRepositoryIntegrationHarness(QueryExecutor executor) : database = AppDatabase(executor) {
    local = SipSubscriptionsLocalDataSourceDriftImpl(database);
    client = api.WebtritApiClient.inner(Uri.parse('https://refresh.test'), '', httpClient: MockClient(_respond));
    repository = SipSubscriptionsRepositorySyncableImpl(
      localDataSource: local,
      remoteDataSource: SipSubscriptionsRemoteDataSourceApiImpl(apiClient: client, apiToken: 'integration-token'),
      connectivityService: connectivity,
    );
  }

  static final cached = SipSubscription(
    type: SipSubscriptionType.presence,
    number: '1000',
    contactUserId: 'contact-0',
    subscribedAt: DateTime.utc(2026, 9, 9).toLocal(),
  );
  static final updated = SipSubscription(
    type: SipSubscriptionType.blf,
    number: '1001',
    contactUserId: 'contact-1',
    subscribedAt: DateTime.utc(2026, 9, 10).toLocal(),
  );

  final AppDatabase database;
  final connectivity = FakeConnectivityService(initialConnected: false);
  final requests = <http.Request>[];
  late final api.WebtritApiClient client;
  late final SipSubscriptionsLocalDataSourceDriftImpl local;
  late final SipSubscriptionsRepositorySyncableImpl repository;
  Future<http.Response> Function(http.Request) respond = (_) async => successResponse();

  Future<void> initialize() => local.batchReplace([cached]);

  Future<http.Response> _respond(http.Request request) {
    expectSync(request.headers['authorization'], 'Bearer integration-token');
    final method = request.method.toUpperCase();
    expectSync(method, anyOf('GET', 'POST'));
    expectSync(
      request.url,
      Uri.parse('https://refresh.test/api/v1/user/sip_subscriptions${method == 'POST' ? '/batch_sync' : ''}'),
    );
    requests.add(request);
    return respond(request);
  }

  static http.Response successResponse() => http.Response(
    '{"subscriptions":[{"type":"blf","number":"1001","contact_user_id":"contact-1",'
    '"subscribed_at":"2026-09-10T00:00:00.000Z"}],"conflicts":[]}',
    200,
    headers: {'content-type': 'application/json', 'etag': 'v1'},
  );

  Future<void> dispose() async {
    client.close();
    await connectivity.dispose();
    await database.close();
  }
}
