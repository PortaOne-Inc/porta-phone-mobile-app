// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deprecated_theme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeprecatedThemeDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  ColorSchemeConfig get colorSchemeConfig => throw _privateConstructorUsedError;
  ThemeWidgetConfig get themeWidgetConfig => throw _privateConstructorUsedError;
  ThemePageConfig get themePageConfig => throw _privateConstructorUsedError;
  AppConfig get appConfig => throw _privateConstructorUsedError;
  DeprecatedLaunchAssetsDto get launchAssets =>
      throw _privateConstructorUsedError;
  DeprecatedSplashAssetsDto get splashAssets =>
      throw _privateConstructorUsedError;
  List<DeprecatedThemeAssetDto> get assets =>
      throw _privateConstructorUsedError;

  /// Serializes this DeprecatedThemeDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeprecatedThemeDTOCopyWith<DeprecatedThemeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeprecatedThemeDTOCopyWith<$Res> {
  factory $DeprecatedThemeDTOCopyWith(
    DeprecatedThemeDTO value,
    $Res Function(DeprecatedThemeDTO) then,
  ) = _$DeprecatedThemeDTOCopyWithImpl<$Res, DeprecatedThemeDTO>;
  @useResult
  $Res call({
    String? id,
    String? applicationId,
    String? name,
    ColorSchemeConfig colorSchemeConfig,
    ThemeWidgetConfig themeWidgetConfig,
    ThemePageConfig themePageConfig,
    AppConfig appConfig,
    DeprecatedLaunchAssetsDto launchAssets,
    DeprecatedSplashAssetsDto splashAssets,
    List<DeprecatedThemeAssetDto> assets,
  });

  $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig;
  $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig;
  $ThemePageConfigCopyWith<$Res> get themePageConfig;
  $AppConfigCopyWith<$Res> get appConfig;
  $DeprecatedLaunchAssetsDtoCopyWith<$Res> get launchAssets;
  $DeprecatedSplashAssetsDtoCopyWith<$Res> get splashAssets;
}

