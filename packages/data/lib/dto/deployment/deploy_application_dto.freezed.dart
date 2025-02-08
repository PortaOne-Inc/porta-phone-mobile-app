// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deploy_application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeployApplicationDto _$DeployApplicationDtoFromJson(Map<String, dynamic> json) {
  return _DeployApplicationDto.fromJson(json);
}

/// @nodoc
mixin _$DeployApplicationDto {
  String get applicationId => throw _privateConstructorUsedError;
  set applicationId(String value) => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  set token(String value) => throw _privateConstructorUsedError;
  String get platforms => throw _privateConstructorUsedError;
  set platforms(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  String get phoneSourceBranch => throw _privateConstructorUsedError;
  set phoneSourceBranch(String value) => throw _privateConstructorUsedError;
  String get phoneConfiguratorToolSourceBranch =>
      throw _privateConstructorUsedError;
  set phoneConfiguratorToolSourceBranch(String value) =>
      throw _privateConstructorUsedError;
  String get callkeepSourceBranch => throw _privateConstructorUsedError;
  set callkeepSourceBranch(String value) => throw _privateConstructorUsedError;
  String get configuratorSourceBranch => throw _privateConstructorUsedError;
  set configuratorSourceBranch(String value) =>
      throw _privateConstructorUsedError;
  String get keystoreSourceBranch => throw _privateConstructorUsedError;
  set keystoreSourceBranch(String value) => throw _privateConstructorUsedError;
  String get androidPlayStoreConfig => throw _privateConstructorUsedError;
  set androidPlayStoreConfig(String value) =>
      throw _privateConstructorUsedError;

  /// Serializes this DeployApplicationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeployApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeployApplicationDtoCopyWith<DeployApplicationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeployApplicationDtoCopyWith<$Res> {
  factory $DeployApplicationDtoCopyWith(DeployApplicationDto value,
          $Res Function(DeployApplicationDto) then) =
      _$DeployApplicationDtoCopyWithImpl<$Res, DeployApplicationDto>;
  @useResult
  $Res call(
      {String applicationId,
      String token,
      String platforms,
      String type,
      String phoneSourceBranch,
      String phoneConfiguratorToolSourceBranch,
      String callkeepSourceBranch,
      String configuratorSourceBranch,
      String keystoreSourceBranch,
      String androidPlayStoreConfig});
}

/// @nodoc
class _$DeployApplicationDtoCopyWithImpl<$Res,
        $Val extends DeployApplicationDto>
    implements $DeployApplicationDtoCopyWith<$Res> {
  _$DeployApplicationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeployApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? token = null,
    Object? platforms = null,
    Object? type = null,
    Object? phoneSourceBranch = null,
    Object? phoneConfiguratorToolSourceBranch = null,
    Object? callkeepSourceBranch = null,
    Object? configuratorSourceBranch = null,
    Object? keystoreSourceBranch = null,
    Object? androidPlayStoreConfig = null,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      phoneSourceBranch: null == phoneSourceBranch
          ? _value.phoneSourceBranch
          : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      phoneConfiguratorToolSourceBranch: null ==
              phoneConfiguratorToolSourceBranch
          ? _value.phoneConfiguratorToolSourceBranch
          : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      callkeepSourceBranch: null == callkeepSourceBranch
          ? _value.callkeepSourceBranch
          : callkeepSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      configuratorSourceBranch: null == configuratorSourceBranch
          ? _value.configuratorSourceBranch
          : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      keystoreSourceBranch: null == keystoreSourceBranch
          ? _value.keystoreSourceBranch
          : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      androidPlayStoreConfig: null == androidPlayStoreConfig
          ? _value.androidPlayStoreConfig
          : androidPlayStoreConfig // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeployApplicationDtoImplCopyWith<$Res>
    implements $DeployApplicationDtoCopyWith<$Res> {
  factory _$$DeployApplicationDtoImplCopyWith(_$DeployApplicationDtoImpl value,
          $Res Function(_$DeployApplicationDtoImpl) then) =
      __$$DeployApplicationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String token,
      String platforms,
      String type,
      String phoneSourceBranch,
      String phoneConfiguratorToolSourceBranch,
      String callkeepSourceBranch,
      String configuratorSourceBranch,
      String keystoreSourceBranch,
      String androidPlayStoreConfig});
}

