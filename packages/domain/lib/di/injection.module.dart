//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i9;
import 'package:domain/entity/entity.dart' as _i21;
import 'package:domain/entity/mappers/applications/application_mapper.dart'
    as _i35;
import 'package:domain/entity/mappers/mapper.dart' as _i4;
import 'package:domain/entity/mappers/mapper_contract.dart' as _i15;
import 'package:domain/entity/mappers/themes/colors_mapper.dart' as _i7;
import 'package:domain/entity/mappers/themes/image_mapper.dart' as _i8;
import 'package:domain/entity/mappers/themes/texts_mapper.dart' as _i16;
import 'package:domain/entity/mappers/themes/theme_mapper.dart' as _i19;
import 'package:domain/entity/models/application/application_model.dart'
    as _i34;
import 'package:domain/entity/models/models.dart' as _i6;
import 'package:domain/entity/models/theme/theme_model.dart' as _i36;
import 'package:domain/repository/auth/auth_repository.dart' as _i24;
import 'package:domain/repository/repository.dart' as _i12;
import 'package:domain/usecase/applications/application_create.dart' as _i40;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i42;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i41;
import 'package:domain/usecase/applications/usecase_application_edit.dart'
    as _i43;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i45;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i38;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i44;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i22;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i23;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i25;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i26;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i29;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i30;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i27;
import 'package:domain/usecase/auth/usecase_auth_sign_in_impl.dart' as _i28;
import 'package:domain/usecase/deployment/usecase_deploy_builds.dart' as _i10;
import 'package:domain/usecase/deployment/usecase_update_build_name.dart'
    as _i47;
import 'package:domain/usecase/deployment/usecase_update_build_number.dart'
    as _i48;
import 'package:domain/usecase/theme/usecase_color_scheme_create.dart' as _i3;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i39;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i37;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i33;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i20;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i31;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i17;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i32;
import 'package:domain/usecase/translations/usecase_translation_delete_override.dart'
    as _i18;
import 'package:domain/usecase/translations/usecase_translation_get_all.dart'
    as _i13;
import 'package:domain/usecase/translations/usecase_translation_get_overrides.dart'
    as _i11;
import 'package:domain/usecase/translations/usecase_translation_set_override.dart'
    as _i14;
