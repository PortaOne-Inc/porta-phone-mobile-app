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
  String? get name => throw _privateConstructorUsedError;
  String? get fontFamily => throw _privateConstructorUsedError;
  Map<String, dynamic> get colorSchemeConfig =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get themeWidgetConfig =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get themePageConfig =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get appConfig => throw _privateConstructorUsedError;
  SystemAssetsModel get systemAssets => throw _privateConstructorUsedError;
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
      String? name,
      String? fontFamily,
      Map<String, dynamic> colorSchemeConfig,
      Map<String, dynamic> themeWidgetConfig,
      Map<String, dynamic> themePageConfig,
      Map<String, dynamic> appConfig,
      SystemAssetsModel systemAssets,
      TextsModel? texts});

  $SystemAssetsModelCopyWith<$Res> get systemAssets;
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
    Object? name = freezed,
    Object? fontFamily = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
    Object? systemAssets = null,
    Object? texts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      systemAssets: null == systemAssets
          ? _value.systemAssets
          : systemAssets // ignore: cast_nullable_to_non_nullable
              as SystemAssetsModel,
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
  $SystemAssetsModelCopyWith<$Res> get systemAssets {
    return $SystemAssetsModelCopyWith<$Res>(_value.systemAssets, (value) {
      return _then(_value.copyWith(systemAssets: value) as $Val);
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
      String? name,
      String? fontFamily,
      Map<String, dynamic> colorSchemeConfig,
      Map<String, dynamic> themeWidgetConfig,
      Map<String, dynamic> themePageConfig,
      Map<String, dynamic> appConfig,
      SystemAssetsModel systemAssets,
      TextsModel? texts});

  @override
  $SystemAssetsModelCopyWith<$Res> get systemAssets;
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
    Object? name = freezed,
    Object? fontFamily = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
    Object? systemAssets = null,
    Object? texts = freezed,
  }) {
    return _then(_$ThemeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      systemAssets: null == systemAssets
          ? _value.systemAssets
          : systemAssets // ignore: cast_nullable_to_non_nullable
              as SystemAssetsModel,
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
      this.name,
      this.fontFamily,
      final Map<String, dynamic> colorSchemeConfig = const {},
      final Map<String, dynamic> themeWidgetConfig = const {},
      final Map<String, dynamic> themePageConfig = const {},
      final Map<String, dynamic> appConfig = const {},
      this.systemAssets = const SystemAssetsModel(),
      this.texts})
      : _colorSchemeConfig = colorSchemeConfig,
        _themeWidgetConfig = themeWidgetConfig,
        _themePageConfig = themePageConfig,
        _appConfig = appConfig,
        super._();

  @override
  final String? id;
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

  @override
  @JsonKey()
  final SystemAssetsModel systemAssets;
  @override
  final TextsModel? texts;

  @override
  String toString() {
    return 'ThemeModel(id: $id, name: $name, fontFamily: $fontFamily, colorSchemeConfig: $colorSchemeConfig, themeWidgetConfig: $themeWidgetConfig, themePageConfig: $themePageConfig, appConfig: $appConfig, systemAssets: $systemAssets, texts: $texts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.systemAssets, systemAssets) ||
                other.systemAssets == systemAssets) &&
            (identical(other.texts, texts) || other.texts == texts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      fontFamily,
      const DeepCollectionEquality().hash(_colorSchemeConfig),
      const DeepCollectionEquality().hash(_themeWidgetConfig),
      const DeepCollectionEquality().hash(_themePageConfig),
      const DeepCollectionEquality().hash(_appConfig),
      systemAssets,
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
      final String? name,
      final String? fontFamily,
      final Map<String, dynamic> colorSchemeConfig,
      final Map<String, dynamic> themeWidgetConfig,
      final Map<String, dynamic> themePageConfig,
      final Map<String, dynamic> appConfig,
      final SystemAssetsModel systemAssets,
      final TextsModel? texts}) = _$ThemeModelImpl;
  const _ThemeModel._() : super._();

  @override
  String? get id;
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
  SystemAssetsModel get systemAssets;
  @override
  TextsModel? get texts;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
