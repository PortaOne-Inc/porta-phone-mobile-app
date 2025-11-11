// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetLinkDto {

 String get type; String get id;
/// Create a copy of AssetLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetLinkDtoCopyWith<AssetLinkDto> get copyWith => _$AssetLinkDtoCopyWithImpl<AssetLinkDto>(this as AssetLinkDto, _$identity);

  /// Serializes this AssetLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetLinkDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'AssetLinkDto(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class $AssetLinkDtoCopyWith<$Res>  {
  factory $AssetLinkDtoCopyWith(AssetLinkDto value, $Res Function(AssetLinkDto) _then) = _$AssetLinkDtoCopyWithImpl;
@useResult
$Res call({
 String type, String id
});




}
/// @nodoc
class _$AssetLinkDtoCopyWithImpl<$Res>
    implements $AssetLinkDtoCopyWith<$Res> {
  _$AssetLinkDtoCopyWithImpl(this._self, this._then);

  final AssetLinkDto _self;
  final $Res Function(AssetLinkDto) _then;

/// Create a copy of AssetLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetLinkDto].
extension AssetLinkDtoPatterns on AssetLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _AssetLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _AssetLinkDto() when $default != null:
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
case _AssetLinkDto() when $default != null:
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
case _AssetLinkDto():
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
case _AssetLinkDto() when $default != null:
return $default(_that.type,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetLinkDto implements AssetLinkDto {
  const _AssetLinkDto({required this.type, required this.id});
  factory _AssetLinkDto.fromJson(Map<String, dynamic> json) => _$AssetLinkDtoFromJson(json);

@override final  String type;
@override final  String id;

/// Create a copy of AssetLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetLinkDtoCopyWith<_AssetLinkDto> get copyWith => __$AssetLinkDtoCopyWithImpl<_AssetLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetLinkDto&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'AssetLinkDto(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AssetLinkDtoCopyWith<$Res> implements $AssetLinkDtoCopyWith<$Res> {
  factory _$AssetLinkDtoCopyWith(_AssetLinkDto value, $Res Function(_AssetLinkDto) _then) = __$AssetLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String id
});




}
/// @nodoc
class __$AssetLinkDtoCopyWithImpl<$Res>
    implements _$AssetLinkDtoCopyWith<$Res> {
  __$AssetLinkDtoCopyWithImpl(this._self, this._then);

  final _AssetLinkDto _self;
  final $Res Function(_AssetLinkDto) _then;

/// Create a copy of AssetLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,}) {
  return _then(_AssetLinkDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AssetDTO {

 String get id; String get ownerId; String get storagePath; String get mimeType; int get size; String get createdAt; String get updatedAt; String? get checksum; int get refCount; List<AssetLinkDto> get usedBy; String? get downloadUrl;
/// Create a copy of AssetDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetDTOCopyWith<AssetDTO> get copyWith => _$AssetDTOCopyWithImpl<AssetDTO>(this as AssetDTO, _$identity);

  /// Serializes this AssetDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.refCount, refCount) || other.refCount == refCount)&&const DeepCollectionEquality().equals(other.usedBy, usedBy)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,storagePath,mimeType,size,createdAt,updatedAt,checksum,refCount,const DeepCollectionEquality().hash(usedBy),downloadUrl);

@override
String toString() {
  return 'AssetDTO(id: $id, ownerId: $ownerId, storagePath: $storagePath, mimeType: $mimeType, size: $size, createdAt: $createdAt, updatedAt: $updatedAt, checksum: $checksum, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class $AssetDTOCopyWith<$Res>  {
  factory $AssetDTOCopyWith(AssetDTO value, $Res Function(AssetDTO) _then) = _$AssetDTOCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String storagePath, String mimeType, int size, String createdAt, String updatedAt, String? checksum, int refCount, List<AssetLinkDto> usedBy, String? downloadUrl
});




}
/// @nodoc
class _$AssetDTOCopyWithImpl<$Res>
    implements $AssetDTOCopyWith<$Res> {
  _$AssetDTOCopyWithImpl(this._self, this._then);

  final AssetDTO _self;
  final $Res Function(AssetDTO) _then;

/// Create a copy of AssetDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? createdAt = null,Object? updatedAt = null,Object? checksum = freezed,Object? refCount = null,Object? usedBy = null,Object? downloadUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,usedBy: null == usedBy ? _self.usedBy : usedBy // ignore: cast_nullable_to_non_nullable
as List<AssetLinkDto>,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetDTO].
extension AssetDTOPatterns on AssetDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetDTO value)  $default,){
final _that = this;
switch (_that) {
case _AssetDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AssetDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String storagePath,  String mimeType,  int size,  String createdAt,  String updatedAt,  String? checksum,  int refCount,  List<AssetLinkDto> usedBy,  String? downloadUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String storagePath,  String mimeType,  int size,  String createdAt,  String updatedAt,  String? checksum,  int refCount,  List<AssetLinkDto> usedBy,  String? downloadUrl)  $default,) {final _that = this;
switch (_that) {
case _AssetDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String storagePath,  String mimeType,  int size,  String createdAt,  String updatedAt,  String? checksum,  int refCount,  List<AssetLinkDto> usedBy,  String? downloadUrl)?  $default,) {final _that = this;
switch (_that) {
case _AssetDTO() when $default != null:
return $default(_that.id,_that.ownerId,_that.storagePath,_that.mimeType,_that.size,_that.createdAt,_that.updatedAt,_that.checksum,_that.refCount,_that.usedBy,_that.downloadUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _AssetDTO extends AssetDTO {
  const _AssetDTO({required this.id, required this.ownerId, required this.storagePath, required this.mimeType, required this.size, required this.createdAt, required this.updatedAt, this.checksum, this.refCount = 0, this.usedBy = const <AssetLinkDto>[], this.downloadUrl}): super._();
  factory _AssetDTO.fromJson(Map<String, dynamic> json) => _$AssetDTOFromJson(json);

@override final  String id;
@override final  String ownerId;
@override final  String storagePath;
@override final  String mimeType;
@override final  int size;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? checksum;
@override@JsonKey() final  int refCount;
@override@JsonKey() final  List<AssetLinkDto> usedBy;
@override final  String? downloadUrl;

/// Create a copy of AssetDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetDTOCopyWith<_AssetDTO> get copyWith => __$AssetDTOCopyWithImpl<_AssetDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.refCount, refCount) || other.refCount == refCount)&&const DeepCollectionEquality().equals(other.usedBy, usedBy)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,storagePath,mimeType,size,createdAt,updatedAt,checksum,refCount,const DeepCollectionEquality().hash(usedBy),downloadUrl);

@override
String toString() {
  return 'AssetDTO(id: $id, ownerId: $ownerId, storagePath: $storagePath, mimeType: $mimeType, size: $size, createdAt: $createdAt, updatedAt: $updatedAt, checksum: $checksum, refCount: $refCount, usedBy: $usedBy, downloadUrl: $downloadUrl)';
}


}

/// @nodoc
abstract mixin class _$AssetDTOCopyWith<$Res> implements $AssetDTOCopyWith<$Res> {
  factory _$AssetDTOCopyWith(_AssetDTO value, $Res Function(_AssetDTO) _then) = __$AssetDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String storagePath, String mimeType, int size, String createdAt, String updatedAt, String? checksum, int refCount, List<AssetLinkDto> usedBy, String? downloadUrl
});




}
/// @nodoc
class __$AssetDTOCopyWithImpl<$Res>
    implements _$AssetDTOCopyWith<$Res> {
  __$AssetDTOCopyWithImpl(this._self, this._then);

  final _AssetDTO _self;
  final $Res Function(_AssetDTO) _then;

/// Create a copy of AssetDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? createdAt = null,Object? updatedAt = null,Object? checksum = freezed,Object? refCount = null,Object? usedBy = null,Object? downloadUrl = freezed,}) {
  return _then(_AssetDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,refCount: null == refCount ? _self.refCount : refCount // ignore: cast_nullable_to_non_nullable
as int,usedBy: null == usedBy ? _self.usedBy : usedBy // ignore: cast_nullable_to_non_nullable
as List<AssetLinkDto>,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
