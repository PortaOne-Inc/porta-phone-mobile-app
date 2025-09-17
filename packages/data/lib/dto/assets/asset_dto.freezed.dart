// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetLinkDto _$AssetLinkDtoFromJson(Map<String, dynamic> json) {
  return _AssetLinkDto.fromJson(json);
}

/// @nodoc
mixin _$AssetLinkDto {
  String get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this AssetLinkDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetLinkDtoCopyWith<AssetLinkDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetLinkDtoCopyWith<$Res> {
  factory $AssetLinkDtoCopyWith(
          AssetLinkDto value, $Res Function(AssetLinkDto) then) =
      _$AssetLinkDtoCopyWithImpl<$Res, AssetLinkDto>;
  @useResult
  $Res call({String type, String id});
}

/// @nodoc
class _$AssetLinkDtoCopyWithImpl<$Res, $Val extends AssetLinkDto>
    implements $AssetLinkDtoCopyWith<$Res> {
  _$AssetLinkDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetLinkDto
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
abstract class _$$AssetLinkDtoImplCopyWith<$Res>
    implements $AssetLinkDtoCopyWith<$Res> {
  factory _$$AssetLinkDtoImplCopyWith(
          _$AssetLinkDtoImpl value, $Res Function(_$AssetLinkDtoImpl) then) =
      __$$AssetLinkDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String id});
}

