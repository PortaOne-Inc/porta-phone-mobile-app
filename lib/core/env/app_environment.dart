abstract class AppEnvironment {
  const AppEnvironment();

  String get name;

  Endpoints get endpoints;

  AuthorizationEmulator? get authorizationEmulator;
}

class Endpoints {
  final String url;

  Endpoints({
    required this.url,
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
