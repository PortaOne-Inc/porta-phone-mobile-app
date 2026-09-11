import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;

import 'package:api/api.dart' as api;

import 'package:webtrit_phone/services/services.dart';

import 'system_notifications_integration_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  systemNotificationsIntegrationTests((name, body) => test(name, body));
}

/// Shared scenarios run on the host and through Patrol on native SQLite.
void systemNotificationsIntegrationTests(void Function(String, Future<void> Function()) register) {
  for (final emptyHistory in [true, false]) {
    for (final producePush in [true, false]) {
      register('notifications: ${emptyHistory ? 'empty' : 'populated'} initial sync, push $producePush', () async {
        final harness = await SystemNotificationsIntegrationHarness.create(producePush: producePush);
        final historical = SystemNotificationsIntegrationHarness.notification(1);
        final news = SystemNotificationsIntegrationHarness.notification(2);
        harness.respond = (_) async => SystemNotificationsIntegrationHarness.response(emptyHistory ? [] : [historical]);

        await harness.owner.runNow();
        await pumpEventQueue();
        expect(harness.owner.state.phase, PollingTaskPhase.succeeded);
        expect(harness.pushes, isEmpty);
        expect(await harness.local.getLastUpdate(), emptyHistory ? isNull : historical.updatedAt);
        harness.expectRequest(0);

        harness.respond = (_) async => SystemNotificationsIntegrationHarness.response([news]);
        await harness.owner.runNow();
        await pumpEventQueue();
        expect(await harness.local.getNotificationById(news.id), news);
        harness.expectRequest(1, since: emptyHistory ? null : historical.updatedAt);
        expect(harness.requests, hasLength(2));
        if (producePush) {
          expect(harness.pushes, hasLength(1));
          expect(harness.pushes.single.id, news.id);
          expect(harness.pushes.single.title, news.title);
          expect(harness.pushes.single.body, news.content);
        } else {
          expect(harness.pushes, isEmpty);
        }
      });
    }
  }

  register('notifications: failed initialization retries silently before delivering news', () async {
    final harness = await SystemNotificationsIntegrationHarness.create();
    harness.respond = (_) async => http.Response('unavailable', 503);
    await expectLater(harness.owner.runNow(), throwsA(isA<api.RequestFailure>()));
    expect(harness.owner.state.phase, PollingTaskPhase.failed);
    expect(harness.owner.state.lastSuccessAt, isNull);
    expect(await harness.local.getNotifications(), isEmpty);

    final historical = SystemNotificationsIntegrationHarness.notification(1);
    harness.respond = (_) async => SystemNotificationsIntegrationHarness.response([historical]);
    await harness.owner.runNow();
    await pumpEventQueue();
    expect(await harness.local.getNotificationById(historical.id), historical);
    expect(harness.pushes, isEmpty);

    final news = SystemNotificationsIntegrationHarness.notification(2);
    harness.respond = (_) async => SystemNotificationsIntegrationHarness.response([news]);
    await harness.owner.runNow();
    await pumpEventQueue();
    expect(harness.pushes.single.id, news.id);
    expect(harness.owner.state.phase, PollingTaskPhase.succeeded);
    expect(harness.requests, hasLength(3));
    harness.expectRequest(0);
    harness.expectRequest(1);
    harness.expectRequest(2, since: historical.updatedAt);
  });

  for (final updates in [false, true]) {
    register(
      'notifications: logout rejects late ${updates ? 'full updates page' : 'history'} without restoring data',
      () async {
        final harness = await SystemNotificationsIntegrationHarness.create();
        final cached = SystemNotificationsIntegrationHarness.notification(1);
        if (updates) await harness.local.upsertNotifications([cached], silent: true);
        final arrived = Completer<void>();
        final response = Completer<http.Response>();
        harness.respond = (_) {
          if (!arrived.isCompleted) arrived.complete();
          return response.future;
        };
        // Always unblock the request before disposing the harness, even on failure.
        addTearDown(() {
          if (!response.isCompleted) response.complete(SystemNotificationsIntegrationHarness.response([]));
        });
        final outcome = harness.owner.runNow().then<Object?>((_) => null, onError: (Object error) => error);
        await arrived.future.timeout(const Duration(seconds: 5));
        harness.expectRequest(0, since: updates ? cached.updatedAt : null);

        await harness.owner.dispose();
        await harness.database.deleteEverything();
        expect(await harness.local.getNotifications(), isEmpty);
        response.complete(
          SystemNotificationsIntegrationHarness.response([
            SystemNotificationsIntegrationHarness.notification(2),
            SystemNotificationsIntegrationHarness.notification(3),
          ]),
        );
        expect(await outcome.timeout(const Duration(seconds: 5)), isA<StateError>());
        await pumpEventQueue();

        expect(await harness.local.getNotifications(), isEmpty);
        expect(await harness.local.getLastUpdate(), isNull);
        expect(harness.pushes, isEmpty);
        expect(harness.requests, hasLength(1), reason: 'A retired worker must not fetch another full page');
        expect(harness.owner.state.phase, PollingTaskPhase.stopped);
        await expectLater(harness.owner.runNow(), throwsStateError);
      },
    );
  }
}
