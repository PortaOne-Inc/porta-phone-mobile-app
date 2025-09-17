// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_asset_dto_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateAssetDtoReq _$CreateAssetDtoReqFromJson(Map<String, dynamic> json) {
  return _CreateAssetDtoReq.fromJson(json);
}

/// @nodoc
mixin _$CreateAssetDtoReq {
  String get applicationId => throw _privateConstructorUsedError;
  String get storagePath => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get checksum => throw _privateConstructorUsedError;

  /// Serializes this CreateAssetDtoReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAssetDtoReqCopyWith<CreateAssetDtoReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAssetDtoReqCopyWith<$Res> {
  factory $CreateAssetDtoReqCopyWith(
          CreateAssetDtoReq value, $Res Function(CreateAssetDtoReq) then) =
      _$CreateAssetDtoReqCopyWithImpl<$Res, CreateAssetDtoReq>;
  @useResult
  $Res call(
      {String applicationId,
      String storagePath,
      String mimeType,
      int size,
      String? checksum});
}

/// @nodoc
class _$CreateAssetDtoReqCopyWithImpl<$Res, $Val extends CreateAssetDtoReq>
    implements $CreateAssetDtoReqCopyWith<$Res> {
  _$CreateAssetDtoReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? storagePath = null,
    Object? mimeType = null,
    Object? size = null,
    Object? checksum = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAssetDtoReqImplCopyWith<$Res>
    implements $CreateAssetDtoReqCopyWith<$Res> {
  factory _$$CreateAssetDtoReqImplCopyWith(_$CreateAssetDtoReqImpl value,
          $Res Function(_$CreateAssetDtoReqImpl) then) =
      __$$CreateAssetDtoReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String storagePath,
      String mimeType,
      int size,
      String? checksum});
}

/// @nodoc
class __$$CreateAssetDtoReqImplCopyWithImpl<$Res>
    extends _$CreateAssetDtoReqCopyWithImpl<$Res, _$CreateAssetDtoReqImpl>
    implements _$$CreateAssetDtoReqImplCopyWith<$Res> {
  __$$CreateAssetDtoReqImplCopyWithImpl(_$CreateAssetDtoReqImpl _value,
      $Res Function(_$CreateAssetDtoReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? storagePath = null,
    Object? mimeType = null,
    Object? size = null,
    Object? checksum = freezed,
  }) {
    return _then(_$CreateAssetDtoReqImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      storagePath: null == storagePath
          ? _value.storagePath
          : storagePath // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAssetDtoReqImpl implements _CreateAssetDtoReq {
  const _$CreateAssetDtoReqImpl(
      {required this.applicationId,
      required this.storagePath,
      required this.mimeType,
      required this.size,
      this.checksum});

  factory _$CreateAssetDtoReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAssetDtoReqImplFromJson(json);

  @override
  final String applicationId;
  @override
  final String storagePath;
  @override
  final String mimeType;
  @override
  final int size;
  @override
  final String? checksum;

  @override
  String toString() {
    return 'CreateAssetDtoReq(applicationId: $applicationId, storagePath: $storagePath, mimeType: $mimeType, size: $size, checksum: $checksum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAssetDtoReqImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, applicationId, storagePath, mimeType, size, checksum);

  /// Create a copy of CreateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAssetDtoReqImplCopyWith<_$CreateAssetDtoReqImpl> get copyWith =>
      __$$CreateAssetDtoReqImplCopyWithImpl<_$CreateAssetDtoReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAssetDtoReqImplToJson(
      this,
    );
  }
}

abstract class _CreateAssetDtoReq implements CreateAssetDtoReq {
  const factory _CreateAssetDtoReq(
      {required final String applicationId,
      required final String storagePath,
      required final String mimeType,
      required final int size,
      final String? checksum}) = _$CreateAssetDtoReqImpl;

  factory _CreateAssetDtoReq.fromJson(Map<String, dynamic> json) =
      _$CreateAssetDtoReqImpl.fromJson;

  @override
  String get applicationId;
  @override
  String get storagePath;
  @override
  String get mimeType;
  @override
  int get size;
  @override
  String? get checksum;

  /// Create a copy of CreateAssetDtoReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAssetDtoReqImplCopyWith<_$CreateAssetDtoReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
