// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_database/firebase_database.dart' as _i4;
import 'package:flutter/material.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:webtrit_configurator/core/config/di/injection.dart' as _i52;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_is_logged_in.dart'
    as _i29;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_is_logged_in_impl.dart'
    as _i30;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_sign_in.dart'
    as _i31;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_sign_in_impl.dart'
    as _i32;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_create.dart'
    as _i33;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_create_impl.dart'
    as _i34;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_delete.dart'
    as _i35;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_delete_impl.dart'
    as _i36;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_do_as_default.dart'
    as _i27;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_do_as_default_impl.dart'
    as _i28;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_all.dart'
    as _i37;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_all_impl.dart'
    as _i38;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_by_id.dart'
    as _i39;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_by_id_impl.dart'
    as _i40;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_template.dart'
    as _i16;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_template_impl.dart'
    as _i17;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_update.dart'
    as _i41;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_update_impl.dart'
    as _i42;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_add_theme.dart'
    as _i44;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_add_theme_impl.dart'
    as _i45;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_delete.dart'
    as _i48;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_delete_impl.dart'
    as _i49;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_get_all.dart'
    as _i50;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_get_all_impl.dart'
    as _i51;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_create.dart'
    as _i46;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_create_impl.dart'
    as _i47;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_get_template.dart'
    as _i18;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_get_template_impl.dart'
    as _i19;
import 'package:webtrit_configurator/share/data/auth_firebase_data.dart'
    as _i22;
import 'package:webtrit_configurator/share/data/data.dart' as _i15;
import 'package:webtrit_configurator/share/data/realtime_firebase_data.dart'
    as _i12;
import 'package:webtrit_configurator/share/entity/dto/dto.dart' as _i6;
import 'package:webtrit_configurator/share/entity/entity.dart' as _i25;
import 'package:webtrit_configurator/share/entity/mappers/mapper.dart' as _i5;
import 'package:webtrit_configurator/share/entity/mappers/themes/colors_mapper.dart'
    as _i11;
import 'package:webtrit_configurator/share/entity/mappers/themes/image_mapper.dart'
    as _i8;
import 'package:webtrit_configurator/share/entity/mappers/themes/text_style_mapper.dart'
    as _i10;
import 'package:webtrit_configurator/share/entity/mappers/themes/theme_mapper.dart'
    as _i24;
import 'package:webtrit_configurator/share/entity/mappers/vendors/vendor_mapper.dart'
    as _i26;
import 'package:webtrit_configurator/share/entity/models/theme/theme.dart'
    as _i7;
import 'package:webtrit_configurator/share/repository/auth/auth_repository_impl.dart'
    as _i23;
import 'package:webtrit_configurator/share/repository/theme/theme_repository.dart'
    as _i13;
import 'package:webtrit_configurator/share/repository/theme/theme_repository_impl.dart'
    as _i14;
import 'package:webtrit_configurator/share/repository/vendor/vendor_repository_impl.dart'
    as _i21;
