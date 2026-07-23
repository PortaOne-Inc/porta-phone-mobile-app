// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JwtPayload {

 String get iss; set iss(String value); String get aud; set aud(String value);// ignore: invalid_annotation_target
@JsonKey(name: 'auth_time')@TimestampConverter() DateTime get authTime;// ignore: invalid_annotation_target
@JsonKey(name: 'auth_time')@TimestampConverter() set authTime(DateTime value);// ignore: invalid_annotation_target
@JsonKey(name: 'user_id') String get userId;// ignore: invalid_annotation_target
@JsonKey(name: 'user_id') set userId(String value); String get sub; set sub(String value);@TimestampConverter() DateTime get iat;@TimestampConverter() set iat(DateTime value);@TimestampConverter() DateTime get exp;@TimestampConverter() set exp(DateTime value); String get email; set email(String value);// ignore: invalid_annotation_target
@JsonKey(name: 'email_verified') bool get emailVerified;// ignore: invalid_annotation_target
@JsonKey(name: 'email_verified') set emailVerified(bool value); JwtPayloadFirebase get firebase; set firebase(JwtPayloadFirebase value);
/// Create a copy of JwtPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JwtPayloadCopyWith<JwtPayload> get copyWith => _$JwtPayloadCopyWithImpl<JwtPayload>(this as JwtPayload, _$identity);

  /// Serializes this JwtPayload to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'JwtPayload(iss: $iss, aud: $aud, authTime: $authTime, userId: $userId, sub: $sub, iat: $iat, exp: $exp, email: $email, emailVerified: $emailVerified, firebase: $firebase)';
}


}

/// @nodoc
abstract mixin class $JwtPayloadCopyWith<$Res>  {
  factory $JwtPayloadCopyWith(JwtPayload value, $Res Function(JwtPayload) _then) = _$JwtPayloadCopyWithImpl;
@useResult
$Res call({
 String iss, String aud,@JsonKey(name: 'auth_time')@TimestampConverter() DateTime authTime,@JsonKey(name: 'user_id') String userId, String sub,@TimestampConverter() DateTime iat,@TimestampConverter() DateTime exp, String email,@JsonKey(name: 'email_verified') bool emailVerified, JwtPayloadFirebase firebase
});


$JwtPayloadFirebaseCopyWith<$Res> get firebase;

}
/// @nodoc
class _$JwtPayloadCopyWithImpl<$Res>
    implements $JwtPayloadCopyWith<$Res> {
  _$JwtPayloadCopyWithImpl(this._self, this._then);

  final JwtPayload _self;
  final $Res Function(JwtPayload) _then;

/// Create a copy of JwtPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iss = null,Object? aud = null,Object? authTime = null,Object? userId = null,Object? sub = null,Object? iat = null,Object? exp = null,Object? email = null,Object? emailVerified = null,Object? firebase = null,}) {
  return _then(_self.copyWith(
iss: null == iss ? _self.iss : iss // ignore: cast_nullable_to_non_nullable
as String,aud: null == aud ? _self.aud : aud // ignore: cast_nullable_to_non_nullable
as String,authTime: null == authTime ? _self.authTime : authTime // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,iat: null == iat ? _self.iat : iat // ignore: cast_nullable_to_non_nullable
as DateTime,exp: null == exp ? _self.exp : exp // ignore: cast_nullable_to_non_nullable
as DateTime,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,firebase: null == firebase ? _self.firebase : firebase // ignore: cast_nullable_to_non_nullable
as JwtPayloadFirebase,
  ));
}
/// Create a copy of JwtPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtPayloadFirebaseCopyWith<$Res> get firebase {
  
  return $JwtPayloadFirebaseCopyWith<$Res>(_self.firebase, (value) {
    return _then(_self.copyWith(firebase: value));
  });
}
}


