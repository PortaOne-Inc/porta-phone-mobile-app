// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_database/firebase_database.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:flutter/material.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:webtrit_configurator/core/config/di/injection.dart' as _i55;
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_add_theme.dart'
    as _i28;
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_add_theme_impl.dart'
    as _i29;
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_delete.dart'
    as _i32;
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_delete_impl.dart'
    as _i33;
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_get_all.dart'
    as _i34;
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_get_all_impl.dart'
    as _i35;
import 'package:webtrit_configurator/features/application_create/usecase/usecase_application_create.dart'
    as _i30;
import 'package:webtrit_configurator/features/application_create/usecase/usecase_application_create_impl.dart'
    as _i31;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_is_logged_in.dart'
    as _i36;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_is_logged_in_impl.dart'
    as _i37;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_sign_in.dart'
    as _i40;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_sign_in_impl.dart'
    as _i41;
import 'package:webtrit_configurator/features/common/usecase/usecase_auth_log_out.dart'
    as _i38;
import 'package:webtrit_configurator/features/common/usecase/usecase_auth_log_out_impl.dart'
    as _i39;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_create.dart'
    as _i42;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_create_impl.dart'
    as _i43;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_delete.dart'
    as _i44;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_delete_impl.dart'
    as _i45;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_do_as_default.dart'
    as _i26;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_do_as_default_impl.dart'
    as _i27;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_all.dart'
    as _i46;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_all_impl.dart'
    as _i47;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_by_id.dart'
    as _i48;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_by_id_impl.dart'
    as _i49;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_template.dart'
    as _i17;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_template_impl.dart'
    as _i18;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_update.dart'
    as _i53;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_update_impl.dart'
    as _i54;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_upload_image.dart'
    as _i50;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_upload_image_impl.dart'
    as _i51;
import 'package:webtrit_configurator/share/data/auth_firebase_data.dart'
    as _i21;
import 'package:webtrit_configurator/share/data/data.dart' as _i16;
import 'package:webtrit_configurator/share/data/realtime_firebase_data.dart'
    as _i13;
import 'package:webtrit_configurator/share/entity/dto/dto.dart' as _i7;
import 'package:webtrit_configurator/share/entity/entity.dart' as _i24;
import 'package:webtrit_configurator/share/entity/mappers/mapper.dart' as _i6;
import 'package:webtrit_configurator/share/entity/mappers/themes/colors_mapper.dart'
    as _i12;
import 'package:webtrit_configurator/share/entity/mappers/themes/image_mapper.dart'
    as _i9;
import 'package:webtrit_configurator/share/entity/mappers/themes/text_style_mapper.dart'
    as _i11;
import 'package:webtrit_configurator/share/entity/mappers/themes/theme_mapper.dart'
    as _i23;
import 'package:webtrit_configurator/share/entity/mappers/vendors/vendor_mapper.dart'
    as _i25;
import 'package:webtrit_configurator/share/entity/models/theme/theme.dart'
    as _i8;
import 'package:webtrit_configurator/share/repository/auth/auth_repository_impl.dart'
    as _i22;
import 'package:webtrit_configurator/share/repository/theme/theme_repository.dart'
    as _i14;
import 'package:webtrit_configurator/share/repository/theme/theme_repository_impl.dart'
    as _i15;
import 'package:webtrit_configurator/share/repository/vendor/vendor_repository_impl.dart'
    as _i20;
