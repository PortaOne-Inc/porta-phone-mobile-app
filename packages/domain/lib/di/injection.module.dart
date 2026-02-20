//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/repository/application/asset_repository.dart' as _i919;
import 'package:domain/repository/application/publication_resource_model.dart'
    as _i1048;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:domain/repository/resources/splash_asset_repository.dart'
    as _i89;
import 'package:domain/repository/theme/color_scheme_repository.dart' as _i323;
import 'package:domain/repository/theme/feature_access_repository.dart'
    as _i908;
import 'package:domain/repository/theme/page_config_repository.dart' as _i278;
import 'package:domain/repository/theme/widget_config_repository.dart' as _i551;
import 'package:domain/usecase/applications/application_create.dart' as _i53;
import 'package:domain/usecase/applications/create_application_embed_usecase.dart'
    as _i392;
import 'package:domain/usecase/applications/create_application_publication_resource_usecase.dart'
    as _i602;
import 'package:domain/usecase/applications/delete_application_embed_usecase.dart'
    as _i999;
import 'package:domain/usecase/applications/delete_application_publication_resource_usecase.dart'
    as _i833;
import 'package:domain/usecase/applications/generate_theme_usecase.dart'
    as _i1046;
import 'package:domain/usecase/applications/get_application_embeds_usecase.dart'
    as _i199;
import 'package:domain/usecase/applications/get_application_publication_resources_usecase.dart'
    as _i526;
import 'package:domain/usecase/applications/nudge_theme_usecase.dart' as _i690;
import 'package:domain/usecase/applications/update_application_embed_usecase.dart'
    as _i944;
import 'package:domain/usecase/applications/update_application_publication_resource_usecase.dart'
    as _i863;
import 'package:domain/usecase/applications/update_application_useecase.dart'
    as _i189;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i434;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i81;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i548;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i210;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i43;
import 'package:domain/usecase/assets/create_application_asset_usecase.dart'
    as _i926;
import 'package:domain/usecase/assets/delete_application_asset_usecase.dart'
    as _i157;
import 'package:domain/usecase/assets/get_application_assets_usecase.dart'
    as _i903;
import 'package:domain/usecase/assets/get_asset_download_url_usecase.dart'
    as _i358;
import 'package:domain/usecase/auth/get_auth_status_usecase.dart' as _i683;
import 'package:domain/usecase/auth/get_user_usecase.dart' as _i459;
import 'package:domain/usecase/auth/log_out_auth_usecase.dart' as _i73;
import 'package:domain/usecase/auth/monitor_token_expiration_usecase.dart'
    as _i490;
import 'package:domain/usecase/auth/reset_auth_password_usecase.dart' as _i1021;
import 'package:domain/usecase/auth/sign_in_auth_usecase.dart' as _i337;
import 'package:domain/usecase/deployment/get_callkeep_branches_usecase.dart'
    as _i923;
import 'package:domain/usecase/deployment/get_phone_branches_usecase.dart'
    as _i902;
import 'package:domain/usecase/deployment/usecase_deploy_builds.dart' as _i606;
import 'package:domain/usecase/deployment/usecase_update_build_name.dart'
    as _i638;
import 'package:domain/usecase/deployment/usecase_update_build_number.dart'
    as _i95;
import 'package:domain/usecase/resources/delete_launch_assets_usecase.dart'
    as _i13;
import 'package:domain/usecase/resources/delete_splash_asset_usecase.dart'
    as _i535;
import 'package:domain/usecase/resources/get_constraints_defaults_usecase.dart'
    as _i490;
import 'package:domain/usecase/resources/get_launch_assets_usecase.dart'
    as _i1049;
import 'package:domain/usecase/resources/get_splash_asset_usecase.dart'
    as _i1060;
import 'package:domain/usecase/resources/get_splash_constraints_defaults_usecase.dart'
    as _i137;
import 'package:domain/usecase/resources/upload_file_use_case.dart' as _i151;
import 'package:domain/usecase/resources/upsert_launch_assets_usecase.dart'
    as _i450;
import 'package:domain/usecase/resources/upsert_splash_asset_usecase.dart'
    as _i970;
import 'package:domain/usecase/resources/watch_application_assets_usecase.dart'
    as _i892;
