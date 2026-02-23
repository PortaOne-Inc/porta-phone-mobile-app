// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordState {

 AuthEmailInput? get emailInput;
/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordStateCopyWith<ResetPasswordState> get copyWith => _$ResetPasswordStateCopyWithImpl<ResetPasswordState>(this as ResetPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordState&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput);

@override
String toString() {
  return 'ResetPasswordState(emailInput: $emailInput)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordStateCopyWith<$Res>  {
  factory $ResetPasswordStateCopyWith(ResetPasswordState value, $Res Function(ResetPasswordState) _then) = _$ResetPasswordStateCopyWithImpl;
@useResult
$Res call({
 AuthEmailInput? emailInput
});




}
/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._self, this._then);

  final ResetPasswordState _self;
  final $Res Function(ResetPasswordState) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailInput = freezed,}) {
  return _then(_self.copyWith(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResetPasswordState].
extension ResetPasswordStatePatterns on ResetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResetPasswordState value)?  $default,{TResult Function( ResetPasswordStateProgress value)?  progress,TResult Function( ResetPasswordStateSuccess value)?  success,TResult Function( ResetPasswordStateValidation value)?  validation,TResult Function( ResetPasswordStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResetPasswordState() when $default != null:
return $default(_that);case ResetPasswordStateProgress() when progress != null:
return progress(_that);case ResetPasswordStateSuccess() when success != null:
return success(_that);case ResetPasswordStateValidation() when validation != null:
return validation(_that);case ResetPasswordStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResetPasswordState value)  $default,{required TResult Function( ResetPasswordStateProgress value)  progress,required TResult Function( ResetPasswordStateSuccess value)  success,required TResult Function( ResetPasswordStateValidation value)  validation,required TResult Function( ResetPasswordStateError value)  error,}){
final _that = this;
switch (_that) {
case _ResetPasswordState():
return $default(_that);case ResetPasswordStateProgress():
return progress(_that);case ResetPasswordStateSuccess():
return success(_that);case ResetPasswordStateValidation():
return validation(_that);case ResetPasswordStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResetPasswordState value)?  $default,{TResult? Function( ResetPasswordStateProgress value)?  progress,TResult? Function( ResetPasswordStateSuccess value)?  success,TResult? Function( ResetPasswordStateValidation value)?  validation,TResult? Function( ResetPasswordStateError value)?  error,}){
final _that = this;
switch (_that) {
case _ResetPasswordState() when $default != null:
return $default(_that);case ResetPasswordStateProgress() when progress != null:
return progress(_that);case ResetPasswordStateSuccess() when success != null:
return success(_that);case ResetPasswordStateValidation() when validation != null:
return validation(_that);case ResetPasswordStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthEmailInput? emailInput)?  $default,{TResult Function( AuthEmailInput? emailInput)?  progress,TResult Function( AuthEmailInput? emailInput)?  success,TResult Function( AuthEmailInput? emailInput)?  validation,TResult Function( AuthEmailInput? emailInput,  AuthException? error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResetPasswordState() when $default != null:
return $default(_that.emailInput);case ResetPasswordStateProgress() when progress != null:
return progress(_that.emailInput);case ResetPasswordStateSuccess() when success != null:
return success(_that.emailInput);case ResetPasswordStateValidation() when validation != null:
return validation(_that.emailInput);case ResetPasswordStateError() when error != null:
return error(_that.emailInput,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthEmailInput? emailInput)  $default,{required TResult Function( AuthEmailInput? emailInput)  progress,required TResult Function( AuthEmailInput? emailInput)  success,required TResult Function( AuthEmailInput? emailInput)  validation,required TResult Function( AuthEmailInput? emailInput,  AuthException? error)  error,}) {final _that = this;
switch (_that) {
case _ResetPasswordState():
return $default(_that.emailInput);case ResetPasswordStateProgress():
return progress(_that.emailInput);case ResetPasswordStateSuccess():
return success(_that.emailInput);case ResetPasswordStateValidation():
return validation(_that.emailInput);case ResetPasswordStateError():
return error(_that.emailInput,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthEmailInput? emailInput)?  $default,{TResult? Function( AuthEmailInput? emailInput)?  progress,TResult? Function( AuthEmailInput? emailInput)?  success,TResult? Function( AuthEmailInput? emailInput)?  validation,TResult? Function( AuthEmailInput? emailInput,  AuthException? error)?  error,}) {final _that = this;
switch (_that) {
case _ResetPasswordState() when $default != null:
return $default(_that.emailInput);case ResetPasswordStateProgress() when progress != null:
return progress(_that.emailInput);case ResetPasswordStateSuccess() when success != null:
return success(_that.emailInput);case ResetPasswordStateValidation() when validation != null:
return validation(_that.emailInput);case ResetPasswordStateError() when error != null:
return error(_that.emailInput,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ResetPasswordState implements ResetPasswordState {
   _ResetPasswordState({this.emailInput});
  

@override final  AuthEmailInput? emailInput;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordStateCopyWith<_ResetPasswordState> get copyWith => __$ResetPasswordStateCopyWithImpl<_ResetPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordState&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput);

@override
String toString() {
  return 'ResetPasswordState(emailInput: $emailInput)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordStateCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory _$ResetPasswordStateCopyWith(_ResetPasswordState value, $Res Function(_ResetPasswordState) _then) = __$ResetPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput
});




}
/// @nodoc
class __$ResetPasswordStateCopyWithImpl<$Res>
    implements _$ResetPasswordStateCopyWith<$Res> {
  __$ResetPasswordStateCopyWithImpl(this._self, this._then);

  final _ResetPasswordState _self;
  final $Res Function(_ResetPasswordState) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,}) {
  return _then(_ResetPasswordState(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,
  ));
}


}

/// @nodoc


class ResetPasswordStateProgress implements ResetPasswordState {
   ResetPasswordStateProgress({this.emailInput});
  

@override final  AuthEmailInput? emailInput;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordStateProgressCopyWith<ResetPasswordStateProgress> get copyWith => _$ResetPasswordStateProgressCopyWithImpl<ResetPasswordStateProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordStateProgress&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput);

@override
String toString() {
  return 'ResetPasswordState.progress(emailInput: $emailInput)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordStateProgressCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateProgressCopyWith(ResetPasswordStateProgress value, $Res Function(ResetPasswordStateProgress) _then) = _$ResetPasswordStateProgressCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput
});




}
/// @nodoc
class _$ResetPasswordStateProgressCopyWithImpl<$Res>
    implements $ResetPasswordStateProgressCopyWith<$Res> {
  _$ResetPasswordStateProgressCopyWithImpl(this._self, this._then);

  final ResetPasswordStateProgress _self;
  final $Res Function(ResetPasswordStateProgress) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,}) {
  return _then(ResetPasswordStateProgress(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,
  ));
}


}

