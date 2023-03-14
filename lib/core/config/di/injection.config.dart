// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_database/firebase_database.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:webtrit_configurator/core/config/di/injection.dart' as _i51;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_is_logged_in.dart'
    as _i28;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_is_logged_in_impl.dart'
    as _i29;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_sign_in.dart'
    as _i30;
import 'package:webtrit_configurator/features/auth/usecase/usecase_auth_sign_in_impl.dart'
    as _i31;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_create.dart'
    as _i32;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_create_impl.dart'
    as _i33;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_delete.dart'
    as _i34;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_delete_impl.dart'
    as _i35;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_do_as_default.dart'
    as _i26;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_do_as_default_impl.dart'
    as _i27;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_all.dart'
    as _i36;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_all_impl.dart'
    as _i37;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_by_id.dart'
    as _i38;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_by_id_impl.dart'
    as _i39;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_template.dart'
    as _i17;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_get_template_impl.dart'
    as _i18;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_update.dart'
    as _i40;
import 'package:webtrit_configurator/features/theme_collection/usecase/usecase_theme_update_impl.dart'
    as _i41;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_add_theme.dart'
    as _i43;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_add_theme_impl.dart'
    as _i44;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_delete.dart'
    as _i47;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_delete_impl.dart'
    as _i48;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_get_all.dart'
    as _i49;
import 'package:webtrit_configurator/features/vendor_collection/usecase/usecase_vendor_get_all_impl.dart'
    as _i50;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_create.dart'
    as _i45;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_create_impl.dart'
    as _i46;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_get_template.dart'
    as _i19;
import 'package:webtrit_configurator/features/vendor_create/usecase/usecase_vendor_get_template_impl.dart'
    as _i20;
import 'package:webtrit_configurator/share/data/auth_firebase_data.dart'
    as _i23;
import 'package:webtrit_configurator/share/data/data.dart' as _i16;
import 'package:webtrit_configurator/share/data/realtime_firebase_data.dart'
    as _i13;
import 'package:webtrit_configurator/share/entity/dto/dto.dart' as _i6;
import 'package:webtrit_configurator/share/entity/entity.dart' as _i11;
import 'package:webtrit_configurator/share/entity/mappers/implementation/themes/colors_mapper.dart'
    as _i10;
import 'package:webtrit_configurator/share/entity/mappers/implementation/themes/image_mapper.dart'
    as _i8;
import 'package:webtrit_configurator/share/entity/mappers/implementation/themes/text_style_mapper.dart'
    as _i9;
import 'package:webtrit_configurator/share/entity/mappers/implementation/themes/theme_mapper.dart'
    as _i25;
import 'package:webtrit_configurator/share/entity/mappers/implementation/vendors/vendor_mapper.dart'
    as _i12;
import 'package:webtrit_configurator/share/entity/mappers/mapper.dart' as _i5;
import 'package:webtrit_configurator/share/entity/models/theme/theme.dart'
    as _i7;
import 'package:webtrit_configurator/share/repository/auth/auth_repository_impl.dart'
    as _i24;
import 'package:webtrit_configurator/share/repository/theme/theme_repository.dart'
    as _i14;
import 'package:webtrit_configurator/share/repository/theme/theme_repository_impl.dart'
    as _i15;
import 'package:webtrit_configurator/share/repository/vendor/vendor_repository_impl.dart'
    as _i22;
