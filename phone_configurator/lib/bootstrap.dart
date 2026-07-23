import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/core/data/package_info.dart';
import 'package:webtrit_configurator/di/di.dart';
import 'package:webtrit_phone/data/app_themes.dart';

import '../gen/assets.gen.dart';

final _logger = Logger('bootstrap');

Future<void> bootstrap(FutureOr<Widget> Function(GetIt di) builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      hierarchicalLoggingEnabled = true;

      Logger.root.clearListeners();
      Logger.root.level = Level.ALL;

      PrintAppender(
        formatter: const ColorFormatter(),
      ).attachToLogger(Logger.root);

      final diContainer = await configureDependencies();

      // Initialize Firebase
      await Firebase.initializeApp(
        options: ApplicationEnvironment.firebaseOptions,
      );

      // // Load phone environment
      // final phoneEnvironment = await _getJson(Assets.environment.dartDefine) as Map<String, dynamic>;
      // diContainer.registerSingleton(phoneEnvironment, instanceName: 'phoneEnvironment');

      // // Load and configure themes
      final themeSettings = await _initializeAppThemes();
      diContainer.registerSingleton(themeSettings);

      // Init data
      final packageInfo = await PackageInfo.init();

      final phoneDefaultTheme = await AppThemes.init();
      diContainer
        ..registerSingleton(phoneDefaultTheme.values.first.settings)
        ..registerSingleton(phoneDefaultTheme.appConfig)
        ..registerSingleton(packageInfo);

      return runApp(await builder(diContainer));
    },
    (error, stackTrace) {
      debugPrint('🔴 Uncaught: $error');
      debugPrint('$stackTrace');
    },
  );

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint('🟠 PlatformDispatcher.onError: $error');
    debugPrint('$stack');
    return true;
  };
}

Future<ConfiguratorThemeSettings> _initializeAppThemes() async {
  final themeJson =
      await _getJson(Assets.scheme.original) as Map<String, dynamic>;
  final settings = ConfiguratorThemeSettings.fromJson(themeJson);

  try {
    if (settings.fontFamily != null) {
      await GoogleFonts.pendingFonts([
        GoogleFonts.getFont(settings.fontFamily!),
      ]);
    }
  } catch (e) {
    _logger.warning('Failed to load font: ${settings.fontFamily}');
  }

  return settings;
}

Future<dynamic> _getJson(String path) async {
  return jsonDecode(await rootBundle.loadString(path));
}
