import 'package:injectable/injectable.dart';

import 'app_environment.dart';

@Environment(Environment.dev)
@Singleton(as: AppEnvironment)
class DevEnvironment extends AppEnvironment {
  @override
  String get name => Environment.dev;

  @override
  Endpoints get endpoints => Endpoints(
        url: 'http://127.0.0.1:7981/webtrit-configurator/us-central1/api/v1',
      );

  @override
  AuthorizationEmulator get authorizationEmulator => AuthorizationEmulator(host: '127.0.0.1', port: 7980);
}