import 'package:domain/usecase/usecase.dart' as _i46;
import 'package:dto/dto.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.UsecaseColorSchemeCreate>(
        () => _i3.UsecaseColorSchemeCreateImpl());
    gh.factory<_i4.Mapper<_i5.ColorDTO?, _i6.ColorSchemeModel?>>(
        () => _i7.ColorsMapper());
    gh.factory<_i4.Mapper<_i5.ImageDTO?, _i6.ImageModel?>>(
        () => _i8.ImageMapper());
    gh.factory<_i9.UsecaseDeployBuilds>(() => _i10.UsecaseDeployBuildsImpl(
        deploymentRepository: gh<_i9.DeploymentRepository>()));
    gh.factory<_i11.UsecaseTranslationsGetOverridesByAppId>(() =>
        _i11.UsecaseTranslationsGetOverridesByAppIdImpl(
            translationsRepository: gh<_i12.TranslationsRepository>()));
    gh.factory<_i13.UsecaseTranslationsGetAll>(() =>
        _i13.UsecaseTranslationsGetAllImpl(
            translationsRepository: gh<_i12.TranslationsRepository>()));
    gh.factory<_i14.UsecaseTranslationsSetOverride>(() =>
        _i14.UsecaseTranslationsSetOverrideImpl(
            translationsRepository: gh<_i12.TranslationsRepository>()));
    gh.factory<_i15.Mapper<_i5.TextsDTO?, _i6.TextsModel?>>(
        () => _i16.TextsMapper());
    gh.factory<_i17.UsecaseThemeGetTemplate>(
        () => _i17.GetThemTemplateUseCase());
    gh.factory<_i18.UsecaseTranslationsDeleteOverride>(() =>
        _i18.UsecaseTranslationsDeleteOverrideImpl(
            translationsRepository: gh<_i12.TranslationsRepository>()));
    gh.factory<_i4.Mapper<_i5.ThemeDTO?, _i6.ThemeModel?>>(
        () => _i19.ThemeMapper(
              gh<_i4.Mapper<_i5.ColorDTO?, _i6.ColorSchemeModel?>>(),
              gh<_i4.Mapper<_i5.ImageDTO?, _i6.ImageModel?>>(),
              gh<_i4.Mapper<_i5.TextsDTO?, _i6.TextsModel?>>(),
            ));
    gh.factoryParam<_i20.UsecaseThemeGet, String, String>(
      (
        applicationId,
        themeId,
      ) =>
          _i20.UsecaseThemeGetImpl(
        themeRepository: gh<_i12.ThemeRepository>(),
        authRepository: gh<_i12.AuthRepository>(),
        mapper: gh<_i21.Mapper<_i5.ThemeDTO?, _i21.ThemeModel?>>(),
        applicationId: applicationId,
        themeId: themeId,
      ),
      instanceName: 'applicationUsecaseKey',
    );
    gh.factory<_i22.UsecaseAuthIsLoggedIn>(() => _i23.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i24.AuthRepository>()));
    gh.factory<_i25.UsecaseAuthLogOut>(() =>
        _i26.UsecaseAuthLogOutImpl(authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i27.UsecaseAuthSignIn>(() =>
        _i28.UsecaseAuthSignInImpl(authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i29.UsecaseAuthResetPassword>(() =>
        _i30.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i31.UsecaseThemeGetAll>(() => _i31.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i12.ThemeRepository>(),
          authRepository: gh<_i12.AuthRepository>(),
          mapper: gh<_i21.Mapper<_i5.ThemeDTO?, _i21.ThemeModel?>>(),
        ));
    gh.factory<_i20.UsecaseThemeGet>(
      () => _i20.UsecaseThemeStaticGetImpl(
        themeRepository: gh<_i12.ThemeRepository>(),
        authRepository: gh<_i12.AuthRepository>(),
        mapper: gh<_i21.Mapper<_i5.ThemeDTO?, _i21.ThemeModel?>>(),
      ),
      instanceName: 'staticUsecaseKey',
    );
    gh.factoryParam<_i32.UsecaseThemeUpdate, String, dynamic>((
      applicationId,
      _,
    ) =>
        _i32.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i12.ThemeRepository>(),
          authRepository: gh<_i12.AuthRepository>(),
          resourcesRepository: gh<_i12.ResourcesRepository>(),
          mapper: gh<_i21.Mapper<_i5.ThemeDTO?, _i21.ThemeModel?>>(),
          applicationId: applicationId,
        ));
    gh.factory<_i33.UsecaseThemeDeleteCreate>(
        () => _i33.UsecaseThemeDeleteCreateImpl(
              gh<_i12.ThemeRepository>(),
              gh<_i12.AuthRepository>(),
              gh<_i21.Mapper<_i5.ThemeDTO?, _i21.ThemeModel?>>(),
            ));
    gh.factory<_i15.Mapper<_i5.ApplicationDTO, _i34.ApplicationModel>>(() =>
        _i35.ApplicationMapper(
            gh<_i15.Mapper<_i5.ThemeDTO?, _i36.ThemeModel?>>()));
    gh.factory<_i37.UsecaseThemeCreate>(() => _i37.UsecaseThemeCreateImpl(
          gh<_i9.ThemeRepository>(),
          gh<_i9.AuthRepository>(),
          gh<_i9.Mapper<_i5.ThemeDTO?, _i9.ThemeModel?>>(),
        ));
    gh.factory<_i38.UsecaseApplicationGetAll>(
        () => _i38.UsecaseApplicationGetAllImpl(
              gh<_i12.ApplicationRepository>(),
              gh<_i12.AuthRepository>(),
              gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
            ));
    gh.factory<_i39.UseCaseSetThemeDefault>(
        () => _i39.UseCaseSetThemeDefaultImpl(
              gh<_i12.ApplicationRepository>(),
              gh<_i12.AuthRepository>(),
              gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
            ));
    gh.factory<_i40.ApplicationCreate>(() => _i40.ApplicationCreateImpl(
          gh<_i12.ApplicationRepository>(),
          gh<_i12.AuthRepository>(),
          gh<_i12.ResourcesRepository>(),
          gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
        ));
    gh.factory<_i41.UsecaseApplicationDeleteTemplate>(
        () => _i41.UsecaseApplicationDeleteTemplateImpl(
              gh<_i12.ApplicationRepository>(),
              gh<_i12.AuthRepository>(),
              gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
            ));
    gh.factory<_i42.UsecaseApplicationAddTheme>(
        () => _i42.UsecaseApplicationAddThemeImpl(
              gh<_i12.ApplicationRepository>(),
              gh<_i12.AuthRepository>(),
              gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
              gh<_i21.Mapper<_i5.ThemeDTO?, _i21.ThemeModel>>(),
            ));
    gh.factory<_i43.UsecaseApplicationEdit>(() =>
        _i43.UsecaseApplicationEditImpl(
          applicationRepository: gh<_i12.ApplicationRepository>(),
          authRepository: gh<_i12.AuthRepository>(),
          resourcesRepository: gh<_i12.ResourcesRepository>(),
          mapper: gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
        ));
    gh.factory<_i44.UsecaseApplicationIncVersion>(
        () => _i44.UsecaseApplicationIncVersionImpl(
              gh<_i12.ApplicationRepository>(),
              gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
            ));
    gh.factory<_i45.UsecaseApplicationGet>(() => _i45.UsecaseApplicationGetImpl(
          applicationRepository: gh<_i12.ApplicationRepository>(),
          authRepository: gh<_i12.AuthRepository>(),
          mapper: gh<_i21.Mapper<_i5.ApplicationDTO, _i21.ApplicationModel>>(),
        ));
    gh.factory<_i46.UpdateBuildNameUseCase>(() =>
        _i47.IncrementBuildNameUseCase(gh<_i46.UsecaseApplicationEdit>()));
    gh.factory<_i46.UpdateBuildNumberUseCase>(() =>
        _i48.UpdateBuildNumberUseCaseImpl(gh<_i46.UsecaseApplicationEdit>()));
  }
}
