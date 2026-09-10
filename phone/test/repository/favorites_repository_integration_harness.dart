import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:api/api.dart' as api;
import 'package:app_database/app_database.dart';

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/favorites/favorites.dart';

import '../mocks/fake_connectivity_service.dart';

/// Real API mapping, repository and SQLite, with controlled HTTP/connectivity.
/// Host tests use in-memory SQLite; Patrol supplies an isolated database file.
class FavoritesRepositoryIntegrationHarness {
  FavoritesRepositoryIntegrationHarness(QueryExecutor executor) : database = AppDatabase(executor) {
    local = FavoritesLocalDataSourceDriftImpl(database);
    client = api.WebtritApiClient.inner(Uri.parse('https://refresh.test'), '', httpClient: MockClient(_respond));
    repository = FavoritesRepositorySyncableImpl(
      localDataSource: local,
      remoteDataSource: FavoritesRemoteDataSourceApiImpl(apiClient: client, apiToken: 'integration-token'),
      connectivityService: connectivity,
    );
  }

  static const cached = Favorite(
    number: '1000',
    sourceType: FavoriteSourceType.device,
    sourceId: 'device-1',
    label: 'main',
    position: 0,
  );
  static const updated = Favorite(
    number: '1001',
    sourceType: FavoriteSourceType.pbx,
    sourceId: 'contact-1',
    label: 'main',
    position: 0,
  );

  final AppDatabase database;
  final connectivity = FakeConnectivityService(initialConnected: false);
  final requests = <http.Request>[];
  late final api.WebtritApiClient client;
  late final FavoritesLocalDataSourceDriftImpl local;
  late final FavoritesRepositorySyncableImpl repository;
  Future<http.Response> Function(http.Request) respond = (_) async => successResponse();

  Future<void> initialize() => local.batchReplace([cached]);

  Future<http.Response> _respond(http.Request request) {
    expectSync(request.headers['authorization'], 'Bearer integration-token');
    final method = request.method.toUpperCase();
    expectSync(method, anyOf('GET', 'POST'));
    expectSync(
      request.url,
      Uri.parse('https://refresh.test/api/v1/user/favorites${method == 'POST' ? '/batch_sync' : ''}'),
    );
    requests.add(request);
    return respond(request);
  }

  static http.Response successResponse() => http.Response(
    '{"items":[{"number":"1001","source_type":"pbx","source_id":"contact-1",'
    '"label":"main","position":0}],"conflicts":[]}',
    200,
    headers: {'content-type': 'application/json', 'etag': 'v1'},
  );

  Future<void> dispose() async {
    client.close();
    await connectivity.dispose();
    await database.close();
  }
}