/// Adds pattern-matching-related methods to [JwtPayload].
extension JwtPayloadPatterns on JwtPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JwtPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JwtPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JwtPayload value)  $default,){
final _that = this;
switch (_that) {
case _JwtPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JwtPayload value)?  $default,){
final _that = this;
switch (_that) {
case _JwtPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String iss,  String aud, @JsonKey(name: 'auth_time')@TimestampConverter()  DateTime authTime, @JsonKey(name: 'user_id')  String userId,  String sub, @TimestampConverter()  DateTime iat, @TimestampConverter()  DateTime exp,  String email, @JsonKey(name: 'email_verified')  bool emailVerified,  JwtPayloadFirebase firebase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JwtPayload() when $default != null:
return $default(_that.iss,_that.aud,_that.authTime,_that.userId,_that.sub,_that.iat,_that.exp,_that.email,_that.emailVerified,_that.firebase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String iss,  String aud, @JsonKey(name: 'auth_time')@TimestampConverter()  DateTime authTime, @JsonKey(name: 'user_id')  String userId,  String sub, @TimestampConverter()  DateTime iat, @TimestampConverter()  DateTime exp,  String email, @JsonKey(name: 'email_verified')  bool emailVerified,  JwtPayloadFirebase firebase)  $default,) {final _that = this;
switch (_that) {
case _JwtPayload():
return $default(_that.iss,_that.aud,_that.authTime,_that.userId,_that.sub,_that.iat,_that.exp,_that.email,_that.emailVerified,_that.firebase);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String iss,  String aud, @JsonKey(name: 'auth_time')@TimestampConverter()  DateTime authTime, @JsonKey(name: 'user_id')  String userId,  String sub, @TimestampConverter()  DateTime iat, @TimestampConverter()  DateTime exp,  String email, @JsonKey(name: 'email_verified')  bool emailVerified,  JwtPayloadFirebase firebase)?  $default,) {final _that = this;
switch (_that) {
case _JwtPayload() when $default != null:
return $default(_that.iss,_that.aud,_that.authTime,_that.userId,_that.sub,_that.iat,_that.exp,_that.email,_that.emailVerified,_that.firebase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JwtPayload implements JwtPayload {
   _JwtPayload({required this.iss, required this.aud, @JsonKey(name: 'auth_time')@TimestampConverter() required this.authTime, @JsonKey(name: 'user_id') required this.userId, required this.sub, @TimestampConverter() required this.iat, @TimestampConverter() required this.exp, required this.email, @JsonKey(name: 'email_verified') required this.emailVerified, required this.firebase});
  factory _JwtPayload.fromJson(Map<String, dynamic> json) => _$JwtPayloadFromJson(json);

@override  String iss;
@override  String aud;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'auth_time')@TimestampConverter()  DateTime authTime;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'user_id')  String userId;
@override  String sub;
@override@TimestampConverter()  DateTime iat;
@override@TimestampConverter()  DateTime exp;
@override  String email;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'email_verified')  bool emailVerified;
@override  JwtPayloadFirebase firebase;

/// Create a copy of JwtPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JwtPayloadCopyWith<_JwtPayload> get copyWith => __$JwtPayloadCopyWithImpl<_JwtPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JwtPayloadToJson(this, );
}



@override
String toString() {
  return 'JwtPayload(iss: $iss, aud: $aud, authTime: $authTime, userId: $userId, sub: $sub, iat: $iat, exp: $exp, email: $email, emailVerified: $emailVerified, firebase: $firebase)';
}


}

