// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserMetadata {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String get jwtToken => throw _privateConstructorUsedError;
  set jwtToken(String value) => throw _privateConstructorUsedError;
  DateTime? get expiredTime => throw _privateConstructorUsedError;
  set expiredTime(DateTime? value) => throw _privateConstructorUsedError;

  /// Create a copy of UserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserMetadataCopyWith<UserMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMetadataCopyWith<$Res> {
  factory $UserMetadataCopyWith(
          UserMetadata value, $Res Function(UserMetadata) then) =
      _$UserMetadataCopyWithImpl<$Res, UserMetadata>;
  @useResult
  $Res call({String id, String email, String jwtToken, DateTime? expiredTime});
}

/// @nodoc
class _$UserMetadataCopyWithImpl<$Res, $Val extends UserMetadata>
    implements $UserMetadataCopyWith<$Res> {
  _$UserMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? jwtToken = null,
    Object? expiredTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      jwtToken: null == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiredTime: freezed == expiredTime
          ? _value.expiredTime
          : expiredTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserMetadataImplCopyWith<$Res>
    implements $UserMetadataCopyWith<$Res> {
  factory _$$UserMetadataImplCopyWith(
          _$UserMetadataImpl value, $Res Function(_$UserMetadataImpl) then) =
      __$$UserMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String jwtToken, DateTime? expiredTime});
}

/// @nodoc
class __$$UserMetadataImplCopyWithImpl<$Res>
    extends _$UserMetadataCopyWithImpl<$Res, _$UserMetadataImpl>
    implements _$$UserMetadataImplCopyWith<$Res> {
  __$$UserMetadataImplCopyWithImpl(
      _$UserMetadataImpl _value, $Res Function(_$UserMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? jwtToken = null,
    Object? expiredTime = freezed,
  }) {
    return _then(_$UserMetadataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      jwtToken: null == jwtToken
          ? _value.jwtToken
          : jwtToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiredTime: freezed == expiredTime
          ? _value.expiredTime
          : expiredTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$UserMetadataImpl implements _UserMetadata {
  _$UserMetadataImpl(
      {required this.id,
      required this.email,
      required this.jwtToken,
      this.expiredTime});

  @override
  String id;
  @override
  String email;
  @override
  String jwtToken;
  @override
  DateTime? expiredTime;

  @override
  String toString() {
    return 'UserMetadata(id: $id, email: $email, jwtToken: $jwtToken, expiredTime: $expiredTime)';
  }

  /// Create a copy of UserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMetadataImplCopyWith<_$UserMetadataImpl> get copyWith =>
      __$$UserMetadataImplCopyWithImpl<_$UserMetadataImpl>(this, _$identity);
}

abstract class _UserMetadata implements UserMetadata {
  factory _UserMetadata(
      {required String id,
      required String email,
      required String jwtToken,
      DateTime? expiredTime}) = _$UserMetadataImpl;

  @override
  String get id;
  set id(String value);
  @override
  String get email;
  set email(String value);
  @override
  String get jwtToken;
  set jwtToken(String value);
  @override
  DateTime? get expiredTime;
  set expiredTime(DateTime? value);

  /// Create a copy of UserMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserMetadataImplCopyWith<_$UserMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