import 'package:domain/usecase/resources/watch_embeds_usecase.dart' as _i88;
import 'package:domain/usecase/theme/copy_theme_usecase.dart' as _i928;
import 'package:domain/usecase/theme/delete_feature_access_usecase.dart'
    as _i852;
import 'package:domain/usecase/theme/ensure_color_scheme_pair_usecase.dart'
    as _i351;
import 'package:domain/usecase/theme/ensure_page_configs_pair_usecase.dart'
    as _i175;
import 'package:domain/usecase/theme/ensure_widget_config_pair.dart' as _i810;
import 'package:domain/usecase/theme/get_all_themes_usecase.dart' as _i767;
import 'package:domain/usecase/theme/get_application_environment_usecase.dart'
    as _i43;
import 'package:domain/usecase/theme/get_application_feature_access_usecase.dart'
    as _i492;
import 'package:domain/usecase/theme/get_color_scheme_by_theme_variant_usecase.dart'
    as _i1069;
import 'package:domain/usecase/theme/get_feature_access_usecase.dart' as _i422;
import 'package:domain/usecase/theme/get_page_config_by_variant_usecase.dart'
    as _i1061;
import 'package:domain/usecase/theme/get_page_configs_for_theme_usecase.dart'
    as _i217;
import 'package:domain/usecase/theme/get_widget_config.dart' as _i899;
import 'package:domain/usecase/theme/list_color_schemes_for_theme_usecase.dart'
    as _i2;
import 'package:domain/usecase/theme/resolve_theme_id_for_build_usecase.dart'
    as _i554;
import 'package:domain/usecase/theme/update_application_environment_usecase.dart'
    as _i431;
import 'package:domain/usecase/theme/update_feature_access_usecase.dart'
    as _i1002;
import 'package:domain/usecase/theme/update_theme_bindings_usecase.dart'
    as _i140;
import 'package:domain/usecase/theme/upsert_color_scheme_by_theme_variant_usecase.dart'
    as _i313;
import 'package:domain/usecase/theme/upsert_page_config_by_variant_usecase.dart'
    as _i174;
import 'package:domain/usecase/theme/upsert_widget_config.dart' as _i345;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i98;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i343;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i314;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i320;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i140;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i109;
import 'package:domain/usecase/translations/usecase_translation_delete_override.dart'
    as _i298;
import 'package:domain/usecase/translations/usecase_translation_get_all.dart'
    as _i478;
import 'package:domain/usecase/translations/usecase_translation_get_overrides.dart'
    as _i609;
import 'package:domain/usecase/translations/usecase_translation_set_override.dart'
    as _i236;
