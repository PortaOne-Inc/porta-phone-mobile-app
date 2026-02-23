// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 AuthEmailInput? get emailInput; AuthPasswordInput? get passwordInput;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.passwordInput, passwordInput) || other.passwordInput == passwordInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,passwordInput);

@override
String toString() {
  return 'LoginState(emailInput: $emailInput, passwordInput: $passwordInput)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 AuthEmailInput? emailInput, AuthPasswordInput? passwordInput
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailInput = freezed,Object? passwordInput = freezed,}) {
  return _then(_self.copyWith(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,passwordInput: freezed == passwordInput ? _self.passwordInput : passwordInput // ignore: cast_nullable_to_non_nullable
as AuthPasswordInput?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{TResult Function( AuthStateProgress value)?  progress,TResult Function( AuthStateSuccess value)?  success,TResult Function( AuthStateValidation value)?  validation,TResult Function( AuthStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case AuthStateProgress() when progress != null:
return progress(_that);case AuthStateSuccess() when success != null:
return success(_that);case AuthStateValidation() when validation != null:
return validation(_that);case AuthStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,{required TResult Function( AuthStateProgress value)  progress,required TResult Function( AuthStateSuccess value)  success,required TResult Function( AuthStateValidation value)  validation,required TResult Function( AuthStateError value)  error,}){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case AuthStateProgress():
return progress(_that);case AuthStateSuccess():
return success(_that);case AuthStateValidation():
return validation(_that);case AuthStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,{TResult? Function( AuthStateProgress value)?  progress,TResult? Function( AuthStateSuccess value)?  success,TResult? Function( AuthStateValidation value)?  validation,TResult? Function( AuthStateError value)?  error,}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case AuthStateProgress() when progress != null:
return progress(_that);case AuthStateSuccess() when success != null:
return success(_that);case AuthStateValidation() when validation != null:
return validation(_that);case AuthStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  $default,{TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  progress,TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  success,TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  validation,TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput,  AuthException? error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.emailInput,_that.passwordInput);case AuthStateProgress() when progress != null:
return progress(_that.emailInput,_that.passwordInput);case AuthStateSuccess() when success != null:
return success(_that.emailInput,_that.passwordInput);case AuthStateValidation() when validation != null:
return validation(_that.emailInput,_that.passwordInput);case AuthStateError() when error != null:
return error(_that.emailInput,_that.passwordInput,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)  $default,{required TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)  progress,required TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)  success,required TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)  validation,required TResult Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput,  AuthException? error)  error,}) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.emailInput,_that.passwordInput);case AuthStateProgress():
return progress(_that.emailInput,_that.passwordInput);case AuthStateSuccess():
return success(_that.emailInput,_that.passwordInput);case AuthStateValidation():
return validation(_that.emailInput,_that.passwordInput);case AuthStateError():
return error(_that.emailInput,_that.passwordInput,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  $default,{TResult? Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  progress,TResult? Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  success,TResult? Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput)?  validation,TResult? Function( AuthEmailInput? emailInput,  AuthPasswordInput? passwordInput,  AuthException? error)?  error,}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.emailInput,_that.passwordInput);case AuthStateProgress() when progress != null:
return progress(_that.emailInput,_that.passwordInput);case AuthStateSuccess() when success != null:
return success(_that.emailInput,_that.passwordInput);case AuthStateValidation() when validation != null:
return validation(_that.emailInput,_that.passwordInput);case AuthStateError() when error != null:
return error(_that.emailInput,_that.passwordInput,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements LoginState {
   _AuthState({this.emailInput, this.passwordInput});
  

@override final  AuthEmailInput? emailInput;
@override final  AuthPasswordInput? passwordInput;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.passwordInput, passwordInput) || other.passwordInput == passwordInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,passwordInput);

@override
String toString() {
  return 'LoginState(emailInput: $emailInput, passwordInput: $passwordInput)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput, AuthPasswordInput? passwordInput
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,Object? passwordInput = freezed,}) {
  return _then(_AuthState(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,passwordInput: freezed == passwordInput ? _self.passwordInput : passwordInput // ignore: cast_nullable_to_non_nullable
as AuthPasswordInput?,
  ));
}


}

/// @nodoc


class AuthStateProgress implements LoginState {
   AuthStateProgress({this.emailInput, this.passwordInput});
  

@override final  AuthEmailInput? emailInput;
@override final  AuthPasswordInput? passwordInput;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateProgressCopyWith<AuthStateProgress> get copyWith => _$AuthStateProgressCopyWithImpl<AuthStateProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateProgress&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.passwordInput, passwordInput) || other.passwordInput == passwordInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,passwordInput);

@override
String toString() {
  return 'LoginState.progress(emailInput: $emailInput, passwordInput: $passwordInput)';
}


}

