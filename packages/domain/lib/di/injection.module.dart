//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i24;
import 'package:domain/entity/entity.dart' as _i26;
import 'package:domain/entity/mappers/applications/application_mapper.dart'
    as _i31;
import 'package:domain/entity/mappers/mapper.dart' as _i7;
import 'package:domain/entity/mappers/mapper_contract.dart' as _i3;
import 'package:domain/entity/mappers/themes/colors_mapper.dart' as _i8;
import 'package:domain/entity/mappers/themes/image_mapper.dart' as _i9;
import 'package:domain/entity/mappers/themes/texts_mapper.dart' as _i6;
import 'package:domain/entity/mappers/themes/theme_mapper.dart' as _i22;
import 'package:domain/entity/models/application/application_model.dart'
    as _i30;
import 'package:domain/entity/models/models.dart' as _i5;
import 'package:domain/entity/models/theme/theme_model.dart' as _i32;
import 'package:domain/repository/auth/auth_repository.dart' as _i12;
import 'package:domain/repository/repository.dart' as _i15;
import 'package:domain/usecase/applications/application_create.dart' as _i40;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i34;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i35;
import 'package:domain/usecase/applications/usecase_application_edit.dart'
    as _i36;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i37;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i38;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i39;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i10;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i11;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i13;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i14;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i16;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i17;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i18;
import 'package:domain/usecase/auth/usecase_auth_sign_in_impl.dart' as _i19;
import 'package:domain/usecase/theme/usecase_color_scheme_create.dart' as _i20;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i33;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i23;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i25;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i27;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i28;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i21;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i29;
import 'package:dto/dto.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.Mapper<_i4.TextsDTO?, _i5.TextsModel?>>(
        () => _i6.TextsMapper());
    gh.factory<_i7.Mapper<_i4.ColorDTO?, _i5.ColorSchemeModel?>>(
        () => _i8.ColorsMapper());
    gh.factory<_i7.Mapper<_i4.ImageDTO?, _i5.ImageModel?>>(
        () => _i9.ImageMapper());
    gh.factory<_i10.UsecaseAuthIsLoggedIn>(() => _i11.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i12.AuthRepository>()));
    gh.factory<_i13.UsecaseAuthLogOut>(() =>
        _i14.UsecaseAuthLogOutImpl(authRepository: gh<_i15.AuthRepository>()));
    gh.factory<_i16.UsecaseAuthResetPassword>(() =>
        _i17.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i15.AuthRepository>()));
    gh.factory<_i18.UsecaseAuthSignIn>(() =>
        _i19.UsecaseAuthSignInImpl(authRepository: gh<_i15.AuthRepository>()));
    gh.factory<_i20.UsecaseColorSchemeCreate>(
        () => _i20.UsecaseColorSchemeCreateImpl());
    gh.factory<_i21.UsecaseThemeGetTemplate>(
        () => _i21.GetThemTemplateUseCase());
    gh.factory<_i7.Mapper<_i4.ThemeDTO?, _i5.ThemeModel?>>(
        () => _i22.ThemeMapper(
              gh<_i7.Mapper<_i4.ColorDTO?, _i5.ColorSchemeModel?>>(),
              gh<_i7.Mapper<_i4.ImageDTO?, _i5.ImageModel?>>(),
              gh<_i7.Mapper<_i4.TextsDTO?, _i5.TextsModel?>>(),
            ));
    gh.factory<_i23.UsecaseThemeCreate>(() => _i23.UsecaseThemeCreateImpl(
          gh<_i24.ThemeRepository>(),
          gh<_i24.AuthRepository>(),
          gh<_i24.Mapper<_i4.ThemeDTO?, _i24.ThemeModel?>>(),
        ));
    gh.factory<_i25.UsecaseThemeDeleteCreate>(
        () => _i25.UsecaseThemeDeleteCreateImpl(
              gh<_i15.ThemeRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i26.Mapper<_i4.ThemeDTO?, _i26.ThemeModel?>>(),
            ));
    gh.factory<_i27.UsecaseThemeGet>(
      () => _i27.UsecaseThemeStaticGetImpl(
        themeRepository: gh<_i15.ThemeRepository>(),
        authRepository: gh<_i15.AuthRepository>(),
        mapper: gh<_i26.Mapper<_i4.ThemeDTO?, _i26.ThemeModel?>>(),
      ),
      instanceName: 'staticUsecaseKey',
    );
    gh.factoryParam<_i27.UsecaseThemeGet, String, String>(
      (
        applicationId,
        themeId,
      ) =>
          _i27.UsecaseThemeGetImpl(
        themeRepository: gh<_i15.ThemeRepository>(),
        authRepository: gh<_i15.AuthRepository>(),
        mapper: gh<_i26.Mapper<_i4.ThemeDTO?, _i26.ThemeModel?>>(),
        applicationId: applicationId,
        themeId: themeId,
      ),
      instanceName: 'applicationUsecaseKey',
    );
    gh.factory<_i28.UsecaseThemeGetAll>(() => _i28.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i15.ThemeRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          mapper: gh<_i26.Mapper<_i4.ThemeDTO?, _i26.ThemeModel?>>(),
        ));
    gh.factoryParam<_i29.UsecaseThemeUpdate, String, dynamic>((
      applicationId,
      _,
    ) =>
        _i29.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i15.ThemeRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          resourcesRepository: gh<_i15.ResourcesRepository>(),
          mapper: gh<_i26.Mapper<_i4.ThemeDTO?, _i26.ThemeModel?>>(),
          applicationId: applicationId,
        ));
    gh.factory<_i3.Mapper<_i4.ApplicationDTO, _i30.ApplicationModel>>(() =>
        _i31.ApplicationMapper(
            gh<_i3.Mapper<_i4.ThemeDTO?, _i32.ThemeModel?>>()));
    gh.factory<_i33.UseCaseSetThemeDefault>(
        () => _i33.UseCaseSetThemeDefaultImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
            ));
    gh.factory<_i34.UsecaseApplicationAddTheme>(
        () => _i34.UsecaseApplicationAddThemeImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
              gh<_i26.Mapper<_i4.ThemeDTO?, _i26.ThemeModel>>(),
            ));
    gh.factory<_i35.UsecaseApplicationDeleteTemplate>(
        () => _i35.UsecaseApplicationDeleteTemplateImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
            ));
    gh.factory<_i36.UsecaseApplicationEdit>(() =>
        _i36.UsecaseApplicationEditImpl(
          applicationRepository: gh<_i15.ApplicationRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          resourcesRepository: gh<_i15.ResourcesRepository>(),
          mapper: gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
        ));
    gh.factory<_i37.UsecaseApplicationGet>(() => _i37.UsecaseApplicationGetImpl(
          applicationRepository: gh<_i15.ApplicationRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          mapper: gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
        ));
    gh.factory<_i38.UsecaseApplicationGetAll>(
        () => _i38.UsecaseApplicationGetAllImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
            ));
    gh.factory<_i39.UsecaseApplicationIncVersion>(
        () => _i39.UsecaseApplicationIncVersionImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
            ));
    gh.factory<_i40.ApplicationCreate>(() => _i40.ApplicationCreateImpl(
          gh<_i15.ApplicationRepository>(),
          gh<_i15.AuthRepository>(),
          gh<_i15.ResourcesRepository>(),
          gh<_i26.Mapper<_i4.ApplicationDTO, _i26.ApplicationModel>>(),
        ));
  }
}
