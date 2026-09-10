import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_semver/pub_semver.dart';

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/data/app_preferences.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/repositories/system_info/system_info.dart';
import 'package:webtrit_phone/utils/api_client_factory.dart';

/// Real system-info pipeline with controlled HTTP and a cache-write fault hook.
class SystemInfoRepositoryIntegrationHarness {
  SystemInfoRepositoryIntegrationHarness(AppPreferences storage)
    : preferences = ControlledSystemInfoPreferences(storage) {
    client = api.WebtritApiClient.inner(Uri.parse('https://refresh.test'), '', httpClient: MockClient(_respond));
    final factory = _MockApiClientFactory();
    when(
      () => factory.createWebtritApiClient(
        coreUrl: any(named: 'coreUrl'),
        tenantId: any(named: 'tenantId'),
      ),
    ).thenReturn(client);
    local = SystemInfoLocalRepositoryPrefsImpl(preferences);
    remote = SystemInfoRemoteDatasource(factory);
    repository = SystemInfoRepositoryImpl(localDatasource: local, remoteDatasource: remote);
  }

  static final cachedInfo = WebtritSystemInfo(
    core: CoreInfo(version: Version(1, 0, 0)),
    postgres: PostgresInfo(version: '15.0'),
  );
  static final updatedInfo = WebtritSystemInfo(
    core: CoreInfo(version: Version(1, 1, 0), iceServersConfigured: true),
    postgres: PostgresInfo(version: '15.0'),
    bundleVersion: 'integration',
  );

  static http.Response successResponse() => http.Response(
    '{"core":{"version":"1.1.0","ice_servers_configured":true},'
    '"postgres":{"version":"15.0"},"bundle_version":"integration"}',
    200,
    headers: {'content-type': 'application/json'},
  );

  final ControlledSystemInfoPreferences preferences;
  final requests = <http.Request>[];
  late final api.WebtritApiClient client;
  late final SystemInfoLocalRepositoryPrefsImpl local;
  late final SystemInfoRemoteDatasource remote;
  late final SystemInfoRepositoryImpl repository;
  Future<http.Response> Function(http.Request) respond = (_) async => successResponse();

  Future<http.Response> _respond(http.Request request) {
    // Automatic requests can arrive while Patrol is pumping frames.
    expectSync(request.method.toUpperCase(), 'GET');
    expectSync(request.url, Uri.parse('https://refresh.test/api/v1/system-info'));
    expectSync(request.headers['authorization'], isNull);
    requests.add(request);
    return respond(request);
  }

  Future<void> dispose() async {
    await repository.dispose();
    await local.dispose();
    await remote.dispose();
    client.close();
  }
}

class _MockApiClientFactory extends Mock implements WebtritApiClientFactory {}

/// Forwards the system-info preferences API with a hook before each write.
/// The hook controls the write boundary, not the underlying native filesystem.
class ControlledSystemInfoPreferences extends Fake implements AppPreferences {
  ControlledSystemInfoPreferences(this.storage);

  final AppPreferences storage;
  Future<void> Function()? beforeWrite;
  var writes = 0;

  @override
  String? getSystemInfo() => storage.getSystemInfo();

  @override
  Future<void> setSystemInfo(String value) async {
    writes++;
    await beforeWrite?.call();
    await storage.setSystemInfo(value);
  }

  @override
  Future<void> removeSystemInfo() => storage.removeSystemInfo();
}
