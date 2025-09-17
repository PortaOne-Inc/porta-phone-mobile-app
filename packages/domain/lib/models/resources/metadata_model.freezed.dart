// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) {
  return _MetadataModel.fromJson(json);
}

/// @nodoc
mixin _$MetadataModel {
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;

  /// Serializes this MetadataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetadataModelCopyWith<MetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataModelCopyWith<$Res> {
  factory $MetadataModelCopyWith(
          MetadataModel value, $Res Function(MetadataModel) then) =
      _$MetadataModelCopyWithImpl<$Res, MetadataModel>;
  @useResult
  $Res call({Map<String, dynamic> attributes});
}

/// @nodoc
class _$MetadataModelCopyWithImpl<$Res, $Val extends MetadataModel>
    implements $MetadataModelCopyWith<$Res> {
  _$MetadataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataModelImplCopyWith<$Res>
    implements $MetadataModelCopyWith<$Res> {
  factory _$$MetadataModelImplCopyWith(
          _$MetadataModelImpl value, $Res Function(_$MetadataModelImpl) then) =
      __$$MetadataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> attributes});
}

/// @nodoc
class __$$MetadataModelImplCopyWithImpl<$Res>
    extends _$MetadataModelCopyWithImpl<$Res, _$MetadataModelImpl>
    implements _$$MetadataModelImplCopyWith<$Res> {
  __$$MetadataModelImplCopyWithImpl(
      _$MetadataModelImpl _value, $Res Function(_$MetadataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
  }) {
    return _then(_$MetadataModelImpl(
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataModelImpl extends _MetadataModel {
  const _$MetadataModelImpl({final Map<String, dynamic> attributes = const {}})
      : _attributes = attributes,
        super._();

  factory _$MetadataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataModelImplFromJson(json);

  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  String toString() {
    return 'MetadataModel(attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataModelImpl &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_attributes));

  /// Create a copy of MetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataModelImplCopyWith<_$MetadataModelImpl> get copyWith =>
      __$$MetadataModelImplCopyWithImpl<_$MetadataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataModelImplToJson(
      this,
    );
  }
}

abstract class _MetadataModel extends MetadataModel {
  const factory _MetadataModel({final Map<String, dynamic> attributes}) =
      _$MetadataModelImpl;
  const _MetadataModel._() : super._();

  factory _MetadataModel.fromJson(Map<String, dynamic> json) =
      _$MetadataModelImpl.fromJson;

  @override
  Map<String, dynamic> get attributes;

  /// Create a copy of MetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetadataModelImplCopyWith<_$MetadataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
