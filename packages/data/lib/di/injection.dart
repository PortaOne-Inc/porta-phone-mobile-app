import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

late GetIt di;

@InjectableInit.microPackage()
initMicroPackage() {}

@module
abstract class RegisterModule {
  @LazySingleton()
  FirebaseAuth auth() => FirebaseAuth.instance;

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
