import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'package:webtrit_configurator/core/config/firebase/firebase_options.dart';
import 'package:webtrit_phone/data/device_info.dart';
import 'package:webtrit_phone/data/package_info.dart';
import 'package:webtrit_phone/data/secure_storage.dart';

import 'package:webtrit_configurator/core/config/di/di.dart';

Future<void> bootstrap(FutureOr<Widget> Function(GetIt di) builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      await DeviceInfo.init();
      await PackageInfo.init();
      await SecureStorage.init();
      await (FirebaseAuth.instance).setPersistence(Persistence.LOCAL);

      final diContainer = await configureDependencies();

      return runApp(await builder(diContainer));
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    },
  );
}
