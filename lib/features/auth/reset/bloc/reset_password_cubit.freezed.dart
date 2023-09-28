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
abstract class _$$ResetPasswordStateImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateImplCopyWith(_$ResetPasswordStateImpl value,
          $Res Function(_$ResetPasswordStateImpl) then) =
      __$$ResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateImpl>
    implements _$$ResetPasswordStateImplCopyWith<$Res> {
  __$$ResetPasswordStateImplCopyWithImpl(_$ResetPasswordStateImpl _value,
      $Res Function(_$ResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateImpl(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateImpl implements _ResetPasswordState {
  _$ResetPasswordStateImpl({this.emailInput});

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
            other is _$ResetPasswordStateImpl &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      __$$ResetPasswordStateImplCopyWithImpl<_$ResetPasswordStateImpl>(
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
      _$ResetPasswordStateImpl;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateProgressImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateProgressImplCopyWith(
          _$ResetPasswordStateProgressImpl value,
          $Res Function(_$ResetPasswordStateProgressImpl) then) =
      __$$ResetPasswordStateProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateProgressImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res,
        _$ResetPasswordStateProgressImpl>
    implements _$$ResetPasswordStateProgressImplCopyWith<$Res> {
  __$$ResetPasswordStateProgressImplCopyWithImpl(
      _$ResetPasswordStateProgressImpl _value,
      $Res Function(_$ResetPasswordStateProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateProgressImpl(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateProgressImpl implements ResetPasswordStateProgress {
  _$ResetPasswordStateProgressImpl({this.emailInput});

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
            other is _$ResetPasswordStateProgressImpl &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateProgressImplCopyWith<_$ResetPasswordStateProgressImpl>
      get copyWith => __$$ResetPasswordStateProgressImplCopyWithImpl<
          _$ResetPasswordStateProgressImpl>(this, _$identity);

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
      _$ResetPasswordStateProgressImpl;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateProgressImplCopyWith<_$ResetPasswordStateProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateSuccessImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateSuccessImplCopyWith(
          _$ResetPasswordStateSuccessImpl value,
          $Res Function(_$ResetPasswordStateSuccessImpl) then) =
      __$$ResetPasswordStateSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateSuccessImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res,
        _$ResetPasswordStateSuccessImpl>
    implements _$$ResetPasswordStateSuccessImplCopyWith<$Res> {
  __$$ResetPasswordStateSuccessImplCopyWithImpl(
      _$ResetPasswordStateSuccessImpl _value,
      $Res Function(_$ResetPasswordStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateSuccessImpl(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateSuccessImpl implements ResetPasswordStateSuccess {
  _$ResetPasswordStateSuccessImpl({this.emailInput});

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
            other is _$ResetPasswordStateSuccessImpl &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateSuccessImplCopyWith<_$ResetPasswordStateSuccessImpl>
      get copyWith => __$$ResetPasswordStateSuccessImplCopyWithImpl<
          _$ResetPasswordStateSuccessImpl>(this, _$identity);

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
      _$ResetPasswordStateSuccessImpl;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateSuccessImplCopyWith<_$ResetPasswordStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateValidationImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateValidationImplCopyWith(
          _$ResetPasswordStateValidationImpl value,
          $Res Function(_$ResetPasswordStateValidationImpl) then) =
      __$$ResetPasswordStateValidationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput});
}

/// @nodoc
class __$$ResetPasswordStateValidationImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res,
        _$ResetPasswordStateValidationImpl>
    implements _$$ResetPasswordStateValidationImplCopyWith<$Res> {
  __$$ResetPasswordStateValidationImplCopyWithImpl(
      _$ResetPasswordStateValidationImpl _value,
      $Res Function(_$ResetPasswordStateValidationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
  }) {
    return _then(_$ResetPasswordStateValidationImpl(
      emailInput: freezed == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as AuthEmailInput?,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateValidationImpl
    implements ResetPasswordStateValidation {
  _$ResetPasswordStateValidationImpl({this.emailInput});

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
            other is _$ResetPasswordStateValidationImpl &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateValidationImplCopyWith<
          _$ResetPasswordStateValidationImpl>
      get copyWith => __$$ResetPasswordStateValidationImplCopyWithImpl<
          _$ResetPasswordStateValidationImpl>(this, _$identity);

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
      _$ResetPasswordStateValidationImpl;

  @override
  AuthEmailInput? get emailInput;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateValidationImplCopyWith<
          _$ResetPasswordStateValidationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordStateErrorImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateErrorImplCopyWith(
          _$ResetPasswordStateErrorImpl value,
          $Res Function(_$ResetPasswordStateErrorImpl) then) =
      __$$ResetPasswordStateErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthEmailInput? emailInput, AuthException? error});
}

/// @nodoc
class __$$ResetPasswordStateErrorImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res,
        _$ResetPasswordStateErrorImpl>
    implements _$$ResetPasswordStateErrorImplCopyWith<$Res> {
  __$$ResetPasswordStateErrorImplCopyWithImpl(
      _$ResetPasswordStateErrorImpl _value,
      $Res Function(_$ResetPasswordStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailInput = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ResetPasswordStateErrorImpl(
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

class _$ResetPasswordStateErrorImpl implements ResetPasswordStateError {
  _$ResetPasswordStateErrorImpl({this.emailInput, this.error});

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
            other is _$ResetPasswordStateErrorImpl &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailInput, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateErrorImplCopyWith<_$ResetPasswordStateErrorImpl>
      get copyWith => __$$ResetPasswordStateErrorImplCopyWithImpl<
          _$ResetPasswordStateErrorImpl>(this, _$identity);

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
      final AuthException? error}) = _$ResetPasswordStateErrorImpl;

  @override
  AuthEmailInput? get emailInput;
  AuthException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateErrorImplCopyWith<_$ResetPasswordStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