/// @nodoc
abstract mixin class _$JwtPayloadCopyWith<$Res> implements $JwtPayloadCopyWith<$Res> {
  factory _$JwtPayloadCopyWith(_JwtPayload value, $Res Function(_JwtPayload) _then) = __$JwtPayloadCopyWithImpl;
@override @useResult
$Res call({
 String iss, String aud,@JsonKey(name: 'auth_time')@TimestampConverter() DateTime authTime,@JsonKey(name: 'user_id') String userId, String sub,@TimestampConverter() DateTime iat,@TimestampConverter() DateTime exp, String email,@JsonKey(name: 'email_verified') bool emailVerified, JwtPayloadFirebase firebase
});


@override $JwtPayloadFirebaseCopyWith<$Res> get firebase;

}
/// @nodoc
class __$JwtPayloadCopyWithImpl<$Res>
    implements _$JwtPayloadCopyWith<$Res> {
  __$JwtPayloadCopyWithImpl(this._self, this._then);

  final _JwtPayload _self;
  final $Res Function(_JwtPayload) _then;

/// Create a copy of JwtPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iss = null,Object? aud = null,Object? authTime = null,Object? userId = null,Object? sub = null,Object? iat = null,Object? exp = null,Object? email = null,Object? emailVerified = null,Object? firebase = null,}) {
  return _then(_JwtPayload(
iss: null == iss ? _self.iss : iss // ignore: cast_nullable_to_non_nullable
as String,aud: null == aud ? _self.aud : aud // ignore: cast_nullable_to_non_nullable
as String,authTime: null == authTime ? _self.authTime : authTime // ignore: cast_nullable_to_non_nullable
as DateTime,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,iat: null == iat ? _self.iat : iat // ignore: cast_nullable_to_non_nullable
as DateTime,exp: null == exp ? _self.exp : exp // ignore: cast_nullable_to_non_nullable
as DateTime,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,firebase: null == firebase ? _self.firebase : firebase // ignore: cast_nullable_to_non_nullable
as JwtPayloadFirebase,
  ));
}

/// Create a copy of JwtPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtPayloadFirebaseCopyWith<$Res> get firebase {
  
  return $JwtPayloadFirebaseCopyWith<$Res>(_self.firebase, (value) {
    return _then(_self.copyWith(firebase: value));
  });
}
}


/// @nodoc
mixin _$JwtPayloadFirebase {

 JwtPayloadFirebaseIdentities get identities; set identities(JwtPayloadFirebaseIdentities value);// ignore: invalid_annotation_target
@JsonKey(name: 'sign_in_provider') String get signInProvider;// ignore: invalid_annotation_target
@JsonKey(name: 'sign_in_provider') set signInProvider(String value);
/// Create a copy of JwtPayloadFirebase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JwtPayloadFirebaseCopyWith<JwtPayloadFirebase> get copyWith => _$JwtPayloadFirebaseCopyWithImpl<JwtPayloadFirebase>(this as JwtPayloadFirebase, _$identity);

  /// Serializes this JwtPayloadFirebase to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'JwtPayloadFirebase(identities: $identities, signInProvider: $signInProvider)';
}


}

