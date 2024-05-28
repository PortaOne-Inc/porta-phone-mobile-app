// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';

class ApplicationEnvironment {
  ApplicationEnvironment._();

  static const APP_NAME = String.fromEnvironment(
    'WEBTRIT_APP_NAME',
    defaultValue: 'Webtrit configurator',
  );

  static const CONFIGURATOR_API_URL = String.fromEnvironment(
    'WEBTRIT_CONFIGURATOR_API_URL',
  );

  // TODO(SERDUN): Change this variable name to 'CONFIGURATOR_API_URL' after migrating to nest all features
  static const CONFIGURATOR_API_URL_V1 = String.fromEnvironment(
    'WEBTRIT_CONFIGURATOR_API_URL_V1',
  );

  static const CONFIGURATOR_DOC_URL = String.fromEnvironment(
    'WEBTRIT_CONFIGURATOR_DOC_URL',
  );

  static FirebaseOptions get firebaseOptions {
    return const FirebaseOptions(
      apiKey: String.fromEnvironment('FIREBASE_API_KEY'),
      authDomain: String.fromEnvironment('FIREBASE_AUTH_DOMAIN'),
      projectId: String.fromEnvironment('FIREBASE_PROJECT_ID'),
      storageBucket: String.fromEnvironment('FIREBASE_STORAGE_BUCKET'),
      messagingSenderId: String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
      appId: String.fromEnvironment('FIREBASE_APP_ID'),
      measurementId: String.fromEnvironment('FIREBASE_MEASUREMENT_ID'),
    );
  }
}