/// @nodoc
class __$$AssetLinkDtoImplCopyWithImpl<$Res>
    extends _$AssetLinkDtoCopyWithImpl<$Res, _$AssetLinkDtoImpl>
    implements _$$AssetLinkDtoImplCopyWith<$Res> {
  __$$AssetLinkDtoImplCopyWithImpl(
      _$AssetLinkDtoImpl _value, $Res Function(_$AssetLinkDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_$AssetLinkDtoImpl(
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
class _$AssetLinkDtoImpl implements _AssetLinkDto {
  const _$AssetLinkDtoImpl({required this.type, required this.id});

  factory _$AssetLinkDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetLinkDtoImplFromJson(json);

  @override
  final String type;
  @override
  final String id;

  @override
  String toString() {
    return 'AssetLinkDto(type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetLinkDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id);

  /// Create a copy of AssetLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetLinkDtoImplCopyWith<_$AssetLinkDtoImpl> get copyWith =>
      __$$AssetLinkDtoImplCopyWithImpl<_$AssetLinkDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetLinkDtoImplToJson(
      this,
    );
  }
}

abstract class _AssetLinkDto implements AssetLinkDto {
  const factory _AssetLinkDto(
      {required final String type,
      required final String id}) = _$AssetLinkDtoImpl;

  factory _AssetLinkDto.fromJson(Map<String, dynamic> json) =
      _$AssetLinkDtoImpl.fromJson;

  @override
  String get type;
  @override
  String get id;

  /// Create a copy of AssetLinkDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetLinkDtoImplCopyWith<_$AssetLinkDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetDTO _$AssetDTOFromJson(Map<String, dynamic> json) {
  return _AssetDTO.fromJson(json);
}

/// @nodoc
mixin _$AssetDTO {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get storagePath => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get checksum => throw _privateConstructorUsedError;
  int get refCount => throw _privateConstructorUsedError;
  List<AssetLinkDto> get usedBy => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;

  /// Serializes this AssetDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetDTOCopyWith<AssetDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetDTOCopyWith<$Res> {
  factory $AssetDTOCopyWith(AssetDTO value, $Res Function(AssetDTO) then) =
      _$AssetDTOCopyWithImpl<$Res, AssetDTO>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String storagePath,
      String mimeType,
      int size,
      String createdAt,
      String updatedAt,
      String? checksum,
      int refCount,
      List<AssetLinkDto> usedBy,
      String? downloadUrl});
}

/// @nodoc
class _$AssetDTOCopyWithImpl<$Res, $Val extends AssetDTO>
    implements $AssetDTOCopyWith<$Res> {
  _$AssetDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? storagePath = null,
    Object? mimeType = null,
    Object? size = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? checksum = freezed,
    Object? refCount = null,
    Object? usedBy = null,
    Object? downloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      refCount: null == refCount
          ? _value.refCount
          : refCount // ignore: cast_nullable_to_non_nullable
              as int,
      usedBy: null == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as List<AssetLinkDto>,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetDTOImplCopyWith<$Res>
    implements $AssetDTOCopyWith<$Res> {
  factory _$$AssetDTOImplCopyWith(
          _$AssetDTOImpl value, $Res Function(_$AssetDTOImpl) then) =
      __$$AssetDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String storagePath,
      String mimeType,
      int size,
      String createdAt,
      String updatedAt,
      String? checksum,
      int refCount,
      List<AssetLinkDto> usedBy,
      String? downloadUrl});
}

/// @nodoc
class __$$AssetDTOImplCopyWithImpl<$Res>
    extends _$AssetDTOCopyWithImpl<$Res, _$AssetDTOImpl>
    implements _$$AssetDTOImplCopyWith<$Res> {
  __$$AssetDTOImplCopyWithImpl(
      _$AssetDTOImpl _value, $Res Function(_$AssetDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? storagePath = null,
    Object? mimeType = null,
    Object? size = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? checksum = freezed,
    Object? refCount = null,
    Object? usedBy = null,
    Object? downloadUrl = freezed,
  }) {
    return _then(_$AssetDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      refCount: null == refCount
          ? _value.refCount
          : refCount // ignore: cast_nullable_to_non_nullable
              as int,
      usedBy: null == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as List<AssetLinkDto>,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AssetDTOImpl extends _AssetDTO {
  const _$AssetDTOImpl(
      {required this.id,
      required this.ownerId,
      required this.storagePath,
      required this.mimeType,
      required this.size,
      required this.createdAt,
      required this.updatedAt,
      this.checksum,
      this.refCount = 0,
      this.usedBy = const <AssetLinkDto>[],
      this.downloadUrl})
      : super._();

  factory _$AssetDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String storagePath;
  @override
  final String mimeType;
  @override
  final int size;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? checksum;
  @override
  @JsonKey()
  final int refCount;
  @override
  @JsonKey()
  final List<AssetLinkDto> usedBy;
  @override
  final String? downloadUrl;

  @override
  String toString() {
    return 'AssetDTO(id: $id, ownerId: $ownerId, storagePath: $storagePath, mimeType: $mimeType, size: $size, createdAt: $createdAt, updatedAt: $updatedAt, checksum: $checksum, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.refCount, refCount) ||
                other.refCount == refCount) &&
            const DeepCollectionEquality().equals(other.usedBy, usedBy) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      storagePath,
      mimeType,
      size,
      createdAt,
      updatedAt,
      checksum,
      refCount,
      const DeepCollectionEquality().hash(usedBy),
      downloadUrl);

  /// Create a copy of AssetDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetDTOImplCopyWith<_$AssetDTOImpl> get copyWith =>
      __$$AssetDTOImplCopyWithImpl<_$AssetDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetDTOImplToJson(
      this,
    );
  }
}

abstract class _AssetDTO extends AssetDTO {
  const factory _AssetDTO(
      {required final String id,
      required final String ownerId,
      required final String storagePath,
      required final String mimeType,
      required final int size,
      required final String createdAt,
      required final String updatedAt,
      final String? checksum,
      final int refCount,
      final List<AssetLinkDto> usedBy,
      final String? downloadUrl}) = _$AssetDTOImpl;
  const _AssetDTO._() : super._();

  factory _AssetDTO.fromJson(Map<String, dynamic> json) =
      _$AssetDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get storagePath;
  @override
  String get mimeType;
  @override
  int get size;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get checksum;
  @override
  int get refCount;
  @override
  List<AssetLinkDto> get usedBy;
  @override
  String? get downloadUrl;

  /// Create a copy of AssetDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetDTOImplCopyWith<_$AssetDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
