//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i34;
import 'package:domain/entity/entity.dart' as _i16;
import 'package:domain/entity/mappers/applications/application_mapper.dart'
    as _i12;
import 'package:domain/entity/mappers/mapper.dart' as _i3;
import 'package:domain/entity/mappers/mapper_contract.dart' as _i8;
import 'package:domain/entity/mappers/themes/colors_mapper.dart' as _i6;
import 'package:domain/entity/mappers/themes/image_mapper.dart' as _i7;
import 'package:domain/entity/mappers/themes/texts_mapper.dart' as _i9;
import 'package:domain/entity/mappers/themes/theme_mapper.dart' as _i10;
import 'package:domain/entity/models/application/application_model.dart'
    as _i11;
import 'package:domain/entity/models/models.dart' as _i5;
import 'package:domain/entity/models/theme/theme_model.dart' as _i13;
import 'package:domain/repository/auth/auth_repository.dart' as _i25;
import 'package:domain/repository/repository.dart' as _i15;
import 'package:domain/usecase/applications/application_create.dart' as _i41;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i17;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i18;
import 'package:domain/usecase/applications/usecase_application_edit.dart'
    as _i19;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i20;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i21;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i22;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i23;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i24;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i26;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i27;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i28;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i29;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i30;
import 'package:domain/usecase/auth/usecase_auth_sign_in_impl.dart' as _i31;
import 'package:domain/usecase/theme/usecase_color_scheme_create.dart' as _i32;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i14;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i33;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i35;
import 'package:domain/usecase/theme/usecase_theme_download.dart' as _i36;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i37;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i38;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i39;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i40;
import 'package:dto/dto.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.Mapper<_i4.ColorDTO?, _i5.ColorSchemeModel?>>(
        () => _i6.ColorsMapper());
    gh.factory<_i3.Mapper<_i4.ImageDTO?, _i5.ImageModel?>>(
        () => _i7.ImageMapper());
    gh.factory<_i8.Mapper<_i4.TextsDTO?, _i5.TextsModel?>>(
        () => _i9.TextsMapper());
    gh.factory<_i3.Mapper<_i4.ThemeDTO?, _i5.ThemeModel?>>(
        () => _i10.ThemeMapper(
              gh<_i3.Mapper<_i4.ColorDTO?, _i5.ColorSchemeModel?>>(),
              gh<_i3.Mapper<_i4.ImageDTO?, _i5.ImageModel?>>(),
              gh<_i3.Mapper<_i4.TextsDTO?, _i5.TextsModel?>>(),
            ));
    gh.factory<_i8.Mapper<_i4.ApplicationDTO, _i11.ApplicationModel>>(() =>
        _i12.ApplicationMapper(
            gh<_i8.Mapper<_i4.ThemeDTO?, _i13.ThemeModel?>>()));
    gh.factory<_i14.UseCaseSetThemeDefault>(
        () => _i14.UseCaseSetThemeDefaultImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
            ));
    gh.factory<_i17.UsecaseApplicationAddTheme>(
        () => _i17.UsecaseApplicationAddThemeImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
              gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel>>(),
            ));
    gh.factory<_i18.UsecaseApplicationDeleteTemplate>(
        () => _i18.UsecaseApplicationDeleteTemplateImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
            ));
    gh.factory<_i19.UsecaseApplicationEdit>(() =>
        _i19.UsecaseApplicationEditImpl(
          applicationRepository: gh<_i15.ApplicationRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          resourcesRepository: gh<_i15.ResourcesRepository>(),
          mapper: gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
        ));
    gh.factory<_i20.UsecaseApplicationGet>(() => _i20.UsecaseApplicationGetImpl(
          applicationRepository: gh<_i15.ApplicationRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          mapper: gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
        ));
    gh.factory<_i21.UsecaseApplicationGetAll>(
        () => _i21.UsecaseApplicationGetAllImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
            ));
    gh.factory<_i22.UsecaseApplicationIncVersion>(
        () => _i22.UsecaseApplicationIncVersionImpl(
              gh<_i15.ApplicationRepository>(),
              gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
            ));
    gh.factory<_i23.UsecaseAuthIsLoggedIn>(() => _i24.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i25.AuthRepository>()));
    gh.factory<_i26.UsecaseAuthLogOut>(() =>
        _i27.UsecaseAuthLogOutImpl(authRepository: gh<_i15.AuthRepository>()));
    gh.factory<_i28.UsecaseAuthResetPassword>(() =>
        _i29.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i15.AuthRepository>()));
    gh.factory<_i30.UsecaseAuthSignIn>(() =>
        _i31.UsecaseAuthSignInImpl(authRepository: gh<_i15.AuthRepository>()));
    gh.factory<_i32.UsecaseColorSchemeCreate>(
        () => _i32.UsecaseColorSchemeCreateImpl());
    gh.factory<_i33.UsecaseThemeCreate>(() => _i33.UsecaseThemeCreateImpl(
          gh<_i34.ThemeRepository>(),
          gh<_i34.AuthRepository>(),
          gh<_i34.Mapper<_i4.ThemeDTO?, _i34.ThemeModel?>>(),
        ));
    gh.factory<_i35.UsecaseThemeDeleteCreate>(
        () => _i35.UsecaseThemeDeleteCreateImpl(
              gh<_i15.ThemeRepository>(),
              gh<_i15.AuthRepository>(),
              gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel?>>(),
            ));
    gh.factoryParam<_i36.UsecaseThemeDownload, String, String>((
      applicationId,
      themeId,
    ) =>
        _i36.UsecaseThemeDownloadImpl(
          themeRepository: gh<_i15.ThemeRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          mapper: gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel?>>(),
          applicationId: applicationId,
          themeId: themeId,
        ));
    gh.factory<_i37.UsecaseThemeGet>(
      () => _i37.UsecaseThemeStaticGetImpl(
        themeRepository: gh<_i15.ThemeRepository>(),
        authRepository: gh<_i15.AuthRepository>(),
        mapper: gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel?>>(),
      ),
      instanceName: 'staticUsecaseKey',
    );
    gh.factoryParam<_i37.UsecaseThemeGet, String, String>(
      (
        applicationId,
        themeId,
      ) =>
          _i37.UsecaseThemeGetImpl(
        themeRepository: gh<_i15.ThemeRepository>(),
        authRepository: gh<_i15.AuthRepository>(),
        mapper: gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel?>>(),
        applicationId: applicationId,
        themeId: themeId,
      ),
      instanceName: 'applicationUsecaseKey',
    );
    gh.factory<_i38.UsecaseThemeGetAll>(() => _i38.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i15.ThemeRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          mapper: gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel?>>(),
        ));
    gh.factory<_i39.UsecaseThemeGetTemplate>(
        () => _i39.GetThemTemplateUseCase());
    gh.factoryParam<_i40.UsecaseThemeUpdate, String, dynamic>((
      applicationId,
      _,
    ) =>
        _i40.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i15.ThemeRepository>(),
          authRepository: gh<_i15.AuthRepository>(),
          resourcesRepository: gh<_i15.ResourcesRepository>(),
          mapper: gh<_i16.Mapper<_i4.ThemeDTO?, _i16.ThemeModel?>>(),
          applicationId: applicationId,
        ));
    gh.factory<_i41.ApplicationCreate>(() => _i41.ApplicationCreateImpl(
          gh<_i15.ApplicationRepository>(),
          gh<_i15.AuthRepository>(),
          gh<_i15.ResourcesRepository>(),
          gh<_i16.Mapper<_i4.ApplicationDTO, _i16.ApplicationModel>>(),
        ));
  }
}
