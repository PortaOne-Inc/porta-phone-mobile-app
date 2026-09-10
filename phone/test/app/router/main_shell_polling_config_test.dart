import 'package:clock/clock.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:webtrit_phone/app/router/main_shell_services.dart';
import 'package:webtrit_phone/data/data.dart';
import 'package:webtrit_phone/environment_config.dart';
import 'package:webtrit_phone/repositories/repositories.dart';
import 'package:webtrit_phone/services/services.dart';

import '../../helpers/feature_access_factories.dart';
import '../../mocks/fake_connectivity_service.dart';
import '../../mocks/mock_refreshable_repository.dart';

class _UserRepository extends Mock implements UserRepository {}

class _SystemInfoRepository extends Mock implements SystemInfoRepository {}

class _CallerIdSettingsRepository extends Fake implements CallerIdSettingsRepository {}

class _FavoritesRepository extends Fake implements FavoritesRepository {}

class _SipSubscriptionsRepository extends Fake implements SipSubscriptionsRepository {}

class _IceServersRepository extends Fake implements IceServersRepository {}

void main() {
  tearDown(EnvironmentConfig.clearOverrides);

  for (final override in <int?>[null, 1800]) {
    testWidgets('shell uses ${override ?? 'default 900'}s cap and snapshots it at creation', (tester) async {
      const name = EnvironmentConfig.POLLING_MAX_BACKOFF_SECONDS__NAME;
      if (override != null) EnvironmentConfig.applyOverrides({name: '$override'});

      final (connectivity, polling) = await _pumpShell(tester);

      final task = MockRefreshableRepository(now: tester.binding.clock.now)..failTimes = 4;
      polling.register(PollingRegistration(listener: task, interval: const Duration(seconds: 300)));
      connectivity.setConnected(true);
      await tester.pump();
      expect(task.callCount, 1);

      // Later override updates do not mutate this service's immutable options.
      EnvironmentConfig.applyOverrides({name: '3600'});
      final delays = override == null ? [600, 900, 900, 900, 300] : [600, 1200, 1800, 1800, 300];
      var calls = 1;
      for (final seconds in delays) {
        // Check on either side of the full production delay, including its
        // proportional jitter, relative to the actual previous call. This
        // avoids accumulating the slack used by earlier pumps.
        final beforeDeadline = task.callTimestamps.last.add(Duration(seconds: seconds - 1));
        await tester.pump(beforeDeadline.difference(tester.binding.clock.now()));
        expect(task.callCount, calls);
        final maximumJitter = Duration(milliseconds: (seconds * 1000 * 0.1).round());
        await tester.pump(const Duration(seconds: 1) + maximumJitter);
        expect(task.callCount, ++calls);
      }

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  }
  for (final override in <int?>[null, 5, 0]) {
    testWidgets('shell snapshots leading min-age cap ${override ?? 'default 30'}s', (tester) async {
      await withClock(Clock(tester.binding.clock.now), () async {
        const name = EnvironmentConfig.POLLING_LEADING_REFRESH_MIN_AGE_CAP_SECONDS__NAME;
        EnvironmentConfig.applyOverrides(override == null ? {} : {name: '$override'});
        final (connectivity, polling) = await _pumpShell(tester);
        final task = MockRefreshableRepository();
        polling.register(PollingRegistration(listener: task, interval: const Duration(minutes: 5)));
        connectivity.setConnected(true);
        await tester.pump();
        expect(task.calls, 1);
        EnvironmentConfig.applyOverrides({name: '120'});
        final cap = override ?? 30;
        if (cap > 0) {
          await tester.pump(Duration(seconds: cap) - const Duration(milliseconds: 1));
          connectivity.setConnected(false);
          await tester.pump();
          connectivity.setConnected(true);
          await tester.pump();
          expect(task.calls, 1);
          await tester.pump(const Duration(milliseconds: 1));
        }
        connectivity.setConnected(false);
        await tester.pump();
        connectivity.setConnected(true);
        await tester.pump();
        expect(task.calls, 2);
        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    });
  }
}

Future<(FakeConnectivityService, PollingService)> _pumpShell(WidgetTester tester) async {
  final connectivity = FakeConnectivityService();
  addTearDown(connectivity.dispose);
  final userRepository = _UserRepository();
  final systemInfoRepository = _SystemInfoRepository();
  when(() => userRepository.isActive).thenReturn(false);
  when(() => systemInfoRepository.isActive).thenReturn(false);
  late PollingService polling;

  await tester.pumpWidget(
    MultiProvider(
      providers: [
        Provider<FeatureAccess>.value(value: featureAccessFor(createMockSystemInfo())),
        Provider<ConnectivityService>.value(value: connectivity),
        Provider<UserRepository>.value(value: userRepository),
        Provider<SystemInfoRepository>.value(value: systemInfoRepository),
        Provider<CallerIdSettingsRepository>.value(value: _CallerIdSettingsRepository()),
        Provider<FavoritesRepository>.value(value: _FavoritesRepository()),
        Provider<SipSubscriptionsRepository>.value(value: _SipSubscriptionsRepository()),
        Provider<IceServersRepository>.value(value: _IceServersRepository()),
      ],
      child: MainShellServices(
        child: Builder(
          builder: (context) {
            polling = context.read<PollingService>();
            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );

  return (connectivity, polling);
}
