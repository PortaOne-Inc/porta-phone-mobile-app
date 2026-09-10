import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

// ignore: depend_on_referenced_packages
import 'package:drift/native.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:api/api.dart' as api;
import 'package:app_database/app_database.dart';

import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/favorites/favorites.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../mocks/fake_connectivity_service.dart';

const _cached = Favorite(
  number: '1000',
  sourceType: FavoriteSourceType.device,
  sourceId: 'device-1',
  label: 'main',
  position: 0,
);
const _updated = Favorite(
  number: '1001',
  sourceType: FavoriteSourceType.pbx,
  sourceId: 'contact-1',
  label: 'main',
  position: 0,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;
  late api.WebtritApiClient client;
  late FavoritesLocalDataSourceDriftImpl local;
  late FavoritesRepositorySyncableImpl repository;
  late FakeConnectivityService connectivity;
  late List<http.Request> requests;
  late Future<http.Response> Function(http.Request) respond;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    local = FavoritesLocalDataSourceDriftImpl(database);
    await local.batchReplace([_cached]);
    connectivity = FakeConnectivityService(initialConnected: false);
    addTearDown(connectivity.dispose);
    requests = [];
    respond = (_) async => _success();
    client = api.WebtritApiClient.inner(
      Uri.parse('https://refresh.test'),
      '',
      httpClient: MockClient((request) {
        expect(request.headers['authorization'], 'Bearer integration-token');
        final method = request.method.toUpperCase();
        expect(method, anyOf('GET', 'POST'));
        expect(
          request.url,
          Uri.parse('https://refresh.test/api/v1/user/favorites${method == 'POST' ? '/batch_sync' : ''}'),
        );
        requests.add(request);
        return respond(request);
      }),
    );
    addTearDown(client.close);
    repository = FavoritesRepositorySyncableImpl(
      localDataSource: local,
      remoteDataSource: FavoritesRemoteDataSourceApiImpl(apiClient: client, apiToken: 'integration-token'),
      connectivityService: connectivity,
    );
  });

  test('HTTP data is mapped to SQLite and a later 304 preserves the persisted snapshot', () async {
    final task = _register(repository, connectivity);
    await task.runNow();

    expect(task.state.phase, PollingTaskPhase.succeeded);
    expect((await local.watchAllWithContacts().first).map((item) => item.favorite), [_updated]);
    expect(requests.single.method.toUpperCase(), 'GET');
    expect(requests.single.headers['if-none-match'], isNull);

    respond = (_) async => http.Response('', 304, headers: {'etag': 'v1'});
    await task.runNow();

    expect(requests, hasLength(2));
    expect(requests.last.headers['if-none-match'], 'v1');
    expect(task.state.phase, PollingTaskPhase.succeeded);
    expect((await local.watchAllWithContacts().first).map((item) => item.favorite), [_updated]);
  });

  for (final status in [401, 429, 503]) {
    test('HTTP $status pull fails polling without replacing cached favorites, then recovers', () async {
      respond = (_) async => _failure(status);
      final task = _register(repository, connectivity);

      await expectLater(task.runNow(), throwsA(isA<api.RequestFailure>()));

      expect(task.state.phase, PollingTaskPhase.failed);
      expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', status));
      expect(task.state.stackTrace, isNotNull);
      expect((await local.watchAllWithContacts().first).map((item) => item.favorite), [_cached]);
      expect(requests, hasLength(1));

      respond = (_) async => _success();
      await task.runNow();

      expect(task.state.phase, PollingTaskPhase.succeeded);
      expect((await local.watchAllWithContacts().first).map((item) => item.favorite), [_updated]);
      expect(requests.last.headers['if-none-match'], isNull);
    });

    test('HTTP $status push keeps a local edit usable but fails a polling retry until recovery', () async {
      await local.batchReplace([], removePrevious: true);
      respond = (_) async => _failure(status);
      connectivity.setConnected(true);

      await repository.addByContact(
        const ContactPhone(id: 1, number: '1001', label: 'main', favorite: false),
        Contact(id: 1, sourceType: ContactSourceType.external, sourceId: 'contact-1', kind: ContactKind.visible),
      );

      expect((await local.watchAllWithContacts().first).single.favorite.number, '1001');
      expect((await local.getAllOutboxActions()).single.sendAttempts, 1);
      expect(requests.single.method.toUpperCase(), 'POST');
      expect(jsonDecode(requests.single.body), {
        'actions': [
          {
            'action': 'upsert',
            'number': '1001',
            'source_type': 'pbx',
            'source_id': 'contact-1',
            'label': 'main',
            'position': null,
          },
        ],
      });

      connectivity.setConnected(false);
      final task = _register(repository, connectivity);
      await expectLater(task.runNow(), throwsA(isA<api.RequestFailure>()));

      expect(task.state.phase, PollingTaskPhase.failed);
      expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', status));
      expect((await local.getAllOutboxActions()).single.sendAttempts, 2);
      expect((await local.watchAllWithContacts().first).single.favorite.number, '1001');
      expect(requests, hasLength(2));

      respond = (_) async => _success();
      await task.runNow();

      expect(task.state.phase, PollingTaskPhase.succeeded);
      expect(await local.getAllOutboxActions(), isEmpty);
      expect((await local.watchAllWithContacts().first).map((item) => item.favorite), [_updated]);
      expect(requests, hasLength(3));
      expect(requests.every((request) => request.method.toUpperCase() == 'POST'), isTrue);
    });
  }

  test('malformed favorites payload fails refresh without discarding the cache', () async {
    respond = (_) async => http.Response('{"items":42}', 200);
    final task = _register(repository, connectivity);

    await expectLater(task.runNow(), throwsA(isA<TypeError>()));

    expect(task.state.phase, PollingTaskPhase.failed);
    expect((await local.watchAllWithContacts().first).map((item) => item.favorite), [_cached]);
    expect(requests, hasLength(1));
  });
}

http.Response _success() => http.Response(
  '{"items":[{"number":"1001","source_type":"pbx","source_id":"contact-1",'
  '"label":"main","position":0}],"conflicts":[]}',
  200,
  headers: {'content-type': 'application/json', 'etag': 'v1'},
);

http.Response _failure(int status) => http.Response(
  status == 401 ? '{"code":"token_invalid"}' : '{"code":"backend_unavailable"}',
  status,
  headers: {'content-type': 'application/json'},
);

PollingTaskHandle _register(FavoritesRepositorySyncableImpl repository, FakeConnectivityService connectivity) {
  final polling = PollingService(connectivityService: connectivity, options: const PollingOptions(jitterMaxMs: 0));
  addTearDown(polling.dispose);
  return polling.register(PollingRegistration(listener: repository, interval: const Duration(seconds: 10)));
}
