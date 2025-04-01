// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeModel {
  String? get id => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get fontFamily => throw _privateConstructorUsedError;
  Map<String, dynamic> get colorSchemeConfig =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get themeWidgetConfig =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get themePageConfig =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get appConfig => throw _privateConstructorUsedError;
  List<ThemeAssetModel> get assets => throw _privateConstructorUsedError;
  LaunchAssetsModel get launchAssets => throw _privateConstructorUsedError;
  SplashAssetModel get splashAsset => throw _privateConstructorUsedError;
  TextsModel? get texts => throw _privateConstructorUsedError;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeModelCopyWith<ThemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeModelCopyWith<$Res> {
  factory $ThemeModelCopyWith(
          ThemeModel value, $Res Function(ThemeModel) then) =
      _$ThemeModelCopyWithImpl<$Res, ThemeModel>;
  @useResult
  $Res call(
      {String? id,
      String? applicationId,
      String? name,
      String? fontFamily,
      Map<String, dynamic> colorSchemeConfig,
      Map<String, dynamic> themeWidgetConfig,
      Map<String, dynamic> themePageConfig,
      Map<String, dynamic> appConfig,
      List<ThemeAssetModel> assets,
      LaunchAssetsModel launchAssets,
      SplashAssetModel splashAsset,
      TextsModel? texts});

  $LaunchAssetsModelCopyWith<$Res> get launchAssets;
  $SplashAssetModelCopyWith<$Res> get splashAsset;
  $TextsModelCopyWith<$Res>? get texts;
}

