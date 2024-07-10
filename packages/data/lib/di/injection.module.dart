//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/datasource/configurator_backend/configurator_backand_datasource.dart'
    as _i9;
import 'package:data/datasource/datasource.dart' as _i8;
import 'package:data/datasource/preferences/auth_pref_datasource.dart' as _i6;
import 'package:data/datasource/preferences/preferences.dart' as _i10;
import 'package:data/datasource/preferences/user_pref_datasource.dart' as _i5;
import 'package:data/di/injection.dart' as _i19;
import 'package:data/repository/application_repository_impl.dart' as _i18;
import 'package:data/repository/auth_repository_impl.dart' as _i14;
import 'package:data/repository/deployment_repository_impl.dart' as _i17;
import 'package:data/repository/resources_repository_impl.dart' as _i12;
import 'package:data/repository/theme_repository_impl.dart' as _i15;
import 'package:data/repository/translations_repository_impl.dart' as _i16;
import 'package:dio/dio.dart' as _i7;
import 'package:domain/domain.dart' as _i13;
import 'package:domain/repository/repository.dart' as _i11;
import 'package:firebase_storage/firebase_storage.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

class DataPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i4.FirebaseStorage>(() => registerModule.storage());
    gh.lazySingleton<_i5.UserPrefDatasource>(
        () => _i5.UserPrefDatasource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i6.AuthPrefDatasource>(
        () => _i6.AuthPrefDatasource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i7.Dio>(() => registerModule.serverApiClient(
          gh<String>(instanceName: 'newBaseUrl'),
          gh<_i8.AuthPrefDatasource>(),
        ));
    gh.lazySingleton<_i9.ConfiguratorBackandDatasource>(
        () => _i9.ConfiguratorBackandDatasource(
              gh<_i7.Dio>(),
              gh<_i10.AuthPrefDatasource>(),
            ));
    gh.factory<_i11.ResourcesRepository>(
        () => _i12.ResourcesRepositoryImpl(gh<_i4.FirebaseStorage>()));
    gh.factory<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i8.ConfiguratorBackandDatasource>(),
          authPrefDataSource: gh<_i8.AuthPrefDatasource>(),
          userPrefDataSource: gh<_i8.UserPrefDatasource>(),
        ));
    gh.factory<_i11.ThemeRepository>(() => _i15.ThemeRepositoryImpl(
        configuratorBackandDatasource:
            gh<_i8.ConfiguratorBackandDatasource>()));
    gh.factory<_i11.TranslationsRepository>(() =>
        _i16.TranslationsRepositoryImpl(
            gh<_i8.ConfiguratorBackandDatasource>()));
    gh.factory<_i13.DeploymentRepository>(() => _i17.DeploymentRepositoryImpl(
        configuratorBackandDatasource:
            gh<_i8.ConfiguratorBackandDatasource>()));
    gh.factory<_i11.ApplicationRepository>(() => _i18.ApplicationRepositoryImpl(
        configuratorBackandDatasource:
            gh<_i8.ConfiguratorBackandDatasource>()));
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
