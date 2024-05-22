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

  // URL for the GitHub API endpoint to dispatch a workflow for building the platform.
  // This URL will be used in the HTTP POST request to trigger the workflow in the GitHub repository.
  // Example usage:
  // curl --location 'https://api.github.com/repos/WebTrit/webtrit_phone_builder/actions/workflows/build_phone.yml/dispatches' \
  // --header 'Accept: application/vnd.github+json' \
  // --header 'Authorization: Bearer xxxxxxxxxxxxxxxx' \
  // --header 'X-GitHub-Api-Version: 2022-11-28' \
  // --header 'Content-Type: application/json' \
  // --data '{...}'
  static const CONFIGURATOR_DEPLOY_PLATFORM_BUILDS_URL = String.fromEnvironment(
    'WEBTRIT_CONFIGURATOR_DEPLOY_PLATFORM_BUILDS_URL',
  );

  // Token for authorization to dispatch a workflow in the GitHub repository.
  // This token will be included in the Authorization header of the HTTP POST request.
  // Example usage:
  // curl --location 'https://api.github.com/repos/WebTrit/webtrit_phone_builder/actions/workflows/build_phone.yml/dispatches' \
  // --header 'Accept: application/vnd.github+json' \
  // --header 'Authorization: Bearer xxxxxxxxxxxxxxxx' \
  // --header 'X-GitHub-Api-Version: 2022-11-28' \
  // --header 'Content-Type: application/json' \
  // --data '{...}'
  static const CONFIGURATOR_DEPLOY_PLATFORM_BUILDS_TOKEN = String.fromEnvironment(
    'WEBTRIT_CONFIGURATOR_DEPLOY_PLATFORM_BUILDS_TOKEN',
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
