//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:domain/domain.dart' as _i32;
import 'package:domain/entity/entity.dart' as _i15;
import 'package:domain/entity/mappers/applications/application_mapper.dart'
    as _i29;
import 'package:domain/entity/mappers/mapper.dart' as _i4;
import 'package:domain/entity/mappers/mapper_contract.dart' as _i9;
import 'package:domain/entity/mappers/themes/colors_mapper.dart' as _i7;
import 'package:domain/entity/mappers/themes/image_mapper.dart' as _i8;
import 'package:domain/entity/mappers/themes/texts_mapper.dart' as _i10;
import 'package:domain/entity/mappers/themes/theme_mapper.dart' as _i12;
import 'package:domain/entity/models/application/application_model.dart'
    as _i28;
import 'package:domain/entity/models/models.dart' as _i6;
import 'package:domain/entity/models/theme/theme_model.dart' as _i30;
import 'package:domain/repository/auth/auth_repository.dart' as _i18;
import 'package:domain/repository/repository.dart' as _i14;
import 'package:domain/usecase/applications/application_create.dart' as _i35;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i37;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i36;
import 'package:domain/usecase/applications/usecase_application_edit.dart'
    as _i38;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i40;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i33;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i39;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i16;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i17;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i19;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i20;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i23;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i24;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i21;
