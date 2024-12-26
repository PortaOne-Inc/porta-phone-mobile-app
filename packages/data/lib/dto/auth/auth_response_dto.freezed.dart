// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthResponseDTO _$AuthResponseDTOFromJson(Map<String, dynamic> json) {
  return _AuthResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseDTO {
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  set token(String value) => throw _privateConstructorUsedError;

  /// Serializes this AuthResponseDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseDTOCopyWith<AuthResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseDTOCopyWith<$Res> {
  factory $AuthResponseDTOCopyWith(
          AuthResponseDTO value, $Res Function(AuthResponseDTO) then) =
      _$AuthResponseDTOCopyWithImpl<$Res, AuthResponseDTO>;
  @useResult
  $Res call({String status, String token});
}

/// @nodoc
class _$AuthResponseDTOCopyWithImpl<$Res, $Val extends AuthResponseDTO>
    implements $AuthResponseDTOCopyWith<$Res> {
  _$AuthResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthResponseDTOImplCopyWith<$Res>
    implements $AuthResponseDTOCopyWith<$Res> {
  factory _$$AuthResponseDTOImplCopyWith(_$AuthResponseDTOImpl value,
          $Res Function(_$AuthResponseDTOImpl) then) =
      __$$AuthResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String token});
}

/// @nodoc
class __$$AuthResponseDTOImplCopyWithImpl<$Res>
    extends _$AuthResponseDTOCopyWithImpl<$Res, _$AuthResponseDTOImpl>
    implements _$$AuthResponseDTOImplCopyWith<$Res> {
  __$$AuthResponseDTOImplCopyWithImpl(
      _$AuthResponseDTOImpl _value, $Res Function(_$AuthResponseDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? token = null,
  }) {
    return _then(_$AuthResponseDTOImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseDTOImpl implements _AuthResponseDTO {
  _$AuthResponseDTOImpl({required this.status, required this.token});

  factory _$AuthResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseDTOImplFromJson(json);

  @override
  String status;
  @override
  String token;

  @override
  String toString() {
    return 'AuthResponseDTO(status: $status, token: $token)';
  }

  /// Create a copy of AuthResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseDTOImplCopyWith<_$AuthResponseDTOImpl> get copyWith =>
      __$$AuthResponseDTOImplCopyWithImpl<_$AuthResponseDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _AuthResponseDTO implements AuthResponseDTO {
  factory _AuthResponseDTO({required String status, required String token}) =
      _$AuthResponseDTOImpl;

  factory _AuthResponseDTO.fromJson(Map<String, dynamic> json) =
      _$AuthResponseDTOImpl.fromJson;

  @override
  String get status;
  set status(String value);
  @override
  String get token;
  set token(String value);

  /// Create a copy of AuthResponseDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseDTOImplCopyWith<_$AuthResponseDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
