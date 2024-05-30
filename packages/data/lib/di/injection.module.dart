//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/data/auth_firebase_data.dart' as _i6;
import 'package:data/data/data.dart' as _i11;
import 'package:data/data/github_datasource.dart' as _i7;
import 'package:data/data/http_datasource.dart' as _i14;
import 'package:data/di/injection.dart' as _i18;
import 'package:data/repository/application_repository_impl.dart' as _i16;
import 'package:data/repository/auth_repository_impl.dart' as _i10;
import 'package:data/repository/deployment_repository_impl.dart' as _i13;
import 'package:data/repository/resources_repository_impl.dart' as _i9;
import 'package:data/repository/theme_repository_impl.dart' as _i17;
import 'package:data/repository/translations_repository_impl.dart' as _i15;
import 'package:dio/dio.dart' as _i5;
import 'package:domain/domain.dart' as _i12;
import 'package:domain/repository/repository.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

class DataPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.auth());
    gh.lazySingleton<_i4.FirebaseStorage>(() => registerModule.storage());
    gh.lazySingleton<_i5.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i6.AuthFirebaseData>(
        () => _i6.AuthFirebaseData(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i5.Dio>(
      () => registerModule
          .githubClient(gh<String>(instanceName: 'deployPlatformBuildsToken')),
      instanceName: 'github_client',
    );
    gh.lazySingleton<_i7.GithubDatasource>(() => _i7.GithubDatasource(
          gh<_i5.Dio>(instanceName: 'github_client'),
          gh<String>(instanceName: 'deployPlatformBuildsURL'),
        ));
    gh.factory<_i8.ResourcesRepository>(
        () => _i9.ResourcesRepositoryImpl(gh<_i4.FirebaseStorage>()));
    gh.factory<_i8.AuthRepository>(
        () => _i10.AuthRepositoryImpl(datasource: gh<_i11.AuthFirebaseData>()));
    gh.factory<_i12.DeploymentRepository>(() => _i13.DeploymentRepositoryImpl(
        githubDatasource: gh<_i11.GithubDatasource>()));
    gh.lazySingleton<_i14.HttpDatasource>(() => _i14.HttpDatasource(
          gh<_i5.Dio>(),
          gh<String>(instanceName: 'baseUrl'),
        ));
    gh.factory<_i8.TranslationsRepository>(
        () => _i15.TranslationsRepositoryImpl(gh<_i11.HttpDatasource>()));
    gh.factory<_i8.ApplicationRepository>(() => _i16.ApplicationRepositoryImpl(
        httpDatasource: gh<_i11.HttpDatasource>()));
    gh.factory<_i8.ThemeRepository>(() =>
        _i17.ThemeRepositoryImpl(httpDatasource: gh<_i14.HttpDatasource>()));
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
