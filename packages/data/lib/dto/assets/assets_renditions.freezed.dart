// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_renditions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetsRendition {

 String get id; String get ownerId; String get applicationId; String get themeId; String get kind; List<AssetsRenditionSource> get sources; String get storagePath; String get mimeType; int get size; String get checksum; DateTime get createdAt; DateTime get updatedAt; int get refCount; List<dynamic> get usedBy; String get downloadUrl;
/// Create a copy of AssetsRendition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetsRenditionCopyWith<AssetsRendition> get copyWith => _$AssetsRenditionCopyWithImpl<AssetsRendition>(this as AssetsRendition, _$identity);

  /// Serializes this AssetsRendition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetsRendition&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.sources, sources)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.refCount, refCount) || other.refCount == refCount)&&const DeepCollectionEquality().equals(other.usedBy, usedBy)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,applicationId,themeId,kind,const DeepCollectionEquality().hash(sources),storagePath,mimeType,size,checksum,createdAt,updatedAt,refCount,const DeepCollectionEquality().hash(usedBy),downloadUrl);

@override
String toString() {
  return 'AssetsRendition(id: $id, ownerId: $ownerId, applicationId: $applicationId, themeId: $themeId, kind: $kind, sources: $sources, storagePath: $storagePath, mimeType: $mimeType, size: $size, checksum: $checksum, createdAt: $createdAt, updatedAt: $updatedAt, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $AssetsRenditionCopyWith<$Res>  {
  factory $AssetsRenditionCopyWith(AssetsRendition value, $Res Function(AssetsRendition) _then) = _$AssetsRenditionCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String applicationId, String themeId, String kind, List<AssetsRenditionSource> sources, String storagePath, String mimeType, int size, String checksum, DateTime createdAt, DateTime updatedAt, int refCount, List<dynamic> usedBy, String downloadUrl
});




}
/// @nodoc
class _$AssetsRenditionCopyWithImpl<$Res>
    implements $AssetsRenditionCopyWith<$Res> {
  _$AssetsRenditionCopyWithImpl(this._self, this._then);

  final AssetsRendition _self;
  final $Res Function(AssetsRendition) _then;

/// Create a copy of AssetsRendition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? applicationId = null,Object? themeId = null,Object? kind = null,Object? sources = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? checksum = null,Object? createdAt = null,Object? updatedAt = null,Object? refCount = null,Object? usedBy = null,Object? downloadUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<AssetsRenditionSource>,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,checksum: null == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,usedBy: null == usedBy ? _self.usedBy : usedBy // ignore: cast_nullable_to_non_nullable
as List<dynamic>,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetsRendition].
extension AssetsRenditionPatterns on AssetsRendition {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetsRendition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetsRendition() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetsRendition value)  $default,){
final _that = this;
switch (_that) {
case _AssetsRendition():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetsRendition value)?  $default,){
final _that = this;
switch (_that) {
case _AssetsRendition() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String applicationId,  String themeId,  String kind,  List<AssetsRenditionSource> sources,  String storagePath,  String mimeType,  int size,  String checksum,  DateTime createdAt,  DateTime updatedAt,  int refCount,  List<dynamic> usedBy,  String downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetsRendition() when $default != null:
return $default(_that.id,_that.ownerId,_that.applicationId,_that.themeId,_that.kind,_that.sources,_that.storagePath,_that.mimeType,_that.size,_that.checksum,_that.createdAt,_that.updatedAt,_that.refCount,_that.usedBy,_that.downloadUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String applicationId,  String themeId,  String kind,  List<AssetsRenditionSource> sources,  String storagePath,  String mimeType,  int size,  String checksum,  DateTime createdAt,  DateTime updatedAt,  int refCount,  List<dynamic> usedBy,  String downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _AssetsRendition():
return $default(_that.id,_that.ownerId,_that.applicationId,_that.themeId,_that.kind,_that.sources,_that.storagePath,_that.mimeType,_that.size,_that.checksum,_that.createdAt,_that.updatedAt,_that.refCount,_that.usedBy,_that.downloadUrl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String applicationId,  String themeId,  String kind,  List<AssetsRenditionSource> sources,  String storagePath,  String mimeType,  int size,  String checksum,  DateTime createdAt,  DateTime updatedAt,  int refCount,  List<dynamic> usedBy,  String downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _AssetsRendition() when $default != null:
return $default(_that.id,_that.ownerId,_that.applicationId,_that.themeId,_that.kind,_that.sources,_that.storagePath,_that.mimeType,_that.size,_that.checksum,_that.createdAt,_that.updatedAt,_that.refCount,_that.usedBy,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetsRendition implements AssetsRendition {
  const _AssetsRendition({required this.id, required this.ownerId, required this.applicationId, required this.themeId, required this.kind, required final  List<AssetsRenditionSource> sources, required this.storagePath, required this.mimeType, required this.size, required this.checksum, required this.createdAt, required this.updatedAt, required this.refCount, required final  List<dynamic> usedBy, required this.downloadUrl}): _sources = sources,_usedBy = usedBy;
  factory _AssetsRendition.fromJson(Map<String, dynamic> json) => _$AssetsRenditionFromJson(json);

@override final  String id;
@override final  String ownerId;
@override final  String applicationId;
@override final  String themeId;
@override final  String kind;
 final  List<AssetsRenditionSource> _sources;
@override List<AssetsRenditionSource> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

@override final  String storagePath;
@override final  String mimeType;
@override final  int size;
@override final  String checksum;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int refCount;
 final  List<dynamic> _usedBy;
@override List<dynamic> get usedBy {
  if (_usedBy is EqualUnmodifiableListView) return _usedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usedBy);
}

@override final  String downloadUrl;

/// Create a copy of AssetsRendition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetsRenditionCopyWith<_AssetsRendition> get copyWith => __$AssetsRenditionCopyWithImpl<_AssetsRendition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetsRenditionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetsRendition&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.refCount, refCount) || other.refCount == refCount)&&const DeepCollectionEquality().equals(other._usedBy, _usedBy)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,applicationId,themeId,kind,const DeepCollectionEquality().hash(_sources),storagePath,mimeType,size,checksum,createdAt,updatedAt,refCount,const DeepCollectionEquality().hash(_usedBy),downloadUrl);

@override
String toString() {
  return 'AssetsRendition(id: $id, ownerId: $ownerId, applicationId: $applicationId, themeId: $themeId, kind: $kind, sources: $sources, storagePath: $storagePath, mimeType: $mimeType, size: $size, checksum: $checksum, createdAt: $createdAt, updatedAt: $updatedAt, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$AssetsRenditionCopyWith<$Res> implements $AssetsRenditionCopyWith<$Res> {
  factory _$AssetsRenditionCopyWith(_AssetsRendition value, $Res Function(_AssetsRendition) _then) = __$AssetsRenditionCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String applicationId, String themeId, String kind, List<AssetsRenditionSource> sources, String storagePath, String mimeType, int size, String checksum, DateTime createdAt, DateTime updatedAt, int refCount, List<dynamic> usedBy, String downloadUrl
});




}
/// @nodoc
class __$AssetsRenditionCopyWithImpl<$Res>
    implements _$AssetsRenditionCopyWith<$Res> {
  __$AssetsRenditionCopyWithImpl(this._self, this._then);

  final _AssetsRendition _self;
  final $Res Function(_AssetsRendition) _then;

/// Create a copy of AssetsRendition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? applicationId = null,Object? themeId = null,Object? kind = null,Object? sources = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? checksum = null,Object? createdAt = null,Object? updatedAt = null,Object? refCount = null,Object? usedBy = null,Object? downloadUrl = null,}) {
  return _then(_AssetsRendition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<AssetsRenditionSource>,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,checksum: null == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,usedBy: null == usedBy ? _self._usedBy : usedBy // ignore: cast_nullable_to_non_nullable
as List<dynamic>,downloadUrl: null == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AssetsRenditionSource {

 String get type; String get id;
/// Create a copy of AssetsRenditionSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetsRenditionSourceCopyWith<AssetsRenditionSource> get copyWith => _$AssetsRenditionSourceCopyWithImpl<AssetsRenditionSource>(this as AssetsRenditionSource, _$identity);

  /// Serializes this AssetsRenditionSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetsRenditionSource&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'AssetsRenditionSource(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class $AssetsRenditionSourceCopyWith<$Res>  {
  factory $AssetsRenditionSourceCopyWith(AssetsRenditionSource value, $Res Function(AssetsRenditionSource) _then) = _$AssetsRenditionSourceCopyWithImpl;
@useResult
$Res call({
 String type, String id
});




}
/// @nodoc
class _$AssetsRenditionSourceCopyWithImpl<$Res>
    implements $AssetsRenditionSourceCopyWith<$Res> {
  _$AssetsRenditionSourceCopyWithImpl(this._self, this._then);

  final AssetsRenditionSource _self;
  final $Res Function(AssetsRenditionSource) _then;

/// Create a copy of AssetsRenditionSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetsRenditionSource].
extension AssetsRenditionSourcePatterns on AssetsRenditionSource {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetsRenditionSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetsRenditionSource() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetsRenditionSource value)  $default,){
final _that = this;
switch (_that) {
case _AssetsRenditionSource():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetsRenditionSource value)?  $default,){
final _that = this;
switch (_that) {
case _AssetsRenditionSource() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetsRenditionSource() when $default != null:
return $default(_that.type,_that.id);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String id)  $default,) {final _that = this;
switch (_that) {
case _AssetsRenditionSource():
return $default(_that.type,_that.id);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String id)?  $default,) {final _that = this;
switch (_that) {
case _AssetsRenditionSource() when $default != null:
return $default(_that.type,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetsRenditionSource implements AssetsRenditionSource {
  const _AssetsRenditionSource({required this.type, required this.id});
  factory _AssetsRenditionSource.fromJson(Map<String, dynamic> json) => _$AssetsRenditionSourceFromJson(json);

@override final  String type;
@override final  String id;

/// Create a copy of AssetsRenditionSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetsRenditionSourceCopyWith<_AssetsRenditionSource> get copyWith => __$AssetsRenditionSourceCopyWithImpl<_AssetsRenditionSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetsRenditionSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetsRenditionSource&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'AssetsRenditionSource(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AssetsRenditionSourceCopyWith<$Res> implements $AssetsRenditionSourceCopyWith<$Res> {
  factory _$AssetsRenditionSourceCopyWith(_AssetsRenditionSource value, $Res Function(_AssetsRenditionSource) _then) = __$AssetsRenditionSourceCopyWithImpl;
@override @useResult
$Res call({
 String type, String id
});




}
/// @nodoc
class __$AssetsRenditionSourceCopyWithImpl<$Res>
    implements _$AssetsRenditionSourceCopyWith<$Res> {
  __$AssetsRenditionSourceCopyWithImpl(this._self, this._then);

  final _AssetsRenditionSource _self;
  final $Res Function(_AssetsRenditionSource) _then;

/// Create a copy of AssetsRenditionSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,}) {
  return _then(_AssetsRenditionSource(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
