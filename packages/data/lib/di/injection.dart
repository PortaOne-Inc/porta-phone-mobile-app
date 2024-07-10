import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:data/datasource/datasource.dart';

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class RegisterModule {
  @LazySingleton()
  FirebaseStorage storage() => FirebaseStorage.instance;

  @preResolve
  Future<SharedPreferences> prefs() => SharedPreferences.getInstance();

  @LazySingleton()
  Dio serverApiClient(@Named('newBaseUrl') String baseUrl, AuthPrefDatasource authPref) {
    final option = BaseOptions(baseUrl: baseUrl);

    return Dio(option)
      ..interceptors.addAll([
        AuthInterceptor(authPref),
        LoggingInterceptor(),
      ]);
  }
}