import 'package:webtrit_configurator/share/share.dart' as _i19;
import 'package:webtrit_configurator/share/usecase/user/usecase_user_get_impl.dart'
    as _i52; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.FirebaseAuth>(registerModule.auth());
    gh.singleton<_i4.FirebaseDatabase>(registerModule.database());
    gh.singleton<_i5.FirebaseStorage>(registerModule.storage());
    gh.factory<_i6.Mapper<_i7.ImageDTO?, _i8.ImageModel?>>(
        () => _i9.ImageMapper());
    gh.factory<_i6.Mapper<_i7.TextStyleDTO?, _i10.TextStyle?>>(
        () => _i11.TextStyleMapper());
    gh.factory<_i6.Mapper<_i7.ColorDTO?, _i8.ColorSchemeModel?>>(
        () => _i12.ColorsMapper());
    gh.singleton<_i13.RealtimeFirebaseData>(_i13.RealtimeFirebaseData(
        firebaseDatabase: gh<_i4.FirebaseDatabase>()));
    gh.factory<_i14.ThemeRepository>(() => _i15.ThemeRepositoryImpl(
          datasource: gh<_i16.RealtimeFirebaseData>(),
          firebaseStorage: gh<_i5.FirebaseStorage>(),
        ));
    gh.factory<_i17.UsecaseThemeGetTemplate>(
        () => _i18.GetThemTemplateUseCase());
    gh.factory<_i19.VendorRepository>(() =>
        _i20.VendorRepositoryImpl(datasource: gh<_i19.RealtimeFirebaseData>()));
    gh.singleton<_i21.AuthFirebaseData>(
        _i21.AuthFirebaseData(gh<_i3.FirebaseAuth>()));
    gh.factory<_i19.AuthRepository>(
        () => _i22.AuthRepositoryImpl(datasource: gh<_i19.AuthFirebaseData>()));
    gh.factory<_i6.Mapper<_i7.ThemeDTO?, _i8.AppConfigurationModel?>>(
        () => _i23.ThemeMapper(
              gh<_i6.Mapper<_i7.ColorDTO?, _i8.ColorSchemeModel?>>(),
              gh<_i6.Mapper<_i7.TextStyleDTO?, _i10.TextStyle?>>(),
              gh<_i6.Mapper<_i7.ImageDTO?, _i8.ImageModel?>>(),
            ));
    gh.factory<_i24.Mapper<_i24.VendorDTO, _i24.ApplicationModel>>(() =>
        _i25.VendorMapper(
            gh<_i24.Mapper<_i24.ThemeDTO?, _i24.AppConfigurationModel?>>()));
    gh.factory<_i26.SetThemeForApplicationUseCase>(
        () => _i27.SetThemeForApplicationUseCaseImpl(
              gh<_i19.VendorRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.VendorDTO, _i19.ApplicationModel>>(),
              gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel?>>(),
            ));
    gh.factory<_i28.UsecaseApplicationAddTheme>(
        () => _i29.UsecaseApplicationAddThemeImpl(
              gh<_i19.VendorRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.VendorDTO, _i19.ApplicationModel>>(),
              gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel>>(),
            ));
    gh.factory<_i30.UsecaseApplicationCreate>(
        () => _i31.UsecaseApplicationCreateImpl(
              gh<_i19.VendorRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.VendorDTO, _i19.ApplicationModel>>(),
            ));
    gh.factory<_i32.UsecaseApplicationDeleteTemplate>(
        () => _i33.UsecaseVendorDeleteTemplateImpl(
              gh<_i19.VendorRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.VendorDTO, _i19.ApplicationModel>>(),
            ));
    gh.factory<_i34.UsecaseApplicationGetAll>(
        () => _i35.UsecaseApplicationGetAllImpl(
              gh<_i19.VendorRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.VendorDTO, _i19.ApplicationModel>>(),
            ));
    gh.factory<_i36.UsecaseAuthIsLoggedIn>(() => _i37.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i19.AuthRepository>()));
    gh.factory<_i38.UsecaseAuthLogOut>(() =>
        _i39.UsecaseAuthLogOutImpl(authRepository: gh<_i19.AuthRepository>()));
    gh.factory<_i40.UsecaseAuthSignIn>(() =>
        _i41.UsecaseAuthSignInImpl(authRepository: gh<_i19.AuthRepository>()));
    gh.factory<_i42.UsecaseThemeCreate>(() => _i43.UsecaseThemeCreateImpl(
          gh<_i19.ThemeRepository>(),
          gh<_i19.AuthRepository>(),
          gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel?>>(),
        ));
    gh.factory<_i44.UsecaseThemeDeleteCreate>(
        () => _i45.UsecaseThemeDeleteCreateImpl(
              gh<_i19.ThemeRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel?>>(),
            ));
    gh.factory<_i46.UsecaseThemeGetAll>(() => _i47.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i19.ThemeRepository>(),
          authRepository: gh<_i19.AuthRepository>(),
          mapper:
              gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel?>>(),
        ));
    gh.factory<_i48.UsecaseThemeGetById>(() => _i49.UsecaseThemeGetByIdImpl(
          gh<_i19.ThemeRepository>(),
          gh<_i19.AuthRepository>(),
          gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel?>>(),
        ));
    gh.factory<_i50.UsecaseThemeUploadImage>(
        () => _i51.UsecaseThemeUploadImageImpl(
              gh<_i19.ThemeRepository>(),
              gh<_i19.AuthRepository>(),
              gh<_i19.Mapper<_i19.ImageDTO?, _i19.ImageModel?>>(),
            ));
    gh.factory<_i19.UsecaseUserGet>(
        () => _i52.UsecaseThemeDeleteCreateImpl(gh<_i19.AuthRepository>()));
    gh.factory<_i53.UsecaseThemeUpdate>(() => _i54.UsecaseThemeUpdateImpl(
          uploadImage: gh<_i50.UsecaseThemeUploadImage>(),
          themeRepository: gh<_i19.ThemeRepository>(),
          authRepository: gh<_i19.AuthRepository>(),
          mapper:
              gh<_i19.Mapper<_i19.ThemeDTO?, _i19.AppConfigurationModel?>>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i55.RegisterModule {}
