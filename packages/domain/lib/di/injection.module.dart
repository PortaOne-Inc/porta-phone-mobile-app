//@GeneratedMicroModule;DomainPackageModule;package:domain/di/injection.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data/data.dart' as _i8;
import 'package:data/dto/dto.dart' as _i4;
import 'package:data/dto/theme/theme_dto.dart' as _i25;
import 'package:domain/domain.dart' as _i24;
import 'package:domain/entity/entity.dart' as _i27;
import 'package:domain/entity/mappers/applications/application_mapper.dart'
    as _i32;
import 'package:domain/entity/mappers/mapper.dart' as _i3;
import 'package:domain/entity/mappers/mapper_contract.dart' as _i7;
import 'package:domain/entity/mappers/themes/colors_mapper.dart' as _i6;
import 'package:domain/entity/mappers/themes/image_mapper.dart' as _i10;
import 'package:domain/entity/mappers/themes/texts_mapper.dart' as _i9;
import 'package:domain/entity/mappers/themes/theme_mapper.dart' as _i22;
import 'package:domain/entity/models/application/application_model.dart'
    as _i31;
import 'package:domain/entity/models/models.dart' as _i5;
import 'package:domain/entity/models/theme/theme_model.dart' as _i33;
import 'package:domain/repository/auth/auth_repository.dart' as _i13;
import 'package:domain/repository/repository.dart' as _i16;
import 'package:domain/usecase/applications/application_create.dart' as _i41;
import 'package:domain/usecase/applications/usecase_application_add_theme.dart'
    as _i35;
import 'package:domain/usecase/applications/usecase_application_delete.dart'
    as _i36;
import 'package:domain/usecase/applications/usecase_application_edit.dart'
    as _i37;
import 'package:domain/usecase/applications/usecase_application_get.dart'
    as _i38;
import 'package:domain/usecase/applications/usecase_application_get_all.dart'
    as _i39;
import 'package:domain/usecase/applications/usecase_application_inc_version.dart'
    as _i40;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in.dart' as _i11;
import 'package:domain/usecase/auth/usecase_auth_is_logged_in_impl.dart'
    as _i12;
import 'package:domain/usecase/auth/usecase_auth_log_out.dart' as _i14;
import 'package:domain/usecase/auth/usecase_auth_log_out_impl.dart' as _i15;
import 'package:domain/usecase/auth/usecase_auth_reset_password.dart' as _i17;
import 'package:domain/usecase/auth/usecase_auth_resrt_password_impl.dart'
    as _i18;
import 'package:domain/usecase/auth/usecase_auth_sign_in.dart' as _i19;
import 'package:domain/usecase/auth/usecase_auth_sign_in_impl.dart' as _i20;
import 'package:domain/usecase/theme/usecase_set_theme_default.dart' as _i34;
import 'package:domain/usecase/theme/usecase_theme_create.dart' as _i23;
import 'package:domain/usecase/theme/usecase_theme_delete.dart' as _i26;
import 'package:domain/usecase/theme/usecase_theme_get.dart' as _i28;
import 'package:domain/usecase/theme/usecase_theme_get_all.dart' as _i29;
import 'package:domain/usecase/theme/usecase_theme_get_template.dart' as _i21;
import 'package:domain/usecase/theme/usecase_theme_update.dart' as _i30;
import 'package:injectable/injectable.dart' as _i1;

class DomainPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.Mapper<_i4.ColorDTO?, _i5.ColorSchemeModel?>>(
        () => _i6.ColorsMapper());
    gh.factory<_i7.Mapper<_i8.TextsDTO?, _i5.TextsModel?>>(
        () => _i9.TextsMapper());
    gh.factory<_i3.Mapper<_i8.ImageDTO?, _i5.ImageModel?>>(
        () => _i10.ImageMapper());
    gh.factory<_i11.UsecaseAuthIsLoggedIn>(() => _i12.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i13.AuthRepository>()));
    gh.factory<_i14.UsecaseAuthLogOut>(() =>
        _i15.UsecaseAuthLogOutImpl(authRepository: gh<_i16.AuthRepository>()));
    gh.factory<_i17.UsecaseAuthResetPassword>(() =>
        _i18.UsecaseAuthResetPasswordImpl(
            authRepository: gh<_i16.AuthRepository>()));
    gh.factory<_i19.UsecaseAuthSignIn>(() =>
        _i20.UsecaseAuthSignInImpl(authRepository: gh<_i16.AuthRepository>()));
    gh.factory<_i21.UsecaseThemeGetTemplate>(
        () => _i21.GetThemTemplateUseCase());
    gh.factory<_i3.Mapper<_i8.ThemeDTO?, _i5.ThemeModel?>>(
        () => _i22.ThemeMapper(
              gh<_i3.Mapper<_i8.ColorDTO?, _i5.ColorSchemeModel?>>(),
              gh<_i3.Mapper<_i8.ImageDTO?, _i5.ImageModel?>>(),
              gh<_i3.Mapper<_i8.TextsDTO?, _i5.TextsModel?>>(),
            ));
    gh.factory<_i23.UsecaseThemeCreate>(() => _i23.UsecaseThemeCreateImpl(
          gh<_i24.ThemeRepository>(),
          gh<_i24.AuthRepository>(),
          gh<_i24.Mapper<_i25.ThemeDTO?, _i24.ThemeModel?>>(),
        ));
    gh.factory<_i26.UsecaseThemeDeleteCreate>(
        () => _i26.UsecaseThemeDeleteCreateImpl(
              gh<_i16.ThemeRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i27.Mapper<_i4.ThemeDTO?, _i27.ThemeModel?>>(),
            ));
    gh.factoryParam<_i28.UsecaseThemeGet, String, String>(
      (
        applicationId,
        themeId,
      ) =>
          _i28.UsecaseThemeGetImpl(
        themeRepository: gh<_i16.ThemeRepository>(),
        authRepository: gh<_i16.AuthRepository>(),
        mapper: gh<_i27.Mapper<_i8.ThemeDTO?, _i27.ThemeModel?>>(),
        applicationId: applicationId,
        themeId: themeId,
      ),
      instanceName: 'applicationUsecaseKey',
    );
    gh.factory<_i28.UsecaseThemeGet>(
      () => _i28.UsecaseThemeStaticGetImpl(
        themeRepository: gh<_i16.ThemeRepository>(),
        authRepository: gh<_i16.AuthRepository>(),
        mapper: gh<_i27.Mapper<_i8.ThemeDTO?, _i27.ThemeModel?>>(),
      ),
      instanceName: 'staticUsecaseKey',
    );
    gh.factory<_i29.UsecaseThemeGetAll>(() => _i29.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i16.ThemeRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          mapper: gh<_i27.Mapper<_i4.ThemeDTO?, _i27.ThemeModel?>>(),
        ));
    gh.factory<_i30.UsecaseThemeUpdate>(
      () => _i30.UsecaseThemeStaticUpdateImpl(
        themeRepository: gh<_i16.ThemeRepository>(),
        authRepository: gh<_i16.AuthRepository>(),
        resourcesRepository: gh<_i16.ResourcesRepository>(),
        mapper: gh<_i27.Mapper<_i8.ThemeDTO?, _i27.ThemeModel?>>(),
      ),
      instanceName: 'staticEditUsecaseKey',
    );
    gh.factoryParam<_i30.UsecaseThemeUpdate, String, dynamic>(
      (
        applicationId,
        _,
      ) =>
          _i30.UsecaseThemeUpdateImpl(
        themeRepository: gh<_i16.ThemeRepository>(),
        authRepository: gh<_i16.AuthRepository>(),
        resourcesRepository: gh<_i16.ResourcesRepository>(),
        mapper: gh<_i27.Mapper<_i8.ThemeDTO?, _i27.ThemeModel?>>(),
        applicationId: applicationId,
      ),
      instanceName: 'applicationEditUsecaseKey',
    );
    gh.factory<_i7.Mapper<_i8.ApplicationDTO, _i31.ApplicationModel>>(() =>
        _i32.ApplicationMapper(
            gh<_i7.Mapper<_i8.ThemeDTO?, _i33.ThemeModel?>>()));
    gh.factory<_i34.UseCaseSetThemeDefault>(
        () => _i34.UseCaseSetThemeDefaultImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
            ));
    gh.factory<_i35.UsecaseApplicationAddTheme>(
        () => _i35.UsecaseApplicationAddThemeImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
              gh<_i27.Mapper<_i4.ThemeDTO?, _i27.ThemeModel>>(),
            ));
    gh.factory<_i36.UsecaseApplicationDeleteTemplate>(
        () => _i36.UsecaseApplicationDeleteTemplateImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
            ));
    gh.factory<_i37.UsecaseApplicationEdit>(() =>
        _i37.UsecaseApplicationEditImpl(
          applicationRepository: gh<_i16.ApplicationRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          resourcesRepository: gh<_i16.ResourcesRepository>(),
          mapper: gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
        ));
    gh.factory<_i38.UsecaseApplicationGet>(() => _i38.UsecaseApplicationGetImpl(
          applicationRepository: gh<_i16.ApplicationRepository>(),
          authRepository: gh<_i16.AuthRepository>(),
          mapper: gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
        ));
    gh.factory<_i39.UsecaseApplicationGetAll>(
        () => _i39.UsecaseApplicationGetAllImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i16.AuthRepository>(),
              gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
            ));
    gh.factory<_i40.UsecaseApplicationIncVersion>(
        () => _i40.UsecaseApplicationIncVersionImpl(
              gh<_i16.ApplicationRepository>(),
              gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
            ));
    gh.factory<_i41.ApplicationCreate>(() => _i41.ApplicationCreateImpl(
          gh<_i16.ApplicationRepository>(),
          gh<_i16.AuthRepository>(),
          gh<_i16.ResourcesRepository>(),
          gh<_i27.Mapper<_i4.ApplicationDTO, _i27.ApplicationModel>>(),
        ));
  }
}
