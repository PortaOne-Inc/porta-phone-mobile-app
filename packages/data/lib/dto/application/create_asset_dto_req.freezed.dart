// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_asset_dto_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAssetDtoReq {

 String get applicationId; String get storagePath; String get mimeType; int get size; String? get checksum;
/// Create a copy of CreateAssetDtoReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAssetDtoReqCopyWith<CreateAssetDtoReq> get copyWith => _$CreateAssetDtoReqCopyWithImpl<CreateAssetDtoReq>(this as CreateAssetDtoReq, _$identity);

  /// Serializes this CreateAssetDtoReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAssetDtoReq&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.checksum, checksum) || other.checksum == checksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,storagePath,mimeType,size,checksum);

@override
String toString() {
  return 'CreateAssetDtoReq(applicationId: $applicationId, storagePath: $storagePath, mimeType: $mimeType, size: $size, checksum: $checksum)';
}


}

/// @nodoc
abstract mixin class $CreateAssetDtoReqCopyWith<$Res>  {
  factory $CreateAssetDtoReqCopyWith(CreateAssetDtoReq value, $Res Function(CreateAssetDtoReq) _then) = _$CreateAssetDtoReqCopyWithImpl;
@useResult
$Res call({
 String applicationId, String storagePath, String mimeType, int size, String? checksum
});




}
/// @nodoc
class _$CreateAssetDtoReqCopyWithImpl<$Res>
    implements $CreateAssetDtoReqCopyWith<$Res> {
  _$CreateAssetDtoReqCopyWithImpl(this._self, this._then);

  final CreateAssetDtoReq _self;
  final $Res Function(CreateAssetDtoReq) _then;

/// Create a copy of CreateAssetDtoReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? checksum = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAssetDtoReq].
extension CreateAssetDtoReqPatterns on CreateAssetDtoReq {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAssetDtoReq value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAssetDtoReq() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAssetDtoReq value)  $default,){
final _that = this;
switch (_that) {
case _CreateAssetDtoReq():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAssetDtoReq value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAssetDtoReq() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String storagePath,  String mimeType,  int size,  String? checksum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAssetDtoReq() when $default != null:
return $default(_that.applicationId,_that.storagePath,_that.mimeType,_that.size,_that.checksum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String storagePath,  String mimeType,  int size,  String? checksum)  $default,) {final _that = this;
switch (_that) {
case _CreateAssetDtoReq():
return $default(_that.applicationId,_that.storagePath,_that.mimeType,_that.size,_that.checksum);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String storagePath,  String mimeType,  int size,  String? checksum)?  $default,) {final _that = this;
switch (_that) {
case _CreateAssetDtoReq() when $default != null:
return $default(_that.applicationId,_that.storagePath,_that.mimeType,_that.size,_that.checksum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAssetDtoReq implements CreateAssetDtoReq {
  const _CreateAssetDtoReq({required this.applicationId, required this.storagePath, required this.mimeType, required this.size, this.checksum});
  factory _CreateAssetDtoReq.fromJson(Map<String, dynamic> json) => _$CreateAssetDtoReqFromJson(json);

@override final  String applicationId;
@override final  String storagePath;
@override final  String mimeType;
@override final  int size;
@override final  String? checksum;

/// Create a copy of CreateAssetDtoReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAssetDtoReqCopyWith<_CreateAssetDtoReq> get copyWith => __$CreateAssetDtoReqCopyWithImpl<_CreateAssetDtoReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAssetDtoReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAssetDtoReq&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.checksum, checksum) || other.checksum == checksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,storagePath,mimeType,size,checksum);

@override
String toString() {
  return 'CreateAssetDtoReq(applicationId: $applicationId, storagePath: $storagePath, mimeType: $mimeType, size: $size, checksum: $checksum)';
}


}

/// @nodoc
abstract mixin class _$CreateAssetDtoReqCopyWith<$Res> implements $CreateAssetDtoReqCopyWith<$Res> {
  factory _$CreateAssetDtoReqCopyWith(_CreateAssetDtoReq value, $Res Function(_CreateAssetDtoReq) _then) = __$CreateAssetDtoReqCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String storagePath, String mimeType, int size, String? checksum
});




}
/// @nodoc
class __$CreateAssetDtoReqCopyWithImpl<$Res>
    implements _$CreateAssetDtoReqCopyWith<$Res> {
  __$CreateAssetDtoReqCopyWithImpl(this._self, this._then);

  final _CreateAssetDtoReq _self;
  final $Res Function(_CreateAssetDtoReq) _then;

/// Create a copy of CreateAssetDtoReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? storagePath = null,Object? mimeType = null,Object? size = null,Object? checksum = freezed,}) {
  return _then(_CreateAssetDtoReq(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
