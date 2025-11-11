// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_deploy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationDeploy {

 AndroidBuildPlatform get android; IOSBuildPlatform get ios; ApplicationDependencyBranches get applicationDependencyBranches;
/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationDeployCopyWith<ApplicationDeploy> get copyWith => _$ApplicationDeployCopyWithImpl<ApplicationDeploy>(this as ApplicationDeploy, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationDeploy&&(identical(other.android, android) || other.android == android)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.applicationDependencyBranches, applicationDependencyBranches) || other.applicationDependencyBranches == applicationDependencyBranches));
}


@override
int get hashCode => Object.hash(runtimeType,android,ios,applicationDependencyBranches);

@override
String toString() {
  return 'ApplicationDeploy(android: $android, ios: $ios, applicationDependencyBranches: $applicationDependencyBranches)';
}


}

/// @nodoc
abstract mixin class $ApplicationDeployCopyWith<$Res>  {
  factory $ApplicationDeployCopyWith(ApplicationDeploy value, $Res Function(ApplicationDeploy) _then) = _$ApplicationDeployCopyWithImpl;
@useResult
$Res call({
 AndroidBuildPlatform android, IOSBuildPlatform ios, ApplicationDependencyBranches applicationDependencyBranches
});


$AndroidBuildPlatformCopyWith<$Res> get android;$IOSBuildPlatformCopyWith<$Res> get ios;$ApplicationDependencyBranchesCopyWith<$Res> get applicationDependencyBranches;

}
/// @nodoc
class _$ApplicationDeployCopyWithImpl<$Res>
    implements $ApplicationDeployCopyWith<$Res> {
  _$ApplicationDeployCopyWithImpl(this._self, this._then);

  final ApplicationDeploy _self;
  final $Res Function(ApplicationDeploy) _then;

/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? android = null,Object? ios = null,Object? applicationDependencyBranches = null,}) {
  return _then(_self.copyWith(
android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as AndroidBuildPlatform,ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as IOSBuildPlatform,applicationDependencyBranches: null == applicationDependencyBranches ? _self.applicationDependencyBranches : applicationDependencyBranches // ignore: cast_nullable_to_non_nullable
as ApplicationDependencyBranches,
  ));
}
/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AndroidBuildPlatformCopyWith<$Res> get android {
  
  return $AndroidBuildPlatformCopyWith<$Res>(_self.android, (value) {
    return _then(_self.copyWith(android: value));
  });
}/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IOSBuildPlatformCopyWith<$Res> get ios {
  
  return $IOSBuildPlatformCopyWith<$Res>(_self.ios, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationDependencyBranchesCopyWith<$Res> get applicationDependencyBranches {
  
  return $ApplicationDependencyBranchesCopyWith<$Res>(_self.applicationDependencyBranches, (value) {
    return _then(_self.copyWith(applicationDependencyBranches: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicationDeploy].
extension ApplicationDeployPatterns on ApplicationDeploy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationDeploy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationDeploy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationDeploy value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationDeploy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationDeploy value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationDeploy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AndroidBuildPlatform android,  IOSBuildPlatform ios,  ApplicationDependencyBranches applicationDependencyBranches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationDeploy() when $default != null:
return $default(_that.android,_that.ios,_that.applicationDependencyBranches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AndroidBuildPlatform android,  IOSBuildPlatform ios,  ApplicationDependencyBranches applicationDependencyBranches)  $default,) {final _that = this;
switch (_that) {
case _ApplicationDeploy():
return $default(_that.android,_that.ios,_that.applicationDependencyBranches);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AndroidBuildPlatform android,  IOSBuildPlatform ios,  ApplicationDependencyBranches applicationDependencyBranches)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationDeploy() when $default != null:
return $default(_that.android,_that.ios,_that.applicationDependencyBranches);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationDeploy extends ApplicationDeploy {
  const _ApplicationDeploy({this.android = const AndroidBuildPlatform(), this.ios = const IOSBuildPlatform(), this.applicationDependencyBranches = const ApplicationDependencyBranches()}): super._();
  

@override@JsonKey() final  AndroidBuildPlatform android;
@override@JsonKey() final  IOSBuildPlatform ios;
@override@JsonKey() final  ApplicationDependencyBranches applicationDependencyBranches;

/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationDeployCopyWith<_ApplicationDeploy> get copyWith => __$ApplicationDeployCopyWithImpl<_ApplicationDeploy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationDeploy&&(identical(other.android, android) || other.android == android)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.applicationDependencyBranches, applicationDependencyBranches) || other.applicationDependencyBranches == applicationDependencyBranches));
}


@override
int get hashCode => Object.hash(runtimeType,android,ios,applicationDependencyBranches);

@override
String toString() {
  return 'ApplicationDeploy(android: $android, ios: $ios, applicationDependencyBranches: $applicationDependencyBranches)';
}


}

/// @nodoc
abstract mixin class _$ApplicationDeployCopyWith<$Res> implements $ApplicationDeployCopyWith<$Res> {
  factory _$ApplicationDeployCopyWith(_ApplicationDeploy value, $Res Function(_ApplicationDeploy) _then) = __$ApplicationDeployCopyWithImpl;
@override @useResult
$Res call({
 AndroidBuildPlatform android, IOSBuildPlatform ios, ApplicationDependencyBranches applicationDependencyBranches
});


@override $AndroidBuildPlatformCopyWith<$Res> get android;@override $IOSBuildPlatformCopyWith<$Res> get ios;@override $ApplicationDependencyBranchesCopyWith<$Res> get applicationDependencyBranches;

}
/// @nodoc
class __$ApplicationDeployCopyWithImpl<$Res>
    implements _$ApplicationDeployCopyWith<$Res> {
  __$ApplicationDeployCopyWithImpl(this._self, this._then);

  final _ApplicationDeploy _self;
  final $Res Function(_ApplicationDeploy) _then;

/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? android = null,Object? ios = null,Object? applicationDependencyBranches = null,}) {
  return _then(_ApplicationDeploy(
android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as AndroidBuildPlatform,ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as IOSBuildPlatform,applicationDependencyBranches: null == applicationDependencyBranches ? _self.applicationDependencyBranches : applicationDependencyBranches // ignore: cast_nullable_to_non_nullable
as ApplicationDependencyBranches,
  ));
}

/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AndroidBuildPlatformCopyWith<$Res> get android {
  
  return $AndroidBuildPlatformCopyWith<$Res>(_self.android, (value) {
    return _then(_self.copyWith(android: value));
  });
}/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IOSBuildPlatformCopyWith<$Res> get ios {
  
  return $IOSBuildPlatformCopyWith<$Res>(_self.ios, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ApplicationDeploy
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationDependencyBranchesCopyWith<$Res> get applicationDependencyBranches {
  
  return $ApplicationDependencyBranchesCopyWith<$Res>(_self.applicationDependencyBranches, (value) {
    return _then(_self.copyWith(applicationDependencyBranches: value));
  });
}
}

// dart format on
