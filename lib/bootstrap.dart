// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'package:webtrit_configurator/di/di.dart';
import 'package:webtrit_configurator/app/env/env.dart';

Future<void> bootstrap(FutureOr<Widget> Function(GetIt di) builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      final diContainer = await configureDependencies(EnvironmentConfig.ENV);

      await Firebase.initializeApp(options: diContainer.get<AppEnvironment>().firebaseOptions);

      await (FirebaseAuth.instance).setPersistence(Persistence.LOCAL);

      _initializeFirebaseEnv();

      return runApp(await builder(diContainer));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    },
  );
}

void _initializeFirebaseEnv() {
  if (kIsWeb) {
    js.context[EnvironmentConfig.ENV_KEY] = EnvironmentConfig.ENV;
    html.document.dispatchEvent(html.CustomEvent('initialize_firebase_env'));
  }
}
