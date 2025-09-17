// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageConfigDto _$PageConfigDtoFromJson(Map<String, dynamic> json) {
  return _PageConfigDto.fromJson(json);
}

/// @nodoc
mixin _$PageConfigDto {
  String get id => throw _privateConstructorUsedError; // themeId_variant
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  String get variant => throw _privateConstructorUsedError; // "light" | "dark"
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PageConfigDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageConfigDtoCopyWith<PageConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageConfigDtoCopyWith<$Res> {
  factory $PageConfigDtoCopyWith(
          PageConfigDto value, $Res Function(PageConfigDto) then) =
      _$PageConfigDtoCopyWithImpl<$Res, PageConfigDto>;
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      String variant,
      Map<String, dynamic> config,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$PageConfigDtoCopyWithImpl<$Res, $Val extends PageConfigDto>
    implements $PageConfigDtoCopyWith<$Res> {
  _$PageConfigDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? variant = null,
    Object? config = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$PageConfigDtoImplCopyWith<$Res>
    implements $PageConfigDtoCopyWith<$Res> {
  factory _$$PageConfigDtoImplCopyWith(
          _$PageConfigDtoImpl value, $Res Function(_$PageConfigDtoImpl) then) =
      __$$PageConfigDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      String variant,
      Map<String, dynamic> config,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$PageConfigDtoImplCopyWithImpl<$Res>
    extends _$PageConfigDtoCopyWithImpl<$Res, _$PageConfigDtoImpl>
    implements _$$PageConfigDtoImplCopyWith<$Res> {
  __$$PageConfigDtoImplCopyWithImpl(
      _$PageConfigDtoImpl _value, $Res Function(_$PageConfigDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? variant = null,
    Object? config = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PageConfigDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$PageConfigDtoImpl implements _PageConfigDto {
  const _$PageConfigDtoImpl(
      {required this.id,
      required this.applicationId,
      required this.themeId,
      required this.variant,
      required final Map<String, dynamic> config,
      this.createdAt,
      this.updatedAt})
      : _config = config;

  factory _$PageConfigDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageConfigDtoImplFromJson(json);

  @override
  final String id;
// themeId_variant
  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final String variant;
// "light" | "dark"
  final Map<String, dynamic> _config;
// "light" | "dark"
  @override
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'PageConfigDto(id: $id, applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageConfigDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      applicationId,
      themeId,
      variant,
      const DeepCollectionEquality().hash(_config),
      createdAt,
      updatedAt);

  /// Create a copy of PageConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageConfigDtoImplCopyWith<_$PageConfigDtoImpl> get copyWith =>
      __$$PageConfigDtoImplCopyWithImpl<_$PageConfigDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageConfigDtoImplToJson(
      this,
    );
  }
}

abstract class _PageConfigDto implements PageConfigDto {
  const factory _PageConfigDto(
      {required final String id,
      required final String applicationId,
      required final String themeId,
      required final String variant,
      required final Map<String, dynamic> config,
      final String? createdAt,
      final String? updatedAt}) = _$PageConfigDtoImpl;

  factory _PageConfigDto.fromJson(Map<String, dynamic> json) =
      _$PageConfigDtoImpl.fromJson;

  @override
  String get id; // themeId_variant
  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  String get variant; // "light" | "dark"
  @override
  Map<String, dynamic> get config;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of PageConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageConfigDtoImplCopyWith<_$PageConfigDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