import 'package:webtrit_configurator/share/share.dart' as _i20;
import 'package:webtrit_configurator/share/usecase/user/usecase_user_get_impl.dart'
    as _i43; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i5.Mapper<_i6.ImageDTO?, _i7.ImageModel?>>(
        () => _i8.ImageMapper());
    gh.factory<_i5.Mapper<_i6.TextStyleDTO?, _i9.TextStyle?>>(
        () => _i10.TextStyleMapper());
    gh.factory<_i5.Mapper<_i6.ColorDTO?, _i7.ColorSchemeModel?>>(
        () => _i11.ColorsMapper());
    gh.singleton<_i12.RealtimeFirebaseData>(_i12.RealtimeFirebaseData(
        firebaseDatabase: gh<_i4.FirebaseDatabase>()));
    gh.factory<_i13.ThemeRepository>(() =>
        _i14.ThemeRepositoryImpl(datasource: gh<_i15.RealtimeFirebaseData>()));
    gh.factory<_i16.UsecaseThemeGetTemplate>(
        () => _i17.GetThemTemplateUseCase());
    gh.factory<_i18.UsecaseVendorGetTemplate>(
        () => _i19.UsecaseVendorGetTemplateImpl());
    gh.factory<_i20.VendorRepository>(() =>
        _i21.VendorRepositoryImpl(datasource: gh<_i20.RealtimeFirebaseData>()));
    gh.singleton<_i22.AuthFirebaseData>(
        _i22.AuthFirebaseData(gh<_i3.FirebaseAuth>()));
    gh.factory<_i20.AuthRepository>(
        () => _i23.AuthRepositoryImpl(datasource: gh<_i20.AuthFirebaseData>()));
    gh.factory<_i5.Mapper<_i6.ThemeDTO?, _i7.AppConfigurationModel?>>(
        () => _i24.ThemeMapper(
              gh<_i5.Mapper<_i6.ColorDTO?, _i7.ColorSchemeModel?>>(),
              gh<_i5.Mapper<_i6.TextStyleDTO?, _i9.TextStyle?>>(),
              gh<_i5.Mapper<_i6.ImageDTO?, _i7.ImageModel?>>(),
            ));
    gh.factory<_i25.Mapper<_i25.VendorDTO, _i25.ApplicationModel>>(() =>
        _i26.VendorMapper(
            gh<_i25.Mapper<_i25.ThemeDTO?, _i25.AppConfigurationModel?>>()));
    gh.factory<_i27.SetThemeForApplicationUseCase>(
        () => _i28.SetThemeForApplicationUseCaseImpl(
              gh<_i20.VendorRepository>(),
              gh<_i20.AuthRepository>(),
              gh<_i20.Mapper<_i20.VendorDTO, _i20.ApplicationModel>>(),
              gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel?>>(),
            ));
    gh.factory<_i29.UsecaseAuthIsLoggedIn>(() => _i30.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i20.AuthRepository>()));
    gh.factory<_i31.UsecaseAuthSignIn>(() =>
        _i32.UsecaseAuthSignInImpl(authRepository: gh<_i20.AuthRepository>()));
    gh.factory<_i33.UsecaseThemeCreate>(() => _i34.UsecaseThemeCreateImpl(
          gh<_i20.ThemeRepository>(),
          gh<_i20.AuthRepository>(),
          gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel?>>(),
        ));
    gh.factory<_i35.UsecaseThemeDeleteCreate>(
        () => _i36.UsecaseThemeDeleteCreateImpl(
              gh<_i20.ThemeRepository>(),
              gh<_i20.AuthRepository>(),
              gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel?>>(),
            ));
    gh.factory<_i37.UsecaseThemeGetAll>(() => _i38.UsecaseThemeGetAllImpl(
          themeRepository: gh<_i20.ThemeRepository>(),
          authRepository: gh<_i20.AuthRepository>(),
          mapper:
              gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel?>>(),
        ));
    gh.factory<_i39.UsecaseThemeGetById>(() => _i40.UsecaseThemeGetByIdImpl(
          gh<_i20.ThemeRepository>(),
          gh<_i20.AuthRepository>(),
          gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel?>>(),
        ));
    gh.factory<_i41.UsecaseThemeUpdate>(() => _i42.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i20.ThemeRepository>(),
          authRepository: gh<_i20.AuthRepository>(),
          mapper:
              gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel?>>(),
        ));
    gh.factory<_i20.UsecaseUserGet>(
        () => _i43.UsecaseThemeDeleteCreateImpl(gh<_i20.AuthRepository>()));
    gh.factory<_i44.UsecaseVendorAddTheme>(() => _i45.UsecaseVendorAddThemeImpl(
          gh<_i20.VendorRepository>(),
          gh<_i20.AuthRepository>(),
          gh<_i20.Mapper<_i20.VendorDTO, _i20.ApplicationModel>>(),
          gh<_i20.Mapper<_i20.ThemeDTO?, _i20.AppConfigurationModel>>(),
        ));
    gh.factory<_i46.UsecaseVendorCreate>(() => _i47.UsecaseVendorCreateImpl(
          gh<_i20.VendorRepository>(),
          gh<_i20.AuthRepository>(),
          gh<_i20.Mapper<_i20.VendorDTO, _i20.ApplicationModel>>(),
        ));
    gh.factory<_i48.UsecaseVendorDeleteTemplate>(
        () => _i49.UsecaseVendorDeleteTemplateImpl(
              gh<_i20.VendorRepository>(),
              gh<_i20.AuthRepository>(),
              gh<_i20.Mapper<_i20.VendorDTO, _i20.ApplicationModel>>(),
            ));
    gh.factory<_i50.UsecaseVendorGetAll>(() => _i51.UsecaseVendorGetAllImpl(
          gh<_i20.VendorRepository>(),
          gh<_i20.AuthRepository>(),
          gh<_i20.Mapper<_i20.VendorDTO, _i20.ApplicationModel>>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i52.RegisterModule {}