/// @nodoc
abstract mixin class $JwtPayloadFirebaseCopyWith<$Res>  {
  factory $JwtPayloadFirebaseCopyWith(JwtPayloadFirebase value, $Res Function(JwtPayloadFirebase) _then) = _$JwtPayloadFirebaseCopyWithImpl;
@useResult
$Res call({
 JwtPayloadFirebaseIdentities identities,@JsonKey(name: 'sign_in_provider') String signInProvider
});


$JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities;

}
/// @nodoc
class _$JwtPayloadFirebaseCopyWithImpl<$Res>
    implements $JwtPayloadFirebaseCopyWith<$Res> {
  _$JwtPayloadFirebaseCopyWithImpl(this._self, this._then);

  final JwtPayloadFirebase _self;
  final $Res Function(JwtPayloadFirebase) _then;

/// Create a copy of JwtPayloadFirebase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? identities = null,Object? signInProvider = null,}) {
  return _then(_self.copyWith(
identities: null == identities ? _self.identities : identities // ignore: cast_nullable_to_non_nullable
as JwtPayloadFirebaseIdentities,signInProvider: null == signInProvider ? _self.signInProvider : signInProvider // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of JwtPayloadFirebase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities {
  
  return $JwtPayloadFirebaseIdentitiesCopyWith<$Res>(_self.identities, (value) {
    return _then(_self.copyWith(identities: value));
  });
}
}


/// Adds pattern-matching-related methods to [JwtPayloadFirebase].
extension JwtPayloadFirebasePatterns on JwtPayloadFirebase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JwtPayloadFirebase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JwtPayloadFirebase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JwtPayloadFirebase value)  $default,){
final _that = this;
switch (_that) {
case _JwtPayloadFirebase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JwtPayloadFirebase value)?  $default,){
final _that = this;
switch (_that) {
case _JwtPayloadFirebase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JwtPayloadFirebaseIdentities identities, @JsonKey(name: 'sign_in_provider')  String signInProvider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JwtPayloadFirebase() when $default != null:
return $default(_that.identities,_that.signInProvider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JwtPayloadFirebaseIdentities identities, @JsonKey(name: 'sign_in_provider')  String signInProvider)  $default,) {final _that = this;
switch (_that) {
case _JwtPayloadFirebase():
return $default(_that.identities,_that.signInProvider);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JwtPayloadFirebaseIdentities identities, @JsonKey(name: 'sign_in_provider')  String signInProvider)?  $default,) {final _that = this;
switch (_that) {
case _JwtPayloadFirebase() when $default != null:
return $default(_that.identities,_that.signInProvider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JwtPayloadFirebase implements JwtPayloadFirebase {
   _JwtPayloadFirebase({required this.identities, @JsonKey(name: 'sign_in_provider') required this.signInProvider});
  factory _JwtPayloadFirebase.fromJson(Map<String, dynamic> json) => _$JwtPayloadFirebaseFromJson(json);

@override  JwtPayloadFirebaseIdentities identities;
// ignore: invalid_annotation_target
@override@JsonKey(name: 'sign_in_provider')  String signInProvider;

/// Create a copy of JwtPayloadFirebase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JwtPayloadFirebaseCopyWith<_JwtPayloadFirebase> get copyWith => __$JwtPayloadFirebaseCopyWithImpl<_JwtPayloadFirebase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JwtPayloadFirebaseToJson(this, );
}



@override
String toString() {
  return 'JwtPayloadFirebase(identities: $identities, signInProvider: $signInProvider)';
}


}

/// @nodoc
abstract mixin class _$JwtPayloadFirebaseCopyWith<$Res> implements $JwtPayloadFirebaseCopyWith<$Res> {
  factory _$JwtPayloadFirebaseCopyWith(_JwtPayloadFirebase value, $Res Function(_JwtPayloadFirebase) _then) = __$JwtPayloadFirebaseCopyWithImpl;
@override @useResult
$Res call({
 JwtPayloadFirebaseIdentities identities,@JsonKey(name: 'sign_in_provider') String signInProvider
});


@override $JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities;

}
/// @nodoc
class __$JwtPayloadFirebaseCopyWithImpl<$Res>
    implements _$JwtPayloadFirebaseCopyWith<$Res> {
  __$JwtPayloadFirebaseCopyWithImpl(this._self, this._then);

  final _JwtPayloadFirebase _self;
  final $Res Function(_JwtPayloadFirebase) _then;

/// Create a copy of JwtPayloadFirebase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? identities = null,Object? signInProvider = null,}) {
  return _then(_JwtPayloadFirebase(
identities: null == identities ? _self.identities : identities // ignore: cast_nullable_to_non_nullable
as JwtPayloadFirebaseIdentities,signInProvider: null == signInProvider ? _self.signInProvider : signInProvider // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of JwtPayloadFirebase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities {
  
  return $JwtPayloadFirebaseIdentitiesCopyWith<$Res>(_self.identities, (value) {
    return _then(_self.copyWith(identities: value));
  });
}
}


/// @nodoc
mixin _$JwtPayloadFirebaseIdentities {

 List<String> get email; set email(List<String> value);
/// Create a copy of JwtPayloadFirebaseIdentities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JwtPayloadFirebaseIdentitiesCopyWith<JwtPayloadFirebaseIdentities> get copyWith => _$JwtPayloadFirebaseIdentitiesCopyWithImpl<JwtPayloadFirebaseIdentities>(this as JwtPayloadFirebaseIdentities, _$identity);

  /// Serializes this JwtPayloadFirebaseIdentities to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'JwtPayloadFirebaseIdentities(email: $email)';
}


}

/// @nodoc
abstract mixin class $JwtPayloadFirebaseIdentitiesCopyWith<$Res>  {
  factory $JwtPayloadFirebaseIdentitiesCopyWith(JwtPayloadFirebaseIdentities value, $Res Function(JwtPayloadFirebaseIdentities) _then) = _$JwtPayloadFirebaseIdentitiesCopyWithImpl;
@useResult
$Res call({
 List<String> email
});




}
/// @nodoc
class _$JwtPayloadFirebaseIdentitiesCopyWithImpl<$Res>
    implements $JwtPayloadFirebaseIdentitiesCopyWith<$Res> {
  _$JwtPayloadFirebaseIdentitiesCopyWithImpl(this._self, this._then);

  final JwtPayloadFirebaseIdentities _self;
  final $Res Function(JwtPayloadFirebaseIdentities) _then;

/// Create a copy of JwtPayloadFirebaseIdentities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [JwtPayloadFirebaseIdentities].
extension JwtPayloadFirebaseIdentitiesPatterns on JwtPayloadFirebaseIdentities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JwtPayloadFirebaseIdentities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JwtPayloadFirebaseIdentities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JwtPayloadFirebaseIdentities value)  $default,){
final _that = this;
switch (_that) {
case _JwtPayloadFirebaseIdentities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JwtPayloadFirebaseIdentities value)?  $default,){
final _that = this;
switch (_that) {
case _JwtPayloadFirebaseIdentities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JwtPayloadFirebaseIdentities() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> email)  $default,) {final _that = this;
switch (_that) {
case _JwtPayloadFirebaseIdentities():
return $default(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> email)?  $default,) {final _that = this;
switch (_that) {
case _JwtPayloadFirebaseIdentities() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JwtPayloadFirebaseIdentities implements JwtPayloadFirebaseIdentities {
   _JwtPayloadFirebaseIdentities({required this.email});
  factory _JwtPayloadFirebaseIdentities.fromJson(Map<String, dynamic> json) => _$JwtPayloadFirebaseIdentitiesFromJson(json);

@override  List<String> email;

/// Create a copy of JwtPayloadFirebaseIdentities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JwtPayloadFirebaseIdentitiesCopyWith<_JwtPayloadFirebaseIdentities> get copyWith => __$JwtPayloadFirebaseIdentitiesCopyWithImpl<_JwtPayloadFirebaseIdentities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JwtPayloadFirebaseIdentitiesToJson(this, );
}



@override
String toString() {
  return 'JwtPayloadFirebaseIdentities(email: $email)';
}


}

/// @nodoc
abstract mixin class _$JwtPayloadFirebaseIdentitiesCopyWith<$Res> implements $JwtPayloadFirebaseIdentitiesCopyWith<$Res> {
  factory _$JwtPayloadFirebaseIdentitiesCopyWith(_JwtPayloadFirebaseIdentities value, $Res Function(_JwtPayloadFirebaseIdentities) _then) = __$JwtPayloadFirebaseIdentitiesCopyWithImpl;
@override @useResult
$Res call({
 List<String> email
});




}
/// @nodoc
class __$JwtPayloadFirebaseIdentitiesCopyWithImpl<$Res>
    implements _$JwtPayloadFirebaseIdentitiesCopyWith<$Res> {
  __$JwtPayloadFirebaseIdentitiesCopyWithImpl(this._self, this._then);

  final _JwtPayloadFirebaseIdentities _self;
  final $Res Function(_JwtPayloadFirebaseIdentities) _then;

/// Create a copy of JwtPayloadFirebaseIdentities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_JwtPayloadFirebaseIdentities(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
