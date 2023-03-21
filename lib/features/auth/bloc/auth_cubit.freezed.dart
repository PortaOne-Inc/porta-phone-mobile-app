// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  AuthEmailInput? get emailInput => throw _privateConstructorUsedError;
  AuthPasswordInput? get passwordInput => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        $default, {
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        progress,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        success,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        validation,
    required TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult? Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthStateProgress value) progress,
    required TResult Function(AuthStateSuccess value) success,
    required TResult Function(AuthStateValidation value) validation,
    required TResult Function(AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthStateProgress value)? progress,
    TResult? Function(AuthStateSuccess value)? success,
    TResult? Function(AuthStateValidation value)? validation,
    TResult? Function(AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthStateProgress value)? progress,
    TResult Function(AuthStateSuccess value)? success,
    TResult Function(AuthStateValidation value)? validation,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthPasswordInput? passwordInput});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
  }) {
    return _then(_value.copyWith(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      passwordInput: freezed == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as AuthPasswordInput?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthPasswordInput? passwordInput});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
  }) {
    return _then(_$_AuthState(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      passwordInput: freezed == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as AuthPasswordInput?,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  _$_AuthState({this.emailInput, this.passwordInput});

  @override
  final AuthEmailInput? emailInput;
  @override
  final AuthPasswordInput? passwordInput;

  @override
  String toString() {
    return 'AuthState(emailInput: $emailInput, passwordInput: $passwordInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput, passwordInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        $default, {
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        progress,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        success,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        validation,
    required TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)
        error,
  }) {
    return $default(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult? Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
  }) {
    return $default?.call(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(emailInput, passwordInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthStateProgress value) progress,
    required TResult Function(AuthStateSuccess value) success,
    required TResult Function(AuthStateValidation value) validation,
    required TResult Function(AuthStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthStateProgress value)? progress,
    TResult? Function(AuthStateSuccess value)? success,
    TResult? Function(AuthStateValidation value)? validation,
    TResult? Function(AuthStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthStateProgress value)? progress,
    TResult Function(AuthStateSuccess value)? success,
    TResult Function(AuthStateValidation value)? validation,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthState implements AuthState {
  factory _AuthState(
      {final AuthEmailInput? emailInput,
      final AuthPasswordInput? passwordInput}) = _$_AuthState;

  @override
  AuthEmailInput? get emailInput;
  @override
  AuthPasswordInput? get passwordInput;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateProgressCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateProgressCopyWith(
          _$AuthStateProgress value, $Res Function(_$AuthStateProgress) then) =
      __$$AuthStateProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthPasswordInput? passwordInput});
}

/// @nodoc
class __$$AuthStateProgressCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateProgress>
    implements _$$AuthStateProgressCopyWith<$Res> {
  __$$AuthStateProgressCopyWithImpl(
      _$AuthStateProgress _value, $Res Function(_$AuthStateProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
  }) {
    return _then(_$AuthStateProgress(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      passwordInput: freezed == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as AuthPasswordInput?,
    ));
  }
}

/// @nodoc

class _$AuthStateProgress implements AuthStateProgress {
  _$AuthStateProgress({this.emailInput, this.passwordInput});

  @override
  final AuthEmailInput? emailInput;
  @override
  final AuthPasswordInput? passwordInput;

  @override
  String toString() {
    return 'AuthState.progress(emailInput: $emailInput, passwordInput: $passwordInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateProgress &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput, passwordInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateProgressCopyWith<_$AuthStateProgress> get copyWith =>
      __$$AuthStateProgressCopyWithImpl<_$AuthStateProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        $default, {
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        progress,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        success,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        validation,
    required TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)
        error,
  }) {
    return progress(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult? Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
  }) {
    return progress?.call(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(emailInput, passwordInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthStateProgress value) progress,
    required TResult Function(AuthStateSuccess value) success,
    required TResult Function(AuthStateValidation value) validation,
    required TResult Function(AuthStateError value) error,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthStateProgress value)? progress,
    TResult? Function(AuthStateSuccess value)? success,
    TResult? Function(AuthStateValidation value)? validation,
    TResult? Function(AuthStateError value)? error,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthStateProgress value)? progress,
    TResult Function(AuthStateSuccess value)? success,
    TResult Function(AuthStateValidation value)? validation,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class AuthStateProgress implements AuthState {
  factory AuthStateProgress(
      {final AuthEmailInput? emailInput,
      final AuthPasswordInput? passwordInput}) = _$AuthStateProgress;

  @override
  AuthEmailInput? get emailInput;
  @override
  AuthPasswordInput? get passwordInput;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateProgressCopyWith<_$AuthStateProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateSuccessCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateSuccessCopyWith(
          _$AuthStateSuccess value, $Res Function(_$AuthStateSuccess) then) =
      __$$AuthStateSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthPasswordInput? passwordInput});
}