import 'package:domain/usecase/auth/usecase_auth_sign_in_impl.dart' as _i22;
import 'package:domain/usecase/theme/usecase_color_scheme_create.dart' as _i3;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i34;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i31;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i27;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i13;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i25;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i11;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i26;
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
    gh.factory<_i9.Mapper<_i5.TextsDTO?, _i6.TextsModel?>>(
        () => _i10.TextsMapper());
    gh.factory<_i11.UsecaseThemeGetTemplate>(
        () => _i11.GetThemTemplateUseCase());
    gh.factory<_i4.Mapper<_i5.ThemeDTO?, _i6.ThemeModel?>>(
        () => _i12.ThemeMapper(
              gh<_i4.Mapper<_i5.ColorDTO?, _i6.ColorSchemeModel?>>(),
              gh<_i4.Mapper<_i5.ImageDTO?, _i6.ImageModel?>>(),
              gh<_i4.Mapper<_i5.TextsDTO?, _i6.TextsModel?>>(),
            ));
    gh.factoryParam<_i13.UsecaseThemeGet, String, String>(
      (
        applicationId,
        themeId,
      ) =>
          _i13.UsecaseThemeGetImpl(
        themeRepository: gh<_i14.ThemeRepository>(),
        authRepository: gh<_i14.AuthRepository>(),
        mapper: gh<_i15.Mapper<_i5.ThemeDTO?, _i15.ThemeModel?>>(),
        applicationId: applicationId,
        themeId: themeId,
      ),
      instanceName: 'applicationUsecaseKey',
    );
    gh.factory<_i16.UsecaseAuthIsLoggedIn>(() => _i17.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i18.AuthRepository>()));
    gh.factory<_i19.UsecaseAuthLogOut>(() =>
        _i20.UsecaseAuthLogOutImpl(authRepository: gh<_i14.AuthRepository>()));
    gh.factory<_i21.UsecaseAuthSignIn>(() =>
        _i22.UsecaseAuthSignInImpl(authRepository: gh<_i14.AuthRepository>()));
    gh.factory<_i23.UsecaseAuthResetPassword>(() =>
        _i24.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i14.AuthRepository>()));
    gh.factory<_i25.UsecaseThemeGetAll>(() => _i25.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i14.ThemeRepository>(),
          authRepository: gh<_i14.AuthRepository>(),
          mapper: gh<_i15.Mapper<_i5.ThemeDTO?, _i15.ThemeModel?>>(),
        ));
    gh.factory<_i13.UsecaseThemeGet>(
      () => _i13.UsecaseThemeStaticGetImpl(
        themeRepository: gh<_i14.ThemeRepository>(),
        authRepository: gh<_i14.AuthRepository>(),
        mapper: gh<_i15.Mapper<_i5.ThemeDTO?, _i15.ThemeModel?>>(),
      ),
      instanceName: 'staticUsecaseKey',
    );
    gh.factoryParam<_i26.UsecaseThemeUpdate, String, dynamic>((
      applicationId,
      _,
    ) =>
        _i26.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i14.ThemeRepository>(),
          authRepository: gh<_i14.AuthRepository>(),
          resourcesRepository: gh<_i14.ResourcesRepository>(),
          mapper: gh<_i15.Mapper<_i5.ThemeDTO?, _i15.ThemeModel?>>(),
          applicationId: applicationId,
        ));
    gh.factory<_i27.UsecaseThemeDeleteCreate>(
        () => _i27.UsecaseThemeDeleteCreateImpl(
              gh<_i14.ThemeRepository>(),
              gh<_i14.AuthRepository>(),
              gh<_i15.Mapper<_i5.ThemeDTO?, _i15.ThemeModel?>>(),
            ));
    gh.factory<_i9.Mapper<_i5.ApplicationDTO, _i28.ApplicationModel>>(() =>
        _i29.ApplicationMapper(
            gh<_i9.Mapper<_i5.ThemeDTO?, _i30.ThemeModel?>>()));
    gh.factory<_i31.UsecaseThemeCreate>(() => _i31.UsecaseThemeCreateImpl(
          gh<_i32.ThemeRepository>(),
          gh<_i32.AuthRepository>(),
          gh<_i32.Mapper<_i5.ThemeDTO?, _i32.ThemeModel?>>(),
        ));
    gh.factory<_i33.UsecaseApplicationGetAll>(
        () => _i33.UsecaseApplicationGetAllImpl(
              gh<_i14.ApplicationRepository>(),
              gh<_i14.AuthRepository>(),
              gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
            ));
    gh.factory<_i34.UseCaseSetThemeDefault>(
        () => _i34.UseCaseSetThemeDefaultImpl(
              gh<_i14.ApplicationRepository>(),
              gh<_i14.AuthRepository>(),
              gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
            ));
    gh.factory<_i35.ApplicationCreate>(() => _i35.ApplicationCreateImpl(
          gh<_i14.ApplicationRepository>(),
          gh<_i14.AuthRepository>(),
          gh<_i14.ResourcesRepository>(),
          gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
        ));
    gh.factory<_i36.UsecaseApplicationDeleteTemplate>(
        () => _i36.UsecaseApplicationDeleteTemplateImpl(
              gh<_i14.ApplicationRepository>(),
              gh<_i14.AuthRepository>(),
              gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
            ));
    gh.factory<_i37.UsecaseApplicationAddTheme>(
        () => _i37.UsecaseApplicationAddThemeImpl(
              gh<_i14.ApplicationRepository>(),
              gh<_i14.AuthRepository>(),
              gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
              gh<_i15.Mapper<_i5.ThemeDTO?, _i15.ThemeModel>>(),
            ));
    gh.factory<_i38.UsecaseApplicationEdit>(() =>
        _i38.UsecaseApplicationEditImpl(
          applicationRepository: gh<_i14.ApplicationRepository>(),
          authRepository: gh<_i14.AuthRepository>(),
          resourcesRepository: gh<_i14.ResourcesRepository>(),
          mapper: gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
        ));
    gh.factory<_i39.UsecaseApplicationIncVersion>(
        () => _i39.UsecaseApplicationIncVersionImpl(
              gh<_i14.ApplicationRepository>(),
              gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
            ));
    gh.factory<_i40.UsecaseApplicationGet>(() => _i40.UsecaseApplicationGetImpl(
          applicationRepository: gh<_i14.ApplicationRepository>(),
          authRepository: gh<_i14.AuthRepository>(),
          mapper: gh<_i15.Mapper<_i5.ApplicationDTO, _i15.ApplicationModel>>(),
        ));
  }
}
