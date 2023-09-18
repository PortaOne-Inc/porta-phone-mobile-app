//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/data/auth_firebase_data.dart' as _i12;
import 'package:data/data/data.dart' as _i11;
import 'package:data/data/http_datasource.dart' as _i6;
import 'package:data/di/injection.dart' as _i14;
import 'package:data/repository/application_repository_impl.dart' as _i10;
import 'package:data/repository/auth_repository_impl.dart' as _i13;
import 'package:data/repository/resources_repository_impl.dart' as _i8;
import 'package:data/repository/theme_repository_impl.dart' as _i9;
import 'package:dio/dio.dart' as _i3;
import 'package:domain/repository/repository.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

class DataPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i4.FirebaseAuth>(() => registerModule.auth());
    gh.lazySingleton<_i5.FirebaseStorage>(() => registerModule.storage());
    gh.lazySingleton<_i6.HttpDatasource>(() => _i6.HttpDatasource(
          gh<_i3.Dio>(),
          gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i7.ResourcesRepository>(
        () => _i8.ResourcesRepositoryImpl(gh<_i5.FirebaseStorage>()));
    gh.factory<_i7.ThemeRepository>(() =>
        _i9.ThemeRepositoryImpl(httpDatasource: gh<_i6.HttpDatasource>()));
    gh.factory<_i7.ApplicationRepository>(() => _i10.ApplicationRepositoryImpl(
        httpDatasource: gh<_i11.HttpDatasource>()));
    gh.lazySingleton<_i12.AuthFirebaseData>(
        () => _i12.AuthFirebaseData(gh<_i4.FirebaseAuth>()));
    gh.factory<_i7.AuthRepository>(
        () => _i13.AuthRepositoryImpl(datasource: gh<_i11.AuthFirebaseData>()));
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