/// @nodoc
class __$$AuthStateSuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateSuccess>
    implements _$$AuthStateSuccessCopyWith<$Res> {
  __$$AuthStateSuccessCopyWithImpl(
      _$AuthStateSuccess _value, $Res Function(_$AuthStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
  }) {
    return _then(_$AuthStateSuccess(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      passwordInput: freezed == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as AuthPasswordInput?,
    ));
  }
}

/// @nodoc

class _$AuthStateSuccess implements AuthStateSuccess {
  _$AuthStateSuccess({this.emailInput, this.passwordInput});

  @override
  final AuthEmailInput? emailInput;
  @override
  final AuthPasswordInput? passwordInput;

  @override
  String toString() {
    return 'AuthState.success(emailInput: $emailInput, passwordInput: $passwordInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateSuccess &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput, passwordInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateSuccessCopyWith<_$AuthStateSuccess> get copyWith =>
      __$$AuthStateSuccessCopyWithImpl<_$AuthStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        $default, {
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        progress,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        success,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        validation,
    required TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)
        error,
  }) {
    return success(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult? Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
  }) {
    return success?.call(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(emailInput, passwordInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthStateProgress value) progress,
    required TResult Function(AuthStateSuccess value) success,
    required TResult Function(AuthStateValidation value) validation,
    required TResult Function(AuthStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthStateProgress value)? progress,
    TResult? Function(AuthStateSuccess value)? success,
    TResult? Function(AuthStateValidation value)? validation,
    TResult? Function(AuthStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthStateProgress value)? progress,
    TResult Function(AuthStateSuccess value)? success,
    TResult Function(AuthStateValidation value)? validation,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthStateSuccess implements AuthState {
  factory AuthStateSuccess(
      {final AuthEmailInput? emailInput,
      final AuthPasswordInput? passwordInput}) = _$AuthStateSuccess;

  @override
  AuthEmailInput? get emailInput;
  @override
  AuthPasswordInput? get passwordInput;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateSuccessCopyWith<_$AuthStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateValidationCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateValidationCopyWith(_$AuthStateValidation value,
          $Res Function(_$AuthStateValidation) then) =
      __$$AuthStateValidationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthPasswordInput? passwordInput});
}

/// @nodoc
class __$$AuthStateValidationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateValidation>
    implements _$$AuthStateValidationCopyWith<$Res> {
  __$$AuthStateValidationCopyWithImpl(
      _$AuthStateValidation _value, $Res Function(_$AuthStateValidation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
  }) {
    return _then(_$AuthStateValidation(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      passwordInput: freezed == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as AuthPasswordInput?,
    ));
  }
}

/// @nodoc

class _$AuthStateValidation implements AuthStateValidation {
  _$AuthStateValidation({this.emailInput, this.passwordInput});

  @override
  final AuthEmailInput? emailInput;
  @override
  final AuthPasswordInput? passwordInput;

