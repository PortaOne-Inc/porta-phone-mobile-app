// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JwtPayload _$JwtPayloadFromJson(Map<String, dynamic> json) {
  return _JwtPayload.fromJson(json);
}

/// @nodoc
mixin _$JwtPayload {
  String get iss => throw _privateConstructorUsedError;
  set iss(String value) => throw _privateConstructorUsedError;
  String get aud => throw _privateConstructorUsedError;
  set aud(String value) =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'auth_time')
  @TimestampConverter()
  DateTime get authTime =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'auth_time')
  @TimestampConverter()
  set authTime(DateTime value) =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'user_id')
  String get userId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'user_id')
  set userId(String value) => throw _privateConstructorUsedError;
  String get sub => throw _privateConstructorUsedError;
  set sub(String value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get iat => throw _privateConstructorUsedError;
  @TimestampConverter()
  set iat(DateTime value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get exp => throw _privateConstructorUsedError;
  @TimestampConverter()
  set exp(DateTime value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'email_verified')
  bool get emailVerified =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'email_verified')
  set emailVerified(bool value) => throw _privateConstructorUsedError;
  JwtPayloadFirebase get firebase => throw _privateConstructorUsedError;
  set firebase(JwtPayloadFirebase value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtPayloadCopyWith<JwtPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtPayloadCopyWith<$Res> {
  factory $JwtPayloadCopyWith(
          JwtPayload value, $Res Function(JwtPayload) then) =
      _$JwtPayloadCopyWithImpl<$Res, JwtPayload>;
  @useResult
  $Res call(
      {String iss,
      String aud,
      @JsonKey(name: 'auth_time') @TimestampConverter() DateTime authTime,
      @JsonKey(name: 'user_id') String userId,
      String sub,
      @TimestampConverter() DateTime iat,
      @TimestampConverter() DateTime exp,
      String email,
      @JsonKey(name: 'email_verified') bool emailVerified,
      JwtPayloadFirebase firebase});

  $JwtPayloadFirebaseCopyWith<$Res> get firebase;
}

/// @nodoc
class _$JwtPayloadCopyWithImpl<$Res, $Val extends JwtPayload>
    implements $JwtPayloadCopyWith<$Res> {
  _$JwtPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iss = null,
    Object? aud = null,
    Object? authTime = null,
    Object? userId = null,
    Object? sub = null,
    Object? iat = null,
    Object? exp = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? firebase = null,
  }) {
    return _then(_value.copyWith(
      iss: null == iss
          ? _value.iss
          : iss // ignore: cast_nullable_to_non_nullable
              as String,
      aud: null == aud
          ? _value.aud
          : aud // ignore: cast_nullable_to_non_nullable
              as String,
      authTime: null == authTime
          ? _value.authTime
          : authTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      iat: null == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      firebase: null == firebase
          ? _value.firebase
          : firebase // ignore: cast_nullable_to_non_nullable
              as JwtPayloadFirebase,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JwtPayloadFirebaseCopyWith<$Res> get firebase {
    return $JwtPayloadFirebaseCopyWith<$Res>(_value.firebase, (value) {
      return _then(_value.copyWith(firebase: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JwtPayloadImplCopyWith<$Res>
    implements $JwtPayloadCopyWith<$Res> {
  factory _$$JwtPayloadImplCopyWith(
          _$JwtPayloadImpl value, $Res Function(_$JwtPayloadImpl) then) =
      __$$JwtPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String iss,
      String aud,
      @JsonKey(name: 'auth_time') @TimestampConverter() DateTime authTime,
      @JsonKey(name: 'user_id') String userId,
      String sub,
      @TimestampConverter() DateTime iat,
      @TimestampConverter() DateTime exp,
      String email,
      @JsonKey(name: 'email_verified') bool emailVerified,
      JwtPayloadFirebase firebase});

  @override
  $JwtPayloadFirebaseCopyWith<$Res> get firebase;
}

/// @nodoc
class __$$JwtPayloadImplCopyWithImpl<$Res>
    extends _$JwtPayloadCopyWithImpl<$Res, _$JwtPayloadImpl>
    implements _$$JwtPayloadImplCopyWith<$Res> {
  __$$JwtPayloadImplCopyWithImpl(
      _$JwtPayloadImpl _value, $Res Function(_$JwtPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iss = null,
    Object? aud = null,
    Object? authTime = null,
    Object? userId = null,
    Object? sub = null,
    Object? iat = null,
    Object? exp = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? firebase = null,
  }) {
    return _then(_$JwtPayloadImpl(
      iss: null == iss
          ? _value.iss
          : iss // ignore: cast_nullable_to_non_nullable
              as String,
      aud: null == aud
          ? _value.aud
          : aud // ignore: cast_nullable_to_non_nullable
              as String,
      authTime: null == authTime
          ? _value.authTime
          : authTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      iat: null == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      firebase: null == firebase
          ? _value.firebase
          : firebase // ignore: cast_nullable_to_non_nullable
              as JwtPayloadFirebase,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtPayloadImpl implements _JwtPayload {
  _$JwtPayloadImpl(
      {required this.iss,
      required this.aud,
      @JsonKey(name: 'auth_time') @TimestampConverter() required this.authTime,
      @JsonKey(name: 'user_id') required this.userId,
      required this.sub,
      @TimestampConverter() required this.iat,
      @TimestampConverter() required this.exp,
      required this.email,
      @JsonKey(name: 'email_verified') required this.emailVerified,
      required this.firebase});

  factory _$JwtPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtPayloadImplFromJson(json);

  @override
  String iss;
  @override
  String aud;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'auth_time')
  @TimestampConverter()
  DateTime authTime;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'user_id')
  String userId;
  @override
  String sub;
  @override
  @TimestampConverter()
  DateTime iat;
  @override
  @TimestampConverter()
  DateTime exp;
  @override
  String email;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'email_verified')
  bool emailVerified;
  @override
  JwtPayloadFirebase firebase;

  @override
  String toString() {
    return 'JwtPayload(iss: $iss, aud: $aud, authTime: $authTime, userId: $userId, sub: $sub, iat: $iat, exp: $exp, email: $email, emailVerified: $emailVerified, firebase: $firebase)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtPayloadImplCopyWith<_$JwtPayloadImpl> get copyWith =>
      __$$JwtPayloadImplCopyWithImpl<_$JwtPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtPayloadImplToJson(
      this,
    );
  }
}

abstract class _JwtPayload implements JwtPayload {
  factory _JwtPayload(
      {required String iss,
      required String aud,
      @JsonKey(name: 'auth_time')
      @TimestampConverter()
      required DateTime authTime,
      @JsonKey(name: 'user_id') required String userId,
      required String sub,
      @TimestampConverter() required DateTime iat,
      @TimestampConverter() required DateTime exp,
      required String email,
      @JsonKey(name: 'email_verified') required bool emailVerified,
      required JwtPayloadFirebase firebase}) = _$JwtPayloadImpl;

  factory _JwtPayload.fromJson(Map<String, dynamic> json) =
      _$JwtPayloadImpl.fromJson;

  @override
  String get iss;
  set iss(String value);
  @override
  String get aud;
  set aud(String value);
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'auth_time')
  @TimestampConverter()
  DateTime get authTime; // ignore: invalid_annotation_target
  @JsonKey(name: 'auth_time')
  @TimestampConverter()
  set authTime(DateTime value);
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'user_id')
  String get userId; // ignore: invalid_annotation_target
  @JsonKey(name: 'user_id')
  set userId(String value);
  @override
  String get sub;
  set sub(String value);
  @override
  @TimestampConverter()
  DateTime get iat;
  @TimestampConverter()
  set iat(DateTime value);
  @override
  @TimestampConverter()
  DateTime get exp;
  @TimestampConverter()
  set exp(DateTime value);
  @override
  String get email;
  set email(String value);
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'email_verified')
  bool get emailVerified; // ignore: invalid_annotation_target
  @JsonKey(name: 'email_verified')
  set emailVerified(bool value);
  @override
  JwtPayloadFirebase get firebase;
  set firebase(JwtPayloadFirebase value);
  @override
  @JsonKey(ignore: true)
  _$$JwtPayloadImplCopyWith<_$JwtPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JwtPayloadFirebase _$JwtPayloadFirebaseFromJson(Map<String, dynamic> json) {
  return _JwtPayloadFirebase.fromJson(json);
}

/// @nodoc
mixin _$JwtPayloadFirebase {
  JwtPayloadFirebaseIdentities get identities =>
      throw _privateConstructorUsedError;
  set identities(JwtPayloadFirebaseIdentities value) =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'sign_in_provider')
  String get signInProvider =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'sign_in_provider')
  set signInProvider(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtPayloadFirebaseCopyWith<JwtPayloadFirebase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtPayloadFirebaseCopyWith<$Res> {
  factory $JwtPayloadFirebaseCopyWith(
          JwtPayloadFirebase value, $Res Function(JwtPayloadFirebase) then) =
      _$JwtPayloadFirebaseCopyWithImpl<$Res, JwtPayloadFirebase>;
  @useResult
  $Res call(
      {JwtPayloadFirebaseIdentities identities,
      @JsonKey(name: 'sign_in_provider') String signInProvider});

  $JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities;
}

/// @nodoc
class _$JwtPayloadFirebaseCopyWithImpl<$Res, $Val extends JwtPayloadFirebase>
    implements $JwtPayloadFirebaseCopyWith<$Res> {
  _$JwtPayloadFirebaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identities = null,
    Object? signInProvider = null,
  }) {
    return _then(_value.copyWith(
      identities: null == identities
          ? _value.identities
          : identities // ignore: cast_nullable_to_non_nullable
              as JwtPayloadFirebaseIdentities,
      signInProvider: null == signInProvider
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities {
    return $JwtPayloadFirebaseIdentitiesCopyWith<$Res>(_value.identities,
        (value) {
      return _then(_value.copyWith(identities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JwtPayloadFirebaseImplCopyWith<$Res>
    implements $JwtPayloadFirebaseCopyWith<$Res> {
  factory _$$JwtPayloadFirebaseImplCopyWith(_$JwtPayloadFirebaseImpl value,
          $Res Function(_$JwtPayloadFirebaseImpl) then) =
      __$$JwtPayloadFirebaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {JwtPayloadFirebaseIdentities identities,
      @JsonKey(name: 'sign_in_provider') String signInProvider});

  @override
  $JwtPayloadFirebaseIdentitiesCopyWith<$Res> get identities;
}

/// @nodoc
class __$$JwtPayloadFirebaseImplCopyWithImpl<$Res>
    extends _$JwtPayloadFirebaseCopyWithImpl<$Res, _$JwtPayloadFirebaseImpl>
    implements _$$JwtPayloadFirebaseImplCopyWith<$Res> {
  __$$JwtPayloadFirebaseImplCopyWithImpl(_$JwtPayloadFirebaseImpl _value,
      $Res Function(_$JwtPayloadFirebaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identities = null,
    Object? signInProvider = null,
  }) {
    return _then(_$JwtPayloadFirebaseImpl(
      identities: null == identities
          ? _value.identities
          : identities // ignore: cast_nullable_to_non_nullable
              as JwtPayloadFirebaseIdentities,
      signInProvider: null == signInProvider
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtPayloadFirebaseImpl implements _JwtPayloadFirebase {
  _$JwtPayloadFirebaseImpl(
      {required this.identities,
      @JsonKey(name: 'sign_in_provider') required this.signInProvider});

  factory _$JwtPayloadFirebaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtPayloadFirebaseImplFromJson(json);

  @override
  JwtPayloadFirebaseIdentities identities;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'sign_in_provider')
  String signInProvider;

  @override
  String toString() {
    return 'JwtPayloadFirebase(identities: $identities, signInProvider: $signInProvider)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtPayloadFirebaseImplCopyWith<_$JwtPayloadFirebaseImpl> get copyWith =>
      __$$JwtPayloadFirebaseImplCopyWithImpl<_$JwtPayloadFirebaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtPayloadFirebaseImplToJson(
      this,
    );
  }
}

abstract class _JwtPayloadFirebase implements JwtPayloadFirebase {
  factory _JwtPayloadFirebase(
          {required JwtPayloadFirebaseIdentities identities,
          @JsonKey(name: 'sign_in_provider') required String signInProvider}) =
      _$JwtPayloadFirebaseImpl;

  factory _JwtPayloadFirebase.fromJson(Map<String, dynamic> json) =
      _$JwtPayloadFirebaseImpl.fromJson;

  @override
  JwtPayloadFirebaseIdentities get identities;
  set identities(JwtPayloadFirebaseIdentities value);
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'sign_in_provider')
  String get signInProvider; // ignore: invalid_annotation_target
  @JsonKey(name: 'sign_in_provider')
  set signInProvider(String value);
  @override
  @JsonKey(ignore: true)
  _$$JwtPayloadFirebaseImplCopyWith<_$JwtPayloadFirebaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JwtPayloadFirebaseIdentities _$JwtPayloadFirebaseIdentitiesFromJson(
    Map<String, dynamic> json) {
  return _JwtPayloadFirebaseIdentities.fromJson(json);
}

/// @nodoc
mixin _$JwtPayloadFirebaseIdentities {
  List<String> get email => throw _privateConstructorUsedError;
  set email(List<String> value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtPayloadFirebaseIdentitiesCopyWith<JwtPayloadFirebaseIdentities>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtPayloadFirebaseIdentitiesCopyWith<$Res> {
  factory $JwtPayloadFirebaseIdentitiesCopyWith(
          JwtPayloadFirebaseIdentities value,
          $Res Function(JwtPayloadFirebaseIdentities) then) =
      _$JwtPayloadFirebaseIdentitiesCopyWithImpl<$Res,
          JwtPayloadFirebaseIdentities>;
  @useResult
  $Res call({List<String> email});
}

/// @nodoc
class _$JwtPayloadFirebaseIdentitiesCopyWithImpl<$Res,
        $Val extends JwtPayloadFirebaseIdentities>
    implements $JwtPayloadFirebaseIdentitiesCopyWith<$Res> {
  _$JwtPayloadFirebaseIdentitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JwtPayloadFirebaseIdentitiesImplCopyWith<$Res>
    implements $JwtPayloadFirebaseIdentitiesCopyWith<$Res> {
  factory _$$JwtPayloadFirebaseIdentitiesImplCopyWith(
          _$JwtPayloadFirebaseIdentitiesImpl value,
          $Res Function(_$JwtPayloadFirebaseIdentitiesImpl) then) =
      __$$JwtPayloadFirebaseIdentitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> email});
}

/// @nodoc
class __$$JwtPayloadFirebaseIdentitiesImplCopyWithImpl<$Res>
    extends _$JwtPayloadFirebaseIdentitiesCopyWithImpl<$Res,
        _$JwtPayloadFirebaseIdentitiesImpl>
    implements _$$JwtPayloadFirebaseIdentitiesImplCopyWith<$Res> {
  __$$JwtPayloadFirebaseIdentitiesImplCopyWithImpl(
      _$JwtPayloadFirebaseIdentitiesImpl _value,
      $Res Function(_$JwtPayloadFirebaseIdentitiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$JwtPayloadFirebaseIdentitiesImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtPayloadFirebaseIdentitiesImpl
    implements _JwtPayloadFirebaseIdentities {
  _$JwtPayloadFirebaseIdentitiesImpl({required this.email});

  factory _$JwtPayloadFirebaseIdentitiesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$JwtPayloadFirebaseIdentitiesImplFromJson(json);

  @override
  List<String> email;

  @override
  String toString() {
    return 'JwtPayloadFirebaseIdentities(email: $email)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtPayloadFirebaseIdentitiesImplCopyWith<
          _$JwtPayloadFirebaseIdentitiesImpl>
      get copyWith => __$$JwtPayloadFirebaseIdentitiesImplCopyWithImpl<
          _$JwtPayloadFirebaseIdentitiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtPayloadFirebaseIdentitiesImplToJson(
      this,
    );
  }
}

abstract class _JwtPayloadFirebaseIdentities
    implements JwtPayloadFirebaseIdentities {
  factory _JwtPayloadFirebaseIdentities({required List<String> email}) =
      _$JwtPayloadFirebaseIdentitiesImpl;

  factory _JwtPayloadFirebaseIdentities.fromJson(Map<String, dynamic> json) =
      _$JwtPayloadFirebaseIdentitiesImpl.fromJson;

  @override
  List<String> get email;
  set email(List<String> value);
  @override
  @JsonKey(ignore: true)
  _$$JwtPayloadFirebaseIdentitiesImplCopyWith<
          _$JwtPayloadFirebaseIdentitiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
