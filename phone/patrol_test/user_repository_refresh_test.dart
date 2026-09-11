import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:patrol/patrol.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/data/app_preferences.dart';
import 'package:webtrit_phone/features/user_info/user_info.dart';
import 'package:webtrit_phone/repositories/user_info/user_repository.dart';
import 'package:webtrit_phone/services/polling_service.dart';
import 'package:webtrit_phone/services/polling_task_handle.dart';

import '../test/mocks/fake_connectivity_service.dart';
import '../test/repository/user_repository_integration_harness.dart';
import 'subsequences/wait_until.dart';

/// Native preferences and real polling/API/datasources, with controlled HTTP.
/// No login, backend, app bootstrap or OS network changes are needed.
void main() {
  patrolTest('user polling backs off after 503 and persists recovery on the device', ($) async {
    final harness = await _createHarness();
    final updates = <UserInfo>[];
    final streamErrors = <Object>[];
    final subscription = harness.repository.getAndListen().listen(updates.add, onError: streamErrors.add);
    addTearDown(subscription.cancel);
    await $.pump();

    final started = <DateTime>[];
    harness.respond = (_) async {
      started.add(DateTime.now());
      return started.length <= 2
          ? http.Response('adapter unavailable', 503)
          : UserRepositoryIntegrationHarness.successResponse();
    };
    final task = _register(harness.worker, connected: true);
    await _waitForPhase($, task, PollingTaskPhase.failed);
    final firstFailureAt = task.state.lastFailureAt!;
    expect(task.state.error, isA<api.RequestFailure>().having((e) => e.statusCode, 'status', 503));
    expect(harness.local.getInfo(), UserRepositoryIntegrationHarness.cachedUser);
    expect(updates, [UserRepositoryIntegrationHarness.cachedUser]);

    await waitUntil(
      $,
      () => started.length >= 2 && task.state.phase == PollingTaskPhase.failed,
      timeout: const Duration(seconds: 10),
      description: 'the second automatic refresh did not fail',
    );
    final secondFailureAt = task.state.lastFailureAt!;
    expect(started[1].difference(firstFailureAt), greaterThanOrEqualTo(const Duration(milliseconds: 1900)));

    await _waitForPhase($, task, PollingTaskPhase.succeeded);
    final recoveredAt = task.state.lastSuccessAt!;
    expect(started[2].difference(secondFailureAt), greaterThanOrEqualTo(const Duration(milliseconds: 3900)));
    expect(harness.local.getInfo(), UserRepositoryIntegrationHarness.updatedUser);

    await waitUntil(
      $,
      () => started.length >= 4 && task.state.phase == PollingTaskPhase.succeeded,
      timeout: const Duration(seconds: 3),
      description: 'recovery did not restore the one-second base interval',
    );
    task.unregister();
    expect(started, hasLength(4));
    expect(started[3].difference(recoveredAt), lessThan(const Duration(seconds: 3)));
    final preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    final reopenedLocal = UserLocalDatasourcePrefsImpl(await AppPreferencesImpl.init());
    expect(reopenedLocal.getInfo(), UserRepositoryIntegrationHarness.updatedUser);
    expect(updates, [UserRepositoryIntegrationHarness.cachedUser, UserRepositoryIntegrationHarness.updatedUser]);
    expect(streamErrors, isEmpty);
    expect(harness.sessionGuard.errors, isEmpty);
  });

  patrolTest('a rejected user session fails refresh and retains the native cache', ($) async {
    final harness = await _createHarness();
    harness.respond = (_) async => http.Response('{"code":"token_invalid"}', 401);
    final task = _register(harness.worker, connected: false);

    await expectLater(task.runNow(), throwsA(isA<api.UnauthorizedException>()));

    expect(task.state.phase, PollingTaskPhase.failed);
    expect(harness.sessionGuard.errors, hasLength(1));
    expect(task.state.error, same(harness.sessionGuard.errors.single));
    expect(harness.requests, hasLength(1));
    final preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    expect(harness.local.getInfo(), UserRepositoryIntegrationHarness.cachedUser);
  });
}

Future<UserRepositoryIntegrationHarness> _createHarness() async {
  final preferences = await AppPreferencesImpl.init();
  final previousUser = preferences.getString('user-info');
  // Restore only this scenario's key; never clear unrelated app/session data.
  addTearDown(
    () => previousUser == null ? preferences.remove('user-info') : preferences.setString('user-info', previousUser),
  );
  final harness = UserRepositoryIntegrationHarness(preferences);
  addTearDown(harness.dispose);
  await harness.local.setInfo(UserRepositoryIntegrationHarness.cachedUser);
  return harness;
}

PollingTaskHandle _register(UserInfoSyncWorker worker, {required bool connected}) {
  final connectivity = FakeConnectivityService(initialConnected: connected);
  addTearDown(connectivity.dispose);
  final polling = PollingService(connectivityService: connectivity, options: const PollingOptions(jitterRatio: 0));
  addTearDown(polling.dispose);
  return polling.register(PollingRegistration(listener: worker, interval: const Duration(seconds: 1)));
}

Future<void> _waitForPhase(PatrolIntegrationTester $, PollingTaskHandle task, PollingTaskPhase phase) async {
  await waitUntil(
    $,
    () => task.state.phase == phase,
    timeout: const Duration(seconds: 10),
    description: 'the user polling task did not reach $phase',
  );
}
