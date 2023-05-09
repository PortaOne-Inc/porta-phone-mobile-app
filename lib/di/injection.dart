import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/env/app_environment.dart';
import 'injection.config.dart';

late GetIt _getIt;

@InjectableInit()
Future<GetIt> configureDependencies({
  String environment = Environment.prod,
}) async {
  _getIt = GetIt.asNewInstance();
  _getIt.init(environment: environment);
  return _getIt;
}

@module
abstract class RegisterModule {

  @LazySingleton()
  FirebaseDatabase database() => FirebaseDatabase.instance;

  @LazySingleton()
  FirebaseAuth auth() {
    final firebaseAuth = FirebaseAuth.instance;
    final env = _getIt.get<AppEnvironment>();
    final authorizationOption = env.authorizationEmulator;

    if (authorizationOption != null) {
      firebaseAuth.useAuthEmulator(authorizationOption.host, authorizationOption.port);
    }
    return firebaseAuth;
  }

  @LazySingleton()
  FirebaseStorage storage() => FirebaseStorage.instance;

  @LazySingleton()
  Dio dio() {
    final dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await auth().currentUser?.getIdToken();
        final authToken = 'Bearer $token';
        options.headers['Authorization'] = authToken;
        return handler.next(options);
      },
    ));
    return dio;
  }
}
