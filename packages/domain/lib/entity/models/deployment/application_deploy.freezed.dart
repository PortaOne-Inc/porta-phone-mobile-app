// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_deploy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationDeploy {
  AndroidBuildPlatform get android => throw _privateConstructorUsedError;
  IOSBuildPlatform get ios => throw _privateConstructorUsedError;
  ApplicationDependencyBranches get applicationDependencyBranches =>
      throw _privateConstructorUsedError;
  ApplicationFlow get appFlow => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationDeployCopyWith<ApplicationDeploy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDeployCopyWith<$Res> {
  factory $ApplicationDeployCopyWith(
          ApplicationDeploy value, $Res Function(ApplicationDeploy) then) =
      _$ApplicationDeployCopyWithImpl<$Res, ApplicationDeploy>;
  @useResult
  $Res call(
      {AndroidBuildPlatform android,
      IOSBuildPlatform ios,
      ApplicationDependencyBranches applicationDependencyBranches,
      ApplicationFlow appFlow});

  $AndroidBuildPlatformCopyWith<$Res> get android;
  $IOSBuildPlatformCopyWith<$Res> get ios;
  $ApplicationDependencyBranchesCopyWith<$Res>
      get applicationDependencyBranches;
}

/// @nodoc
class _$ApplicationDeployCopyWithImpl<$Res, $Val extends ApplicationDeploy>
    implements $ApplicationDeployCopyWith<$Res> {
  _$ApplicationDeployCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
    Object? applicationDependencyBranches = null,
    Object? appFlow = null,
  }) {
    return _then(_value.copyWith(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as AndroidBuildPlatform,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as IOSBuildPlatform,
      applicationDependencyBranches: null == applicationDependencyBranches
          ? _value.applicationDependencyBranches
          : applicationDependencyBranches // ignore: cast_nullable_to_non_nullable
              as ApplicationDependencyBranches,
      appFlow: null == appFlow
          ? _value.appFlow
          : appFlow // ignore: cast_nullable_to_non_nullable
              as ApplicationFlow,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AndroidBuildPlatformCopyWith<$Res> get android {
    return $AndroidBuildPlatformCopyWith<$Res>(_value.android, (value) {
      return _then(_value.copyWith(android: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IOSBuildPlatformCopyWith<$Res> get ios {
    return $IOSBuildPlatformCopyWith<$Res>(_value.ios, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationDependencyBranchesCopyWith<$Res>
      get applicationDependencyBranches {
    return $ApplicationDependencyBranchesCopyWith<$Res>(
        _value.applicationDependencyBranches, (value) {
      return _then(
          _value.copyWith(applicationDependencyBranches: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplicationDeployImplCopyWith<$Res>
    implements $ApplicationDeployCopyWith<$Res> {
  factory _$$ApplicationDeployImplCopyWith(_$ApplicationDeployImpl value,
          $Res Function(_$ApplicationDeployImpl) then) =
      __$$ApplicationDeployImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AndroidBuildPlatform android,
      IOSBuildPlatform ios,
      ApplicationDependencyBranches applicationDependencyBranches,
      ApplicationFlow appFlow});

  @override
  $AndroidBuildPlatformCopyWith<$Res> get android;
  @override
  $IOSBuildPlatformCopyWith<$Res> get ios;
  @override
  $ApplicationDependencyBranchesCopyWith<$Res>
      get applicationDependencyBranches;
}

/// @nodoc
class __$$ApplicationDeployImplCopyWithImpl<$Res>
    extends _$ApplicationDeployCopyWithImpl<$Res, _$ApplicationDeployImpl>
    implements _$$ApplicationDeployImplCopyWith<$Res> {
  __$$ApplicationDeployImplCopyWithImpl(_$ApplicationDeployImpl _value,
      $Res Function(_$ApplicationDeployImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
    Object? applicationDependencyBranches = null,
    Object? appFlow = null,
  }) {
    return _then(_$ApplicationDeployImpl(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as AndroidBuildPlatform,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as IOSBuildPlatform,
      applicationDependencyBranches: null == applicationDependencyBranches
          ? _value.applicationDependencyBranches
          : applicationDependencyBranches // ignore: cast_nullable_to_non_nullable
              as ApplicationDependencyBranches,
      appFlow: null == appFlow
          ? _value.appFlow
          : appFlow // ignore: cast_nullable_to_non_nullable
              as ApplicationFlow,
    ));
  }
}

/// @nodoc

class _$ApplicationDeployImpl extends _ApplicationDeploy {
  const _$ApplicationDeployImpl(
      {required this.android,
      required this.ios,
      required this.applicationDependencyBranches,
      required this.appFlow})
      : super._();

  @override
  final AndroidBuildPlatform android;
  @override
  final IOSBuildPlatform ios;
  @override
  final ApplicationDependencyBranches applicationDependencyBranches;
  @override
  final ApplicationFlow appFlow;

  @override
  String toString() {
    return 'ApplicationDeploy(android: $android, ios: $ios, applicationDependencyBranches: $applicationDependencyBranches, appFlow: $appFlow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDeployImpl &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.applicationDependencyBranches,
                    applicationDependencyBranches) ||
                other.applicationDependencyBranches ==
                    applicationDependencyBranches) &&
            (identical(other.appFlow, appFlow) || other.appFlow == appFlow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, android, ios, applicationDependencyBranches, appFlow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationDeployImplCopyWith<_$ApplicationDeployImpl> get copyWith =>
      __$$ApplicationDeployImplCopyWithImpl<_$ApplicationDeployImpl>(
          this, _$identity);
}

abstract class _ApplicationDeploy extends ApplicationDeploy {
  const factory _ApplicationDeploy(
      {required final AndroidBuildPlatform android,
      required final IOSBuildPlatform ios,
      required final ApplicationDependencyBranches
          applicationDependencyBranches,
      required final ApplicationFlow appFlow}) = _$ApplicationDeployImpl;
  const _ApplicationDeploy._() : super._();

  @override
  AndroidBuildPlatform get android;
  @override
  IOSBuildPlatform get ios;
  @override
  ApplicationDependencyBranches get applicationDependencyBranches;
  @override
  ApplicationFlow get appFlow;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationDeployImplCopyWith<_$ApplicationDeployImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
