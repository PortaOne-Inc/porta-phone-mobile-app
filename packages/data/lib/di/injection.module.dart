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
import 'package:data/datasource/preferences/user_pref_datasource.dart' as _i759;
import 'package:data/datasource/storage/file_storage.dart' as _i99;
import 'package:data/datasource/storage/local_storage.dart' as _i191;
import 'package:data/datasource/storage/shared_preferences.dart' as _i578;
import 'package:data/datasource/storage/storage.dart' as _i99;
import 'package:data/di/injection.dart' as _i237;
import 'package:data/dto/application/application.dart' as _i499;
import 'package:data/dto/dto.dart' as _i862;
import 'package:data/mappers/applications/app_version_mapper.dart' as _i377;
import 'package:data/mappers/applications/application_mapper.dart' as _i518;
import 'package:data/mappers/deployment/phone_branch_mapper.dart' as _i729;
import 'package:data/mappers/mapper.dart' as _i602;
import 'package:data/mappers/mappers.dart' as _i1058;
import 'package:data/mappers/themes/launch_asset_mapper.dart' as _i920;
import 'package:data/mappers/themes/splash_asset_mapper.dart' as _i369;
import 'package:data/mappers/themes/theme_asset_mapper.dart' as _i414;
import 'package:data/mappers/themes/theme_mapper.dart' as _i177;
import 'package:data/repository/application_repository_impl.dart' as _i747;
import 'package:data/repository/auth_repository_impl.dart' as _i442;
import 'package:data/repository/deployment_repository_impl.dart' as _i123;
import 'package:data/repository/resources_repository_impl.dart' as _i136;
import 'package:data/repository/theme_repository_impl.dart' as _i165;
import 'package:data/repository/translations_repository_impl.dart' as _i591;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:domain/entity/models/theme/splash_asset_model.dart' as _i1065;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final registerModule = _$RegisterModule();
    final storageModule = _$StorageModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    await gh.factoryAsync<_i822.LocalStorage>(
      () => storageModule.provideLocalStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i457.FirebaseStorage>(() => registerModule.storage());
    gh.factory<
            _i602.CommonMapper<_i494.ApplicationModel, _i499.ApplicationDTO>>(
        () => _i518.ApplicationMapper());
    gh.factory<_i602.CommonMapper<_i862.AppVersion, _i494.BuildVersionModel>>(
        () => _i377.AppVersionMapper());
    gh.factory<_i1058.CommonMapper<_i494.ThemeAssetModel, _i862.ThemeAssetDto>>(
        () => _i414.ThemeAssetMapper());
    gh.factory<_i602.CommonMapper<_i494.PhoneBranch, _i862.PhoneBranchDto>>(
        () => _i729.PhoneBranchMapper());
    gh.factory<
        _i602.CommonMapper<_i494.SplashAssetModel?,
            _i862.SplashAssetsDto?>>(() => _i369.SplashAssetsMapper());
    gh.factory<
        _i602.CommonMapper<_i494.LaunchAssetsModel?,
            _i862.LaunchAssetsDto?>>(() => _i920.LaunchAssetsMapper());
    gh.factory<_i191.LocalStorage>(
      () => _i99.FileStorage(gh<String>()),
      instanceName: 'FileStorage',
    );
    gh.factory<_i191.LocalStorage>(
      () => _i578.SharedPreferencesStorage(gh<_i460.SharedPreferences>()),
      instanceName: 'SharedPrefsStorage',
    );
    gh.lazySingleton<_i759.UserPrefDatasource>(
        () => _i759.UserPrefDatasource(gh<_i99.LocalStorage>()));
    gh.lazySingleton<_i808.AuthPrefDatasource>(
        () => _i808.AuthPrefDatasource(gh<_i99.LocalStorage>()));
    gh.lazySingleton<_i361.Dio>(() => registerModule.serverApiClient(
          gh<String>(instanceName: 'baseUrl'),
          gh<_i822.AuthPrefDatasource>(),
        ));
    gh.factory<_i174.ResourcesRepository>(
        () => _i136.ResourcesRepositoryImpl(gh<_i457.FirebaseStorage>()));
    gh.factory<_i1058.CommonMapper<_i494.ThemeModel, _i862.ThemeDTO>>(() =>
        _i177.ThemeMapper(
          gh<_i1058.CommonMapper<_i494.ThemeAssetModel, _i862.ThemeAssetDto>>(),
          gh<
              _i1058.CommonMapper<_i494.LaunchAssetsModel?,
                  _i862.LaunchAssetsDto?>>(),
          gh<
              _i1058
              .CommonMapper<_i494.SplashAssetModel?, _i862.SplashAssetsDto?>>(),
        ));
    gh.lazySingleton<_i342.ConfiguratorBackandDatasource>(
        () => _i342.ConfiguratorBackandDatasource(gh<_i342.Dio>()));
    gh.factory<_i174.TranslationsRepository>(() =>
        _i591.TranslationsRepositoryImpl(
            gh<_i822.ConfiguratorBackandDatasource>()));
    gh.factory<_i494.ThemeRepository>(() => _i165.ThemeRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          themeMapper:
              gh<_i1058.CommonMapper<_i494.ThemeModel, _i862.ThemeDTO>>(),
          themeAssetMapper: gh<
              _i1058
              .CommonMapper<_i494.ThemeAssetModel, _i862.ThemeAssetDto>>(),
          launchAssetsMapper: gh<
              _i1058.CommonMapper<_i494.LaunchAssetsModel?,
                  _i862.LaunchAssetsDto?>>(),
          splashAssetsMapper: gh<
              _i1058.CommonMapper<_i1065.SplashAssetModel?,
                  _i862.SplashAssetsDto?>>(),
        ));
    gh.factory<_i494.AuthRepository>(() => _i442.AuthRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          authPrefDataSource: gh<_i822.AuthPrefDatasource>(),
          userPrefDataSource: gh<_i822.UserPrefDatasource>(),
        ));
    gh.factory<_i494.DeploymentRepository>(() => _i123.DeploymentRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          phoneBranchMapper: gh<
              _i1058.CommonMapper<_i494.PhoneBranch, _i862.PhoneBranchDto>>(),
          appVersionMapper: gh<
              _i1058.CommonMapper<_i862.AppVersion, _i494.BuildVersionModel>>(),
        ));
    gh.factory<_i494.ApplicationRepository>(() =>
        _i747.ApplicationRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          applicationMapper: gh<
              _i1058
              .CommonMapper<_i494.ApplicationModel, _i862.ApplicationDTO>>(),
        ));
  }
}

class _$RegisterModule extends _i237.RegisterModule {}

class _$StorageModule extends _i237.StorageModule {}
