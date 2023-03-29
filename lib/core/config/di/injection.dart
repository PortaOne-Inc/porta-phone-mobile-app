import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../env/app_environment.dart';
import 'injection.config.dart';

late GetIt _getIt;

@InjectableInit()
Future<GetIt> configureDependencies({
  String environment = Environment.dev,
}) async {
  _getIt = GetIt.asNewInstance();
  _getIt.init(environment: environment);
  return _getIt;
}

@module
abstract class RegisterModule {
  @Singleton()
  FirebaseDatabase database() => FirebaseDatabase.instance;

  @Singleton()
  FirebaseAuth auth() => FirebaseAuth.instance;

  @Singleton()
  FirebaseStorage storage() => FirebaseStorage.instance;
}
