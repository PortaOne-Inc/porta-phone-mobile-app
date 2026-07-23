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
  Dio serverApiClient(
    @Named('baseUrl') String baseUrl,
    AuthPrefDatasource authPref,
  ) {
    final options = BaseOptions(baseUrl: baseUrl);
    final dio = Dio(options);

    dio.interceptors.addAll([AuthInterceptor(authPref), LoggingInterceptor()]);

    return dio;
  }
}

@module
abstract class StorageModule {
  @preResolve
  Future<LocalStorage> provideLocalStorage() =>
      providePlatformSpecificStorage();
}
