// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_build_platform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AndroidBuildPlatform {
  String get key => throw _privateConstructorUsedError;
  bool get deploy => throw _privateConstructorUsedError;
  AndroidPlayStoreConfig get playStoreConfig =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AndroidBuildPlatformCopyWith<AndroidBuildPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidBuildPlatformCopyWith<$Res> {
  factory $AndroidBuildPlatformCopyWith(AndroidBuildPlatform value,
          $Res Function(AndroidBuildPlatform) then) =
      _$AndroidBuildPlatformCopyWithImpl<$Res, AndroidBuildPlatform>;
  @useResult
  $Res call({String key, bool deploy, AndroidPlayStoreConfig playStoreConfig});

  $AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig;
}

/// @nodoc
class _$AndroidBuildPlatformCopyWithImpl<$Res,
        $Val extends AndroidBuildPlatform>
    implements $AndroidBuildPlatformCopyWith<$Res> {
  _$AndroidBuildPlatformCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? deploy = null,
    Object? playStoreConfig = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      deploy: null == deploy
          ? _value.deploy
          : deploy // ignore: cast_nullable_to_non_nullable
              as bool,
      playStoreConfig: null == playStoreConfig
          ? _value.playStoreConfig
          : playStoreConfig // ignore: cast_nullable_to_non_nullable
              as AndroidPlayStoreConfig,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig {
    return $AndroidPlayStoreConfigCopyWith<$Res>(_value.playStoreConfig,
        (value) {
      return _then(_value.copyWith(playStoreConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AndroidBuildPlatformImplCopyWith<$Res>
    implements $AndroidBuildPlatformCopyWith<$Res> {
  factory _$$AndroidBuildPlatformImplCopyWith(_$AndroidBuildPlatformImpl value,
          $Res Function(_$AndroidBuildPlatformImpl) then) =
      __$$AndroidBuildPlatformImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, bool deploy, AndroidPlayStoreConfig playStoreConfig});

  @override
  $AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig;
}

/// @nodoc
class __$$AndroidBuildPlatformImplCopyWithImpl<$Res>
    extends _$AndroidBuildPlatformCopyWithImpl<$Res, _$AndroidBuildPlatformImpl>
    implements _$$AndroidBuildPlatformImplCopyWith<$Res> {
  __$$AndroidBuildPlatformImplCopyWithImpl(_$AndroidBuildPlatformImpl _value,
      $Res Function(_$AndroidBuildPlatformImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? deploy = null,
    Object? playStoreConfig = null,
  }) {
    return _then(_$AndroidBuildPlatformImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      deploy: null == deploy
          ? _value.deploy
          : deploy // ignore: cast_nullable_to_non_nullable
              as bool,
      playStoreConfig: null == playStoreConfig
          ? _value.playStoreConfig
          : playStoreConfig // ignore: cast_nullable_to_non_nullable
              as AndroidPlayStoreConfig,
    ));
  }
}

/// @nodoc

class _$AndroidBuildPlatformImpl extends _AndroidBuildPlatform {
  const _$AndroidBuildPlatformImpl(
      {this.key = _kPlatformAndroidKey,
      this.deploy = false,
      this.playStoreConfig = const AndroidPlayStoreConfig(
          track: _kPlayStoreTrackBeta,
          status: _kPlayStoreStatusDraft,
          updatePriority: 0,
          userFraction: 0.99)})
      : super._();

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final bool deploy;
  @override
  @JsonKey()
  final AndroidPlayStoreConfig playStoreConfig;

  @override
  String toString() {
    return 'AndroidBuildPlatform(key: $key, deploy: $deploy, playStoreConfig: $playStoreConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidBuildPlatformImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.deploy, deploy) || other.deploy == deploy) &&
            (identical(other.playStoreConfig, playStoreConfig) ||
                other.playStoreConfig == playStoreConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, deploy, playStoreConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidBuildPlatformImplCopyWith<_$AndroidBuildPlatformImpl>
      get copyWith =>
          __$$AndroidBuildPlatformImplCopyWithImpl<_$AndroidBuildPlatformImpl>(
              this, _$identity);
}

abstract class _AndroidBuildPlatform extends AndroidBuildPlatform {
  const factory _AndroidBuildPlatform(
          {final String key,
          final bool deploy,
          final AndroidPlayStoreConfig playStoreConfig}) =
      _$AndroidBuildPlatformImpl;
  const _AndroidBuildPlatform._() : super._();

  @override
  String get key;
  @override
  bool get deploy;
  @override
  AndroidPlayStoreConfig get playStoreConfig;
  @override
  @JsonKey(ignore: true)
  _$$AndroidBuildPlatformImplCopyWith<_$AndroidBuildPlatformImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IOSBuildPlatform {
  String get key => throw _privateConstructorUsedError;
  bool get deploy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IOSBuildPlatformCopyWith<IOSBuildPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IOSBuildPlatformCopyWith<$Res> {
  factory $IOSBuildPlatformCopyWith(
          IOSBuildPlatform value, $Res Function(IOSBuildPlatform) then) =
      _$IOSBuildPlatformCopyWithImpl<$Res, IOSBuildPlatform>;
  @useResult
  $Res call({String key, bool deploy});
}

/// @nodoc
class _$IOSBuildPlatformCopyWithImpl<$Res, $Val extends IOSBuildPlatform>
    implements $IOSBuildPlatformCopyWith<$Res> {
  _$IOSBuildPlatformCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? deploy = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      deploy: null == deploy
          ? _value.deploy
          : deploy // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IOSBuildPlatformImplCopyWith<$Res>
    implements $IOSBuildPlatformCopyWith<$Res> {
  factory _$$IOSBuildPlatformImplCopyWith(_$IOSBuildPlatformImpl value,
          $Res Function(_$IOSBuildPlatformImpl) then) =
      __$$IOSBuildPlatformImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, bool deploy});
}

/// @nodoc
class __$$IOSBuildPlatformImplCopyWithImpl<$Res>
    extends _$IOSBuildPlatformCopyWithImpl<$Res, _$IOSBuildPlatformImpl>
    implements _$$IOSBuildPlatformImplCopyWith<$Res> {
  __$$IOSBuildPlatformImplCopyWithImpl(_$IOSBuildPlatformImpl _value,
      $Res Function(_$IOSBuildPlatformImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? deploy = null,
  }) {
    return _then(_$IOSBuildPlatformImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      deploy: null == deploy
          ? _value.deploy
          : deploy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IOSBuildPlatformImpl extends _IOSBuildPlatform {
  const _$IOSBuildPlatformImpl(
      {this.key = _kPlatformIOSKey, this.deploy = false})
      : super._();

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final bool deploy;

  @override
  String toString() {
    return 'IOSBuildPlatform(key: $key, deploy: $deploy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IOSBuildPlatformImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.deploy, deploy) || other.deploy == deploy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, deploy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IOSBuildPlatformImplCopyWith<_$IOSBuildPlatformImpl> get copyWith =>
      __$$IOSBuildPlatformImplCopyWithImpl<_$IOSBuildPlatformImpl>(
          this, _$identity);
}

abstract class _IOSBuildPlatform extends IOSBuildPlatform {
  const factory _IOSBuildPlatform({final String key, final bool deploy}) =
      _$IOSBuildPlatformImpl;
  const _IOSBuildPlatform._() : super._();

  @override
  String get key;
  @override
  bool get deploy;
  @override
  @JsonKey(ignore: true)
  _$$IOSBuildPlatformImplCopyWith<_$IOSBuildPlatformImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AndroidPlayStoreConfig {
  String get track => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get updatePriority => throw _privateConstructorUsedError;
  double? get userFraction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AndroidPlayStoreConfigCopyWith<AndroidPlayStoreConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidPlayStoreConfigCopyWith<$Res> {
  factory $AndroidPlayStoreConfigCopyWith(AndroidPlayStoreConfig value,
          $Res Function(AndroidPlayStoreConfig) then) =
      _$AndroidPlayStoreConfigCopyWithImpl<$Res, AndroidPlayStoreConfig>;
  @useResult
  $Res call(
      {String track, String status, int updatePriority, double? userFraction});
}

/// @nodoc
class _$AndroidPlayStoreConfigCopyWithImpl<$Res,
        $Val extends AndroidPlayStoreConfig>
    implements $AndroidPlayStoreConfigCopyWith<$Res> {
  _$AndroidPlayStoreConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track = null,
    Object? status = null,
    Object? updatePriority = null,
    Object? userFraction = freezed,
  }) {
    return _then(_value.copyWith(
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatePriority: null == updatePriority
          ? _value.updatePriority
          : updatePriority // ignore: cast_nullable_to_non_nullable
              as int,
      userFraction: freezed == userFraction
          ? _value.userFraction
          : userFraction // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidPlayStoreConfigImplCopyWith<$Res>
    implements $AndroidPlayStoreConfigCopyWith<$Res> {
  factory _$$AndroidPlayStoreConfigImplCopyWith(
          _$AndroidPlayStoreConfigImpl value,
          $Res Function(_$AndroidPlayStoreConfigImpl) then) =
      __$$AndroidPlayStoreConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String track, String status, int updatePriority, double? userFraction});
}

/// @nodoc
class __$$AndroidPlayStoreConfigImplCopyWithImpl<$Res>
    extends _$AndroidPlayStoreConfigCopyWithImpl<$Res,
        _$AndroidPlayStoreConfigImpl>
    implements _$$AndroidPlayStoreConfigImplCopyWith<$Res> {
  __$$AndroidPlayStoreConfigImplCopyWithImpl(
      _$AndroidPlayStoreConfigImpl _value,
      $Res Function(_$AndroidPlayStoreConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track = null,
    Object? status = null,
    Object? updatePriority = null,
    Object? userFraction = freezed,
  }) {
    return _then(_$AndroidPlayStoreConfigImpl(
      track: null == track
          ? _value.track
          : track // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      updatePriority: null == updatePriority
          ? _value.updatePriority
          : updatePriority // ignore: cast_nullable_to_non_nullable
              as int,
      userFraction: freezed == userFraction
          ? _value.userFraction
          : userFraction // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$AndroidPlayStoreConfigImpl extends _AndroidPlayStoreConfig {
  const _$AndroidPlayStoreConfigImpl(
      {required this.track,
      required this.status,
      required this.updatePriority,
      this.userFraction})
      : super._();

  @override
  final String track;
  @override
  final String status;
  @override
  final int updatePriority;
  @override
  final double? userFraction;

  @override
  String toString() {
    return 'AndroidPlayStoreConfig(track: $track, status: $status, updatePriority: $updatePriority, userFraction: $userFraction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidPlayStoreConfigImpl &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatePriority, updatePriority) ||
                other.updatePriority == updatePriority) &&
            (identical(other.userFraction, userFraction) ||
                other.userFraction == userFraction));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, track, status, updatePriority, userFraction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidPlayStoreConfigImplCopyWith<_$AndroidPlayStoreConfigImpl>
      get copyWith => __$$AndroidPlayStoreConfigImplCopyWithImpl<
          _$AndroidPlayStoreConfigImpl>(this, _$identity);
}

abstract class _AndroidPlayStoreConfig extends AndroidPlayStoreConfig {
  const factory _AndroidPlayStoreConfig(
      {required final String track,
      required final String status,
      required final int updatePriority,
      final double? userFraction}) = _$AndroidPlayStoreConfigImpl;
  const _AndroidPlayStoreConfig._() : super._();

  @override
  String get track;
  @override
  String get status;
  @override
  int get updatePriority;
  @override
  double? get userFraction;
  @override
  @JsonKey(ignore: true)
  _$$AndroidPlayStoreConfigImplCopyWith<_$AndroidPlayStoreConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
