// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnvironmentState {

 String get applicationId; EnvironmentStatus get status; Map<String, dynamic> get environment; String? get errorMessage;
/// Create a copy of EnvironmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvironmentStateCopyWith<EnvironmentState> get copyWith => _$EnvironmentStateCopyWithImpl<EnvironmentState>(this as EnvironmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnvironmentState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.environment, environment)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,status,const DeepCollectionEquality().hash(environment),errorMessage);

@override
String toString() {
  return 'EnvironmentState(applicationId: $applicationId, status: $status, environment: $environment, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EnvironmentStateCopyWith<$Res>  {
  factory $EnvironmentStateCopyWith(EnvironmentState value, $Res Function(EnvironmentState) _then) = _$EnvironmentStateCopyWithImpl;
@useResult
$Res call({
 String applicationId, EnvironmentStatus status, Map<String, dynamic> environment, String? errorMessage
});




}
/// @nodoc
class _$EnvironmentStateCopyWithImpl<$Res>
    implements $EnvironmentStateCopyWith<$Res> {
  _$EnvironmentStateCopyWithImpl(this._self, this._then);

  final EnvironmentState _self;
  final $Res Function(EnvironmentState) _then;

/// Create a copy of EnvironmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? status = null,Object? environment = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EnvironmentStatus,environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnvironmentState].
extension EnvironmentStatePatterns on EnvironmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnvironmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnvironmentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnvironmentState value)  $default,){
final _that = this;
switch (_that) {
case _EnvironmentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnvironmentState value)?  $default,){
final _that = this;
switch (_that) {
case _EnvironmentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  EnvironmentStatus status,  Map<String, dynamic> environment,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnvironmentState() when $default != null:
return $default(_that.applicationId,_that.status,_that.environment,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  EnvironmentStatus status,  Map<String, dynamic> environment,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _EnvironmentState():
return $default(_that.applicationId,_that.status,_that.environment,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  EnvironmentStatus status,  Map<String, dynamic> environment,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _EnvironmentState() when $default != null:
return $default(_that.applicationId,_that.status,_that.environment,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EnvironmentState extends EnvironmentState {
   _EnvironmentState({required this.applicationId, this.status = EnvironmentStatus.initial, final  Map<String, dynamic> environment = const {}, this.errorMessage}): _environment = environment,super._();
  

@override final  String applicationId;
@override@JsonKey() final  EnvironmentStatus status;
 final  Map<String, dynamic> _environment;
@override@JsonKey() Map<String, dynamic> get environment {
  if (_environment is EqualUnmodifiableMapView) return _environment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_environment);
}

@override final  String? errorMessage;

/// Create a copy of EnvironmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvironmentStateCopyWith<_EnvironmentState> get copyWith => __$EnvironmentStateCopyWithImpl<_EnvironmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnvironmentState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._environment, _environment)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,status,const DeepCollectionEquality().hash(_environment),errorMessage);

@override
String toString() {
  return 'EnvironmentState(applicationId: $applicationId, status: $status, environment: $environment, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EnvironmentStateCopyWith<$Res> implements $EnvironmentStateCopyWith<$Res> {
  factory _$EnvironmentStateCopyWith(_EnvironmentState value, $Res Function(_EnvironmentState) _then) = __$EnvironmentStateCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, EnvironmentStatus status, Map<String, dynamic> environment, String? errorMessage
});




}
/// @nodoc
class __$EnvironmentStateCopyWithImpl<$Res>
    implements _$EnvironmentStateCopyWith<$Res> {
  __$EnvironmentStateCopyWithImpl(this._self, this._then);

  final _EnvironmentState _self;
  final $Res Function(_EnvironmentState) _then;

/// Create a copy of EnvironmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? status = null,Object? environment = null,Object? errorMessage = freezed,}) {
  return _then(_EnvironmentState(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EnvironmentStatus,environment: null == environment ? _self._environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
