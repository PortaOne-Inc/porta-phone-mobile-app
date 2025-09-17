// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widgets_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WidgetsConfig {
  String get id => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  BrightnessVariant get variant => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of WidgetsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WidgetsConfigCopyWith<WidgetsConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WidgetsConfigCopyWith<$Res> {
  factory $WidgetsConfigCopyWith(
          WidgetsConfig value, $Res Function(WidgetsConfig) then) =
      _$WidgetsConfigCopyWithImpl<$Res, WidgetsConfig>;
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      BrightnessVariant variant,
      Map<String, dynamic> config,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$WidgetsConfigCopyWithImpl<$Res, $Val extends WidgetsConfig>
    implements $WidgetsConfigCopyWith<$Res> {
  _$WidgetsConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WidgetsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? variant = null,
    Object? config = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
              as BrightnessVariant,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WidgetsConfigImplCopyWith<$Res>
    implements $WidgetsConfigCopyWith<$Res> {
  factory _$$WidgetsConfigImplCopyWith(
          _$WidgetsConfigImpl value, $Res Function(_$WidgetsConfigImpl) then) =
      __$$WidgetsConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      BrightnessVariant variant,
      Map<String, dynamic> config,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$WidgetsConfigImplCopyWithImpl<$Res>
    extends _$WidgetsConfigCopyWithImpl<$Res, _$WidgetsConfigImpl>
    implements _$$WidgetsConfigImplCopyWith<$Res> {
  __$$WidgetsConfigImplCopyWithImpl(
      _$WidgetsConfigImpl _value, $Res Function(_$WidgetsConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of WidgetsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? variant = null,
    Object? config = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WidgetsConfigImpl(
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
              as BrightnessVariant,
      config: null == config
          ? _value._config
          : config // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$WidgetsConfigImpl implements _WidgetsConfig {
  const _$WidgetsConfigImpl(
      {required this.id,
      required this.applicationId,
      required this.themeId,
      required this.variant,
      required final Map<String, dynamic> config,
      required this.createdAt,
      required this.updatedAt})
      : _config = config;

  @override
  final String id;
  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final BrightnessVariant variant;
  final Map<String, dynamic> _config;
  @override
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WidgetsConfig(id: $id, applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetsConfigImpl &&
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

  /// Create a copy of WidgetsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetsConfigImplCopyWith<_$WidgetsConfigImpl> get copyWith =>
      __$$WidgetsConfigImplCopyWithImpl<_$WidgetsConfigImpl>(this, _$identity);
}

abstract class _WidgetsConfig implements WidgetsConfig {
  const factory _WidgetsConfig(
      {required final String id,
      required final String applicationId,
      required final String themeId,
      required final BrightnessVariant variant,
      required final Map<String, dynamic> config,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$WidgetsConfigImpl;

  @override
  String get id;
  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  BrightnessVariant get variant;
  @override
  Map<String, dynamic> get config;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of WidgetsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WidgetsConfigImplCopyWith<_$WidgetsConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
