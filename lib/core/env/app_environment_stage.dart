import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

import 'app_environment.dart';

@Environment(Environment.dev)
@Singleton(as: AppEnvironment)
class DevEnvironment extends AppEnvironment {
  @override
  String get name => Environment.dev;

  @override
  Endpoints get endpoints => Endpoints(host: 'https://us-central1-webtrit-configurator-stage.cloudfunctions.net/api/v1');

  @override
  AuthorizationEmulator? get authorizationEmulator => null;

  @override
  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        apiKey: 'AIzaSyDfVipSr47hmDzE-b4Xq9y3ozFSF-GgLdc',
        authDomain: 'webtrit-configurator-stage.firebaseapp.com',
        projectId: 'webtrit-configurator-stage',
        storageBucket: 'webtrit-configurator-stage.appspot.com',
        messagingSenderId: '353614723935',
        appId: '1:353614723935:web:9e515b8043a2f84e6b54ea',
        measurementId: 'G-M2NNXXL0PY',
      );
}
