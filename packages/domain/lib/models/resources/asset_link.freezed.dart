// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetLink _$AssetLinkFromJson(Map<String, dynamic> json) {
  return _AssetLink.fromJson(json);
}

/// @nodoc
mixin _$AssetLink {
  String get type =>
      throw _privateConstructorUsedError; // e.g. "embed" | "post" | "user" | "asset"
  String get id => throw _privateConstructorUsedError;

  /// Serializes this AssetLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetLinkCopyWith<AssetLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetLinkCopyWith<$Res> {
  factory $AssetLinkCopyWith(AssetLink value, $Res Function(AssetLink) then) =
      _$AssetLinkCopyWithImpl<$Res, AssetLink>;
  @useResult
  $Res call({String type, String id});
}

/// @nodoc
class _$AssetLinkCopyWithImpl<$Res, $Val extends AssetLink>
    implements $AssetLinkCopyWith<$Res> {
  _$AssetLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetLinkImplCopyWith<$Res>
    implements $AssetLinkCopyWith<$Res> {
  factory _$$AssetLinkImplCopyWith(
          _$AssetLinkImpl value, $Res Function(_$AssetLinkImpl) then) =
      __$$AssetLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String id});
}

/// @nodoc
class __$$AssetLinkImplCopyWithImpl<$Res>
    extends _$AssetLinkCopyWithImpl<$Res, _$AssetLinkImpl>
    implements _$$AssetLinkImplCopyWith<$Res> {
  __$$AssetLinkImplCopyWithImpl(
      _$AssetLinkImpl _value, $Res Function(_$AssetLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_$AssetLinkImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetLinkImpl implements _AssetLink {
  const _$AssetLinkImpl({required this.type, required this.id});

  factory _$AssetLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetLinkImplFromJson(json);

  @override
  final String type;
// e.g. "embed" | "post" | "user" | "asset"
  @override
  final String id;

  @override
  String toString() {
    return 'AssetLink(type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetLinkImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id);

  /// Create a copy of AssetLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetLinkImplCopyWith<_$AssetLinkImpl> get copyWith =>
      __$$AssetLinkImplCopyWithImpl<_$AssetLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetLinkImplToJson(
      this,
    );
  }
}

abstract class _AssetLink implements AssetLink {
  const factory _AssetLink(
      {required final String type, required final String id}) = _$AssetLinkImpl;

  factory _AssetLink.fromJson(Map<String, dynamic> json) =
      _$AssetLinkImpl.fromJson;

  @override
  String get type; // e.g. "embed" | "post" | "user" | "asset"
  @override
  String get id;

  /// Create a copy of AssetLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetLinkImplCopyWith<_$AssetLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
