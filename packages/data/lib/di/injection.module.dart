//@GeneratedMicroModule;DataPackageModule;package:data/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/datasource/configurator_backend/configurator_backand_datasource.dart'
    as _i342;
import 'package:data/datasource/datasource.dart' as _i822;
import 'package:data/datasource/interceptors/interceptors.dart' as _i898;
import 'package:data/datasource/interceptors/unauthorized_interceptor.dart'
    as _i244;
import 'package:data/datasource/preferences/auth_pref_datasource.dart' as _i808;
import 'package:data/datasource/preferences/user_pref_datasource.dart' as _i759;
import 'package:data/datasource/storage/file_storage.dart' as _i99;
import 'package:data/datasource/storage/local_storage.dart' as _i191;
import 'package:data/datasource/storage/shared_preferences.dart' as _i578;
import 'package:data/datasource/storage/storage.dart' as _i99;
import 'package:data/di/injection.dart' as _i237;
import 'package:data/dto/application/application.dart' as _i499;
import 'package:data/dto/application/publication_resource_dto.dart' as _i948;
import 'package:data/dto/dto.dart' as _i862;
import 'package:data/dto/theme/color_scheme_dto.dart' as _i687;
import 'package:data/dto/theme/feature_access_dto.dart' as _i803;
import 'package:data/dto/theme/page_config_dto.dart' as _i610;
import 'package:data/dto/theme/theme_dto.dart' as _i592;
import 'package:data/mappers/applications/app_version_mapper.dart' as _i377;
import 'package:data/mappers/applications/application_mapper.dart' as _i518;
import 'package:data/mappers/applications/asset_link_mapper.dart' as _i675;
import 'package:data/mappers/applications/asset_mapper.dart' as _i1056;
import 'package:data/mappers/applications/embedded_resource_mapper.dart'
    as _i285;
import 'package:data/mappers/applications/publication_resource_mapper.dart'
    as _i553;
import 'package:data/mappers/deployment/callkeep_branch_mapper.dart' as _i730;
import 'package:data/mappers/deployment/phone_branch_mapper.dart' as _i729;
import 'package:data/mappers/mapper.dart' as _i602;
import 'package:data/mappers/mappers.dart' as _i1058;
import 'package:data/mappers/resources/constraints_mappers.dart' as _i848;
import 'package:data/mappers/resources/fit_mapper.dart' as _i788;
import 'package:data/mappers/resources/launch_assets_mapper.dart' as _i552;
import 'package:data/mappers/resources/splash_constraints_defaults_slice_mapper.dart'
    as _i192;
import 'package:data/mappers/resources/splash_mappers.dart' as _i832;
import 'package:data/mappers/themes/color_scheme_mapper.dart' as _i684;
import 'package:data/mappers/themes/feature_access_mapper.dart' as _i135;
import 'package:data/mappers/themes/page_config_mapper.dart' as _i229;
import 'package:data/mappers/themes/theme_mapper.dart' as _i177;
import 'package:data/mappers/themes/widget_config_mapper.dart' as _i467;
import 'package:data/mappers/translations/translation_http_mapper.dart' as _i51;
import 'package:data/repository/application_repository_impl.dart' as _i747;
import 'package:data/repository/asset_repository_impl.dart' as _i29;
import 'package:data/repository/auth_repository_impl.dart' as _i442;
import 'package:data/repository/color_scheme_repository_impl.dart' as _i1046;
import 'package:data/repository/deployment_repository_impl.dart' as _i123;
import 'package:data/repository/embeds_repository_impl.dart' as _i712;
import 'package:data/repository/feature_access_repository_impl.dart' as _i144;
import 'package:data/repository/launch_assets_repository_impl.dart' as _i959;
import 'package:data/repository/page_config_repository_impl.dart' as _i1054;
import 'package:data/repository/publication_resources_repository_impl.dart'
    as _i591;
import 'package:data/repository/resources_repository_impl.dart' as _i136;
import 'package:data/repository/splash_asset_repository_impl.dart' as _i316;
import 'package:data/repository/theme_repository_impl.dart' as _i165;
import 'package:data/repository/translations_repository_impl.dart' as _i591;
import 'package:data/repository/widget_config_repository_impl.dart' as _i340;
import 'package:domain/domain.dart' as _i494;
import 'package:domain/models/applications/publication_resource_model.dart'
    as _i96;
