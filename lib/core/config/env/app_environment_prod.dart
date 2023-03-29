import 'package:injectable/injectable.dart';

import 'app_environment.dart';

@Environment(Environment.prod)
@Singleton(as: AppEnvironment)
class ProdEnvironment implements AppEnvironment {
  @override
  String get name => Environment.prod;

  @override
  Endpoints get endpoints => Endpoints(
        url: 'https://us-central1-webtrit-configurator.cloudfunctions.net/api/v1',
      );

  @override
  AuthorizationEmulator? get authorizationEmulator => null;
}
