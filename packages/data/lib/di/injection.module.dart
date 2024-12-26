//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/datasource/configurator_backend/configurator_backand_datasource.dart'
    as _i342;
import 'package:data/datasource/datasource.dart' as _i822;
import 'package:data/datasource/preferences/auth_pref_datasource.dart' as _i808;
import 'package:data/datasource/preferences/preferences.dart' as _i385;
import 'package:data/datasource/preferences/user_pref_datasource.dart' as _i759;
import 'package:data/di/injection.dart' as _i237;
import 'package:data/repository/application_repository_impl.dart' as _i747;
import 'package:data/repository/auth_repository_impl.dart' as _i442;
import 'package:data/repository/deployment_repository_impl.dart' as _i123;
import 'package:data/repository/resources_repository_impl.dart' as _i136;
import 'package:data/repository/theme_repository_impl.dart' as _i165;
import 'package:data/repository/translations_repository_impl.dart' as _i591;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i457.FirebaseStorage>(() => registerModule.storage());
    gh.lazySingleton<_i759.UserPrefDatasource>(
        () => _i759.UserPrefDatasource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i808.AuthPrefDatasource>(
        () => _i808.AuthPrefDatasource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(() => registerModule.serverApiClient(
          gh<String>(instanceName: 'newBaseUrl'),
          gh<_i822.AuthPrefDatasource>(),
        ));
    gh.lazySingleton<_i342.ConfiguratorBackandDatasource>(
        () => _i342.ConfiguratorBackandDatasource(
              gh<_i361.Dio>(),
              gh<_i385.AuthPrefDatasource>(),
            ));
    gh.factory<_i174.ResourcesRepository>(
        () => _i136.ResourcesRepositoryImpl(gh<_i457.FirebaseStorage>()));
    gh.factory<_i494.AuthRepository>(() => _i442.AuthRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          authPrefDataSource: gh<_i822.AuthPrefDatasource>(),
          userPrefDataSource: gh<_i822.UserPrefDatasource>(),
        ));
    gh.factory<_i174.ThemeRepository>(() => _i165.ThemeRepositoryImpl(
        configuratorBackandDatasource:
            gh<_i822.ConfiguratorBackandDatasource>()));
    gh.factory<_i174.TranslationsRepository>(() =>
        _i591.TranslationsRepositoryImpl(
            gh<_i822.ConfiguratorBackandDatasource>()));
    gh.factory<_i494.DeploymentRepository>(() => _i123.DeploymentRepositoryImpl(
        configuratorBackandDatasource:
            gh<_i822.ConfiguratorBackandDatasource>()));
    gh.factory<_i174.ApplicationRepository>(() =>
        _i747.ApplicationRepositoryImpl(
            configuratorBackandDatasource:
                gh<_i822.ConfiguratorBackandDatasource>()));
  }
}

class _$RegisterModule extends _i237.RegisterModule {}
