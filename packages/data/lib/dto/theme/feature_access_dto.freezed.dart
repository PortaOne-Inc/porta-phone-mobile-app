// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_access_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureAccessDto _$FeatureAccessDtoFromJson(Map<String, dynamic> json) {
  return _FeatureAccessDto.fromJson(json);
}

/// @nodoc
mixin _$FeatureAccessDto {
  String get applicationId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  String? get themeId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FeatureAccessDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureAccessDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureAccessDtoCopyWith<FeatureAccessDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureAccessDtoCopyWith<$Res> {
  factory $FeatureAccessDtoCopyWith(
          FeatureAccessDto value, $Res Function(FeatureAccessDto) then) =
      _$FeatureAccessDtoCopyWithImpl<$Res, FeatureAccessDto>;
  @useResult
  $Res call(
      {String applicationId,
      String status,
      Map<String, dynamic> config,
      String? themeId,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$FeatureAccessDtoCopyWithImpl<$Res, $Val extends FeatureAccessDto>
    implements $FeatureAccessDtoCopyWith<$Res> {
  _$FeatureAccessDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureAccessDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? status = null,
    Object? config = null,
    Object? themeId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themeId: freezed == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FeatureAccessDtoImplCopyWith<$Res>
    implements $FeatureAccessDtoCopyWith<$Res> {
  factory _$$FeatureAccessDtoImplCopyWith(_$FeatureAccessDtoImpl value,
          $Res Function(_$FeatureAccessDtoImpl) then) =
      __$$FeatureAccessDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String status,
      Map<String, dynamic> config,
      String? themeId,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$FeatureAccessDtoImplCopyWithImpl<$Res>
    extends _$FeatureAccessDtoCopyWithImpl<$Res, _$FeatureAccessDtoImpl>
    implements _$$FeatureAccessDtoImplCopyWith<$Res> {
  __$$FeatureAccessDtoImplCopyWithImpl(_$FeatureAccessDtoImpl _value,
      $Res Function(_$FeatureAccessDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeatureAccessDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? status = null,
    Object? config = null,
    Object? themeId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FeatureAccessDtoImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themeId: freezed == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
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
class _$FeatureAccessDtoImpl implements _FeatureAccessDto {
  const _$FeatureAccessDtoImpl(
      {required this.applicationId,
      required this.status,
      required final Map<String, dynamic> config,
      this.themeId,
      this.createdAt,
      this.updatedAt})
      : _config = config;

  factory _$FeatureAccessDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureAccessDtoImplFromJson(json);

  @override
  final String applicationId;
  @override
  final String status;
  final Map<String, dynamic> _config;
  @override
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final String? themeId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'FeatureAccessDto(applicationId: $applicationId, status: $status, config: $config, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureAccessDtoImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      applicationId,
      status,
      const DeepCollectionEquality().hash(_config),
      themeId,
      createdAt,
      updatedAt);

  /// Create a copy of FeatureAccessDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureAccessDtoImplCopyWith<_$FeatureAccessDtoImpl> get copyWith =>
      __$$FeatureAccessDtoImplCopyWithImpl<_$FeatureAccessDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureAccessDtoImplToJson(
      this,
    );
  }
}

abstract class _FeatureAccessDto implements FeatureAccessDto {
  const factory _FeatureAccessDto(
      {required final String applicationId,
      required final String status,
      required final Map<String, dynamic> config,
      final String? themeId,
      final String? createdAt,
      final String? updatedAt}) = _$FeatureAccessDtoImpl;

  factory _FeatureAccessDto.fromJson(Map<String, dynamic> json) =
      _$FeatureAccessDtoImpl.fromJson;

  @override
  String get applicationId;
  @override
  String get status;
  @override
  Map<String, dynamic> get config;
  @override
  String? get themeId;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of FeatureAccessDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureAccessDtoImplCopyWith<_$FeatureAccessDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
