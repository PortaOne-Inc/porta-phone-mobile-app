// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deployment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeploymentState {
  DeploymentDetailsStatus get status => throw _privateConstructorUsedError;
  ApplicationDeploy get applicationDeploy => throw _privateConstructorUsedError;
  List<ApplicationValidateError> get applicationValidateErrors =>
      throw _privateConstructorUsedError;
  ApplicationBuildVersionProgress get buildVersionProgress =>
      throw _privateConstructorUsedError;
  ApplicationModel? get application => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeploymentStateCopyWith<DeploymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeploymentStateCopyWith<$Res> {
  factory $DeploymentStateCopyWith(
          DeploymentState value, $Res Function(DeploymentState) then) =
      _$DeploymentStateCopyWithImpl<$Res, DeploymentState>;
  @useResult
  $Res call(
      {DeploymentDetailsStatus status,
      ApplicationDeploy applicationDeploy,
      List<ApplicationValidateError> applicationValidateErrors,
      ApplicationBuildVersionProgress buildVersionProgress,
      ApplicationModel? application,
      Object? error});

  $ApplicationDeployCopyWith<$Res> get applicationDeploy;
  $ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress;
  $ApplicationModelCopyWith<$Res>? get application;
}

/// @nodoc
class _$DeploymentStateCopyWithImpl<$Res, $Val extends DeploymentState>
    implements $DeploymentStateCopyWith<$Res> {
  _$DeploymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applicationDeploy = null,
    Object? applicationValidateErrors = null,
    Object? buildVersionProgress = null,
    Object? application = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeploymentDetailsStatus,
      applicationDeploy: null == applicationDeploy
          ? _value.applicationDeploy
          : applicationDeploy // ignore: cast_nullable_to_non_nullable
              as ApplicationDeploy,
      applicationValidateErrors: null == applicationValidateErrors
          ? _value.applicationValidateErrors
          : applicationValidateErrors // ignore: cast_nullable_to_non_nullable
              as List<ApplicationValidateError>,
      buildVersionProgress: null == buildVersionProgress
          ? _value.buildVersionProgress
          : buildVersionProgress // ignore: cast_nullable_to_non_nullable
              as ApplicationBuildVersionProgress,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationDeployCopyWith<$Res> get applicationDeploy {
    return $ApplicationDeployCopyWith<$Res>(_value.applicationDeploy, (value) {
      return _then(_value.copyWith(applicationDeploy: value) as $Val);
    });
  }

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress {
    return $ApplicationBuildVersionProgressCopyWith<$Res>(
        _value.buildVersionProgress, (value) {
      return _then(_value.copyWith(buildVersionProgress: value) as $Val);
    });
  }

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationModelCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $ApplicationModelCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeploymentStateInitialImplCopyWith<$Res>
    implements $DeploymentStateCopyWith<$Res> {
  factory _$$DeploymentStateInitialImplCopyWith(
          _$DeploymentStateInitialImpl value,
          $Res Function(_$DeploymentStateInitialImpl) then) =
      __$$DeploymentStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeploymentDetailsStatus status,
      ApplicationDeploy applicationDeploy,
      List<ApplicationValidateError> applicationValidateErrors,
      ApplicationBuildVersionProgress buildVersionProgress,
      ApplicationModel? application,
      Object? error});

  @override
  $ApplicationDeployCopyWith<$Res> get applicationDeploy;
  @override
  $ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress;
  @override
  $ApplicationModelCopyWith<$Res>? get application;
}

