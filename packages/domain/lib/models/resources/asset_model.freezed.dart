// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) {
  return _AssetModel.fromJson(json);
}

/// @nodoc
mixin _$AssetModel {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get storagePath => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get checksum => throw _privateConstructorUsedError;
  int get refCount => throw _privateConstructorUsedError;
  List<AssetLink> get usedBy => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;

  /// Serializes this AssetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetModelCopyWith<AssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetModelCopyWith<$Res> {
  factory $AssetModelCopyWith(
          AssetModel value, $Res Function(AssetModel) then) =
      _$AssetModelCopyWithImpl<$Res, AssetModel>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String storagePath,
      String mimeType,
      int size,
      DateTime createdAt,
      DateTime updatedAt,
      String? checksum,
      int refCount,
      List<AssetLink> usedBy,
      String? downloadUrl});
}

/// @nodoc
class _$AssetModelCopyWithImpl<$Res, $Val extends AssetModel>
    implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetModel
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as List<AssetLink>,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetModelImplCopyWith<$Res>
    implements $AssetModelCopyWith<$Res> {
  factory _$$AssetModelImplCopyWith(
          _$AssetModelImpl value, $Res Function(_$AssetModelImpl) then) =
      __$$AssetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String storagePath,
      String mimeType,
      int size,
      DateTime createdAt,
      DateTime updatedAt,
      String? checksum,
      int refCount,
      List<AssetLink> usedBy,
      String? downloadUrl});
}

/// @nodoc
class __$$AssetModelImplCopyWithImpl<$Res>
    extends _$AssetModelCopyWithImpl<$Res, _$AssetModelImpl>
    implements _$$AssetModelImplCopyWith<$Res> {
  __$$AssetModelImplCopyWithImpl(
      _$AssetModelImpl _value, $Res Function(_$AssetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetModel
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
    return _then(_$AssetModelImpl(
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checksum: freezed == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String?,
      refCount: null == refCount
          ? _value.refCount
          : refCount // ignore: cast_nullable_to_non_nullable
              as int,
      usedBy: null == usedBy
          ? _value._usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as List<AssetLink>,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetModelImpl implements _AssetModel {
  const _$AssetModelImpl(
      {required this.id,
      required this.ownerId,
      required this.storagePath,
      required this.mimeType,
      required this.size,
      required this.createdAt,
      required this.updatedAt,
      this.checksum,
      this.refCount = 0,
      final List<AssetLink> usedBy = const <AssetLink>[],
      this.downloadUrl})
      : _usedBy = usedBy;

  factory _$AssetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetModelImplFromJson(json);

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
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? checksum;
  @override
  @JsonKey()
  final int refCount;
  final List<AssetLink> _usedBy;
  @override
  @JsonKey()
  List<AssetLink> get usedBy {
    if (_usedBy is EqualUnmodifiableListView) return _usedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedBy);
  }

  @override
  final String? downloadUrl;

  @override
  String toString() {
    return 'AssetModel(id: $id, ownerId: $ownerId, storagePath: $storagePath, mimeType: $mimeType, size: $size, createdAt: $createdAt, updatedAt: $updatedAt, checksum: $checksum, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetModelImpl &&
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
            const DeepCollectionEquality().equals(other._usedBy, _usedBy) &&
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
      const DeepCollectionEquality().hash(_usedBy),
      downloadUrl);

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetModelImplCopyWith<_$AssetModelImpl> get copyWith =>
      __$$AssetModelImplCopyWithImpl<_$AssetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetModelImplToJson(
      this,
    );
  }
}

abstract class _AssetModel implements AssetModel {
  const factory _AssetModel(
      {required final String id,
      required final String ownerId,
      required final String storagePath,
      required final String mimeType,
      required final int size,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? checksum,
      final int refCount,
      final List<AssetLink> usedBy,
      final String? downloadUrl}) = _$AssetModelImpl;

  factory _AssetModel.fromJson(Map<String, dynamic> json) =
      _$AssetModelImpl.fromJson;

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
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get checksum;
  @override
  int get refCount;
  @override
  List<AssetLink> get usedBy;
  @override
  String? get downloadUrl;

  /// Create a copy of AssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetModelImplCopyWith<_$AssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