import 'package:webtrit_configurator/share/share.dart' as _i21;
import 'package:webtrit_configurator/share/usecase/user/usecase_user_get_impl.dart'
    as _i42; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i5.Mapper<_i6.ImageDTO, _i7.ImageModel>>(
        () => _i8.ImageMapper());
    gh.factory<_i5.Mapper<_i6.TextStyleDTO, _i7.TextStyleModel>>(
        () => _i9.TextStyleMapper());
    gh.factory<_i5.Mapper<_i6.ColorDTO, _i7.ColorsModel>>(
        () => _i10.ColorsMapper());
    gh.factory<_i11.Mapper<_i11.VendorDTO, _i11.ApplicationModel>>(
        () => _i12.VendorMapper());
    gh.singleton<_i13.RealtimeFirebaseData>(_i13.RealtimeFirebaseData(
        firebaseDatabase: gh<_i4.FirebaseDatabase>()));
    gh.factory<_i14.ThemeRepository>(() =>
        _i15.ThemeRepositoryImpl(datasource: gh<_i16.RealtimeFirebaseData>()));
    gh.factory<_i17.UsecaseThemeGetTemplate>(
        () => _i18.GetThemTemplateUseCase());
    gh.factory<_i19.UsecaseVendorGetTemplate>(
        () => _i20.UsecaseVendorGetTemplateImpl());
    gh.factory<_i21.VendorRepository>(() =>
        _i22.VendorRepositoryImpl(datasource: gh<_i21.RealtimeFirebaseData>()));
    gh.singleton<_i23.AuthFirebaseData>(
        _i23.AuthFirebaseData(gh<_i3.FirebaseAuth>()));
    gh.factory<_i21.AuthRepository>(
        () => _i24.AuthRepositoryImpl(datasource: gh<_i21.AuthFirebaseData>()));
    gh.factory<_i5.Mapper<_i6.ThemeDTO, _i7.ThemeModel>>(() => _i25.ThemeMapper(
          gh<_i5.Mapper<_i6.ColorDTO, _i7.ColorsModel>>(),
          gh<_i5.Mapper<_i6.TextStyleDTO, _i7.TextStyleModel>>(),
          gh<_i5.Mapper<_i6.ImageDTO, _i7.ImageModel>>(),
        ));
    gh.factory<_i26.SetThemeForApplicationUseCase>(
        () => _i27.SetThemeForApplicationUseCaseImpl(
              gh<_i21.VendorRepository>(),
              gh<_i21.AuthRepository>(),
              gh<_i21.Mapper<_i21.VendorDTO, _i21.ApplicationModel>>(),
              gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
            ));
    gh.factory<_i28.UsecaseAuthIsLoggedIn>(() => _i29.UsecaseAuthIsLoggedInImpl(
        authRepository: gh<_i21.AuthRepository>()));
    gh.factory<_i30.UsecaseAuthSignIn>(() =>
        _i31.UsecaseAuthSignInImpl(authRepository: gh<_i21.AuthRepository>()));
    gh.factory<_i32.UsecaseThemeCreate>(() => _i33.UsecaseThemeCreateImpl(
          gh<_i21.ThemeRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
        ));
    gh.factory<_i34.UsecaseThemeDeleteCreate>(
        () => _i35.UsecaseThemeDeleteCreateImpl(
              gh<_i21.ThemeRepository>(),
              gh<_i21.AuthRepository>(),
              gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
            ));
    gh.factory<_i36.UsecaseThemeGetAll>(() => _i37.UsecaseThemeGetAllImpl(
          gh<_i21.ThemeRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
        ));
    gh.factory<_i38.UsecaseThemeGetById>(() => _i39.UsecaseThemeGetByIdImpl(
          gh<_i21.ThemeRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
        ));
    gh.factory<_i40.UsecaseThemeUpdate>(() => _i41.UsecaseThemeUpdateImpl(
          themeRepository: gh<_i21.ThemeRepository>(),
          authRepository: gh<_i21.AuthRepository>(),
          mapper: gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
        ));
    gh.factory<_i21.UsecaseUserGet>(
        () => _i42.UsecaseThemeDeleteCreateImpl(gh<_i21.AuthRepository>()));
    gh.factory<_i43.UsecaseVendorAddTheme>(() => _i44.UsecaseVendorAddThemeImpl(
          gh<_i21.VendorRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i21.Mapper<_i21.VendorDTO, _i21.ApplicationModel>>(),
          gh<_i21.Mapper<_i21.ThemeDTO, _i21.ThemeModel>>(),
        ));
    gh.factory<_i45.UsecaseVendorCreate>(() => _i46.UsecaseVendorCreateImpl(
          gh<_i21.VendorRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i21.Mapper<_i21.VendorDTO, _i21.ApplicationModel>>(),
        ));
    gh.factory<_i47.UsecaseVendorDeleteTemplate>(
        () => _i48.UsecaseVendorDeleteTemplateImpl(
              gh<_i21.VendorRepository>(),
              gh<_i21.AuthRepository>(),
              gh<_i21.Mapper<_i21.VendorDTO, _i21.ApplicationModel>>(),
            ));
    gh.factory<_i49.UsecaseVendorGetAll>(() => _i50.UsecaseVendorGetAllImpl(
          gh<_i21.VendorRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i21.Mapper<_i21.VendorDTO, _i21.ApplicationModel>>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i51.RegisterModule {}