/// @nodoc
class __$$DeploymentStateInitialImplCopyWithImpl<$Res>
    extends _$DeploymentStateCopyWithImpl<$Res, _$DeploymentStateInitialImpl>
    implements _$$DeploymentStateInitialImplCopyWith<$Res> {
  __$$DeploymentStateInitialImplCopyWithImpl(
      _$DeploymentStateInitialImpl _value,
      $Res Function(_$DeploymentStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applicationDeploy = null,
    Object? applicationValidateErrors = null,
    Object? buildVersionProgress = null,
    Object? application = freezed,
    Object? error = freezed,
  }) {
    return _then(_$DeploymentStateInitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeploymentDetailsStatus,
      applicationDeploy: null == applicationDeploy
          ? _value.applicationDeploy
          : applicationDeploy // ignore: cast_nullable_to_non_nullable
              as ApplicationDeploy,
      applicationValidateErrors: null == applicationValidateErrors
          ? _value._applicationValidateErrors
          : applicationValidateErrors // ignore: cast_nullable_to_non_nullable
              as List<ApplicationValidateError>,
      buildVersionProgress: null == buildVersionProgress
          ? _value.buildVersionProgress
          : buildVersionProgress // ignore: cast_nullable_to_non_nullable
              as ApplicationBuildVersionProgress,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$DeploymentStateInitialImpl extends DeploymentStateInitial {
  const _$DeploymentStateInitialImpl(
      {this.status = DeploymentDetailsStatus.initial,
      this.applicationDeploy = const ApplicationDeploy(),
      final List<ApplicationValidateError> applicationValidateErrors = const [],
      this.buildVersionProgress = const ApplicationBuildVersionProgress(
          progressNameUpdating: [], progressNumberUpdating: []),
      this.application,
      this.error})
      : _applicationValidateErrors = applicationValidateErrors,
        super._();

  @override
  @JsonKey()
  final DeploymentDetailsStatus status;
  @override
  @JsonKey()
  final ApplicationDeploy applicationDeploy;
  final List<ApplicationValidateError> _applicationValidateErrors;
  @override
  @JsonKey()
  List<ApplicationValidateError> get applicationValidateErrors {
    if (_applicationValidateErrors is EqualUnmodifiableListView)
      return _applicationValidateErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicationValidateErrors);
  }

  @override
  @JsonKey()
  final ApplicationBuildVersionProgress buildVersionProgress;
  @override
  final ApplicationModel? application;
  @override
  final Object? error;

  @override
  String toString() {
    return 'DeploymentState(status: $status, applicationDeploy: $applicationDeploy, applicationValidateErrors: $applicationValidateErrors, buildVersionProgress: $buildVersionProgress, application: $application, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeploymentStateInitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.applicationDeploy, applicationDeploy) ||
                other.applicationDeploy == applicationDeploy) &&
            const DeepCollectionEquality().equals(
                other._applicationValidateErrors, _applicationValidateErrors) &&
            (identical(other.buildVersionProgress, buildVersionProgress) ||
                other.buildVersionProgress == buildVersionProgress) &&
            (identical(other.application, application) ||
                other.application == application) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      applicationDeploy,
      const DeepCollectionEquality().hash(_applicationValidateErrors),
      buildVersionProgress,
      application,
      const DeepCollectionEquality().hash(error));

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeploymentStateInitialImplCopyWith<_$DeploymentStateInitialImpl>
      get copyWith => __$$DeploymentStateInitialImplCopyWithImpl<
          _$DeploymentStateInitialImpl>(this, _$identity);
}

abstract class DeploymentStateInitial extends DeploymentState {
  const factory DeploymentStateInitial(
      {final DeploymentDetailsStatus status,
      final ApplicationDeploy applicationDeploy,
      final List<ApplicationValidateError> applicationValidateErrors,
      final ApplicationBuildVersionProgress buildVersionProgress,
      final ApplicationModel? application,
      final Object? error}) = _$DeploymentStateInitialImpl;
  const DeploymentStateInitial._() : super._();

  @override
  DeploymentDetailsStatus get status;
  @override
  ApplicationDeploy get applicationDeploy;
  @override
  List<ApplicationValidateError> get applicationValidateErrors;
  @override
  ApplicationBuildVersionProgress get buildVersionProgress;
  @override
  ApplicationModel? get application;
  @override
  Object? get error;

  /// Create a copy of DeploymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeploymentStateInitialImplCopyWith<_$DeploymentStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
