import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:data/data/interceptors/interceptors.dart';

@InjectableInit.microPackage()
void initMicroPackage() {}

@module
abstract class RegisterModule {
  @LazySingleton()
  FirebaseAuth auth() => FirebaseAuth.instance;

  @LazySingleton()
  FirebaseStorage storage() => FirebaseStorage.instance;

  @LazySingleton()
  Dio dio() => Dio()
    ..interceptors.addAll([
      FirebaseAuthInterceptor(auth()),
      LoggingInterceptor(),
    ]);

  @Named('github_client')
  @LazySingleton()
  Dio githubClient(@Named('deployPlatformBuildsToken') String token) {
    final option = BaseOptions(headers: {
      'Accept': 'application/vnd.github+json',
      'X-GitHub-Api-Version': '2022-11-28',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return Dio(option)
      ..interceptors.addAll([
        LoggingInterceptor(),
      ]);
  }
}
