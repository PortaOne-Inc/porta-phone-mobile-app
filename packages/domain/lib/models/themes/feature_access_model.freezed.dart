// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureAccessModel _$FeatureAccessModelFromJson(Map<String, dynamic> json) {
  return _FeatureAccessModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureAccessModel {
  String get applicationId => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  String? get themeId => throw _privateConstructorUsedError;
  FeatureAccessStatus get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FeatureAccessModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureAccessModelCopyWith<FeatureAccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureAccessModelCopyWith<$Res> {
  factory $FeatureAccessModelCopyWith(
          FeatureAccessModel value, $Res Function(FeatureAccessModel) then) =
      _$FeatureAccessModelCopyWithImpl<$Res, FeatureAccessModel>;
  @useResult
  $Res call(
      {String applicationId,
      Map<String, dynamic> config,
      String? themeId,
      FeatureAccessStatus status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$FeatureAccessModelCopyWithImpl<$Res, $Val extends FeatureAccessModel>
    implements $FeatureAccessModelCopyWith<$Res> {
  _$FeatureAccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? config = null,
    Object? themeId = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themeId: freezed == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureAccessStatus,
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
abstract class _$$FeatureAccessModelImplCopyWith<$Res>
    implements $FeatureAccessModelCopyWith<$Res> {
  factory _$$FeatureAccessModelImplCopyWith(_$FeatureAccessModelImpl value,
          $Res Function(_$FeatureAccessModelImpl) then) =
      __$$FeatureAccessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      Map<String, dynamic> config,
      String? themeId,
      FeatureAccessStatus status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$FeatureAccessModelImplCopyWithImpl<$Res>
    extends _$FeatureAccessModelCopyWithImpl<$Res, _$FeatureAccessModelImpl>
    implements _$$FeatureAccessModelImplCopyWith<$Res> {
  __$$FeatureAccessModelImplCopyWithImpl(_$FeatureAccessModelImpl _value,
      $Res Function(_$FeatureAccessModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeatureAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? config = null,
    Object? themeId = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FeatureAccessModelImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      themeId: freezed == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureAccessStatus,
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
class _$FeatureAccessModelImpl implements _FeatureAccessModel {
  const _$FeatureAccessModelImpl(
      {required this.applicationId,
      required final Map<String, dynamic> config,
      this.themeId,
      this.status = FeatureAccessStatus.draft,
      this.createdAt,
      this.updatedAt})
      : _config = config;

  factory _$FeatureAccessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureAccessModelImplFromJson(json);

  @override
  final String applicationId;
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
  @JsonKey()
  final FeatureAccessStatus status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'FeatureAccessModel(applicationId: $applicationId, config: $config, themeId: $themeId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureAccessModelImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.status, status) || other.status == status) &&
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
      const DeepCollectionEquality().hash(_config),
      themeId,
      status,
      createdAt,
      updatedAt);

  /// Create a copy of FeatureAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureAccessModelImplCopyWith<_$FeatureAccessModelImpl> get copyWith =>
      __$$FeatureAccessModelImplCopyWithImpl<_$FeatureAccessModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureAccessModelImplToJson(
      this,
    );
  }
}

abstract class _FeatureAccessModel implements FeatureAccessModel {
  const factory _FeatureAccessModel(
      {required final String applicationId,
      required final Map<String, dynamic> config,
      final String? themeId,
      final FeatureAccessStatus status,
      final String? createdAt,
      final String? updatedAt}) = _$FeatureAccessModelImpl;

  factory _FeatureAccessModel.fromJson(Map<String, dynamic> json) =
      _$FeatureAccessModelImpl.fromJson;

  @override
  String get applicationId;
  @override
  Map<String, dynamic> get config;
  @override
  String? get themeId;
  @override
  FeatureAccessStatus get status;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of FeatureAccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureAccessModelImplCopyWith<_$FeatureAccessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
