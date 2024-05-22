//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i9;
import 'package:domain/entity/entity.dart' as _i17;
import 'package:domain/entity/mappers/applications/application_mapper.dart'
    as _i31;
import 'package:domain/entity/mappers/mapper.dart' as _i4;
import 'package:domain/entity/mappers/mapper_contract.dart' as _i11;
import 'package:domain/entity/mappers/themes/colors_mapper.dart' as _i7;
import 'package:domain/entity/mappers/themes/image_mapper.dart' as _i8;
import 'package:domain/entity/mappers/themes/texts_mapper.dart' as _i12;
import 'package:domain/entity/mappers/themes/theme_mapper.dart' as _i14;
import 'package:domain/entity/models/application/application_model.dart'
    as _i30;
import 'package:domain/entity/models/models.dart' as _i6;
import 'package:domain/entity/models/theme/theme_model.dart' as _i32;
import 'package:domain/repository/auth/auth_repository.dart' as _i20;
import 'package:domain/repository/repository.dart' as _i16;
import 'package:domain/usecase/applications/application_create.dart' as _i36;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i38;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i37;
import 'package:domain/usecase/applications/usecase_application_edit.dart'
    as _i39;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i41;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i34;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i40;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i18;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i19;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i21;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i22;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i25;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i26;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i23;
import 'package:domain/usecase/auth/usecase_auth_sign_in_impl.dart' as _i24;
import 'package:domain/usecase/deployment/usecase_deploy_builds.dart' as _i10;
import 'package:domain/usecase/theme/usecase_color_scheme_create.dart' as _i3;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i35;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i33;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i29;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i15;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i27;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i13;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i28;
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
    gh.factory<_i11.Mapper<_i5.TextsDTO?, _i6.TextsModel?>>(
        () => _i12.TextsMapper());
    gh.factory<_i13.UsecaseThemeGetTemplate>(
        () => _i13.GetThemTemplateUseCase());
    gh.factory<_i4.Mapper<_i5.ThemeDTO?, _i6.ThemeModel?>>(
        () => _i14.ThemeMapper(
              gh<_i4.Mapper<_i5.ColorDTO?, _i6.ColorSchemeModel?>>(),
              gh<_i4.Mapper<_i5.ImageDTO?, _i6.ImageModel?>>(),
              gh<_i4.Mapper<_i5.TextsDTO?, _i6.TextsModel?>>(),
            ));
    gh.factoryParam<_i15.UsecaseThemeGet, String, String>(
      (
        applicationId,
        themeId,
      ) =>
          _i15.UsecaseThemeGetImpl(
        themeRepository: gh<_i16.ThemeRepository>(),
        authRepository: gh<_i16.AuthRepository>(),
        mapper: gh<_i17.Mapper<_i5.ThemeDTO?, _i17.ThemeModel?>>(),
        applicationId: applicationId,
        themeId: themeId,
      ),
      instanceName: 'applicationUsecaseKey',
    );
    gh.factory<_i18.UsecaseAuthIsLoggedIn>(() => _i19.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i20.AuthRepository>()));
    gh.factory<_i21.UsecaseAuthLogOut>(() =>
        _i22.UsecaseAuthLogOutImpl(authRepository: gh<_i16.AuthRepository>()));
    gh.factory<_i23.UsecaseAuthSignIn>(() =>
        _i24.UsecaseAuthSignInImpl(authRepository: gh<_i16.AuthRepository>()));
    gh.factory<_i25.UsecaseAuthResetPassword>(() =>
        _i26.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i16.AuthRepository>()));
    gh.factory<_i27.UsecaseThemeGetAll>(() => _i27.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i16.ThemeRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          mapper: gh<_i17.Mapper<_i5.ThemeDTO?, _i17.ThemeModel?>>(),
        ));
    gh.factory<_i15.UsecaseThemeGet>(
      () => _i15.UsecaseThemeStaticGetImpl(
        themeRepository: gh<_i16.ThemeRepository>(),
        authRepository: gh<_i16.AuthRepository>(),
        mapper: gh<_i17.Mapper<_i5.ThemeDTO?, _i17.ThemeModel?>>(),
      ),
      instanceName: 'staticUsecaseKey',
    );
    gh.factoryParam<_i28.UsecaseThemeUpdate, String, dynamic>((
      applicationId,
      _,
    ) =>
        _i28.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i16.ThemeRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          resourcesRepository: gh<_i16.ResourcesRepository>(),
          mapper: gh<_i17.Mapper<_i5.ThemeDTO?, _i17.ThemeModel?>>(),
          applicationId: applicationId,
        ));
    gh.factory<_i29.UsecaseThemeDeleteCreate>(
        () => _i29.UsecaseThemeDeleteCreateImpl(
              gh<_i16.ThemeRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i17.Mapper<_i5.ThemeDTO?, _i17.ThemeModel?>>(),
            ));
    gh.factory<_i11.Mapper<_i5.ApplicationDTO, _i30.ApplicationModel>>(() =>
        _i31.ApplicationMapper(
            gh<_i11.Mapper<_i5.ThemeDTO?, _i32.ThemeModel?>>()));
    gh.factory<_i33.UsecaseThemeCreate>(() => _i33.UsecaseThemeCreateImpl(
          gh<_i9.ThemeRepository>(),
          gh<_i9.AuthRepository>(),
          gh<_i9.Mapper<_i5.ThemeDTO?, _i9.ThemeModel?>>(),
        ));
    gh.factory<_i34.UsecaseApplicationGetAll>(
        () => _i34.UsecaseApplicationGetAllImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
            ));
    gh.factory<_i35.UseCaseSetThemeDefault>(
        () => _i35.UseCaseSetThemeDefaultImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
            ));
    gh.factory<_i36.ApplicationCreate>(() => _i36.ApplicationCreateImpl(
          gh<_i16.ApplicationRepository>(),
          gh<_i16.AuthRepository>(),
          gh<_i16.ResourcesRepository>(),
          gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
        ));
    gh.factory<_i37.UsecaseApplicationDeleteTemplate>(
        () => _i37.UsecaseApplicationDeleteTemplateImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
            ));
    gh.factory<_i38.UsecaseApplicationAddTheme>(
        () => _i38.UsecaseApplicationAddThemeImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
              gh<_i17.Mapper<_i5.ThemeDTO?, _i17.ThemeModel>>(),
            ));
    gh.factory<_i39.UsecaseApplicationEdit>(() =>
        _i39.UsecaseApplicationEditImpl(
          applicationRepository: gh<_i16.ApplicationRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          resourcesRepository: gh<_i16.ResourcesRepository>(),
          mapper: gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
        ));
    gh.factory<_i40.UsecaseApplicationIncVersion>(
        () => _i40.UsecaseApplicationIncVersionImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
            ));
    gh.factory<_i41.UsecaseApplicationGet>(() => _i41.UsecaseApplicationGetImpl(
          applicationRepository: gh<_i16.ApplicationRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          mapper: gh<_i17.Mapper<_i5.ApplicationDTO, _i17.ApplicationModel>>(),
        ));
  }
}
