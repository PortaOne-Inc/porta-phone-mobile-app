import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

import 'app_environment.dart';

@Environment(Environment.prod)
@Singleton(as: AppEnvironment)
class ProdEnvironment implements AppEnvironment {
  @override
  String get name => Environment.prod;

  @override
  Endpoints get endpoints => Endpoints(host: 'https://us-central1-webtrit-configurator.cloudfunctions.net/api/v1');

  @override
  AuthorizationEmulator? get authorizationEmulator => null;

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