/// @nodoc
class _$ThemeModelCopyWithImpl<$Res, $Val extends ThemeModel>
    implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? name = freezed,
    Object? fontFamily = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
    Object? assets = null,
    Object? launchAssets = null,
    Object? splashAsset = null,
    Object? texts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fontFamily: freezed == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      colorSchemeConfig: null == colorSchemeConfig
          ? _value.colorSchemeConfig
          : colorSchemeConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themeWidgetConfig: null == themeWidgetConfig
          ? _value.themeWidgetConfig
          : themeWidgetConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themePageConfig: null == themePageConfig
          ? _value.themePageConfig
          : themePageConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      appConfig: null == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<ThemeAssetModel>,
      launchAssets: null == launchAssets
          ? _value.launchAssets
          : launchAssets // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsModel,
      splashAsset: null == splashAsset
          ? _value.splashAsset
          : splashAsset // ignore: cast_nullable_to_non_nullable
              as SplashAssetModel,
      texts: freezed == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as TextsModel?,
    ) as $Val);
  }

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetsModelCopyWith<$Res> get launchAssets {
    return $LaunchAssetsModelCopyWith<$Res>(_value.launchAssets, (value) {
      return _then(_value.copyWith(launchAssets: value) as $Val);
    });
  }

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashAssetModelCopyWith<$Res> get splashAsset {
    return $SplashAssetModelCopyWith<$Res>(_value.splashAsset, (value) {
      return _then(_value.copyWith(splashAsset: value) as $Val);
    });
  }

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextsModelCopyWith<$Res>? get texts {
    if (_value.texts == null) {
      return null;
    }

    return $TextsModelCopyWith<$Res>(_value.texts!, (value) {
      return _then(_value.copyWith(texts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThemeModelImplCopyWith<$Res>
    implements $ThemeModelCopyWith<$Res> {
  factory _$$ThemeModelImplCopyWith(
          _$ThemeModelImpl value, $Res Function(_$ThemeModelImpl) then) =
      __$$ThemeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? applicationId,
      String? name,
      String? fontFamily,
      Map<String, dynamic> colorSchemeConfig,
      Map<String, dynamic> themeWidgetConfig,
      Map<String, dynamic> themePageConfig,
      Map<String, dynamic> appConfig,
      List<ThemeAssetModel> assets,
      LaunchAssetsModel launchAssets,
      SplashAssetModel splashAsset,
      TextsModel? texts});

  @override
  $LaunchAssetsModelCopyWith<$Res> get launchAssets;
  @override
  $SplashAssetModelCopyWith<$Res> get splashAsset;
  @override
  $TextsModelCopyWith<$Res>? get texts;
}

/// @nodoc
class __$$ThemeModelImplCopyWithImpl<$Res>
    extends _$ThemeModelCopyWithImpl<$Res, _$ThemeModelImpl>
    implements _$$ThemeModelImplCopyWith<$Res> {
  __$$ThemeModelImplCopyWithImpl(
      _$ThemeModelImpl _value, $Res Function(_$ThemeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? name = freezed,
    Object? fontFamily = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
    Object? assets = null,
    Object? launchAssets = null,
    Object? splashAsset = null,
    Object? texts = freezed,
  }) {
    return _then(_$ThemeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fontFamily: freezed == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      colorSchemeConfig: null == colorSchemeConfig
          ? _value._colorSchemeConfig
          : colorSchemeConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themeWidgetConfig: null == themeWidgetConfig
          ? _value._themeWidgetConfig
          : themeWidgetConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themePageConfig: null == themePageConfig
          ? _value._themePageConfig
          : themePageConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      appConfig: null == appConfig
          ? _value._appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<ThemeAssetModel>,
      launchAssets: null == launchAssets
          ? _value.launchAssets
          : launchAssets // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsModel,
      splashAsset: null == splashAsset
          ? _value.splashAsset
          : splashAsset // ignore: cast_nullable_to_non_nullable
              as SplashAssetModel,
      texts: freezed == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as TextsModel?,
    ));
  }
}

/// @nodoc

class _$ThemeModelImpl extends _ThemeModel {
  const _$ThemeModelImpl(
      {this.id,
      this.applicationId,
      this.name,
      this.fontFamily,
      final Map<String, dynamic> colorSchemeConfig = const {},
      final Map<String, dynamic> themeWidgetConfig = const {},
      final Map<String, dynamic> themePageConfig = const {},
      final Map<String, dynamic> appConfig = const {},
      final List<ThemeAssetModel> assets = const [],
      this.launchAssets = const LaunchAssetsModel(),
      this.splashAsset = const SplashAssetModel(),
      this.texts})
      : _colorSchemeConfig = colorSchemeConfig,
        _themeWidgetConfig = themeWidgetConfig,
        _themePageConfig = themePageConfig,
        _appConfig = appConfig,
        _assets = assets,
        super._();

  @override
  final String? id;
  @override
  final String? applicationId;
  @override
  final String? name;
  @override
  final String? fontFamily;
  final Map<String, dynamic> _colorSchemeConfig;
  @override
  @JsonKey()
  Map<String, dynamic> get colorSchemeConfig {
    if (_colorSchemeConfig is EqualUnmodifiableMapView)
      return _colorSchemeConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_colorSchemeConfig);
  }

  final Map<String, dynamic> _themeWidgetConfig;
  @override
  @JsonKey()
  Map<String, dynamic> get themeWidgetConfig {
    if (_themeWidgetConfig is EqualUnmodifiableMapView)
      return _themeWidgetConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_themeWidgetConfig);
  }

  final Map<String, dynamic> _themePageConfig;
  @override
  @JsonKey()
  Map<String, dynamic> get themePageConfig {
    if (_themePageConfig is EqualUnmodifiableMapView) return _themePageConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_themePageConfig);
  }

  final Map<String, dynamic> _appConfig;
  @override
  @JsonKey()
  Map<String, dynamic> get appConfig {
    if (_appConfig is EqualUnmodifiableMapView) return _appConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_appConfig);
  }

  final List<ThemeAssetModel> _assets;
  @override
  @JsonKey()
  List<ThemeAssetModel> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  @JsonKey()
  final LaunchAssetsModel launchAssets;
  @override
  @JsonKey()
  final SplashAssetModel splashAsset;
  @override
  final TextsModel? texts;

  @override
  String toString() {
    return 'ThemeModel(id: $id, applicationId: $applicationId, name: $name, fontFamily: $fontFamily, colorSchemeConfig: $colorSchemeConfig, themeWidgetConfig: $themeWidgetConfig, themePageConfig: $themePageConfig, appConfig: $appConfig, assets: $assets, launchAssets: $launchAssets, splashAsset: $splashAsset, texts: $texts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            const DeepCollectionEquality()
                .equals(other._colorSchemeConfig, _colorSchemeConfig) &&
            const DeepCollectionEquality()
                .equals(other._themeWidgetConfig, _themeWidgetConfig) &&
            const DeepCollectionEquality()
                .equals(other._themePageConfig, _themePageConfig) &&
            const DeepCollectionEquality()
                .equals(other._appConfig, _appConfig) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.launchAssets, launchAssets) ||
                other.launchAssets == launchAssets) &&
            (identical(other.splashAsset, splashAsset) ||
                other.splashAsset == splashAsset) &&
            (identical(other.texts, texts) || other.texts == texts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      applicationId,
      name,
      fontFamily,
      const DeepCollectionEquality().hash(_colorSchemeConfig),
      const DeepCollectionEquality().hash(_themeWidgetConfig),
      const DeepCollectionEquality().hash(_themePageConfig),
      const DeepCollectionEquality().hash(_appConfig),
      const DeepCollectionEquality().hash(_assets),
      launchAssets,
      splashAsset,
      texts);

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      __$$ThemeModelImplCopyWithImpl<_$ThemeModelImpl>(this, _$identity);
}

abstract class _ThemeModel extends ThemeModel {
  const factory _ThemeModel(
      {final String? id,
      final String? applicationId,
      final String? name,
      final String? fontFamily,
      final Map<String, dynamic> colorSchemeConfig,
      final Map<String, dynamic> themeWidgetConfig,
      final Map<String, dynamic> themePageConfig,
      final Map<String, dynamic> appConfig,
      final List<ThemeAssetModel> assets,
      final LaunchAssetsModel launchAssets,
      final SplashAssetModel splashAsset,
      final TextsModel? texts}) = _$ThemeModelImpl;
  const _ThemeModel._() : super._();

  @override
  String? get id;
  @override
  String? get applicationId;
  @override
  String? get name;
  @override
  String? get fontFamily;
  @override
  Map<String, dynamic> get colorSchemeConfig;
  @override
  Map<String, dynamic> get themeWidgetConfig;
  @override
  Map<String, dynamic> get themePageConfig;
  @override
  Map<String, dynamic> get appConfig;
  @override
  List<ThemeAssetModel> get assets;
  @override
  LaunchAssetsModel get launchAssets;
  @override
  SplashAssetModel get splashAsset;
  @override
  TextsModel? get texts;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
