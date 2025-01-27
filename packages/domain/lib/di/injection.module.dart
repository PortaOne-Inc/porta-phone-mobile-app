//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/repository/auth/auth_repository.dart' as _i2;
import 'package:domain/repository/repository.dart' as _i174;
import 'package:domain/usecase/applications/application_create.dart' as _i53;
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
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i538;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i987;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i0;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i874;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i745;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i1038;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i246;
import 'package:domain/usecase/deployment/get_phone_branches_usecase.dart'
    as _i902;
import 'package:domain/usecase/deployment/usecase_deploy_builds.dart' as _i606;
import 'package:domain/usecase/deployment/usecase_update_build_name.dart'
    as _i638;
import 'package:domain/usecase/deployment/usecase_update_build_number.dart'
    as _i95;
import 'package:domain/usecase/resources/upload_file_use_case.dart' as _i151;
import 'package:domain/usecase/theme/add_assets_theme_usecase.dart' as _i911;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i98;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i343;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i314;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i320;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i140;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i349;
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
    gh.factory<_i81.UsecaseApplicationDeleteTemplate>(
        () => _i81.UsecaseApplicationDeleteTemplateImpl(
              gh<_i174.ApplicationRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i140.UsecaseThemeGetAll>(() => _i140.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i174.ThemeRepository>(),
          authRepository: gh<_i174.AuthRepository>(),
        ));
    gh.factory<_i43.UsecaseApplicationIncVersion>(() =>
        _i43.UsecaseApplicationIncVersionImpl(
            gh<_i174.ApplicationRepository>()));
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
    gh.factory<_i53.ApplicationCreate>(() => _i53.ApplicationCreateImpl(
          gh<_i174.ApplicationRepository>(),
          gh<_i174.AuthRepository>(),
          gh<_i174.ResourcesRepository>(),
        ));
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
    gh.factory<_i434.UsecaseApplicationAddTheme>(
        () => _i434.UsecaseApplicationAddThemeImpl(
              gh<_i174.ApplicationRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i349.UsecaseThemeGetTemplate>(
        () => _i349.GetThemTemplateUseCase());
    gh.factory<_i548.UsecaseApplicationGet>(
        () => _i548.UsecaseApplicationGetImpl(
              applicationRepository: gh<_i174.ApplicationRepository>(),
              authRepository: gh<_i174.AuthRepository>(),
            ));
    gh.lazySingleton<_i902.GetPhoneBranchesUsecase>(() =>
        _i902.GetPhoneBranchesUsecaseImpl(
            deploymentRepository: gh<_i174.DeploymentRepository>()));
    gh.factory<_i246.UsecaseAuthSignIn>(() => _i246.UsecaseAuthSignInImpl(
        authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i189.UpdateApplicationUsecase>(
        () => _i189.UpdateApplicationUsecaseImpl(
              applicationRepository: gh<_i174.ApplicationRepository>(),
              authRepository: gh<_i174.AuthRepository>(),
              resourcesRepository: gh<_i174.ResourcesRepository>(),
            ));
    gh.factory<_i151.UploadFileUsecase>(
        () => _i151.UploadFileUsecaseImpl(gh<_i494.ResourcesRepository>()));
    gh.factory<_i298.UsecaseTranslationsDeleteOverride>(() =>
        _i298.UsecaseTranslationsDeleteOverrideImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i651.UpdateBuildNameUseCase>(() =>
        _i638.IncrementBuildNameUseCase(gh<_i651.UpdateApplicationUsecase>()));
    gh.factory<_i343.UsecaseThemeCreate>(
        () => _i343.UsecaseThemeCreateImpl(gh<_i494.ThemeRepository>()));
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
    gh.factory<_i236.UsecaseTranslationsSetOverride>(() =>
        _i236.UsecaseTranslationsSetOverrideImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i478.UsecaseTranslationsGetAll>(() =>
        _i478.UsecaseTranslationsGetAllImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i494.UsecaseDeployBuilds>(() => _i606.UsecaseDeployBuildsImpl(
          deploymentRepository: gh<_i494.DeploymentRepository>(),
          applicationRepository: gh<_i494.ApplicationRepository>(),
        ));
    gh.factory<_i314.UsecaseThemeDeleteCreate>(
        () => _i314.UsecaseThemeDeleteCreateImpl(
              gh<_i174.ThemeRepository>(),
              gh<_i174.AuthRepository>(),
            ));
    gh.factory<_i538.UsecaseAuthIsLoggedIn>(() =>
        _i987.UsecaseAuthIsLoggedInImpl(
            authRepository: gh<_i2.AuthRepository>()));
    gh.factory<_i745.UsecaseAuthResetPassword>(() =>
        _i1038.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i609.UsecaseTranslationsGetOverridesByAppId>(() =>
        _i609.UsecaseTranslationsGetOverridesByAppIdImpl(
            translationsRepository: gh<_i174.TranslationsRepository>()));
    gh.factory<_i651.UpdateBuildNumberUseCase>(() =>
        _i95.UpdateBuildNumberUseCaseImpl(
            gh<_i651.UpdateApplicationUsecase>()));
    gh.factory<_i0.UsecaseAuthLogOut>(() => _i874.UsecaseAuthLogOutImpl(
        authRepository: gh<_i174.AuthRepository>()));
    gh.factory<_i911.AddAssetsThemeUsecase>(
        () => _i911.AddAssetsThemeUsecaseImpl(gh<_i494.ThemeRepository>()));
  }
}
