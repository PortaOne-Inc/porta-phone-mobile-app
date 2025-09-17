// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_renditions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetsRendition _$AssetsRenditionFromJson(Map<String, dynamic> json) {
  return _AssetsRendition.fromJson(json);
}

/// @nodoc
mixin _$AssetsRendition {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  List<AssetsRenditionSource> get sources => throw _privateConstructorUsedError;
  String get storagePath => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get checksum => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get refCount => throw _privateConstructorUsedError;
  List<dynamic> get usedBy => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;

  /// Serializes this AssetsRendition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetsRendition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetsRenditionCopyWith<AssetsRendition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetsRenditionCopyWith<$Res> {
  factory $AssetsRenditionCopyWith(
          AssetsRendition value, $Res Function(AssetsRendition) then) =
      _$AssetsRenditionCopyWithImpl<$Res, AssetsRendition>;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String applicationId,
      String themeId,
      String kind,
      List<AssetsRenditionSource> sources,
      String storagePath,
      String mimeType,
      int size,
      String checksum,
      DateTime createdAt,
      DateTime updatedAt,
      int refCount,
      List<dynamic> usedBy,
      String downloadUrl});
}

/// @nodoc
class _$AssetsRenditionCopyWithImpl<$Res, $Val extends AssetsRendition>
    implements $AssetsRenditionCopyWith<$Res> {
  _$AssetsRenditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetsRendition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? kind = null,
    Object? sources = null,
    Object? storagePath = null,
    Object? mimeType = null,
    Object? size = null,
    Object? checksum = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? refCount = null,
    Object? usedBy = null,
    Object? downloadUrl = null,
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
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssetsRenditionSource>,
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
      checksum: null == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refCount: null == refCount
          ? _value.refCount
          : refCount // ignore: cast_nullable_to_non_nullable
              as int,
      usedBy: null == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetsRenditionImplCopyWith<$Res>
    implements $AssetsRenditionCopyWith<$Res> {
  factory _$$AssetsRenditionImplCopyWith(_$AssetsRenditionImpl value,
          $Res Function(_$AssetsRenditionImpl) then) =
      __$$AssetsRenditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String applicationId,
      String themeId,
      String kind,
      List<AssetsRenditionSource> sources,
      String storagePath,
      String mimeType,
      int size,
      String checksum,
      DateTime createdAt,
      DateTime updatedAt,
      int refCount,
      List<dynamic> usedBy,
      String downloadUrl});
}

/// @nodoc
class __$$AssetsRenditionImplCopyWithImpl<$Res>
    extends _$AssetsRenditionCopyWithImpl<$Res, _$AssetsRenditionImpl>
    implements _$$AssetsRenditionImplCopyWith<$Res> {
  __$$AssetsRenditionImplCopyWithImpl(
      _$AssetsRenditionImpl _value, $Res Function(_$AssetsRenditionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsRendition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? kind = null,
    Object? sources = null,
    Object? storagePath = null,
    Object? mimeType = null,
    Object? size = null,
    Object? checksum = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? refCount = null,
    Object? usedBy = null,
    Object? downloadUrl = null,
  }) {
    return _then(_$AssetsRenditionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<AssetsRenditionSource>,
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
      checksum: null == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      refCount: null == refCount
          ? _value.refCount
          : refCount // ignore: cast_nullable_to_non_nullable
              as int,
      usedBy: null == usedBy
          ? _value._usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetsRenditionImpl implements _AssetsRendition {
  const _$AssetsRenditionImpl(
      {required this.id,
      required this.ownerId,
      required this.applicationId,
      required this.themeId,
      required this.kind,
      required final List<AssetsRenditionSource> sources,
      required this.storagePath,
      required this.mimeType,
      required this.size,
      required this.checksum,
      required this.createdAt,
      required this.updatedAt,
      required this.refCount,
      required final List<dynamic> usedBy,
      required this.downloadUrl})
      : _sources = sources,
        _usedBy = usedBy;

  factory _$AssetsRenditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetsRenditionImplFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final String kind;
  final List<AssetsRenditionSource> _sources;
  @override
  List<AssetsRenditionSource> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  @override
  final String storagePath;
  @override
  final String mimeType;
  @override
  final int size;
  @override
  final String checksum;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int refCount;
  final List<dynamic> _usedBy;
  @override
  List<dynamic> get usedBy {
    if (_usedBy is EqualUnmodifiableListView) return _usedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedBy);
  }

  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'AssetsRendition(id: $id, ownerId: $ownerId, applicationId: $applicationId, themeId: $themeId, kind: $kind, sources: $sources, storagePath: $storagePath, mimeType: $mimeType, size: $size, checksum: $checksum, createdAt: $createdAt, updatedAt: $updatedAt, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetsRenditionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.storagePath, storagePath) ||
                other.storagePath == storagePath) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
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
      applicationId,
      themeId,
      kind,
      const DeepCollectionEquality().hash(_sources),
      storagePath,
      mimeType,
      size,
      checksum,
      createdAt,
      updatedAt,
      refCount,
      const DeepCollectionEquality().hash(_usedBy),
      downloadUrl);

  /// Create a copy of AssetsRendition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetsRenditionImplCopyWith<_$AssetsRenditionImpl> get copyWith =>
      __$$AssetsRenditionImplCopyWithImpl<_$AssetsRenditionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetsRenditionImplToJson(
      this,
    );
  }
}

