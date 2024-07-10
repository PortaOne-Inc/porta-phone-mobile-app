import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/di/di.dart';

Future<void> bootstrap(FutureOr<Widget> Function(GetIt di) builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      final diContainer = await configureDependencies();

      await Firebase.initializeApp(options: ApplicationEnvironment.firebaseOptions);
      // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

      return runApp(await builder(diContainer));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    },
  );
}
