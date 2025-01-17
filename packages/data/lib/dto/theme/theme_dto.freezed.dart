// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThemeDTO _$ThemeDTOFromJson(Map<String, dynamic> json) {
  return _ThemeDTO.fromJson(json);
}

/// @nodoc
mixin _$ThemeDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  ColorSchemeConfig get colorSchemeConfig => throw _privateConstructorUsedError;
  ThemeWidgetConfig get themeWidgetConfig => throw _privateConstructorUsedError;
  ThemePageConfig get themePageConfig => throw _privateConstructorUsedError;
  AppConfig get appConfig => throw _privateConstructorUsedError;

  /// Serializes this ThemeDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeDTOCopyWith<ThemeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeDTOCopyWith<$Res> {
  factory $ThemeDTOCopyWith(ThemeDTO value, $Res Function(ThemeDTO) then) =
      _$ThemeDTOCopyWithImpl<$Res, ThemeDTO>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      ColorSchemeConfig colorSchemeConfig,
      ThemeWidgetConfig themeWidgetConfig,
      ThemePageConfig themePageConfig,
      AppConfig appConfig});

  $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig;
  $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig;
  $ThemePageConfigCopyWith<$Res> get themePageConfig;
  $AppConfigCopyWith<$Res> get appConfig;
}

/// @nodoc
class _$ThemeDTOCopyWithImpl<$Res, $Val extends ThemeDTO>
    implements $ThemeDTOCopyWith<$Res> {
  _$ThemeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
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
      colorSchemeConfig: null == colorSchemeConfig
          ? _value.colorSchemeConfig
          : colorSchemeConfig // ignore: cast_nullable_to_non_nullable
              as ColorSchemeConfig,
      themeWidgetConfig: null == themeWidgetConfig
          ? _value.themeWidgetConfig
          : themeWidgetConfig // ignore: cast_nullable_to_non_nullable
              as ThemeWidgetConfig,
      themePageConfig: null == themePageConfig
          ? _value.themePageConfig
          : themePageConfig // ignore: cast_nullable_to_non_nullable
              as ThemePageConfig,
      appConfig: null == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig,
    ) as $Val);
  }

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig {
    return $ColorSchemeConfigCopyWith<$Res>(_value.colorSchemeConfig, (value) {
      return _then(_value.copyWith(colorSchemeConfig: value) as $Val);
    });
  }

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig {
    return $ThemeWidgetConfigCopyWith<$Res>(_value.themeWidgetConfig, (value) {
      return _then(_value.copyWith(themeWidgetConfig: value) as $Val);
    });
  }

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemePageConfigCopyWith<$Res> get themePageConfig {
    return $ThemePageConfigCopyWith<$Res>(_value.themePageConfig, (value) {
      return _then(_value.copyWith(themePageConfig: value) as $Val);
    });
  }

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<$Res> get appConfig {
    return $AppConfigCopyWith<$Res>(_value.appConfig, (value) {
      return _then(_value.copyWith(appConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThemeDTOImplCopyWith<$Res>
    implements $ThemeDTOCopyWith<$Res> {
  factory _$$ThemeDTOImplCopyWith(
          _$ThemeDTOImpl value, $Res Function(_$ThemeDTOImpl) then) =
      __$$ThemeDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      ColorSchemeConfig colorSchemeConfig,
      ThemeWidgetConfig themeWidgetConfig,
      ThemePageConfig themePageConfig,
      AppConfig appConfig});

  @override
  $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig;
  @override
  $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig;
  @override
  $ThemePageConfigCopyWith<$Res> get themePageConfig;
  @override
  $AppConfigCopyWith<$Res> get appConfig;
}

/// @nodoc
class __$$ThemeDTOImplCopyWithImpl<$Res>
    extends _$ThemeDTOCopyWithImpl<$Res, _$ThemeDTOImpl>
    implements _$$ThemeDTOImplCopyWith<$Res> {
  __$$ThemeDTOImplCopyWithImpl(
      _$ThemeDTOImpl _value, $Res Function(_$ThemeDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
  }) {
    return _then(_$ThemeDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      colorSchemeConfig: null == colorSchemeConfig
          ? _value.colorSchemeConfig
          : colorSchemeConfig // ignore: cast_nullable_to_non_nullable
              as ColorSchemeConfig,
      themeWidgetConfig: null == themeWidgetConfig
          ? _value.themeWidgetConfig
          : themeWidgetConfig // ignore: cast_nullable_to_non_nullable
              as ThemeWidgetConfig,
      themePageConfig: null == themePageConfig
          ? _value.themePageConfig
          : themePageConfig // ignore: cast_nullable_to_non_nullable
              as ThemePageConfig,
      appConfig: null == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeDTOImpl extends _ThemeDTO {
  const _$ThemeDTOImpl(
      {this.id,
      this.name,
      this.colorSchemeConfig = const ColorSchemeConfig(),
      this.themeWidgetConfig = const ThemeWidgetConfig(),
      this.themePageConfig = const ThemePageConfig(),
      this.appConfig = const AppConfig()})
      : super._();

  factory _$ThemeDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeDTOImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey()
  final ColorSchemeConfig colorSchemeConfig;
  @override
  @JsonKey()
  final ThemeWidgetConfig themeWidgetConfig;
  @override
  @JsonKey()
  final ThemePageConfig themePageConfig;
  @override
  @JsonKey()
  final AppConfig appConfig;

  @override
  String toString() {
    return 'ThemeDTO(id: $id, name: $name, colorSchemeConfig: $colorSchemeConfig, themeWidgetConfig: $themeWidgetConfig, themePageConfig: $themePageConfig, appConfig: $appConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorSchemeConfig, colorSchemeConfig) ||
                other.colorSchemeConfig == colorSchemeConfig) &&
            (identical(other.themeWidgetConfig, themeWidgetConfig) ||
                other.themeWidgetConfig == themeWidgetConfig) &&
            (identical(other.themePageConfig, themePageConfig) ||
                other.themePageConfig == themePageConfig) &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorSchemeConfig,
      themeWidgetConfig, themePageConfig, appConfig);

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeDTOImplCopyWith<_$ThemeDTOImpl> get copyWith =>
      __$$ThemeDTOImplCopyWithImpl<_$ThemeDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeDTOImplToJson(
      this,
    );
  }
}

abstract class _ThemeDTO extends ThemeDTO {
  const factory _ThemeDTO(
      {final String? id,
      final String? name,
      final ColorSchemeConfig colorSchemeConfig,
      final ThemeWidgetConfig themeWidgetConfig,
      final ThemePageConfig themePageConfig,
      final AppConfig appConfig}) = _$ThemeDTOImpl;
  const _ThemeDTO._() : super._();

  factory _ThemeDTO.fromJson(Map<String, dynamic> json) =
      _$ThemeDTOImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  ColorSchemeConfig get colorSchemeConfig;
  @override
  ThemeWidgetConfig get themeWidgetConfig;
  @override
  ThemePageConfig get themePageConfig;
  @override
  AppConfig get appConfig;

  /// Create a copy of ThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeDTOImplCopyWith<_$ThemeDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
