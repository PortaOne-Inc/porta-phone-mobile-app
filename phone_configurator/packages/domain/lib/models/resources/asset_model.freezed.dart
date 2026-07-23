// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetModel {

 String get id; String get ownerId; String get storagePath; String get mimeType; int get size; DateTime get createdAt; DateTime get updatedAt; String? get checksum; int get refCount; List<AssetLink> get usedBy; String? get downloadUrl;
/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetModelCopyWith<AssetModel> get copyWith => _$AssetModelCopyWithImpl<AssetModel>(this as AssetModel, _$identity);

  /// Serializes this AssetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.refCount, refCount) || other.refCount == refCount)&&const DeepCollectionEquality().equals(other.usedBy, usedBy)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,storagePath,mimeType,size,createdAt,updatedAt,checksum,refCount,const DeepCollectionEquality().hash(usedBy),downloadUrl);

@override
String toString() {
  return 'AssetModel(id: $id, ownerId: $ownerId, storagePath: $storagePath, mimeType: $mimeType, size: $size, createdAt: $createdAt, updatedAt: $updatedAt, checksum: $checksum, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $AssetModelCopyWith<$Res>  {
  factory $AssetModelCopyWith(AssetModel value, $Res Function(AssetModel) _then) = _$AssetModelCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String storagePath, String mimeType, int size, DateTime createdAt, DateTime updatedAt, String? checksum, int refCount, List<AssetLink> usedBy, String? downloadUrl
});




}
/// @nodoc
class _$AssetModelCopyWithImpl<$Res>
    implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._self, this._then);

  final AssetModel _self;
  final $Res Function(AssetModel) _then;

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? createdAt = null,Object? updatedAt = null,Object? checksum = freezed,Object? refCount = null,Object? usedBy = null,Object? downloadUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,usedBy: null == usedBy ? _self.usedBy : usedBy // ignore: cast_nullable_to_non_nullable
as List<AssetLink>,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetModel].
extension AssetModelPatterns on AssetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetModel value)  $default,){
final _that = this;
switch (_that) {
case _AssetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String storagePath,  String mimeType,  int size,  DateTime createdAt,  DateTime updatedAt,  String? checksum,  int refCount,  List<AssetLink> usedBy,  String? downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
return $default(_that.id,_that.ownerId,_that.storagePath,_that.mimeType,_that.size,_that.createdAt,_that.updatedAt,_that.checksum,_that.refCount,_that.usedBy,_that.downloadUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String storagePath,  String mimeType,  int size,  DateTime createdAt,  DateTime updatedAt,  String? checksum,  int refCount,  List<AssetLink> usedBy,  String? downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _AssetModel():
return $default(_that.id,_that.ownerId,_that.storagePath,_that.mimeType,_that.size,_that.createdAt,_that.updatedAt,_that.checksum,_that.refCount,_that.usedBy,_that.downloadUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String storagePath,  String mimeType,  int size,  DateTime createdAt,  DateTime updatedAt,  String? checksum,  int refCount,  List<AssetLink> usedBy,  String? downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
return $default(_that.id,_that.ownerId,_that.storagePath,_that.mimeType,_that.size,_that.createdAt,_that.updatedAt,_that.checksum,_that.refCount,_that.usedBy,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetModel implements AssetModel {
  const _AssetModel({required this.id, required this.ownerId, required this.storagePath, required this.mimeType, required this.size, required this.createdAt, required this.updatedAt, this.checksum, this.refCount = 0, final  List<AssetLink> usedBy = const <AssetLink>[], this.downloadUrl}): _usedBy = usedBy;
  factory _AssetModel.fromJson(Map<String, dynamic> json) => _$AssetModelFromJson(json);

@override final  String id;
@override final  String ownerId;
@override final  String storagePath;
@override final  String mimeType;
@override final  int size;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? checksum;
@override@JsonKey() final  int refCount;
 final  List<AssetLink> _usedBy;
@override@JsonKey() List<AssetLink> get usedBy {
  if (_usedBy is EqualUnmodifiableListView) return _usedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usedBy);
}

@override final  String? downloadUrl;

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetModelCopyWith<_AssetModel> get copyWith => __$AssetModelCopyWithImpl<_AssetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.refCount, refCount) || other.refCount == refCount)&&const DeepCollectionEquality().equals(other._usedBy, _usedBy)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,storagePath,mimeType,size,createdAt,updatedAt,checksum,refCount,const DeepCollectionEquality().hash(_usedBy),downloadUrl);

@override
String toString() {
  return 'AssetModel(id: $id, ownerId: $ownerId, storagePath: $storagePath, mimeType: $mimeType, size: $size, createdAt: $createdAt, updatedAt: $updatedAt, checksum: $checksum, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$AssetModelCopyWith<$Res> implements $AssetModelCopyWith<$Res> {
  factory _$AssetModelCopyWith(_AssetModel value, $Res Function(_AssetModel) _then) = __$AssetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String storagePath, String mimeType, int size, DateTime createdAt, DateTime updatedAt, String? checksum, int refCount, List<AssetLink> usedBy, String? downloadUrl
});




}
/// @nodoc
class __$AssetModelCopyWithImpl<$Res>
    implements _$AssetModelCopyWith<$Res> {
  __$AssetModelCopyWithImpl(this._self, this._then);

  final _AssetModel _self;
  final $Res Function(_AssetModel) _then;

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? createdAt = null,Object? updatedAt = null,Object? checksum = freezed,Object? refCount = null,Object? usedBy = null,Object? downloadUrl = freezed,}) {
  return _then(_AssetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,usedBy: null == usedBy ? _self._usedBy : usedBy // ignore: cast_nullable_to_non_nullable
as List<AssetLink>,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
