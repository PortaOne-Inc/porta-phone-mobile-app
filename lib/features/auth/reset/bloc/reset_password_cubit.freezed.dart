// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordState {
  AuthEmailInput? get emailInput => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput) $default, {
    required TResult Function(AuthEmailInput? emailInput) progress,
    required TResult Function(AuthEmailInput? emailInput) success,
    required TResult Function(AuthEmailInput? emailInput) validation,
    required TResult Function(AuthEmailInput? emailInput, AuthException? error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(AuthEmailInput? emailInput)? $default, {
    TResult? Function(AuthEmailInput? emailInput)? progress,
    TResult? Function(AuthEmailInput? emailInput)? success,
    TResult? Function(AuthEmailInput? emailInput)? validation,
    TResult? Function(AuthEmailInput? emailInput, AuthException? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput)? $default, {
    TResult Function(AuthEmailInput? emailInput)? progress,
    TResult Function(AuthEmailInput? emailInput)? success,
    TResult Function(AuthEmailInput? emailInput)? validation,
    TResult Function(AuthEmailInput? emailInput, AuthException? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResetPasswordState value) $default, {
    required TResult Function(ResetPasswordStateProgress value) progress,
    required TResult Function(ResetPasswordStateSuccess value) success,
    required TResult Function(ResetPasswordStateValidation value) validation,
    required TResult Function(ResetPasswordStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResetPasswordState value)? $default, {
    TResult? Function(ResetPasswordStateProgress value)? progress,
    TResult? Function(ResetPasswordStateSuccess value)? success,
    TResult? Function(ResetPasswordStateValidation value)? validation,
    TResult? Function(ResetPasswordStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResetPasswordState value)? $default, {
    TResult Function(ResetPasswordStateProgress value)? progress,
    TResult Function(ResetPasswordStateSuccess value)? success,
    TResult Function(ResetPasswordStateValidation value)? validation,
    TResult Function(ResetPasswordStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_value.copyWith(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordStateCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$_ResetPasswordStateCopyWith(_$_ResetPasswordState value,
          $Res Function(_$_ResetPasswordState) then) =
      __$$_ResetPasswordStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$_ResetPasswordStateCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$_ResetPasswordState>
    implements _$$_ResetPasswordStateCopyWith<$Res> {
  __$$_ResetPasswordStateCopyWithImpl(
      _$_ResetPasswordState _value, $Res Function(_$_ResetPasswordState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$_ResetPasswordState(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordState implements _ResetPasswordState {
  _$_ResetPasswordState({this.emailInput});

  @override
  final AuthEmailInput? emailInput;

  @override
  String toString() {
    return 'ResetPasswordState(emailInput: $emailInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordState &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      __$$_ResetPasswordStateCopyWithImpl<_$_ResetPasswordState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput) $default, {
    required TResult Function(AuthEmailInput? emailInput) progress,
    required TResult Function(AuthEmailInput? emailInput) success,
    required TResult Function(AuthEmailInput? emailInput) validation,
    required TResult Function(AuthEmailInput? emailInput, AuthException? error)
        error,
  }) {
    return $default(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(AuthEmailInput? emailInput)? $default, {
    TResult? Function(AuthEmailInput? emailInput)? progress,
    TResult? Function(AuthEmailInput? emailInput)? success,
    TResult? Function(AuthEmailInput? emailInput)? validation,
    TResult? Function(AuthEmailInput? emailInput, AuthException? error)? error,
  }) {
    return $default?.call(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput)? $default, {
    TResult Function(AuthEmailInput? emailInput)? progress,
    TResult Function(AuthEmailInput? emailInput)? success,
    TResult Function(AuthEmailInput? emailInput)? validation,
    TResult Function(AuthEmailInput? emailInput, AuthException? error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(emailInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResetPasswordState value) $default, {
    required TResult Function(ResetPasswordStateProgress value) progress,
    required TResult Function(ResetPasswordStateSuccess value) success,
    required TResult Function(ResetPasswordStateValidation value) validation,
    required TResult Function(ResetPasswordStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResetPasswordState value)? $default, {
    TResult? Function(ResetPasswordStateProgress value)? progress,
    TResult? Function(ResetPasswordStateSuccess value)? success,
    TResult? Function(ResetPasswordStateValidation value)? validation,
    TResult? Function(ResetPasswordStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResetPasswordState value)? $default, {
    TResult Function(ResetPasswordStateProgress value)? progress,
    TResult Function(ResetPasswordStateSuccess value)? success,
    TResult Function(ResetPasswordStateValidation value)? validation,
    TResult Function(ResetPasswordStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ResetPasswordState implements ResetPasswordState {
  factory _ResetPasswordState({final AuthEmailInput? emailInput}) =
      _$_ResetPasswordState;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordStateCopyWith<_$_ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateProgressCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateProgressCopyWith(
          _$ResetPasswordStateProgress value,
          $Res Function(_$ResetPasswordStateProgress) then) =
      __$$ResetPasswordStateProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateProgressCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateProgress>
    implements _$$ResetPasswordStateProgressCopyWith<$Res> {
  __$$ResetPasswordStateProgressCopyWithImpl(
      _$ResetPasswordStateProgress _value,
      $Res Function(_$ResetPasswordStateProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateProgress(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateProgress implements ResetPasswordStateProgress {
  _$ResetPasswordStateProgress({this.emailInput});

  @override
  final AuthEmailInput? emailInput;

  @override
  String toString() {
    return 'ResetPasswordState.progress(emailInput: $emailInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateProgress &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateProgressCopyWith<_$ResetPasswordStateProgress>
      get copyWith => __$$ResetPasswordStateProgressCopyWithImpl<
          _$ResetPasswordStateProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput) $default, {
    required TResult Function(AuthEmailInput? emailInput) progress,
    required TResult Function(AuthEmailInput? emailInput) success,
    required TResult Function(AuthEmailInput? emailInput) validation,
    required TResult Function(AuthEmailInput? emailInput, AuthException? error)
        error,
  }) {
    return progress(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(AuthEmailInput? emailInput)? $default, {
    TResult? Function(AuthEmailInput? emailInput)? progress,
    TResult? Function(AuthEmailInput? emailInput)? success,
    TResult? Function(AuthEmailInput? emailInput)? validation,
    TResult? Function(AuthEmailInput? emailInput, AuthException? error)? error,
  }) {
    return progress?.call(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput)? $default, {
    TResult Function(AuthEmailInput? emailInput)? progress,
    TResult Function(AuthEmailInput? emailInput)? success,
    TResult Function(AuthEmailInput? emailInput)? validation,
    TResult Function(AuthEmailInput? emailInput, AuthException? error)? error,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(emailInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResetPasswordState value) $default, {
    required TResult Function(ResetPasswordStateProgress value) progress,
    required TResult Function(ResetPasswordStateSuccess value) success,
    required TResult Function(ResetPasswordStateValidation value) validation,
    required TResult Function(ResetPasswordStateError value) error,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResetPasswordState value)? $default, {
    TResult? Function(ResetPasswordStateProgress value)? progress,
    TResult? Function(ResetPasswordStateSuccess value)? success,
    TResult? Function(ResetPasswordStateValidation value)? validation,
    TResult? Function(ResetPasswordStateError value)? error,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResetPasswordState value)? $default, {
    TResult Function(ResetPasswordStateProgress value)? progress,
    TResult Function(ResetPasswordStateSuccess value)? success,
    TResult Function(ResetPasswordStateValidation value)? validation,
    TResult Function(ResetPasswordStateError value)? error,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordStateProgress implements ResetPasswordState {
  factory ResetPasswordStateProgress({final AuthEmailInput? emailInput}) =
      _$ResetPasswordStateProgress;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateProgressCopyWith<_$ResetPasswordStateProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateSuccessCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateSuccessCopyWith(
          _$ResetPasswordStateSuccess value,
          $Res Function(_$ResetPasswordStateSuccess) then) =
      __$$ResetPasswordStateSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateSuccessCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateSuccess>
    implements _$$ResetPasswordStateSuccessCopyWith<$Res> {
  __$$ResetPasswordStateSuccessCopyWithImpl(_$ResetPasswordStateSuccess _value,
      $Res Function(_$ResetPasswordStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateSuccess(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateSuccess implements ResetPasswordStateSuccess {
  _$ResetPasswordStateSuccess({this.emailInput});

  @override
  final AuthEmailInput? emailInput;

  @override
  String toString() {
    return 'ResetPasswordState.success(emailInput: $emailInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateSuccess &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateSuccessCopyWith<_$ResetPasswordStateSuccess>
      get copyWith => __$$ResetPasswordStateSuccessCopyWithImpl<
          _$ResetPasswordStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput) $default, {
    required TResult Function(AuthEmailInput? emailInput) progress,
    required TResult Function(AuthEmailInput? emailInput) success,
    required TResult Function(AuthEmailInput? emailInput) validation,
    required TResult Function(AuthEmailInput? emailInput, AuthException? error)
        error,
  }) {
    return success(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(AuthEmailInput? emailInput)? $default, {
    TResult? Function(AuthEmailInput? emailInput)? progress,
    TResult? Function(AuthEmailInput? emailInput)? success,
    TResult? Function(AuthEmailInput? emailInput)? validation,
    TResult? Function(AuthEmailInput? emailInput, AuthException? error)? error,
  }) {
    return success?.call(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput)? $default, {
    TResult Function(AuthEmailInput? emailInput)? progress,
    TResult Function(AuthEmailInput? emailInput)? success,
    TResult Function(AuthEmailInput? emailInput)? validation,
    TResult Function(AuthEmailInput? emailInput, AuthException? error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(emailInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResetPasswordState value) $default, {
    required TResult Function(ResetPasswordStateProgress value) progress,
    required TResult Function(ResetPasswordStateSuccess value) success,
    required TResult Function(ResetPasswordStateValidation value) validation,
    required TResult Function(ResetPasswordStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResetPasswordState value)? $default, {
    TResult? Function(ResetPasswordStateProgress value)? progress,
    TResult? Function(ResetPasswordStateSuccess value)? success,
    TResult? Function(ResetPasswordStateValidation value)? validation,
    TResult? Function(ResetPasswordStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResetPasswordState value)? $default, {
    TResult Function(ResetPasswordStateProgress value)? progress,
    TResult Function(ResetPasswordStateSuccess value)? success,
    TResult Function(ResetPasswordStateValidation value)? validation,
    TResult Function(ResetPasswordStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordStateSuccess implements ResetPasswordState {
  factory ResetPasswordStateSuccess({final AuthEmailInput? emailInput}) =
      _$ResetPasswordStateSuccess;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateSuccessCopyWith<_$ResetPasswordStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateValidationCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateValidationCopyWith(
          _$ResetPasswordStateValidation value,
          $Res Function(_$ResetPasswordStateValidation) then) =
      __$$ResetPasswordStateValidationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateValidationCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res,
        _$ResetPasswordStateValidation>
    implements _$$ResetPasswordStateValidationCopyWith<$Res> {
  __$$ResetPasswordStateValidationCopyWithImpl(
      _$ResetPasswordStateValidation _value,
      $Res Function(_$ResetPasswordStateValidation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateValidation(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateValidation implements ResetPasswordStateValidation {
  _$ResetPasswordStateValidation({this.emailInput});

  @override
  final AuthEmailInput? emailInput;

  @override
  String toString() {
    return 'ResetPasswordState.validation(emailInput: $emailInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateValidation &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateValidationCopyWith<_$ResetPasswordStateValidation>
      get copyWith => __$$ResetPasswordStateValidationCopyWithImpl<
          _$ResetPasswordStateValidation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput) $default, {
    required TResult Function(AuthEmailInput? emailInput) progress,
    required TResult Function(AuthEmailInput? emailInput) success,
    required TResult Function(AuthEmailInput? emailInput) validation,
    required TResult Function(AuthEmailInput? emailInput, AuthException? error)
        error,
  }) {
    return validation(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(AuthEmailInput? emailInput)? $default, {
    TResult? Function(AuthEmailInput? emailInput)? progress,
    TResult? Function(AuthEmailInput? emailInput)? success,
    TResult? Function(AuthEmailInput? emailInput)? validation,
    TResult? Function(AuthEmailInput? emailInput, AuthException? error)? error,
  }) {
    return validation?.call(emailInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput)? $default, {
    TResult Function(AuthEmailInput? emailInput)? progress,
    TResult Function(AuthEmailInput? emailInput)? success,
    TResult Function(AuthEmailInput? emailInput)? validation,
    TResult Function(AuthEmailInput? emailInput, AuthException? error)? error,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(emailInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResetPasswordState value) $default, {
    required TResult Function(ResetPasswordStateProgress value) progress,
    required TResult Function(ResetPasswordStateSuccess value) success,
    required TResult Function(ResetPasswordStateValidation value) validation,
    required TResult Function(ResetPasswordStateError value) error,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResetPasswordState value)? $default, {
    TResult? Function(ResetPasswordStateProgress value)? progress,
    TResult? Function(ResetPasswordStateSuccess value)? success,
    TResult? Function(ResetPasswordStateValidation value)? validation,
    TResult? Function(ResetPasswordStateError value)? error,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResetPasswordState value)? $default, {
    TResult Function(ResetPasswordStateProgress value)? progress,
    TResult Function(ResetPasswordStateSuccess value)? success,
    TResult Function(ResetPasswordStateValidation value)? validation,
    TResult Function(ResetPasswordStateError value)? error,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordStateValidation implements ResetPasswordState {
  factory ResetPasswordStateValidation({final AuthEmailInput? emailInput}) =
      _$ResetPasswordStateValidation;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateValidationCopyWith<_$ResetPasswordStateValidation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateErrorCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateErrorCopyWith(_$ResetPasswordStateError value,
          $Res Function(_$ResetPasswordStateError) then) =
      __$$ResetPasswordStateErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthException? error});
}

/// @nodoc
class __$$ResetPasswordStateErrorCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateError>
    implements _$$ResetPasswordStateErrorCopyWith<$Res> {
  __$$ResetPasswordStateErrorCopyWithImpl(_$ResetPasswordStateError _value,
      $Res Function(_$ResetPasswordStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ResetPasswordStateError(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthException?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateError implements ResetPasswordStateError {
  _$ResetPasswordStateError({this.emailInput, this.error});

  @override
  final AuthEmailInput? emailInput;
  @override
  final AuthException? error;

  @override
  String toString() {
    return 'ResetPasswordState.error(emailInput: $emailInput, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateError &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateErrorCopyWith<_$ResetPasswordStateError> get copyWith =>
      __$$ResetPasswordStateErrorCopyWithImpl<_$ResetPasswordStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput) $default, {
    required TResult Function(AuthEmailInput? emailInput) progress,
    required TResult Function(AuthEmailInput? emailInput) success,
    required TResult Function(AuthEmailInput? emailInput) validation,
    required TResult Function(AuthEmailInput? emailInput, AuthException? error)
        error,
  }) {
    return error(emailInput, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(AuthEmailInput? emailInput)? $default, {
    TResult? Function(AuthEmailInput? emailInput)? progress,
    TResult? Function(AuthEmailInput? emailInput)? success,
    TResult? Function(AuthEmailInput? emailInput)? validation,
    TResult? Function(AuthEmailInput? emailInput, AuthException? error)? error,
  }) {
    return error?.call(emailInput, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(AuthEmailInput? emailInput)? $default, {
    TResult Function(AuthEmailInput? emailInput)? progress,
    TResult Function(AuthEmailInput? emailInput)? success,
    TResult Function(AuthEmailInput? emailInput)? validation,
    TResult Function(AuthEmailInput? emailInput, AuthException? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(emailInput, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResetPasswordState value) $default, {
    required TResult Function(ResetPasswordStateProgress value) progress,
    required TResult Function(ResetPasswordStateSuccess value) success,
    required TResult Function(ResetPasswordStateValidation value) validation,
    required TResult Function(ResetPasswordStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResetPasswordState value)? $default, {
    TResult? Function(ResetPasswordStateProgress value)? progress,
    TResult? Function(ResetPasswordStateSuccess value)? success,
    TResult? Function(ResetPasswordStateValidation value)? validation,
    TResult? Function(ResetPasswordStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResetPasswordState value)? $default, {
    TResult Function(ResetPasswordStateProgress value)? progress,
    TResult Function(ResetPasswordStateSuccess value)? success,
    TResult Function(ResetPasswordStateValidation value)? validation,
    TResult Function(ResetPasswordStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordStateError implements ResetPasswordState {
  factory ResetPasswordStateError(
      {final AuthEmailInput? emailInput,
      final AuthException? error}) = _$ResetPasswordStateError;

  @override
  AuthEmailInput? get emailInput;
  AuthException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateErrorCopyWith<_$ResetPasswordStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