/// @nodoc


class ResetPasswordStateSuccess implements ResetPasswordState {
   ResetPasswordStateSuccess({this.emailInput});
  

@override final  AuthEmailInput? emailInput;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordStateSuccessCopyWith<ResetPasswordStateSuccess> get copyWith => _$ResetPasswordStateSuccessCopyWithImpl<ResetPasswordStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordStateSuccess&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput);

@override
String toString() {
  return 'ResetPasswordState.success(emailInput: $emailInput)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordStateSuccessCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateSuccessCopyWith(ResetPasswordStateSuccess value, $Res Function(ResetPasswordStateSuccess) _then) = _$ResetPasswordStateSuccessCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput
});




}
/// @nodoc
class _$ResetPasswordStateSuccessCopyWithImpl<$Res>
    implements $ResetPasswordStateSuccessCopyWith<$Res> {
  _$ResetPasswordStateSuccessCopyWithImpl(this._self, this._then);

  final ResetPasswordStateSuccess _self;
  final $Res Function(ResetPasswordStateSuccess) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,}) {
  return _then(ResetPasswordStateSuccess(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,
  ));
}


}

/// @nodoc


class ResetPasswordStateValidation implements ResetPasswordState {
   ResetPasswordStateValidation({this.emailInput});
  

@override final  AuthEmailInput? emailInput;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordStateValidationCopyWith<ResetPasswordStateValidation> get copyWith => _$ResetPasswordStateValidationCopyWithImpl<ResetPasswordStateValidation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordStateValidation&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput);

@override
String toString() {
  return 'ResetPasswordState.validation(emailInput: $emailInput)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordStateValidationCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateValidationCopyWith(ResetPasswordStateValidation value, $Res Function(ResetPasswordStateValidation) _then) = _$ResetPasswordStateValidationCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput
});




}
/// @nodoc
class _$ResetPasswordStateValidationCopyWithImpl<$Res>
    implements $ResetPasswordStateValidationCopyWith<$Res> {
  _$ResetPasswordStateValidationCopyWithImpl(this._self, this._then);

  final ResetPasswordStateValidation _self;
  final $Res Function(ResetPasswordStateValidation) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,}) {
  return _then(ResetPasswordStateValidation(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,
  ));
}


}

/// @nodoc


class ResetPasswordStateError implements ResetPasswordState {
   ResetPasswordStateError({this.emailInput, this.error});
  

@override final  AuthEmailInput? emailInput;
 final  AuthException? error;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordStateErrorCopyWith<ResetPasswordStateError> get copyWith => _$ResetPasswordStateErrorCopyWithImpl<ResetPasswordStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordStateError&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,error);

@override
String toString() {
  return 'ResetPasswordState.error(emailInput: $emailInput, error: $error)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordStateErrorCopyWith<$Res> implements $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateErrorCopyWith(ResetPasswordStateError value, $Res Function(ResetPasswordStateError) _then) = _$ResetPasswordStateErrorCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput, AuthException? error
});




}
/// @nodoc
class _$ResetPasswordStateErrorCopyWithImpl<$Res>
    implements $ResetPasswordStateErrorCopyWith<$Res> {
  _$ResetPasswordStateErrorCopyWithImpl(this._self, this._then);

  final ResetPasswordStateError _self;
  final $Res Function(ResetPasswordStateError) _then;

/// Create a copy of ResetPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,Object? error = freezed,}) {
  return _then(ResetPasswordStateError(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AuthException?,
  ));
}


}

// dart format on
