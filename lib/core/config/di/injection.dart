import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

@InjectableInit()
Future<GetIt> configureDependencies({String environment = Environment.dev}) async {
  final di = GetIt.asNewInstance();
  di.init();
  return di;
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