/// @nodoc
abstract mixin class $AuthStateProgressCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $AuthStateProgressCopyWith(AuthStateProgress value, $Res Function(AuthStateProgress) _then) = _$AuthStateProgressCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput, AuthPasswordInput? passwordInput
});




}
/// @nodoc
class _$AuthStateProgressCopyWithImpl<$Res>
    implements $AuthStateProgressCopyWith<$Res> {
  _$AuthStateProgressCopyWithImpl(this._self, this._then);

  final AuthStateProgress _self;
  final $Res Function(AuthStateProgress) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,Object? passwordInput = freezed,}) {
  return _then(AuthStateProgress(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,passwordInput: freezed == passwordInput ? _self.passwordInput : passwordInput // ignore: cast_nullable_to_non_nullable
as AuthPasswordInput?,
  ));
}


}

/// @nodoc


class AuthStateSuccess implements LoginState {
   AuthStateSuccess({this.emailInput, this.passwordInput});
  

@override final  AuthEmailInput? emailInput;
@override final  AuthPasswordInput? passwordInput;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateSuccessCopyWith<AuthStateSuccess> get copyWith => _$AuthStateSuccessCopyWithImpl<AuthStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSuccess&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.passwordInput, passwordInput) || other.passwordInput == passwordInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,passwordInput);

@override
String toString() {
  return 'LoginState.success(emailInput: $emailInput, passwordInput: $passwordInput)';
}


}

/// @nodoc
abstract mixin class $AuthStateSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $AuthStateSuccessCopyWith(AuthStateSuccess value, $Res Function(AuthStateSuccess) _then) = _$AuthStateSuccessCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput, AuthPasswordInput? passwordInput
});




}
/// @nodoc
class _$AuthStateSuccessCopyWithImpl<$Res>
    implements $AuthStateSuccessCopyWith<$Res> {
  _$AuthStateSuccessCopyWithImpl(this._self, this._then);

  final AuthStateSuccess _self;
  final $Res Function(AuthStateSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,Object? passwordInput = freezed,}) {
  return _then(AuthStateSuccess(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,passwordInput: freezed == passwordInput ? _self.passwordInput : passwordInput // ignore: cast_nullable_to_non_nullable
as AuthPasswordInput?,
  ));
}


}

/// @nodoc


class AuthStateValidation implements LoginState {
   AuthStateValidation({this.emailInput, this.passwordInput});
  

@override final  AuthEmailInput? emailInput;
@override final  AuthPasswordInput? passwordInput;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateValidationCopyWith<AuthStateValidation> get copyWith => _$AuthStateValidationCopyWithImpl<AuthStateValidation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateValidation&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.passwordInput, passwordInput) || other.passwordInput == passwordInput));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,passwordInput);

@override
String toString() {
  return 'LoginState.validation(emailInput: $emailInput, passwordInput: $passwordInput)';
}


}

/// @nodoc
abstract mixin class $AuthStateValidationCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $AuthStateValidationCopyWith(AuthStateValidation value, $Res Function(AuthStateValidation) _then) = _$AuthStateValidationCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput, AuthPasswordInput? passwordInput
});




}
/// @nodoc
class _$AuthStateValidationCopyWithImpl<$Res>
    implements $AuthStateValidationCopyWith<$Res> {
  _$AuthStateValidationCopyWithImpl(this._self, this._then);

  final AuthStateValidation _self;
  final $Res Function(AuthStateValidation) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,Object? passwordInput = freezed,}) {
  return _then(AuthStateValidation(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,passwordInput: freezed == passwordInput ? _self.passwordInput : passwordInput // ignore: cast_nullable_to_non_nullable
as AuthPasswordInput?,
  ));
}


}

/// @nodoc


class AuthStateError implements LoginState {
   AuthStateError({this.emailInput, this.passwordInput, this.error});
  

@override final  AuthEmailInput? emailInput;
@override final  AuthPasswordInput? passwordInput;
 final  AuthException? error;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateErrorCopyWith<AuthStateError> get copyWith => _$AuthStateErrorCopyWithImpl<AuthStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateError&&(identical(other.emailInput, emailInput) || other.emailInput == emailInput)&&(identical(other.passwordInput, passwordInput) || other.passwordInput == passwordInput)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,emailInput,passwordInput,error);

@override
String toString() {
  return 'LoginState.error(emailInput: $emailInput, passwordInput: $passwordInput, error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthStateErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $AuthStateErrorCopyWith(AuthStateError value, $Res Function(AuthStateError) _then) = _$AuthStateErrorCopyWithImpl;
@override @useResult
$Res call({
 AuthEmailInput? emailInput, AuthPasswordInput? passwordInput, AuthException? error
});




}
/// @nodoc
class _$AuthStateErrorCopyWithImpl<$Res>
    implements $AuthStateErrorCopyWith<$Res> {
  _$AuthStateErrorCopyWithImpl(this._self, this._then);

  final AuthStateError _self;
  final $Res Function(AuthStateError) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailInput = freezed,Object? passwordInput = freezed,Object? error = freezed,}) {
  return _then(AuthStateError(
emailInput: freezed == emailInput ? _self.emailInput : emailInput // ignore: cast_nullable_to_non_nullable
as AuthEmailInput?,passwordInput: freezed == passwordInput ? _self.passwordInput : passwordInput // ignore: cast_nullable_to_non_nullable
as AuthPasswordInput?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AuthException?,
  ));
}


}

// dart format on
