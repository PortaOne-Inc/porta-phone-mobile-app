// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponseDTO {

 String get status; set status(String value); String get token; set token(String value);
/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseDTOCopyWith<AuthResponseDTO> get copyWith => _$AuthResponseDTOCopyWithImpl<AuthResponseDTO>(this as AuthResponseDTO, _$identity);

  /// Serializes this AuthResponseDTO to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'AuthResponseDTO(status: $status, token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthResponseDTOCopyWith<$Res>  {
  factory $AuthResponseDTOCopyWith(AuthResponseDTO value, $Res Function(AuthResponseDTO) _then) = _$AuthResponseDTOCopyWithImpl;
@useResult
$Res call({
 String status, String token
});




}
/// @nodoc
class _$AuthResponseDTOCopyWithImpl<$Res>
    implements $AuthResponseDTOCopyWith<$Res> {
  _$AuthResponseDTOCopyWithImpl(this._self, this._then);

  final AuthResponseDTO _self;
  final $Res Function(AuthResponseDTO) _then;

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? token = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthResponseDTO].
extension AuthResponseDTOPatterns on AuthResponseDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseDTO value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
return $default(_that.status,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String token)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDTO():
return $default(_that.status,_that.token);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String token)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
return $default(_that.status,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponseDTO implements AuthResponseDTO {
   _AuthResponseDTO({required this.status, required this.token});
  factory _AuthResponseDTO.fromJson(Map<String, dynamic> json) => _$AuthResponseDTOFromJson(json);

@override  String status;
@override  String token;

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseDTOCopyWith<_AuthResponseDTO> get copyWith => __$AuthResponseDTOCopyWithImpl<_AuthResponseDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseDTOToJson(this, );
}



@override
String toString() {
  return 'AuthResponseDTO(status: $status, token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseDTOCopyWith<$Res> implements $AuthResponseDTOCopyWith<$Res> {
  factory _$AuthResponseDTOCopyWith(_AuthResponseDTO value, $Res Function(_AuthResponseDTO) _then) = __$AuthResponseDTOCopyWithImpl;
@override @useResult
$Res call({
 String status, String token
});




}
/// @nodoc
class __$AuthResponseDTOCopyWithImpl<$Res>
    implements _$AuthResponseDTOCopyWith<$Res> {
  __$AuthResponseDTOCopyWithImpl(this._self, this._then);

  final _AuthResponseDTO _self;
  final $Res Function(_AuthResponseDTO) _then;

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? token = null,}) {
  return _then(_AuthResponseDTO(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
