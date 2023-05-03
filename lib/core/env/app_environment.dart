import 'package:firebase_core/firebase_core.dart';

abstract class AppEnvironment {
  const AppEnvironment();

  String get name;

  Endpoints get endpoints;

  AuthorizationEmulator? get authorizationEmulator;

  FirebaseOptions get firebaseOptions;
}

class Endpoints {
  late final String _host;
  late final String _apiVersion;
  late final String _doc;

  Endpoints({
    required String host,
    required String apiVersion,
    required String docs,
  }) {
    _host = host;
    _apiVersion = apiVersion;
    _doc = docs;
  }

  String get host => _host + _apiVersion;

  String get doc => _host + _apiVersion + _doc;
}

class AuthorizationEmulator {
  final String host;
  final int port;

  AuthorizationEmulator({
    required this.host,
    required this.port,
  });
}
