import 'package:firebase_core/firebase_core.dart';

abstract class AppEnvironment {
  const AppEnvironment();

  String get name;

  Endpoints get endpoints;

  AuthorizationEmulator? get authorizationEmulator;

  FirebaseOptions get firebaseOptions;
}

class Endpoints {
  final String host;

  Endpoints({
    required this.host,
  });
}

class AuthorizationEmulator {
  final String host;
  final int port;

  AuthorizationEmulator({
    required this.host,
    required this.port,
  });
}