abstract class _AssetsRendition implements AssetsRendition {
  const factory _AssetsRendition(
      {required final String id,
      required final String ownerId,
      required final String applicationId,
      required final String themeId,
      required final String kind,
      required final List<AssetsRenditionSource> sources,
      required final String storagePath,
      required final String mimeType,
      required final int size,
      required final String checksum,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int refCount,
      required final List<dynamic> usedBy,
      required final String downloadUrl}) = _$AssetsRenditionImpl;

  factory _AssetsRendition.fromJson(Map<String, dynamic> json) =
      _$AssetsRenditionImpl.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  String get kind;
  @override
  List<AssetsRenditionSource> get sources;
  @override
  String get storagePath;
  @override
  String get mimeType;
  @override
  int get size;
  @override
  String get checksum;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get refCount;
  @override
  List<dynamic> get usedBy;
  @override
  String get downloadUrl;

  /// Create a copy of AssetsRendition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetsRenditionImplCopyWith<_$AssetsRenditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetsRenditionSource _$AssetsRenditionSourceFromJson(
    Map<String, dynamic> json) {
  return _AssetsRenditionSource.fromJson(json);
}

/// @nodoc
mixin _$AssetsRenditionSource {
  String get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this AssetsRenditionSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetsRenditionSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetsRenditionSourceCopyWith<AssetsRenditionSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetsRenditionSourceCopyWith<$Res> {
  factory $AssetsRenditionSourceCopyWith(AssetsRenditionSource value,
          $Res Function(AssetsRenditionSource) then) =
      _$AssetsRenditionSourceCopyWithImpl<$Res, AssetsRenditionSource>;
  @useResult
  $Res call({String type, String id});
}

/// @nodoc
class _$AssetsRenditionSourceCopyWithImpl<$Res,
        $Val extends AssetsRenditionSource>
    implements $AssetsRenditionSourceCopyWith<$Res> {
  _$AssetsRenditionSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetsRenditionSource
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
abstract class _$$AssetsRenditionSourceImplCopyWith<$Res>
    implements $AssetsRenditionSourceCopyWith<$Res> {
  factory _$$AssetsRenditionSourceImplCopyWith(
          _$AssetsRenditionSourceImpl value,
          $Res Function(_$AssetsRenditionSourceImpl) then) =
      __$$AssetsRenditionSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String id});
}

/// @nodoc
class __$$AssetsRenditionSourceImplCopyWithImpl<$Res>
    extends _$AssetsRenditionSourceCopyWithImpl<$Res,
        _$AssetsRenditionSourceImpl>
    implements _$$AssetsRenditionSourceImplCopyWith<$Res> {
  __$$AssetsRenditionSourceImplCopyWithImpl(_$AssetsRenditionSourceImpl _value,
      $Res Function(_$AssetsRenditionSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsRenditionSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_$AssetsRenditionSourceImpl(
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
class _$AssetsRenditionSourceImpl implements _AssetsRenditionSource {
  const _$AssetsRenditionSourceImpl({required this.type, required this.id});

  factory _$AssetsRenditionSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetsRenditionSourceImplFromJson(json);

  @override
  final String type;
  @override
  final String id;

  @override
  String toString() {
    return 'AssetsRenditionSource(type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetsRenditionSourceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, id);

  /// Create a copy of AssetsRenditionSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetsRenditionSourceImplCopyWith<_$AssetsRenditionSourceImpl>
      get copyWith => __$$AssetsRenditionSourceImplCopyWithImpl<
          _$AssetsRenditionSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetsRenditionSourceImplToJson(
      this,
    );
  }
}

abstract class _AssetsRenditionSource implements AssetsRenditionSource {
  const factory _AssetsRenditionSource(
      {required final String type,
      required final String id}) = _$AssetsRenditionSourceImpl;

  factory _AssetsRenditionSource.fromJson(Map<String, dynamic> json) =
      _$AssetsRenditionSourceImpl.fromJson;

  @override
  String get type;
  @override
  String get id;

  /// Create a copy of AssetsRenditionSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetsRenditionSourceImplCopyWith<_$AssetsRenditionSourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