/// @nodoc
class __$$DeployApplicationDtoImplCopyWithImpl<$Res>
    extends _$DeployApplicationDtoCopyWithImpl<$Res, _$DeployApplicationDtoImpl>
    implements _$$DeployApplicationDtoImplCopyWith<$Res> {
  __$$DeployApplicationDtoImplCopyWithImpl(_$DeployApplicationDtoImpl _value,
      $Res Function(_$DeployApplicationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeployApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? token = null,
    Object? platforms = null,
    Object? type = null,
    Object? phoneSourceBranch = null,
    Object? phoneConfiguratorToolSourceBranch = null,
    Object? callkeepSourceBranch = null,
    Object? configuratorSourceBranch = null,
    Object? keystoreSourceBranch = null,
    Object? androidPlayStoreConfig = null,
  }) {
    return _then(_$DeployApplicationDtoImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      phoneSourceBranch: null == phoneSourceBranch
          ? _value.phoneSourceBranch
          : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      phoneConfiguratorToolSourceBranch: null ==
              phoneConfiguratorToolSourceBranch
          ? _value.phoneConfiguratorToolSourceBranch
          : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      callkeepSourceBranch: null == callkeepSourceBranch
          ? _value.callkeepSourceBranch
          : callkeepSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      configuratorSourceBranch: null == configuratorSourceBranch
          ? _value.configuratorSourceBranch
          : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      keystoreSourceBranch: null == keystoreSourceBranch
          ? _value.keystoreSourceBranch
          : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
              as String,
      androidPlayStoreConfig: null == androidPlayStoreConfig
          ? _value.androidPlayStoreConfig
          : androidPlayStoreConfig // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeployApplicationDtoImpl implements _DeployApplicationDto {
  _$DeployApplicationDtoImpl(
      {required this.applicationId,
      required this.token,
      required this.platforms,
      required this.type,
      required this.phoneSourceBranch,
      required this.phoneConfiguratorToolSourceBranch,
      required this.callkeepSourceBranch,
      required this.configuratorSourceBranch,
      required this.keystoreSourceBranch,
      required this.androidPlayStoreConfig});

  factory _$DeployApplicationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeployApplicationDtoImplFromJson(json);

  @override
  String applicationId;
  @override
  String token;
  @override
  String platforms;
  @override
  String type;
  @override
  String phoneSourceBranch;
  @override
  String phoneConfiguratorToolSourceBranch;
  @override
  String callkeepSourceBranch;
  @override
  String configuratorSourceBranch;
  @override
  String keystoreSourceBranch;
  @override
  String androidPlayStoreConfig;

  @override
  String toString() {
    return 'DeployApplicationDto(applicationId: $applicationId, token: $token, platforms: $platforms, type: $type, phoneSourceBranch: $phoneSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, callkeepSourceBranch: $callkeepSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, keystoreSourceBranch: $keystoreSourceBranch, androidPlayStoreConfig: $androidPlayStoreConfig)';
  }

  /// Create a copy of DeployApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeployApplicationDtoImplCopyWith<_$DeployApplicationDtoImpl>
      get copyWith =>
          __$$DeployApplicationDtoImplCopyWithImpl<_$DeployApplicationDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeployApplicationDtoImplToJson(
      this,
    );
  }
}

abstract class _DeployApplicationDto implements DeployApplicationDto {
  factory _DeployApplicationDto(
      {required String applicationId,
      required String token,
      required String platforms,
      required String type,
      required String phoneSourceBranch,
      required String phoneConfiguratorToolSourceBranch,
      required String callkeepSourceBranch,
      required String configuratorSourceBranch,
      required String keystoreSourceBranch,
      required String androidPlayStoreConfig}) = _$DeployApplicationDtoImpl;

  factory _DeployApplicationDto.fromJson(Map<String, dynamic> json) =
      _$DeployApplicationDtoImpl.fromJson;

  @override
  String get applicationId;
  set applicationId(String value);
  @override
  String get token;
  set token(String value);
  @override
  String get platforms;
  set platforms(String value);
  @override
  String get type;
  set type(String value);
  @override
  String get phoneSourceBranch;
  set phoneSourceBranch(String value);
  @override
  String get phoneConfiguratorToolSourceBranch;
  set phoneConfiguratorToolSourceBranch(String value);
  @override
  String get callkeepSourceBranch;
  set callkeepSourceBranch(String value);
  @override
  String get configuratorSourceBranch;
  set configuratorSourceBranch(String value);
  @override
  String get keystoreSourceBranch;
  set keystoreSourceBranch(String value);
  @override
  String get androidPlayStoreConfig;
  set androidPlayStoreConfig(String value);

  /// Create a copy of DeployApplicationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeployApplicationDtoImplCopyWith<_$DeployApplicationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