  @override
  String toString() {
    return 'AuthState.validation(emailInput: $emailInput, passwordInput: $passwordInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateValidation &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput, passwordInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateValidationCopyWith<_$AuthStateValidation> get copyWith =>
      __$$AuthStateValidationCopyWithImpl<_$AuthStateValidation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        $default, {
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        progress,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        success,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        validation,
    required TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)
        error,
  }) {
    return validation(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult? Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
  }) {
    return validation?.call(emailInput, passwordInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(emailInput, passwordInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthStateProgress value) progress,
    required TResult Function(AuthStateSuccess value) success,
    required TResult Function(AuthStateValidation value) validation,
    required TResult Function(AuthStateError value) error,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthStateProgress value)? progress,
    TResult? Function(AuthStateSuccess value)? success,
    TResult? Function(AuthStateValidation value)? validation,
    TResult? Function(AuthStateError value)? error,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthStateProgress value)? progress,
    TResult Function(AuthStateSuccess value)? success,
    TResult Function(AuthStateValidation value)? validation,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class AuthStateValidation implements AuthState {
  factory AuthStateValidation(
      {final AuthEmailInput? emailInput,
      final AuthPasswordInput? passwordInput}) = _$AuthStateValidation;

  @override
  AuthEmailInput? get emailInput;
  @override
  AuthPasswordInput? get passwordInput;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateValidationCopyWith<_$AuthStateValidation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateErrorCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateErrorCopyWith(
          _$AuthStateError value, $Res Function(_$AuthStateError) then) =
      __$$AuthStateErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthEmailInput? emailInput,
      AuthPasswordInput? passwordInput,
      BaseException? error});
}

/// @nodoc
class __$$AuthStateErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateError>
    implements _$$AuthStateErrorCopyWith<$Res> {
  __$$AuthStateErrorCopyWithImpl(
      _$AuthStateError _value, $Res Function(_$AuthStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? passwordInput = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AuthStateError(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      passwordInput: freezed == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as AuthPasswordInput?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$AuthStateError implements AuthStateError {
  _$AuthStateError({this.emailInput, this.passwordInput, this.error});

  @override
  final AuthEmailInput? emailInput;
  @override
  final AuthPasswordInput? passwordInput;
  @override
  final BaseException? error;

  @override
  String toString() {
    return 'AuthState.error(emailInput: $emailInput, passwordInput: $passwordInput, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateError &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailInput, passwordInput, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorCopyWith<_$AuthStateError> get copyWith =>
      __$$AuthStateErrorCopyWithImpl<_$AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        $default, {
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        progress,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        success,
    required TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)
        validation,
    required TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)
        error,
  }) {
    return error(emailInput, passwordInput, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult? Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult? Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
  }) {
    return error?.call(emailInput, passwordInput, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        $default, {
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        progress,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        success,
    TResult Function(
            AuthEmailInput? emailInput, AuthPasswordInput? passwordInput)?
        validation,
    TResult Function(AuthEmailInput? emailInput,
            AuthPasswordInput? passwordInput, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(emailInput, passwordInput, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthStateProgress value) progress,
    required TResult Function(AuthStateSuccess value) success,
    required TResult Function(AuthStateValidation value) validation,
    required TResult Function(AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthStateProgress value)? progress,
    TResult? Function(AuthStateSuccess value)? success,
    TResult? Function(AuthStateValidation value)? validation,
    TResult? Function(AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthStateProgress value)? progress,
    TResult Function(AuthStateSuccess value)? success,
    TResult Function(AuthStateValidation value)? validation,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthState {
  factory AuthStateError(
      {final AuthEmailInput? emailInput,
      final AuthPasswordInput? passwordInput,
      final BaseException? error}) = _$AuthStateError;

  @override
  AuthEmailInput? get emailInput;
  @override
  AuthPasswordInput? get passwordInput;
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateErrorCopyWith<_$AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
