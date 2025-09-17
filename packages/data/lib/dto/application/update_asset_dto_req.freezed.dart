// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_asset_dto_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateAssetDtoReq _$UpdateAssetDtoReqFromJson(Map<String, dynamic> json) {
  return _UpdateAssetDtoReq.fromJson(json);
}

/// @nodoc
mixin _$UpdateAssetDtoReq {
  String? get checksum => throw _privateConstructorUsedError;

  /// Serializes this UpdateAssetDtoReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateAssetDtoReqCopyWith<UpdateAssetDtoReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAssetDtoReqCopyWith<$Res> {
  factory $UpdateAssetDtoReqCopyWith(
          UpdateAssetDtoReq value, $Res Function(UpdateAssetDtoReq) then) =
      _$UpdateAssetDtoReqCopyWithImpl<$Res, UpdateAssetDtoReq>;
  @useResult
  $Res call({String? checksum});
}

/// @nodoc
class _$UpdateAssetDtoReqCopyWithImpl<$Res, $Val extends UpdateAssetDtoReq>
    implements $UpdateAssetDtoReqCopyWith<$Res> {
  _$UpdateAssetDtoReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checksum = freezed,
  }) {
    return _then(_value.copyWith(
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateAssetDtoReqImplCopyWith<$Res>
    implements $UpdateAssetDtoReqCopyWith<$Res> {
  factory _$$UpdateAssetDtoReqImplCopyWith(_$UpdateAssetDtoReqImpl value,
          $Res Function(_$UpdateAssetDtoReqImpl) then) =
      __$$UpdateAssetDtoReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? checksum});
}

/// @nodoc
class __$$UpdateAssetDtoReqImplCopyWithImpl<$Res>
    extends _$UpdateAssetDtoReqCopyWithImpl<$Res, _$UpdateAssetDtoReqImpl>
    implements _$$UpdateAssetDtoReqImplCopyWith<$Res> {
  __$$UpdateAssetDtoReqImplCopyWithImpl(_$UpdateAssetDtoReqImpl _value,
      $Res Function(_$UpdateAssetDtoReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checksum = freezed,
  }) {
    return _then(_$UpdateAssetDtoReqImpl(
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateAssetDtoReqImpl implements _UpdateAssetDtoReq {
  const _$UpdateAssetDtoReqImpl({this.checksum});

  factory _$UpdateAssetDtoReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateAssetDtoReqImplFromJson(json);

  @override
  final String? checksum;

  @override
  String toString() {
    return 'UpdateAssetDtoReq(checksum: $checksum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAssetDtoReqImpl &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, checksum);

  /// Create a copy of UpdateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAssetDtoReqImplCopyWith<_$UpdateAssetDtoReqImpl> get copyWith =>
      __$$UpdateAssetDtoReqImplCopyWithImpl<_$UpdateAssetDtoReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateAssetDtoReqImplToJson(
      this,
    );
  }
}

abstract class _UpdateAssetDtoReq implements UpdateAssetDtoReq {
  const factory _UpdateAssetDtoReq({final String? checksum}) =
      _$UpdateAssetDtoReqImpl;

  factory _UpdateAssetDtoReq.fromJson(Map<String, dynamic> json) =
      _$UpdateAssetDtoReqImpl.fromJson;

  @override
  String? get checksum;

  /// Create a copy of UpdateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAssetDtoReqImplCopyWith<_$UpdateAssetDtoReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
