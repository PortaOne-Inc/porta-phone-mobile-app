import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:injectable/injectable.dart';

import 'app_environment.dart';

@Environment(Environment.test)
@Singleton(as: AppEnvironment)
class DevEnvironment extends AppEnvironment {
  @override
  String get name => Environment.test;

  @override
  Endpoints get endpoints => Endpoints(url: 'http://127.0.0.1:7981/webtrit-configurator-stage/us-central1/api/v1');

  @override
  AuthorizationEmulator get authorizationEmulator => AuthorizationEmulator(host: '127.0.0.1', port: 7980);

  @override
  FirebaseOptions get firebaseOptions => const FirebaseOptions(
      apiKey: 'AIzaSyAUDdR2-iV_LGI42vFNLCtHM-Bd-EIoGsk',
      authDomain: 'webtrit-configurator.firebaseapp.com',
      databaseURL: 'https://webtrit-configurator-default-rtdb.europe-west1.firebasedatabase.app',
      projectId: 'webtrit-configurator',
      storageBucket: 'webtrit-configurator.appspot.com',
      messagingSenderId: '242667391268',
      appId: '1:242667391268:web:3d40f4769e774b6ad64bb1',
      measurementId: 'G-HBK4609JQL');
}