import 'package:domain/usecase/usecase.dart' as _i651;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i1049.GetLaunchAssetsUsecase>(() =>
        _i1049.GetLaunchAssetsUsecaseImpl(gh<_i174.LaunchAssetsRepository>()));
    gh.factory<_i314.UsecaseThemeDeleteCreate>(
        () => _i314.UsecaseThemeDeleteCreateImpl(
              gh<_i174.ThemeRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i999.DeleteApplicationEmbedUsecase>(() =>
        _i999.DeleteApplicationEmbedUsecaseImpl(gh<_i494.EmbedsRepository>()));
    gh.factory<_i358.GetAssetDownloadUrlUsecase>(() =>
        _i358.GetAssetDownloadUrlUsecaseImpl(gh<_i919.AssetRepository>()));
    gh.factory<_i13.DeleteLaunchAssetsUsecase>(() =>
        _i13.DeleteLaunchAssetsUsecaseImpl(gh<_i174.LaunchAssetsRepository>()));
    gh.factory<_i892.WatchApplicationAssetsUsecase>(() =>
        _i892.WatchApplicationAssetsUsecaseImpl(gh<_i174.AssetRepository>()));
    gh.factory<_i53.ApplicationCreate>(() => _i53.ApplicationCreateImpl(
          gh<_i174.ApplicationRepository>(),
          gh<_i174.AuthRepository>(),
          gh<_i174.ResourcesRepository>(),
        ));
    gh.factory<_i137.GetSplashConstraintsDefaultsUsecase>(() =>
        _i137.GetSplashConstraintsDefaultsUsecaseImpl(
            gh<_i89.SplashAssetRepository>()));
    gh.factory<_i345.UpsertWidgetConfigUsecase>(() =>
        _i345.UpsertWidgetConfigUsecaseImpl(
            gh<_i174.WidgetConfigRepository>()));
    gh.factory<_i1060.GetSplashAssetUsecase>(() =>
        _i1060.GetSplashAssetUsecaseImpl(gh<_i174.SplashAssetRepository>()));
    gh.factory<_i970.UpsertSplashAssetUsecase>(() =>
        _i970.UpsertSplashAssetUsecaseImpl(gh<_i174.SplashAssetRepository>()));
    gh.factory<_i852.DeleteFeatureAccessUsecase>(() =>
        _i852.DeleteFeatureAccessUsecaseImpl(
            gh<_i908.FeatureAccessRepository>()));
    gh.factory<_i492.GetApplicationFeatureAccessUsecase>(() =>
        _i492.GetApplicationFeatureAccessUsecaseImpl(
            gh<_i908.FeatureAccessRepository>()));
    gh.factory<_i899.GetWidgetConfigUsecase>(() =>
        _i899.GetWidgetConfigUsecaseImpl(gh<_i174.WidgetConfigRepository>()));
    gh.factoryParam<_i109.UsecaseThemeUpdate, String, dynamic>((
      applicationId,
      _,
    ) =>
        _i109.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i174.ThemeRepository>(),
          authRepository: gh<_i174.AuthRepository>(),
          resourcesRepository: gh<_i174.ResourcesRepository>(),
          applicationId: applicationId,
        ));
    gh.factory<_i199.GetApplicationEmbedsUsecase>(() =>
        _i199.GetApplicationEmbedsUsecaseImpl(gh<_i174.EmbedsRepository>()));
    gh.factory<_i157.DeleteApplicationAssetUsecase>(() =>
        _i157.DeleteApplicationAssetUsecaseImpl(gh<_i174.AssetRepository>()));
    gh.factory<_i422.GetFeatureAccessUsecase>(() =>
        _i422.GetFeatureAccessUsecaseImpl(gh<_i908.FeatureAccessRepository>()));
    gh.factory<_i535.DeleteSplashAssetUsecase>(() =>
        _i535.DeleteSplashAssetUsecaseImpl(gh<_i174.SplashAssetRepository>()));
    gh.factory<_i526.GetApplicationPublicationResourcesUsecase>(() =>
        _i526.GetApplicationPublicationResourcesUsecaseImpl(
            gh<_i1048.PublicationResourcesRepository>()));
    gh.factory<_i602.CreateApplicationPublicationResourceUsecase>(() =>
        _i602.CreateApplicationPublicationResourceUsecaseImpl(
            gh<_i1048.PublicationResourcesRepository>()));
    gh.lazySingleton<_i923.GetCallkeepBranchesUsecase>(() =>
        _i923.GetCallkeepBranchesUsecaseImpl(
            deploymentRepository: gh<_i174.DeploymentRepository>()));
    gh.factory<_i392.CreateApplicationEmbedUsecase>(() =>
        _i392.CreateApplicationEmbedUsecaseImpl(gh<_i174.EmbedsRepository>()));
    gh.factory<_i88.WatchEmbedsUsecase>(
        () => _i88.WatchEmbedsUsecaseImpl(gh<_i174.EmbedsRepository>()));
    gh.factory<_i1002.UpdateFeatureAccessUsecase>(() =>
        _i1002.UpdateFeatureAccessUsecaseImpl(
            gh<_i908.FeatureAccessRepository>()));
    gh.factory<_i343.UsecaseThemeCreate>(
        () => _i343.UsecaseThemeCreateImpl(gh<_i494.ThemeRepository>()));
    gh.factory<_i43.UsecaseApplicationIncVersion>(() =>
        _i43.UsecaseApplicationIncVersionImpl(
            gh<_i174.ApplicationRepository>()));
    gh.factory<_i767.GetAllThemesUsecase>(() => _i767.GetAllThemesUsecaseImpl(
        themeRepository: gh<_i174.ThemeRepository>()));
    gh.factory<_i833.DeleteApplicationPublicationResourceUsecase>(() =>
        _i833.DeleteApplicationPublicationResourceUsecaseImpl(
            gh<_i1048.PublicationResourcesRepository>()));
    gh.lazySingleton<_i902.GetPhoneBranchesUsecase>(() =>
        _i902.GetPhoneBranchesUsecaseImpl(
            deploymentRepository: gh<_i174.DeploymentRepository>()));
    gh.factory<_i450.UpsertLaunchAssetsUsecase>(() =>
        _i450.UpsertLaunchAssetsUsecaseImpl(
            gh<_i174.LaunchAssetsRepository>()));
    gh.factory<_i944.UpdateApplicationEmbedUsecase>(() =>
        _i944.UpdateApplicationEmbedUsecaseImpl(gh<_i174.EmbedsRepository>()));
    gh.factory<_i863.UpdateApplicationPublicationResourceUsecase>(() =>
        _i863.UpdateApplicationPublicationResourceUsecaseImpl(
            gh<_i1048.PublicationResourcesRepository>()));
    gh.factory<_i151.UploadFileUsecase>(
        () => _i151.UploadFileUsecaseImpl(gh<_i494.ResourcesRepository>()));
    gh.factory<_i606.UsecaseDeployBuilds>(() => _i606.UsecaseDeployBuildsImpl(
          deploymentRepository: gh<_i494.DeploymentRepository>(),
          applicationRepository: gh<_i494.ApplicationRepository>(),
        ));
    gh.factory<_i490.MonitorTokenExpirationUsecase>(() =>
        _i490.MonitorTokenExpirationUsecaseImpl(
            authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i298.UsecaseTranslationsDeleteOverride>(() =>
        _i298.UsecaseTranslationsDeleteOverrideImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i683.GetAuthStatusUsecase>(() =>
        _i683.GetAuthStatusUsecaseHandler(
            authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i217.GetPageConfigsForThemeUsecase>(() =>
        _i217.GetPageConfigsForThemeUsecaseImpl(
            repo: gh<_i278.PageConfigRepository>()));
    gh.lazySingleton<_i2.ListColorSchemesForThemeUsecase>(() =>
        _i2.ListColorSchemesForThemeUsecaseImpl(
            gh<_i323.ColorSchemeRepository>()));
    gh.factory<_i174.UpsertPageConfigByVariantUsecase>(() =>
        _i174.UpsertPageConfigByVariantUsecaseImpl(
            repo: gh<_i174.PageConfigRepository>()));
    gh.factory<_i434.UsecaseApplicationAddTheme>(
        () => _i434.UsecaseApplicationAddThemeImpl(
              gh<_i174.ApplicationRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i1046.GenerateThemeUsecase>(
        () => _i1046.GenerateThemeUsecaseImpl(gh<_i494.ThemeRepository>()));
    gh.factory<_i690.NudgeThemeUsecase>(
        () => _i690.NudgeThemeUsecaseImpl(gh<_i494.ThemeRepository>()));
    gh.lazySingleton<_i313.UpsertColorSchemeByThemeVariantUsecase>(() =>
        _i313.UpsertColorSchemeByThemeVariantUsecaseImpl(
            gh<_i174.ColorSchemeRepository>()));
    gh.factory<_i337.SignInAuthUsecase>(() => _i337.SignInAuthUsecaseHandler(
        authRepository: gh<_i174.AuthRepository>()));
    gh.lazySingleton<_i1069.GetColorSchemeByThemeVariantUsecase>(() =>
        _i1069.GetColorSchemeByThemeVariantUsecaseImpl(
            gh<_i174.ColorSchemeRepository>()));
    gh.factory<_i236.UsecaseTranslationsSetOverride>(() =>
        _i236.UsecaseTranslationsSetOverrideImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i490.GetConstraintsDefaultsUsecase>(() =>
        _i490.GetConstraintsDefaultsUsecaseImpl(
            gh<_i174.LaunchAssetsRepository>()));
    gh.factory<_i478.UsecaseTranslationsGetAll>(() =>
        _i478.UsecaseTranslationsGetAllImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factoryParam<_i320.UsecaseThemeGet, String, String>((
      applicationId,
      themeId,
    ) =>
        _i320.UsecaseThemeGetImpl(
          themeRepository: gh<_i174.ThemeRepository>(),
          authRepository: gh<_i174.AuthRepository>(),
          applicationId: applicationId,
          themeId: themeId,
        ));
    gh.factory<_i459.GetUserUsecase>(() =>
        _i459.GetUserUsecaseImpl(authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i926.CreateApplicationAssetUsecase>(() =>
        _i926.CreateApplicationAssetUsecaseImpl(
            assetRepository: gh<_i174.AssetRepository>()));
    gh.factory<_i140.UpdateThemeBindingsUsecase>(() =>
        _i140.UpdateThemeBindingsUsecaseImpl(
            gh<_i494.ApplicationRepository>()));
    gh.factory<_i210.UsecaseApplicationGetAll>(
        () => _i210.UsecaseApplicationGetAllImpl(
              gh<_i174.ApplicationRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i98.UseCaseSetThemeDefault>(
        () => _i98.UseCaseSetThemeDefaultImpl(
              gh<_i174.ApplicationRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i1021.ResetAuthPasswordUsecase>(() =>
        _i1021.ResetAuthPasswordUsecaseHandler(
            authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i928.CopyThemeUsecase>(
        () => _i928.CopyThemeUsecaseImpl(gh<_i494.ThemeRepository>()));
    gh.factory<_i548.UsecaseApplicationGet>(
        () => _i548.UsecaseApplicationGetImpl(
              applicationRepository: gh<_i174.ApplicationRepository>(),
              authRepository: gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i189.UpdateApplicationUsecase>(
        () => _i189.UpdateApplicationUsecaseImpl(
              applicationRepository: gh<_i174.ApplicationRepository>(),
              authRepository: gh<_i174.AuthRepository>(),
              resourcesRepository: gh<_i174.ResourcesRepository>(),
            ));
    gh.factory<_i810.EnsureWidgetConfigPairUsecase>(() =>
        _i810.EnsureWidgetConfigPairUsecaseImpl(
            gh<_i551.WidgetConfigRepository>()));
    gh.factory<_i609.UsecaseTranslationsGetOverridesByAppId>(() =>
        _i609.UsecaseTranslationsGetOverridesByAppIdImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i431.UpdateApplicationEnvironmentUsecase>(() =>
        _i431.UpdateApplicationEnvironmentUsecaseImpl(
            gh<_i494.ApplicationRepository>()));
    gh.factory<_i651.UpdateBuildNumberUseCase>(() =>
        _i95.UpdateBuildNumberUseCaseImpl(
            gh<_i651.UpdateApplicationUsecase>()));
    gh.factory<_i43.GetApplicationEnvironmentUsecase>(() =>
        _i43.GetApplicationEnvironmentUsecaseImpl(
            gh<_i494.ApplicationRepository>()));
    gh.factory<_i140.UsecaseThemeGetAll>(() => _i140.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i174.ThemeRepository>(),
          authRepository: gh<_i174.AuthRepository>(),
        ));
    gh.factory<_i1061.GetPageConfigByVariantUsecase>(() =>
        _i1061.GetPageConfigByVariantUsecaseImpl(
            repo: gh<_i174.PageConfigRepository>()));
    gh.factory<_i554.ResolveThemeIdForBuildUsecase>(() =>
        _i554.ResolveThemeIdForBuildUsecaseImpl(
            gh<_i494.ApplicationRepository>()));
    gh.lazySingleton<_i351.EnsureColorSchemePairUsecase>(() =>
        _i351.EnsureColorSchemePairUsecaseImpl(
            gh<_i323.ColorSchemeRepository>()));
    gh.factoryParam<_i903.GetApplicationAssetsUsecase, bool, int>((
      defaultIncludeUrl,
      defaultUrlTtlSec,
    ) =>
        _i903.GetApplicationAssetsUsecaseImpl(
          assetRepository: gh<_i174.AssetRepository>(),
          defaultIncludeUrl: defaultIncludeUrl,
          defaultUrlTtlSec: defaultUrlTtlSec,
        ));
    gh.factory<_i81.UsecaseApplicationDeleteTemplate>(
        () => _i81.UsecaseApplicationDeleteTemplateImpl(
              gh<_i174.ApplicationRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i73.UsecaseAuthLogOut>(() =>
        _i73.UsecaseAuthLogOutImpl(authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i175.EnsurePageConfigsPairUsecase>(() =>
        _i175.EnsurePageConfigsPairUsecaseImpl(
            repo: gh<_i278.PageConfigRepository>()));
    gh.factory<_i651.UpdateBuildNameUseCase>(() =>
        _i638.IncrementBuildNameUseCase(gh<_i651.UpdateApplicationUsecase>()));
  }
}
