// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deployment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeploymentState {

 DeploymentDetailsStatus get status; ApplicationDeploy get applicationDeploy; List<ApplicationValidateError> get applicationValidateErrors; ApplicationBuildVersionProgress get buildVersionProgress; ApplicationModel? get application; Object? get error;
/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeploymentStateCopyWith<DeploymentState> get copyWith => _$DeploymentStateCopyWithImpl<DeploymentState>(this as DeploymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeploymentState&&(identical(other.status, status) || other.status == status)&&(identical(other.applicationDeploy, applicationDeploy) || other.applicationDeploy == applicationDeploy)&&const DeepCollectionEquality().equals(other.applicationValidateErrors, applicationValidateErrors)&&(identical(other.buildVersionProgress, buildVersionProgress) || other.buildVersionProgress == buildVersionProgress)&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,applicationDeploy,const DeepCollectionEquality().hash(applicationValidateErrors),buildVersionProgress,application,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'DeploymentState(status: $status, applicationDeploy: $applicationDeploy, applicationValidateErrors: $applicationValidateErrors, buildVersionProgress: $buildVersionProgress, application: $application, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeploymentStateCopyWith<$Res>  {
  factory $DeploymentStateCopyWith(DeploymentState value, $Res Function(DeploymentState) _then) = _$DeploymentStateCopyWithImpl;
@useResult
$Res call({
 DeploymentDetailsStatus status, ApplicationDeploy applicationDeploy, List<ApplicationValidateError> applicationValidateErrors, ApplicationBuildVersionProgress buildVersionProgress, ApplicationModel? application, Object? error
});


$ApplicationDeployCopyWith<$Res> get applicationDeploy;$ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress;$ApplicationModelCopyWith<$Res>? get application;

}
/// @nodoc
class _$DeploymentStateCopyWithImpl<$Res>
    implements $DeploymentStateCopyWith<$Res> {
  _$DeploymentStateCopyWithImpl(this._self, this._then);

  final DeploymentState _self;
  final $Res Function(DeploymentState) _then;

/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? applicationDeploy = null,Object? applicationValidateErrors = null,Object? buildVersionProgress = null,Object? application = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeploymentDetailsStatus,applicationDeploy: null == applicationDeploy ? _self.applicationDeploy : applicationDeploy // ignore: cast_nullable_to_non_nullable
as ApplicationDeploy,applicationValidateErrors: null == applicationValidateErrors ? _self.applicationValidateErrors : applicationValidateErrors // ignore: cast_nullable_to_non_nullable
as List<ApplicationValidateError>,buildVersionProgress: null == buildVersionProgress ? _self.buildVersionProgress : buildVersionProgress // ignore: cast_nullable_to_non_nullable
as ApplicationBuildVersionProgress,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,error: freezed == error ? _self.error : error ,
  ));
}
/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationDeployCopyWith<$Res> get applicationDeploy {
  
  return $ApplicationDeployCopyWith<$Res>(_self.applicationDeploy, (value) {
    return _then(_self.copyWith(applicationDeploy: value));
  });
}/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress {
  
  return $ApplicationBuildVersionProgressCopyWith<$Res>(_self.buildVersionProgress, (value) {
    return _then(_self.copyWith(buildVersionProgress: value));
  });
}/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get application {
    if (_self.application == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.application!, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeploymentState].
extension DeploymentStatePatterns on DeploymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( DeploymentStateInitial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeploymentStateInitial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( DeploymentStateInitial value)  $default,){
final _that = this;
switch (_that) {
case DeploymentStateInitial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( DeploymentStateInitial value)?  $default,){
final _that = this;
switch (_that) {
case DeploymentStateInitial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeploymentDetailsStatus status,  ApplicationDeploy applicationDeploy,  List<ApplicationValidateError> applicationValidateErrors,  ApplicationBuildVersionProgress buildVersionProgress,  ApplicationModel? application,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeploymentStateInitial() when $default != null:
return $default(_that.status,_that.applicationDeploy,_that.applicationValidateErrors,_that.buildVersionProgress,_that.application,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeploymentDetailsStatus status,  ApplicationDeploy applicationDeploy,  List<ApplicationValidateError> applicationValidateErrors,  ApplicationBuildVersionProgress buildVersionProgress,  ApplicationModel? application,  Object? error)  $default,) {final _that = this;
switch (_that) {
case DeploymentStateInitial():
return $default(_that.status,_that.applicationDeploy,_that.applicationValidateErrors,_that.buildVersionProgress,_that.application,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeploymentDetailsStatus status,  ApplicationDeploy applicationDeploy,  List<ApplicationValidateError> applicationValidateErrors,  ApplicationBuildVersionProgress buildVersionProgress,  ApplicationModel? application,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case DeploymentStateInitial() when $default != null:
return $default(_that.status,_that.applicationDeploy,_that.applicationValidateErrors,_that.buildVersionProgress,_that.application,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DeploymentStateInitial extends DeploymentState {
  const DeploymentStateInitial({this.status = DeploymentDetailsStatus.initial, this.applicationDeploy = const ApplicationDeploy(), final  List<ApplicationValidateError> applicationValidateErrors = const [], this.buildVersionProgress = const ApplicationBuildVersionProgress(progressNameUpdating: [], progressNumberUpdating: []), this.application, this.error}): _applicationValidateErrors = applicationValidateErrors,super._();
  

@override@JsonKey() final  DeploymentDetailsStatus status;
@override@JsonKey() final  ApplicationDeploy applicationDeploy;
 final  List<ApplicationValidateError> _applicationValidateErrors;
@override@JsonKey() List<ApplicationValidateError> get applicationValidateErrors {
  if (_applicationValidateErrors is EqualUnmodifiableListView) return _applicationValidateErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicationValidateErrors);
}

@override@JsonKey() final  ApplicationBuildVersionProgress buildVersionProgress;
@override final  ApplicationModel? application;
@override final  Object? error;

/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeploymentStateInitialCopyWith<DeploymentStateInitial> get copyWith => _$DeploymentStateInitialCopyWithImpl<DeploymentStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeploymentStateInitial&&(identical(other.status, status) || other.status == status)&&(identical(other.applicationDeploy, applicationDeploy) || other.applicationDeploy == applicationDeploy)&&const DeepCollectionEquality().equals(other._applicationValidateErrors, _applicationValidateErrors)&&(identical(other.buildVersionProgress, buildVersionProgress) || other.buildVersionProgress == buildVersionProgress)&&(identical(other.application, application) || other.application == application)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,applicationDeploy,const DeepCollectionEquality().hash(_applicationValidateErrors),buildVersionProgress,application,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'DeploymentState(status: $status, applicationDeploy: $applicationDeploy, applicationValidateErrors: $applicationValidateErrors, buildVersionProgress: $buildVersionProgress, application: $application, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeploymentStateInitialCopyWith<$Res> implements $DeploymentStateCopyWith<$Res> {
  factory $DeploymentStateInitialCopyWith(DeploymentStateInitial value, $Res Function(DeploymentStateInitial) _then) = _$DeploymentStateInitialCopyWithImpl;
@override @useResult
$Res call({
 DeploymentDetailsStatus status, ApplicationDeploy applicationDeploy, List<ApplicationValidateError> applicationValidateErrors, ApplicationBuildVersionProgress buildVersionProgress, ApplicationModel? application, Object? error
});


@override $ApplicationDeployCopyWith<$Res> get applicationDeploy;@override $ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress;@override $ApplicationModelCopyWith<$Res>? get application;

}
/// @nodoc
class _$DeploymentStateInitialCopyWithImpl<$Res>
    implements $DeploymentStateInitialCopyWith<$Res> {
  _$DeploymentStateInitialCopyWithImpl(this._self, this._then);

  final DeploymentStateInitial _self;
  final $Res Function(DeploymentStateInitial) _then;

/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? applicationDeploy = null,Object? applicationValidateErrors = null,Object? buildVersionProgress = null,Object? application = freezed,Object? error = freezed,}) {
  return _then(DeploymentStateInitial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeploymentDetailsStatus,applicationDeploy: null == applicationDeploy ? _self.applicationDeploy : applicationDeploy // ignore: cast_nullable_to_non_nullable
as ApplicationDeploy,applicationValidateErrors: null == applicationValidateErrors ? _self._applicationValidateErrors : applicationValidateErrors // ignore: cast_nullable_to_non_nullable
as List<ApplicationValidateError>,buildVersionProgress: null == buildVersionProgress ? _self.buildVersionProgress : buildVersionProgress // ignore: cast_nullable_to_non_nullable
as ApplicationBuildVersionProgress,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationDeployCopyWith<$Res> get applicationDeploy {
  
  return $ApplicationDeployCopyWith<$Res>(_self.applicationDeploy, (value) {
    return _then(_self.copyWith(applicationDeploy: value));
  });
}/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationBuildVersionProgressCopyWith<$Res> get buildVersionProgress {
  
  return $ApplicationBuildVersionProgressCopyWith<$Res>(_self.buildVersionProgress, (value) {
    return _then(_self.copyWith(buildVersionProgress: value));
  });
}/// Create a copy of DeploymentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get application {
    if (_self.application == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.application!, (value) {
    return _then(_self.copyWith(application: value));
  });
}
}

// dart format on