/// @nodoc
class _$DeprecatedThemeDTOCopyWithImpl<$Res, $Val extends DeprecatedThemeDTO>
    implements $DeprecatedThemeDTOCopyWith<$Res> {
  _$DeprecatedThemeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? name = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
    Object? launchAssets = null,
    Object? splashAssets = null,
    Object? assets = null,
  }) {
    return _then(
      _value.copyWith(
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
            launchAssets: null == launchAssets
                ? _value.launchAssets
                : launchAssets // ignore: cast_nullable_to_non_nullable
                      as DeprecatedLaunchAssetsDto,
            splashAssets: null == splashAssets
                ? _value.splashAssets
                : splashAssets // ignore: cast_nullable_to_non_nullable
                      as DeprecatedSplashAssetsDto,
            assets: null == assets
                ? _value.assets
                : assets // ignore: cast_nullable_to_non_nullable
                      as List<DeprecatedThemeAssetDto>,
          )
          as $Val,
    );
  }

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig {
    return $ColorSchemeConfigCopyWith<$Res>(_value.colorSchemeConfig, (value) {
      return _then(_value.copyWith(colorSchemeConfig: value) as $Val);
    });
  }

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig {
    return $ThemeWidgetConfigCopyWith<$Res>(_value.themeWidgetConfig, (value) {
      return _then(_value.copyWith(themeWidgetConfig: value) as $Val);
    });
  }

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemePageConfigCopyWith<$Res> get themePageConfig {
    return $ThemePageConfigCopyWith<$Res>(_value.themePageConfig, (value) {
      return _then(_value.copyWith(themePageConfig: value) as $Val);
    });
  }

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<$Res> get appConfig {
    return $AppConfigCopyWith<$Res>(_value.appConfig, (value) {
      return _then(_value.copyWith(appConfig: value) as $Val);
    });
  }

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeprecatedLaunchAssetsDtoCopyWith<$Res> get launchAssets {
    return $DeprecatedLaunchAssetsDtoCopyWith<$Res>(_value.launchAssets, (
      value,
    ) {
      return _then(_value.copyWith(launchAssets: value) as $Val);
    });
  }

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeprecatedSplashAssetsDtoCopyWith<$Res> get splashAssets {
    return $DeprecatedSplashAssetsDtoCopyWith<$Res>(_value.splashAssets, (
      value,
    ) {
      return _then(_value.copyWith(splashAssets: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeprecatedThemeDTOImplCopyWith<$Res>
    implements $DeprecatedThemeDTOCopyWith<$Res> {
  factory _$$DeprecatedThemeDTOImplCopyWith(
    _$DeprecatedThemeDTOImpl value,
    $Res Function(_$DeprecatedThemeDTOImpl) then,
  ) = __$$DeprecatedThemeDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? applicationId,
    String? name,
    ColorSchemeConfig colorSchemeConfig,
    ThemeWidgetConfig themeWidgetConfig,
    ThemePageConfig themePageConfig,
    AppConfig appConfig,
    DeprecatedLaunchAssetsDto launchAssets,
    DeprecatedSplashAssetsDto splashAssets,
    List<DeprecatedThemeAssetDto> assets,
  });

  @override
  $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig;
  @override
  $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig;
  @override
  $ThemePageConfigCopyWith<$Res> get themePageConfig;
  @override
  $AppConfigCopyWith<$Res> get appConfig;
  @override
  $DeprecatedLaunchAssetsDtoCopyWith<$Res> get launchAssets;
  @override
  $DeprecatedSplashAssetsDtoCopyWith<$Res> get splashAssets;
}

/// @nodoc
class __$$DeprecatedThemeDTOImplCopyWithImpl<$Res>
    extends _$DeprecatedThemeDTOCopyWithImpl<$Res, _$DeprecatedThemeDTOImpl>
    implements _$$DeprecatedThemeDTOImplCopyWith<$Res> {
  __$$DeprecatedThemeDTOImplCopyWithImpl(
    _$DeprecatedThemeDTOImpl _value,
    $Res Function(_$DeprecatedThemeDTOImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? name = freezed,
    Object? colorSchemeConfig = null,
    Object? themeWidgetConfig = null,
    Object? themePageConfig = null,
    Object? appConfig = null,
    Object? launchAssets = null,
    Object? splashAssets = null,
    Object? assets = null,
  }) {
    return _then(
      _$DeprecatedThemeDTOImpl(
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
        launchAssets: null == launchAssets
            ? _value.launchAssets
            : launchAssets // ignore: cast_nullable_to_non_nullable
                  as DeprecatedLaunchAssetsDto,
        splashAssets: null == splashAssets
            ? _value.splashAssets
            : splashAssets // ignore: cast_nullable_to_non_nullable
                  as DeprecatedSplashAssetsDto,
        assets: null == assets
            ? _value.assets
            : assets // ignore: cast_nullable_to_non_nullable
                  as List<DeprecatedThemeAssetDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeprecatedThemeDTOImpl extends _DeprecatedThemeDTO {
  const _$DeprecatedThemeDTOImpl({
    this.id,
    this.applicationId,
    this.name,
    this.colorSchemeConfig = const ColorSchemeConfig(),
    this.themeWidgetConfig = const ThemeWidgetConfig(),
    this.themePageConfig = const ThemePageConfig(),
    this.appConfig = const AppConfig(),
    this.launchAssets = const DeprecatedLaunchAssetsDto(),
    this.splashAssets = const DeprecatedSplashAssetsDto(),
    this.assets = const [],
  }) : super._();

  @override
  final String? id;
  @override
  final String? applicationId;
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
  @JsonKey()
  final DeprecatedLaunchAssetsDto launchAssets;
  @override
  @JsonKey()
  final DeprecatedSplashAssetsDto splashAssets;
  @override
  @JsonKey()
  final List<DeprecatedThemeAssetDto> assets;

  @override
  String toString() {
    return 'DeprecatedThemeDTO(id: $id, applicationId: $applicationId, name: $name, colorSchemeConfig: $colorSchemeConfig, themeWidgetConfig: $themeWidgetConfig, themePageConfig: $themePageConfig, appConfig: $appConfig, launchAssets: $launchAssets, splashAssets: $splashAssets, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeprecatedThemeDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorSchemeConfig, colorSchemeConfig) ||
                other.colorSchemeConfig == colorSchemeConfig) &&
            (identical(other.themeWidgetConfig, themeWidgetConfig) ||
                other.themeWidgetConfig == themeWidgetConfig) &&
            (identical(other.themePageConfig, themePageConfig) ||
                other.themePageConfig == themePageConfig) &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig) &&
            (identical(other.launchAssets, launchAssets) ||
                other.launchAssets == launchAssets) &&
            (identical(other.splashAssets, splashAssets) ||
                other.splashAssets == splashAssets) &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    applicationId,
    name,
    colorSchemeConfig,
    themeWidgetConfig,
    themePageConfig,
    appConfig,
    launchAssets,
    splashAssets,
    const DeepCollectionEquality().hash(assets),
  );

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeprecatedThemeDTOImplCopyWith<_$DeprecatedThemeDTOImpl> get copyWith =>
      __$$DeprecatedThemeDTOImplCopyWithImpl<_$DeprecatedThemeDTOImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeprecatedThemeDTOImplToJson(this);
  }
}

abstract class _DeprecatedThemeDTO extends DeprecatedThemeDTO {
  const factory _DeprecatedThemeDTO({
    final String? id,
    final String? applicationId,
    final String? name,
    final ColorSchemeConfig colorSchemeConfig,
    final ThemeWidgetConfig themeWidgetConfig,
    final ThemePageConfig themePageConfig,
    final AppConfig appConfig,
    final DeprecatedLaunchAssetsDto launchAssets,
    final DeprecatedSplashAssetsDto splashAssets,
    final List<DeprecatedThemeAssetDto> assets,
  }) = _$DeprecatedThemeDTOImpl;
  const _DeprecatedThemeDTO._() : super._();

  @override
  String? get id;
  @override
  String? get applicationId;
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
  @override
  DeprecatedLaunchAssetsDto get launchAssets;
  @override
  DeprecatedSplashAssetsDto get splashAssets;
  @override
  List<DeprecatedThemeAssetDto> get assets;

  /// Create a copy of DeprecatedThemeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeprecatedThemeDTOImplCopyWith<_$DeprecatedThemeDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeprecatedThemeAssetDto _$DeprecatedThemeAssetDtoFromJson(
  Map<String, dynamic> json,
) {
  return _DeprecatedThemeAssetDto.fromJson(json);
}

/// @nodoc
mixin _$DeprecatedThemeAssetDto {
  @IntToStringConverter()
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this DeprecatedThemeAssetDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeprecatedThemeAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeprecatedThemeAssetDtoCopyWith<DeprecatedThemeAssetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeprecatedThemeAssetDtoCopyWith<$Res> {
  factory $DeprecatedThemeAssetDtoCopyWith(
    DeprecatedThemeAssetDto value,
    $Res Function(DeprecatedThemeAssetDto) then,
  ) = _$DeprecatedThemeAssetDtoCopyWithImpl<$Res, DeprecatedThemeAssetDto>;
  @useResult
  $Res call({
    @IntToStringConverter() String id,
    String name,
    String description,
    String? url,
    String? type,
  });
}

/// @nodoc
class _$DeprecatedThemeAssetDtoCopyWithImpl<
  $Res,
  $Val extends DeprecatedThemeAssetDto
>
    implements $DeprecatedThemeAssetDtoCopyWith<$Res> {
  _$DeprecatedThemeAssetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeprecatedThemeAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeprecatedThemeAssetDtoImplCopyWith<$Res>
    implements $DeprecatedThemeAssetDtoCopyWith<$Res> {
  factory _$$DeprecatedThemeAssetDtoImplCopyWith(
    _$DeprecatedThemeAssetDtoImpl value,
    $Res Function(_$DeprecatedThemeAssetDtoImpl) then,
  ) = __$$DeprecatedThemeAssetDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @IntToStringConverter() String id,
    String name,
    String description,
    String? url,
    String? type,
  });
}

/// @nodoc
class __$$DeprecatedThemeAssetDtoImplCopyWithImpl<$Res>
    extends
        _$DeprecatedThemeAssetDtoCopyWithImpl<
          $Res,
          _$DeprecatedThemeAssetDtoImpl
        >
    implements _$$DeprecatedThemeAssetDtoImplCopyWith<$Res> {
  __$$DeprecatedThemeAssetDtoImplCopyWithImpl(
    _$DeprecatedThemeAssetDtoImpl _value,
    $Res Function(_$DeprecatedThemeAssetDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeprecatedThemeAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$DeprecatedThemeAssetDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeprecatedThemeAssetDtoImpl implements _DeprecatedThemeAssetDto {
  const _$DeprecatedThemeAssetDtoImpl({
    @IntToStringConverter() required this.id,
    required this.name,
    this.description = '',
    this.url,
    this.type,
  });

  factory _$DeprecatedThemeAssetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeprecatedThemeAssetDtoImplFromJson(json);

  @override
  @IntToStringConverter()
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final String? url;
  @override
  final String? type;

  @override
  String toString() {
    return 'DeprecatedThemeAssetDto(id: $id, name: $name, description: $description, url: $url, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeprecatedThemeAssetDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, url, type);

  /// Create a copy of DeprecatedThemeAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeprecatedThemeAssetDtoImplCopyWith<_$DeprecatedThemeAssetDtoImpl>
  get copyWith =>
      __$$DeprecatedThemeAssetDtoImplCopyWithImpl<
        _$DeprecatedThemeAssetDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeprecatedThemeAssetDtoImplToJson(this);
  }
}

abstract class _DeprecatedThemeAssetDto implements DeprecatedThemeAssetDto {
  const factory _DeprecatedThemeAssetDto({
    @IntToStringConverter() required final String id,
    required final String name,
    final String description,
    final String? url,
    final String? type,
  }) = _$DeprecatedThemeAssetDtoImpl;

  factory _DeprecatedThemeAssetDto.fromJson(Map<String, dynamic> json) =
      _$DeprecatedThemeAssetDtoImpl.fromJson;

  @override
  @IntToStringConverter()
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get url;
  @override
  String? get type;

  /// Create a copy of DeprecatedThemeAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeprecatedThemeAssetDtoImplCopyWith<_$DeprecatedThemeAssetDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DeprecatedSplashAssetsDto _$DeprecatedSplashAssetsDtoFromJson(
  Map<String, dynamic> json,
) {
  return _SplashAssetsDto.fromJson(json);
}

/// @nodoc
mixin _$DeprecatedSplashAssetsDto {
  int? get originalAssetId => throw _privateConstructorUsedError;
  String? get pictureUrl => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  String get fit => throw _privateConstructorUsedError;

  /// Serializes this DeprecatedSplashAssetsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeprecatedSplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeprecatedSplashAssetsDtoCopyWith<DeprecatedSplashAssetsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeprecatedSplashAssetsDtoCopyWith<$Res> {
  factory $DeprecatedSplashAssetsDtoCopyWith(
    DeprecatedSplashAssetsDto value,
    $Res Function(DeprecatedSplashAssetsDto) then,
  ) = _$DeprecatedSplashAssetsDtoCopyWithImpl<$Res, DeprecatedSplashAssetsDto>;
  @useResult
  $Res call({
    int? originalAssetId,
    String? pictureUrl,
    String? color,
    double padding,
    String fit,
  });
}

/// @nodoc
class _$DeprecatedSplashAssetsDtoCopyWithImpl<
  $Res,
  $Val extends DeprecatedSplashAssetsDto
>
    implements $DeprecatedSplashAssetsDtoCopyWith<$Res> {
  _$DeprecatedSplashAssetsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeprecatedSplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAssetId = freezed,
    Object? pictureUrl = freezed,
    Object? color = freezed,
    Object? padding = null,
    Object? fit = null,
  }) {
    return _then(
      _value.copyWith(
            originalAssetId: freezed == originalAssetId
                ? _value.originalAssetId
                : originalAssetId // ignore: cast_nullable_to_non_nullable
                      as int?,
            pictureUrl: freezed == pictureUrl
                ? _value.pictureUrl
                : pictureUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
            padding: null == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                      as double,
            fit: null == fit
                ? _value.fit
                : fit // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SplashAssetsDtoImplCopyWith<$Res>
    implements $DeprecatedSplashAssetsDtoCopyWith<$Res> {
  factory _$$SplashAssetsDtoImplCopyWith(
    _$SplashAssetsDtoImpl value,
    $Res Function(_$SplashAssetsDtoImpl) then,
  ) = __$$SplashAssetsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? originalAssetId,
    String? pictureUrl,
    String? color,
    double padding,
    String fit,
  });
}

/// @nodoc
class __$$SplashAssetsDtoImplCopyWithImpl<$Res>
    extends _$DeprecatedSplashAssetsDtoCopyWithImpl<$Res, _$SplashAssetsDtoImpl>
    implements _$$SplashAssetsDtoImplCopyWith<$Res> {
  __$$SplashAssetsDtoImplCopyWithImpl(
    _$SplashAssetsDtoImpl _value,
    $Res Function(_$SplashAssetsDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeprecatedSplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAssetId = freezed,
    Object? pictureUrl = freezed,
    Object? color = freezed,
    Object? padding = null,
    Object? fit = null,
  }) {
    return _then(
      _$SplashAssetsDtoImpl(
        originalAssetId: freezed == originalAssetId
            ? _value.originalAssetId
            : originalAssetId // ignore: cast_nullable_to_non_nullable
                  as int?,
        pictureUrl: freezed == pictureUrl
            ? _value.pictureUrl
            : pictureUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
        padding: null == padding
            ? _value.padding
            : padding // ignore: cast_nullable_to_non_nullable
                  as double,
        fit: null == fit
            ? _value.fit
            : fit // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SplashAssetsDtoImpl implements _SplashAssetsDto {
  const _$SplashAssetsDtoImpl({
    this.originalAssetId,
    this.pictureUrl,
    this.color,
    this.padding = 0.0,
    this.fit = 'scaleDown',
  });

  factory _$SplashAssetsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashAssetsDtoImplFromJson(json);

  @override
  final int? originalAssetId;
  @override
  final String? pictureUrl;
  @override
  final String? color;
  @override
  @JsonKey()
  final double padding;
  @override
  @JsonKey()
  final String fit;

  @override
  String toString() {
    return 'DeprecatedSplashAssetsDto(originalAssetId: $originalAssetId, pictureUrl: $pictureUrl, color: $color, padding: $padding, fit: $fit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetsDtoImpl &&
            (identical(other.originalAssetId, originalAssetId) ||
                other.originalAssetId == originalAssetId) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.fit, fit) || other.fit == fit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    originalAssetId,
    pictureUrl,
    color,
    padding,
    fit,
  );

  /// Create a copy of DeprecatedSplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetsDtoImplCopyWith<_$SplashAssetsDtoImpl> get copyWith =>
      __$$SplashAssetsDtoImplCopyWithImpl<_$SplashAssetsDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashAssetsDtoImplToJson(this);
  }
}

abstract class _SplashAssetsDto implements DeprecatedSplashAssetsDto {
  const factory _SplashAssetsDto({
    final int? originalAssetId,
    final String? pictureUrl,
    final String? color,
    final double padding,
    final String fit,
  }) = _$SplashAssetsDtoImpl;

  factory _SplashAssetsDto.fromJson(Map<String, dynamic> json) =
      _$SplashAssetsDtoImpl.fromJson;

  @override
  int? get originalAssetId;
  @override
  String? get pictureUrl;
  @override
  String? get color;
  @override
  double get padding;
  @override
  String get fit;

  /// Create a copy of DeprecatedSplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetsDtoImplCopyWith<_$SplashAssetsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeprecatedLaunchAssetsDto _$DeprecatedLaunchAssetsDtoFromJson(
  Map<String, dynamic> json,
) {
  return _DeprecatedLaunchAssetsDto.fromJson(json);
}

/// @nodoc
mixin _$DeprecatedLaunchAssetsDto {
  // Linking to the original asset
  int? get originalAssetId =>
      throw _privateConstructorUsedError; // System generated assets
  String? get notificationLogoUrl =>
      throw _privateConstructorUsedError; // Generated images
  String? get adaptiveIconForegroundUrl => throw _privateConstructorUsedError;
  String? get androidLauncherIconUrl => throw _privateConstructorUsedError;
  String? get iosLauncherIconUrl => throw _privateConstructorUsedError;
  String? get webLauncherIconUrl =>
      throw _privateConstructorUsedError; // Generated background images
  String? get adaptiveIconBackgroundUrl =>
      throw _privateConstructorUsedError; // Background color
  String? get backgroundColor => throw _privateConstructorUsedError;

  /// Serializes this DeprecatedLaunchAssetsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeprecatedLaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeprecatedLaunchAssetsDtoCopyWith<DeprecatedLaunchAssetsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeprecatedLaunchAssetsDtoCopyWith<$Res> {
  factory $DeprecatedLaunchAssetsDtoCopyWith(
    DeprecatedLaunchAssetsDto value,
    $Res Function(DeprecatedLaunchAssetsDto) then,
  ) = _$DeprecatedLaunchAssetsDtoCopyWithImpl<$Res, DeprecatedLaunchAssetsDto>;
  @useResult
  $Res call({
    int? originalAssetId,
    String? notificationLogoUrl,
    String? adaptiveIconForegroundUrl,
    String? androidLauncherIconUrl,
    String? iosLauncherIconUrl,
    String? webLauncherIconUrl,
    String? adaptiveIconBackgroundUrl,
    String? backgroundColor,
  });
}

/// @nodoc
class _$DeprecatedLaunchAssetsDtoCopyWithImpl<
  $Res,
  $Val extends DeprecatedLaunchAssetsDto
>
    implements $DeprecatedLaunchAssetsDtoCopyWith<$Res> {
  _$DeprecatedLaunchAssetsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeprecatedLaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAssetId = freezed,
    Object? notificationLogoUrl = freezed,
    Object? adaptiveIconForegroundUrl = freezed,
    Object? androidLauncherIconUrl = freezed,
    Object? iosLauncherIconUrl = freezed,
    Object? webLauncherIconUrl = freezed,
    Object? adaptiveIconBackgroundUrl = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            originalAssetId: freezed == originalAssetId
                ? _value.originalAssetId
                : originalAssetId // ignore: cast_nullable_to_non_nullable
                      as int?,
            notificationLogoUrl: freezed == notificationLogoUrl
                ? _value.notificationLogoUrl
                : notificationLogoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            adaptiveIconForegroundUrl: freezed == adaptiveIconForegroundUrl
                ? _value.adaptiveIconForegroundUrl
                : adaptiveIconForegroundUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            androidLauncherIconUrl: freezed == androidLauncherIconUrl
                ? _value.androidLauncherIconUrl
                : androidLauncherIconUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            iosLauncherIconUrl: freezed == iosLauncherIconUrl
                ? _value.iosLauncherIconUrl
                : iosLauncherIconUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            webLauncherIconUrl: freezed == webLauncherIconUrl
                ? _value.webLauncherIconUrl
                : webLauncherIconUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            adaptiveIconBackgroundUrl: freezed == adaptiveIconBackgroundUrl
                ? _value.adaptiveIconBackgroundUrl
                : adaptiveIconBackgroundUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeprecatedLaunchAssetsDtoImplCopyWith<$Res>
    implements $DeprecatedLaunchAssetsDtoCopyWith<$Res> {
  factory _$$DeprecatedLaunchAssetsDtoImplCopyWith(
    _$DeprecatedLaunchAssetsDtoImpl value,
    $Res Function(_$DeprecatedLaunchAssetsDtoImpl) then,
  ) = __$$DeprecatedLaunchAssetsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? originalAssetId,
    String? notificationLogoUrl,
    String? adaptiveIconForegroundUrl,
    String? androidLauncherIconUrl,
    String? iosLauncherIconUrl,
    String? webLauncherIconUrl,
    String? adaptiveIconBackgroundUrl,
    String? backgroundColor,
  });
}

/// @nodoc
class __$$DeprecatedLaunchAssetsDtoImplCopyWithImpl<$Res>
    extends
        _$DeprecatedLaunchAssetsDtoCopyWithImpl<
          $Res,
          _$DeprecatedLaunchAssetsDtoImpl
        >
    implements _$$DeprecatedLaunchAssetsDtoImplCopyWith<$Res> {
  __$$DeprecatedLaunchAssetsDtoImplCopyWithImpl(
    _$DeprecatedLaunchAssetsDtoImpl _value,
    $Res Function(_$DeprecatedLaunchAssetsDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeprecatedLaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAssetId = freezed,
    Object? notificationLogoUrl = freezed,
    Object? adaptiveIconForegroundUrl = freezed,
    Object? androidLauncherIconUrl = freezed,
    Object? iosLauncherIconUrl = freezed,
    Object? webLauncherIconUrl = freezed,
    Object? adaptiveIconBackgroundUrl = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(
      _$DeprecatedLaunchAssetsDtoImpl(
        originalAssetId: freezed == originalAssetId
            ? _value.originalAssetId
            : originalAssetId // ignore: cast_nullable_to_non_nullable
                  as int?,
        notificationLogoUrl: freezed == notificationLogoUrl
            ? _value.notificationLogoUrl
            : notificationLogoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        adaptiveIconForegroundUrl: freezed == adaptiveIconForegroundUrl
            ? _value.adaptiveIconForegroundUrl
            : adaptiveIconForegroundUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        androidLauncherIconUrl: freezed == androidLauncherIconUrl
            ? _value.androidLauncherIconUrl
            : androidLauncherIconUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        iosLauncherIconUrl: freezed == iosLauncherIconUrl
            ? _value.iosLauncherIconUrl
            : iosLauncherIconUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        webLauncherIconUrl: freezed == webLauncherIconUrl
            ? _value.webLauncherIconUrl
            : webLauncherIconUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        adaptiveIconBackgroundUrl: freezed == adaptiveIconBackgroundUrl
            ? _value.adaptiveIconBackgroundUrl
            : adaptiveIconBackgroundUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DeprecatedLaunchAssetsDtoImpl implements _DeprecatedLaunchAssetsDto {
  const _$DeprecatedLaunchAssetsDtoImpl({
    this.originalAssetId,
    this.notificationLogoUrl,
    this.adaptiveIconForegroundUrl,
    this.androidLauncherIconUrl,
    this.iosLauncherIconUrl,
    this.webLauncherIconUrl,
    this.adaptiveIconBackgroundUrl,
    this.backgroundColor,
  });

  factory _$DeprecatedLaunchAssetsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeprecatedLaunchAssetsDtoImplFromJson(json);

  // Linking to the original asset
  @override
  final int? originalAssetId;
  // System generated assets
  @override
  final String? notificationLogoUrl;
  // Generated images
  @override
  final String? adaptiveIconForegroundUrl;
  @override
  final String? androidLauncherIconUrl;
  @override
  final String? iosLauncherIconUrl;
  @override
  final String? webLauncherIconUrl;
  // Generated background images
  @override
  final String? adaptiveIconBackgroundUrl;
  // Background color
  @override
  final String? backgroundColor;

  @override
  String toString() {
    return 'DeprecatedLaunchAssetsDto(originalAssetId: $originalAssetId, notificationLogoUrl: $notificationLogoUrl, adaptiveIconForegroundUrl: $adaptiveIconForegroundUrl, androidLauncherIconUrl: $androidLauncherIconUrl, iosLauncherIconUrl: $iosLauncherIconUrl, webLauncherIconUrl: $webLauncherIconUrl, adaptiveIconBackgroundUrl: $adaptiveIconBackgroundUrl, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeprecatedLaunchAssetsDtoImpl &&
            (identical(other.originalAssetId, originalAssetId) ||
                other.originalAssetId == originalAssetId) &&
            (identical(other.notificationLogoUrl, notificationLogoUrl) ||
                other.notificationLogoUrl == notificationLogoUrl) &&
            (identical(
                  other.adaptiveIconForegroundUrl,
                  adaptiveIconForegroundUrl,
                ) ||
                other.adaptiveIconForegroundUrl == adaptiveIconForegroundUrl) &&
            (identical(other.androidLauncherIconUrl, androidLauncherIconUrl) ||
                other.androidLauncherIconUrl == androidLauncherIconUrl) &&
            (identical(other.iosLauncherIconUrl, iosLauncherIconUrl) ||
                other.iosLauncherIconUrl == iosLauncherIconUrl) &&
            (identical(other.webLauncherIconUrl, webLauncherIconUrl) ||
                other.webLauncherIconUrl == webLauncherIconUrl) &&
            (identical(
                  other.adaptiveIconBackgroundUrl,
                  adaptiveIconBackgroundUrl,
                ) ||
                other.adaptiveIconBackgroundUrl == adaptiveIconBackgroundUrl) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    originalAssetId,
    notificationLogoUrl,
    adaptiveIconForegroundUrl,
    androidLauncherIconUrl,
    iosLauncherIconUrl,
    webLauncherIconUrl,
    adaptiveIconBackgroundUrl,
    backgroundColor,
  );

  /// Create a copy of DeprecatedLaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeprecatedLaunchAssetsDtoImplCopyWith<_$DeprecatedLaunchAssetsDtoImpl>
  get copyWith =>
      __$$DeprecatedLaunchAssetsDtoImplCopyWithImpl<
        _$DeprecatedLaunchAssetsDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeprecatedLaunchAssetsDtoImplToJson(this);
  }
}

abstract class _DeprecatedLaunchAssetsDto implements DeprecatedLaunchAssetsDto {
  const factory _DeprecatedLaunchAssetsDto({
    final int? originalAssetId,
    final String? notificationLogoUrl,
    final String? adaptiveIconForegroundUrl,
    final String? androidLauncherIconUrl,
    final String? iosLauncherIconUrl,
    final String? webLauncherIconUrl,
    final String? adaptiveIconBackgroundUrl,
    final String? backgroundColor,
  }) = _$DeprecatedLaunchAssetsDtoImpl;

  factory _DeprecatedLaunchAssetsDto.fromJson(Map<String, dynamic> json) =
      _$DeprecatedLaunchAssetsDtoImpl.fromJson;

  // Linking to the original asset
  @override
  int? get originalAssetId; // System generated assets
  @override
  String? get notificationLogoUrl; // Generated images
  @override
  String? get adaptiveIconForegroundUrl;
  @override
  String? get androidLauncherIconUrl;
  @override
  String? get iosLauncherIconUrl;
  @override
  String? get webLauncherIconUrl; // Generated background images
  @override
  String? get adaptiveIconBackgroundUrl; // Background color
  @override
  String? get backgroundColor;

  /// Create a copy of DeprecatedLaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeprecatedLaunchAssetsDtoImplCopyWith<_$DeprecatedLaunchAssetsDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