import 'package:domain/models/themes/feature_access_model.dart' as _i169;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:domain/repository/theme/feature_access_repository.dart'
    as _i908;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final registerModule = _$RegisterModule();
    final storageModule = _$StorageModule();
    gh.factory<_i244.UnauthorizedInterceptor>(
        () => _i244.UnauthorizedInterceptor());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    await gh.factoryAsync<_i822.LocalStorage>(
      () => storageModule.provideLocalStorage(),
      preResolve: true,
    );
    gh.factory<_i848.PlatformConstraintsMapper>(
        () => _i848.PlatformConstraintsMapper());
    gh.factory<_i788.LaunchFitMapper>(() => _i788.LaunchFitMapper());
    gh.factory<_i552.SourceConfigMapper>(() => _i552.SourceConfigMapper());
    gh.factory<_i552.OutputArtifactsMapper>(
        () => _i552.OutputArtifactsMapper());
    gh.factory<_i552.ValidationSliceMapper>(
        () => _i552.ValidationSliceMapper());
    gh.lazySingleton<_i457.FirebaseStorage>(() => registerModule.storage());
    gh.factory<_i602.CommonMapper<_i494.ThemeModel, _i592.ThemeDTO>>(
        () => _i177.ThemeDtoMapper());
    gh.factory<
            _i602.CommonMapper<_i494.ApplicationModel, _i499.ApplicationDTO>>(
        () => _i518.ApplicationMapper());
    gh.factory<
        _i602.CommonMapper<
            _i96.PublicationResourceModel,
            _i948
            .PublicationResourceDto>>(() => _i553.PublicationResourceMapper());
    gh.singleton<
            _i602.CommonMapper<_i494.PageConfigModel, _i862.PageConfigDto>>(
        () => _i229.PageConfigMapper());
    gh.factory<
            _i1058.CommonMapper<_i494.SplashConstraintsValidation,
                _i862.SplashConstraintsValidationDto>>(
        () => _i832.SplashConstraintsValidationMapper());
    gh.factory<_i602.CommonMapper<_i862.AppVersion, _i494.BuildVersionModel>>(
        () => _i377.AppVersionMapper());
    gh.factory<_i1058.CommonMapper<_i494.AssetLink, _i862.AssetLinkDto>>(
        () => _i675.AssetLinkMapper());
    gh.factory<
            _i602.CommonMapper<_i494.Translation, _i862.TranslationHttpModel>>(
        () => _i51.TranslationHttpMapper());
    gh.factory<_i602.CommonMapper<_i494.PhoneBranch, _i862.PhoneBranchDto>>(
        () => _i729.PhoneBranchMapper());
    gh.factory<_i602.CommonMapper<_i494.CallkeepBranch, _i862.CallkeepBranchDto>>(
        () => _i730.CallkeepBranchMapper());
    gh.factory<
            _i602.CommonMapper<_i494.ColorSchemeModel, _i862.ColorSchemeDto>>(
        () => _i684.ColorSchemeMapper());
    gh.factory<_i191.LocalStorage>(
      () => _i99.FileStorage(gh<String>()),
      instanceName: 'FileStorage',
    );
    gh.factory<_i848.ConstraintsMapper>(
        () => _i848.ConstraintsMapper(gh<_i848.PlatformConstraintsMapper>()));
    gh.lazySingleton<
        _i602.CommonMapper<_i494.FeatureAccessModel,
            _i803.FeatureAccessDto>>(() => _i135.FeatureAccessMapper());
    gh.lazySingleton<
            _i602.CommonMapper<_i494.WidgetsConfig, _i862.WidgetsConfigDto>>(
        () => _i467.WidgetConfigMapper());
    gh.factory<_i1058.CommonMapper<_i494.AssetModel, _i862.AssetDTO>>(() =>
        _i1056.AssetMapper(
            gh<_i1058.CommonMapper<_i494.AssetLink, _i862.AssetLinkDto>>()));
    gh.factory<_i191.LocalStorage>(
      () => _i578.SharedPreferencesStorage(gh<_i460.SharedPreferences>()),
      instanceName: 'SharedPrefsStorage',
    );
    gh.factory<_i552.ValidationReportMapper>(
        () => _i552.ValidationReportMapper(gh<_i552.ValidationSliceMapper>()));
    gh.factory<_i552.FitPaddingMapper>(
        () => _i552.FitPaddingMapper(gh<_i1058.LaunchFitMapper>()));
    gh.factory<
        _i1058.CommonMapper<_i494.EmbeddedResourceModel,
            _i862.EmbeddedResourceDto>>(() => _i285.EmbeddedResourceMapper());
    gh.factory<
            _i1058.CommonMapper<_i494.SplashConstraintsDefaultsSliceModel,
                _i862.SplashConstraintsDefaultsSliceDto>>(
        () => _i192.SplashConstraintsDefaultsSliceMapper());
    gh.factory<_i1058.CommonMapper<_i494.FitModel, _i862.FitDto>>(
        () => _i832.SplashFitEnumMapper());
    gh.factory<
        _i1058.CommonMapper<_i494.SplashConstraintsDefaultsModel,
            _i862.SplashConstraintsDefaultsDto>>(() =>
        _i192.SplashConstraintsDefaultsMapper(gh<
            _i1058.CommonMapper<_i494.SplashConstraintsDefaultsSliceModel,
                _i862.SplashConstraintsDefaultsSliceDto>>()));
    gh.lazySingleton<_i808.AuthPrefDatasource>(
        () => _i808.AuthPrefDatasource(gh<_i99.LocalStorage>()));
    gh.lazySingleton<_i759.UserPrefDatasource>(
        () => _i759.UserPrefDatasource(gh<_i99.LocalStorage>()));
    gh.lazySingleton<_i822.Dio>(() => registerModule.serverApiClient(
          gh<String>(instanceName: 'baseUrl'),
          gh<_i822.AuthPrefDatasource>(),
        ));
    gh.factory<_i174.ResourcesRepository>(
        () => _i136.ResourcesRepositoryImpl(gh<_i457.FirebaseStorage>()));
    gh.factory<
        _i1058.CommonMapper<_i494.SplashIconConstraints,
            _i862.SplashIconConstraintsDto>>(() =>
        _i832.SplashIconConstraintsMapper(gh<
            _i1058.CommonMapper<_i494.SplashConstraintsValidation,
                _i862.SplashConstraintsValidationDto>>()));
    gh.factory<
            _i1058
            .CommonMapper<_i494.SplashAssetParams, _i862.SplashAssetParamsDto>>(
        () => _i832.SplashAssetParamsMapper(
            gh<_i1058.CommonMapper<_i494.FitModel, _i862.FitDto>>()));
    gh.factory<_i552.PlatformParamsMapper>(
        () => _i552.PlatformParamsMapper(gh<_i552.FitPaddingMapper>()));
    gh.lazySingleton<_i342.ConfiguratorBackandDatasource>(
        () => _i342.ConfiguratorBackandDatasource(
              gh<_i342.Dio>(),
              gh<_i898.UnauthorizedInterceptor>(),
            ));
    gh.factory<_i494.DeploymentRepository>(() => _i123.DeploymentRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          phoneBranchMapper: gh<
              _i1058.CommonMapper<_i494.PhoneBranch, _i862.PhoneBranchDto>>(),
          callkeepBranchMapper: gh<
              _i1058.CommonMapper<_i494.CallkeepBranch, _i862.CallkeepBranchDto>>(),
          appVersionMapper: gh<
              _i1058.CommonMapper<_i862.AppVersion, _i494.BuildVersionModel>>(),
          authPrefDataSource: gh<_i822.AuthPrefDatasource>(),
        ));
    gh.factory<_i494.PageConfigRepository>(() =>
        _i1054.PageConfigRepositoryImpl(
          api: gh<_i342.ConfiguratorBackandDatasource>(),
          mapper: gh<
              _i602.CommonMapper<_i494.PageConfigModel, _i610.PageConfigDto>>(),
        ));
    gh.factory<_i494.TranslationsRepository>(() =>
        _i591.TranslationsRepositoryImpl(
          gh<_i822.ConfiguratorBackandDatasource>(),
          gh<
              _i1058
              .CommonMapper<_i494.Translation, _i862.TranslationHttpModel>>(),
        ));
    gh.factory<_i552.LaunchAssetsMapper>(() => _i552.LaunchAssetsMapper(
          gh<_i552.SourceConfigMapper>(),
          gh<_i552.PlatformParamsMapper>(),
          gh<_i552.OutputArtifactsMapper>(),
        ));
    gh.factory<_i908.FeatureAccessRepository>(
        () => _i144.FeatureAccessRepositoryImpl(
              api: gh<_i342.ConfiguratorBackandDatasource>(),
              mapper: gh<
                  _i602.CommonMapper<_i169.FeatureAccessModel,
                      _i803.FeatureAccessDto>>(),
            ));
    gh.factory<_i494.WidgetConfigRepository>(
        () => _i340.WidgetConfigRepositoryImpl(
              configuratorBackendDatasource:
                  gh<_i822.ConfiguratorBackandDatasource>(),
              widgetConfigMapper: gh<
                  _i1058
                  .CommonMapper<_i494.WidgetsConfig, _i862.WidgetsConfigDto>>(),
            ));
    gh.factory<
            _i1058.CommonMapper<_i494.SplashAssetModel, _i862.SplashAssetDto>>(
        () => _i832.SplashAssetMapper(
              gh<
                  _i1058.CommonMapper<_i494.SplashAssetParams,
                      _i862.SplashAssetParamsDto>>(),
              gh<
                  _i1058.CommonMapper<_i494.SplashIconConstraints,
                      _i862.SplashIconConstraintsDto>>(),
            ));
    gh.factory<_i494.ApplicationRepository>(() =>
        _i747.ApplicationRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          applicationMapper: gh<
              _i1058
              .CommonMapper<_i494.ApplicationModel, _i862.ApplicationDTO>>(),
        ));
    gh.factory<_i552.LaunchAssetsEnvelopeMapper>(
        () => _i552.LaunchAssetsEnvelopeMapper(
              gh<_i552.LaunchAssetsMapper>(),
              gh<_i552.ValidationReportMapper>(),
            ));
    gh.factory<_i494.ColorSchemeRepository>(() =>
        _i1046.ColorSchemeRepositoryImpl(
          gh<_i342.ConfiguratorBackandDatasource>(),
          gh<
              _i602
              .CommonMapper<_i494.ColorSchemeModel, _i687.ColorSchemeDto>>(),
        ));
    gh.factory<_i494.SplashAssetRepository>(() =>
        _i316.SplashAssetRepositoryImpl(
          configuratorBackendDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          splashAssetMapper: gh<
              _i1058
              .CommonMapper<_i494.SplashAssetModel, _i862.SplashAssetDto>>(),
          splashFitMapper:
              gh<_i1058.CommonMapper<_i494.FitModel, _i862.FitDto>>(),
        ));
    gh.singleton<_i494.AuthRepository>(
      () => _i442.AuthRepositoryImpl(
        configuratorBackandDatasource:
            gh<_i822.ConfiguratorBackandDatasource>(),
        authPrefDataSource: gh<_i822.AuthPrefDatasource>(),
        userPrefDataSource: gh<_i822.UserPrefDatasource>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i494.EmbedsRepository>(() => _i712.EmbedsRepositoryImpl(
          datasource: gh<_i822.ConfiguratorBackandDatasource>(),
          mapper: gh<
              _i602.CommonMapper<_i494.EmbeddedResourceModel,
                  _i862.EmbeddedResourceDto>>(),
        ));
    gh.factory<_i494.LaunchAssetsRepository>(
        () => _i959.LaunchAssetsRepositoryImpl(
              gh<_i342.ConfiguratorBackandDatasource>(),
              gh<_i1058.LaunchAssetsEnvelopeMapper>(),
              gh<_i1058.LaunchAssetsMapper>(),
              gh<_i1058.SourceConfigMapper>(),
              gh<_i1058.PlatformParamsMapper>(),
              gh<_i848.ConstraintsMapper>(),
            ));
    gh.factory<_i494.PublicationResourcesRepository>(
        () => _i591.PublicationResourcesRepositoryImpl(
              datasource: gh<_i822.ConfiguratorBackandDatasource>(),
              mapper: gh<
                  _i602.CommonMapper<_i494.PublicationResourceModel,
                      _i862.PublicationResourceDto>>(),
            ));
    gh.factory<_i494.ThemeRepository>(() => _i165.ThemeRepositoryImpl(
          configuratorBackandDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          themeMapper:
              gh<_i1058.CommonMapper<_i494.ThemeModel, _i862.ThemeDTO>>(),
        ));
    gh.singleton<_i494.AssetRepository>(() => _i29.AssetRepositoryImpl(
          configuratorBackendDatasource:
              gh<_i822.ConfiguratorBackandDatasource>(),
          assetMapper:
              gh<_i1058.CommonMapper<_i494.AssetModel, _i862.AssetDTO>>(),
          assetLinkMapper:
              gh<_i1058.CommonMapper<_i494.AssetLink, _i862.AssetLinkDto>>(),
        ));
  }
}

class _$RegisterModule extends _i237.RegisterModule {}

class _$StorageModule extends _i237.StorageModule {}
