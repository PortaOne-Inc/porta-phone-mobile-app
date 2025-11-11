// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserMetadata {

 String get id; set id(String value); String get email; set email(String value); String get jwtToken; set jwtToken(String value); DateTime? get expiredTime; set expiredTime(DateTime? value);
/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMetadataCopyWith<UserMetadata> get copyWith => _$UserMetadataCopyWithImpl<UserMetadata>(this as UserMetadata, _$identity);





@override
String toString() {
  return 'UserMetadata(id: $id, email: $email, jwtToken: $jwtToken, expiredTime: $expiredTime)';
}


}

/// @nodoc
abstract mixin class $UserMetadataCopyWith<$Res>  {
  factory $UserMetadataCopyWith(UserMetadata value, $Res Function(UserMetadata) _then) = _$UserMetadataCopyWithImpl;
@useResult
$Res call({
 String id, String email, String jwtToken, DateTime? expiredTime
});




}
/// @nodoc
class _$UserMetadataCopyWithImpl<$Res>
    implements $UserMetadataCopyWith<$Res> {
  _$UserMetadataCopyWithImpl(this._self, this._then);

  final UserMetadata _self;
  final $Res Function(UserMetadata) _then;

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? jwtToken = null,Object? expiredTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,jwtToken: null == jwtToken ? _self.jwtToken : jwtToken // ignore: cast_nullable_to_non_nullable
as String,expiredTime: freezed == expiredTime ? _self.expiredTime : expiredTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserMetadata].
extension UserMetadataPatterns on UserMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMetadata value)  $default,){
final _that = this;
switch (_that) {
case _UserMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String jwtToken,  DateTime? expiredTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
return $default(_that.id,_that.email,_that.jwtToken,_that.expiredTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String jwtToken,  DateTime? expiredTime)  $default,) {final _that = this;
switch (_that) {
case _UserMetadata():
return $default(_that.id,_that.email,_that.jwtToken,_that.expiredTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String jwtToken,  DateTime? expiredTime)?  $default,) {final _that = this;
switch (_that) {
case _UserMetadata() when $default != null:
return $default(_that.id,_that.email,_that.jwtToken,_that.expiredTime);case _:
  return null;

}
}

}

/// @nodoc


class _UserMetadata implements UserMetadata {
   _UserMetadata({required this.id, required this.email, required this.jwtToken, this.expiredTime});
  

@override  String id;
@override  String email;
@override  String jwtToken;
@override  DateTime? expiredTime;

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMetadataCopyWith<_UserMetadata> get copyWith => __$UserMetadataCopyWithImpl<_UserMetadata>(this, _$identity);





@override
String toString() {
  return 'UserMetadata(id: $id, email: $email, jwtToken: $jwtToken, expiredTime: $expiredTime)';
}


}

/// @nodoc
abstract mixin class _$UserMetadataCopyWith<$Res> implements $UserMetadataCopyWith<$Res> {
  factory _$UserMetadataCopyWith(_UserMetadata value, $Res Function(_UserMetadata) _then) = __$UserMetadataCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String jwtToken, DateTime? expiredTime
});




}
/// @nodoc
class __$UserMetadataCopyWithImpl<$Res>
    implements _$UserMetadataCopyWith<$Res> {
  __$UserMetadataCopyWithImpl(this._self, this._then);

  final _UserMetadata _self;
  final $Res Function(_UserMetadata) _then;

/// Create a copy of UserMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? jwtToken = null,Object? expiredTime = freezed,}) {
  return _then(_UserMetadata(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,jwtToken: null == jwtToken ? _self.jwtToken : jwtToken // ignore: cast_nullable_to_non_nullable
as String,expiredTime: freezed == expiredTime ? _self.expiredTime : expiredTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
