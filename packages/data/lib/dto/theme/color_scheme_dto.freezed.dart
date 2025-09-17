// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_scheme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ColorSchemeDto _$ColorSchemeDtoFromJson(Map<String, dynamic> json) {
  return _ColorSchemeDto.fromJson(json);
}

/// @nodoc
mixin _$ColorSchemeDto {
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  String get variant => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ColorSchemeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorSchemeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorSchemeDtoCopyWith<ColorSchemeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorSchemeDtoCopyWith<$Res> {
  factory $ColorSchemeDtoCopyWith(
          ColorSchemeDto value, $Res Function(ColorSchemeDto) then) =
      _$ColorSchemeDtoCopyWithImpl<$Res, ColorSchemeDto>;
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      String variant,
      Map<String, dynamic> config,
      String? id,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$ColorSchemeDtoCopyWithImpl<$Res, $Val extends ColorSchemeDto>
    implements $ColorSchemeDtoCopyWith<$Res> {
  _$ColorSchemeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorSchemeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? variant = null,
    Object? config = null,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorSchemeDtoImplCopyWith<$Res>
    implements $ColorSchemeDtoCopyWith<$Res> {
  factory _$$ColorSchemeDtoImplCopyWith(_$ColorSchemeDtoImpl value,
          $Res Function(_$ColorSchemeDtoImpl) then) =
      __$$ColorSchemeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      String variant,
      Map<String, dynamic> config,
      String? id,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$ColorSchemeDtoImplCopyWithImpl<$Res>
    extends _$ColorSchemeDtoCopyWithImpl<$Res, _$ColorSchemeDtoImpl>
    implements _$$ColorSchemeDtoImplCopyWith<$Res> {
  __$$ColorSchemeDtoImplCopyWithImpl(
      _$ColorSchemeDtoImpl _value, $Res Function(_$ColorSchemeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorSchemeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? variant = null,
    Object? config = null,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ColorSchemeDtoImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorSchemeDtoImpl implements _ColorSchemeDto {
  const _$ColorSchemeDtoImpl(
      {required this.applicationId,
      required this.themeId,
      required this.variant,
      required final Map<String, dynamic> config,
      this.id,
      this.createdAt,
      this.updatedAt})
      : _config = config;

  factory _$ColorSchemeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorSchemeDtoImplFromJson(json);

  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final String variant;
  final Map<String, dynamic> _config;
  @override
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'ColorSchemeDto(applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorSchemeDtoImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, applicationId, themeId, variant,
      const DeepCollectionEquality().hash(_config), id, createdAt, updatedAt);

  /// Create a copy of ColorSchemeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorSchemeDtoImplCopyWith<_$ColorSchemeDtoImpl> get copyWith =>
      __$$ColorSchemeDtoImplCopyWithImpl<_$ColorSchemeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorSchemeDtoImplToJson(
      this,
    );
  }
}

abstract class _ColorSchemeDto implements ColorSchemeDto {
  const factory _ColorSchemeDto(
      {required final String applicationId,
      required final String themeId,
      required final String variant,
      required final Map<String, dynamic> config,
      final String? id,
      final String? createdAt,
      final String? updatedAt}) = _$ColorSchemeDtoImpl;

  factory _ColorSchemeDto.fromJson(Map<String, dynamic> json) =
      _$ColorSchemeDtoImpl.fromJson;

  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  String get variant;
  @override
  Map<String, dynamic> get config;
  @override
  String? get id;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of ColorSchemeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorSchemeDtoImplCopyWith<_$ColorSchemeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
