// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApplicationCollectionState {
  List<ApplicationModel> get applications => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications) $default, {
    required TResult Function(List<ApplicationModel> applications) progress,
    required TResult Function(List<ApplicationModel> applications) success,
    required TResult Function(
            List<ApplicationModel> applications, BaseException? error)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ApplicationModel> applications)? $default, {
    TResult? Function(List<ApplicationModel> applications)? progress,
    TResult? Function(List<ApplicationModel> applications)? success,
    TResult? Function(
            List<ApplicationModel> applications, BaseException? error)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications)? $default, {
    TResult Function(List<ApplicationModel> applications)? progress,
    TResult Function(List<ApplicationModel> applications)? success,
    TResult Function(List<ApplicationModel> applications, BaseException? error)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value) $default, {
    required TResult Function(ApplicationCollectionProgress value) progress,
    required TResult Function(ApplicationCollectionSuccess value) success,
    required TResult Function(ApplicationCollectionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApplicationCollectionState value)? $default, {
    TResult? Function(ApplicationCollectionProgress value)? progress,
    TResult? Function(ApplicationCollectionSuccess value)? success,
    TResult? Function(ApplicationCollectionError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value)? $default, {
    TResult Function(ApplicationCollectionProgress value)? progress,
    TResult Function(ApplicationCollectionSuccess value)? success,
    TResult Function(ApplicationCollectionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationCollectionStateCopyWith<ApplicationCollectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationCollectionStateCopyWith<$Res> {
  factory $ApplicationCollectionStateCopyWith(ApplicationCollectionState value,
          $Res Function(ApplicationCollectionState) then) =
      _$ApplicationCollectionStateCopyWithImpl<$Res,
          ApplicationCollectionState>;
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class _$ApplicationCollectionStateCopyWithImpl<$Res,
        $Val extends ApplicationCollectionState>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  _$ApplicationCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_value.copyWith(
      applications: null == applications
          ? _value.applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplicationCollectionStateCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$_ApplicationCollectionStateCopyWith(
          _$_ApplicationCollectionState value,
          $Res Function(_$_ApplicationCollectionState) then) =
      __$$_ApplicationCollectionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class __$$_ApplicationCollectionStateCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$_ApplicationCollectionState>
    implements _$$_ApplicationCollectionStateCopyWith<$Res> {
  __$$_ApplicationCollectionStateCopyWithImpl(
      _$_ApplicationCollectionState _value,
      $Res Function(_$_ApplicationCollectionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_$_ApplicationCollectionState(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ));
  }
}

/// @nodoc

class _$_ApplicationCollectionState implements _ApplicationCollectionState {
  _$_ApplicationCollectionState(
      {final List<ApplicationModel> applications = const []})
      : _applications = applications;

  final List<ApplicationModel> _applications;
  @override
  @JsonKey()
  List<ApplicationModel> get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  String toString() {
    return 'ApplicationCollectionState(applications: $applications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationCollectionState &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicationCollectionStateCopyWith<_$_ApplicationCollectionState>
      get copyWith => __$$_ApplicationCollectionStateCopyWithImpl<
          _$_ApplicationCollectionState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications) $default, {
    required TResult Function(List<ApplicationModel> applications) progress,
    required TResult Function(List<ApplicationModel> applications) success,
    required TResult Function(
            List<ApplicationModel> applications, BaseException? error)
        error,
  }) {
    return $default(applications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ApplicationModel> applications)? $default, {
    TResult? Function(List<ApplicationModel> applications)? progress,
    TResult? Function(List<ApplicationModel> applications)? success,
    TResult? Function(
            List<ApplicationModel> applications, BaseException? error)?
        error,
  }) {
    return $default?.call(applications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications)? $default, {
    TResult Function(List<ApplicationModel> applications)? progress,
    TResult Function(List<ApplicationModel> applications)? success,
    TResult Function(List<ApplicationModel> applications, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(applications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value) $default, {
    required TResult Function(ApplicationCollectionProgress value) progress,
    required TResult Function(ApplicationCollectionSuccess value) success,
    required TResult Function(ApplicationCollectionError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApplicationCollectionState value)? $default, {
    TResult? Function(ApplicationCollectionProgress value)? progress,
    TResult? Function(ApplicationCollectionSuccess value)? success,
    TResult? Function(ApplicationCollectionError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value)? $default, {
    TResult Function(ApplicationCollectionProgress value)? progress,
    TResult Function(ApplicationCollectionSuccess value)? success,
    TResult Function(ApplicationCollectionError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ApplicationCollectionState
    implements ApplicationCollectionState {
  factory _ApplicationCollectionState(
          {final List<ApplicationModel> applications}) =
      _$_ApplicationCollectionState;

  @override
  List<ApplicationModel> get applications;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationCollectionStateCopyWith<_$_ApplicationCollectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationCollectionProgressCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionProgressCopyWith(
          _$ApplicationCollectionProgress value,
          $Res Function(_$ApplicationCollectionProgress) then) =
      __$$ApplicationCollectionProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class __$$ApplicationCollectionProgressCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionProgress>
    implements _$$ApplicationCollectionProgressCopyWith<$Res> {
  __$$ApplicationCollectionProgressCopyWithImpl(
      _$ApplicationCollectionProgress _value,
      $Res Function(_$ApplicationCollectionProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_$ApplicationCollectionProgress(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionProgress implements ApplicationCollectionProgress {
  _$ApplicationCollectionProgress(
      {final List<ApplicationModel> applications = const []})
      : _applications = applications;

  final List<ApplicationModel> _applications;
  @override
  @JsonKey()
  List<ApplicationModel> get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  String toString() {
    return 'ApplicationCollectionState.progress(applications: $applications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationCollectionProgress &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionProgressCopyWith<_$ApplicationCollectionProgress>
      get copyWith => __$$ApplicationCollectionProgressCopyWithImpl<
          _$ApplicationCollectionProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications) $default, {
    required TResult Function(List<ApplicationModel> applications) progress,
    required TResult Function(List<ApplicationModel> applications) success,
    required TResult Function(
            List<ApplicationModel> applications, BaseException? error)
        error,
  }) {
    return progress(applications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ApplicationModel> applications)? $default, {
    TResult? Function(List<ApplicationModel> applications)? progress,
    TResult? Function(List<ApplicationModel> applications)? success,
    TResult? Function(
            List<ApplicationModel> applications, BaseException? error)?
        error,
  }) {
    return progress?.call(applications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications)? $default, {
    TResult Function(List<ApplicationModel> applications)? progress,
    TResult Function(List<ApplicationModel> applications)? success,
    TResult Function(List<ApplicationModel> applications, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(applications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value) $default, {
    required TResult Function(ApplicationCollectionProgress value) progress,
    required TResult Function(ApplicationCollectionSuccess value) success,
    required TResult Function(ApplicationCollectionError value) error,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApplicationCollectionState value)? $default, {
    TResult? Function(ApplicationCollectionProgress value)? progress,
    TResult? Function(ApplicationCollectionSuccess value)? success,
    TResult? Function(ApplicationCollectionError value)? error,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value)? $default, {
    TResult Function(ApplicationCollectionProgress value)? progress,
    TResult Function(ApplicationCollectionSuccess value)? success,
    TResult Function(ApplicationCollectionError value)? error,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ApplicationCollectionProgress
    implements ApplicationCollectionState {
  factory ApplicationCollectionProgress(
          {final List<ApplicationModel> applications}) =
      _$ApplicationCollectionProgress;

  @override
  List<ApplicationModel> get applications;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionProgressCopyWith<_$ApplicationCollectionProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationCollectionSuccessCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionSuccessCopyWith(
          _$ApplicationCollectionSuccess value,
          $Res Function(_$ApplicationCollectionSuccess) then) =
      __$$ApplicationCollectionSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class __$$ApplicationCollectionSuccessCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionSuccess>
    implements _$$ApplicationCollectionSuccessCopyWith<$Res> {
  __$$ApplicationCollectionSuccessCopyWithImpl(
      _$ApplicationCollectionSuccess _value,
      $Res Function(_$ApplicationCollectionSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_$ApplicationCollectionSuccess(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionSuccess implements ApplicationCollectionSuccess {
  _$ApplicationCollectionSuccess(
      {final List<ApplicationModel> applications = const []})
      : _applications = applications;

  final List<ApplicationModel> _applications;
  @override
  @JsonKey()
  List<ApplicationModel> get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  String toString() {
    return 'ApplicationCollectionState.success(applications: $applications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationCollectionSuccess &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionSuccessCopyWith<_$ApplicationCollectionSuccess>
      get copyWith => __$$ApplicationCollectionSuccessCopyWithImpl<
          _$ApplicationCollectionSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications) $default, {
    required TResult Function(List<ApplicationModel> applications) progress,
    required TResult Function(List<ApplicationModel> applications) success,
    required TResult Function(
            List<ApplicationModel> applications, BaseException? error)
        error,
  }) {
    return success(applications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ApplicationModel> applications)? $default, {
    TResult? Function(List<ApplicationModel> applications)? progress,
    TResult? Function(List<ApplicationModel> applications)? success,
    TResult? Function(
            List<ApplicationModel> applications, BaseException? error)?
        error,
  }) {
    return success?.call(applications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications)? $default, {
    TResult Function(List<ApplicationModel> applications)? progress,
    TResult Function(List<ApplicationModel> applications)? success,
    TResult Function(List<ApplicationModel> applications, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(applications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value) $default, {
    required TResult Function(ApplicationCollectionProgress value) progress,
    required TResult Function(ApplicationCollectionSuccess value) success,
    required TResult Function(ApplicationCollectionError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApplicationCollectionState value)? $default, {
    TResult? Function(ApplicationCollectionProgress value)? progress,
    TResult? Function(ApplicationCollectionSuccess value)? success,
    TResult? Function(ApplicationCollectionError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value)? $default, {
    TResult Function(ApplicationCollectionProgress value)? progress,
    TResult Function(ApplicationCollectionSuccess value)? success,
    TResult Function(ApplicationCollectionError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApplicationCollectionSuccess
    implements ApplicationCollectionState {
  factory ApplicationCollectionSuccess(
          {final List<ApplicationModel> applications}) =
      _$ApplicationCollectionSuccess;

  @override
  List<ApplicationModel> get applications;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionSuccessCopyWith<_$ApplicationCollectionSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationCollectionErrorCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionErrorCopyWith(
          _$ApplicationCollectionError value,
          $Res Function(_$ApplicationCollectionError) then) =
      __$$ApplicationCollectionErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications, BaseException? error});
}

/// @nodoc
class __$$ApplicationCollectionErrorCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionError>
    implements _$$ApplicationCollectionErrorCopyWith<$Res> {
  __$$ApplicationCollectionErrorCopyWithImpl(
      _$ApplicationCollectionError _value,
      $Res Function(_$ApplicationCollectionError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
    Object? error = freezed,
  }) {
    return _then(_$ApplicationCollectionError(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionError implements ApplicationCollectionError {
  _$ApplicationCollectionError(
      {final List<ApplicationModel> applications = const [], this.error})
      : _applications = applications;

  final List<ApplicationModel> _applications;
  @override
  @JsonKey()
  List<ApplicationModel> get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  final BaseException? error;

  @override
  String toString() {
    return 'ApplicationCollectionState.error(applications: $applications, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationCollectionError &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionErrorCopyWith<_$ApplicationCollectionError>
      get copyWith => __$$ApplicationCollectionErrorCopyWithImpl<
          _$ApplicationCollectionError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications) $default, {
    required TResult Function(List<ApplicationModel> applications) progress,
    required TResult Function(List<ApplicationModel> applications) success,
    required TResult Function(
            List<ApplicationModel> applications, BaseException? error)
        error,
  }) {
    return error(applications, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<ApplicationModel> applications)? $default, {
    TResult? Function(List<ApplicationModel> applications)? progress,
    TResult? Function(List<ApplicationModel> applications)? success,
    TResult? Function(
            List<ApplicationModel> applications, BaseException? error)?
        error,
  }) {
    return error?.call(applications, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<ApplicationModel> applications)? $default, {
    TResult Function(List<ApplicationModel> applications)? progress,
    TResult Function(List<ApplicationModel> applications)? success,
    TResult Function(List<ApplicationModel> applications, BaseException? error)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(applications, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value) $default, {
    required TResult Function(ApplicationCollectionProgress value) progress,
    required TResult Function(ApplicationCollectionSuccess value) success,
    required TResult Function(ApplicationCollectionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ApplicationCollectionState value)? $default, {
    TResult? Function(ApplicationCollectionProgress value)? progress,
    TResult? Function(ApplicationCollectionSuccess value)? success,
    TResult? Function(ApplicationCollectionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApplicationCollectionState value)? $default, {
    TResult Function(ApplicationCollectionProgress value)? progress,
    TResult Function(ApplicationCollectionSuccess value)? success,
    TResult Function(ApplicationCollectionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApplicationCollectionError
    implements ApplicationCollectionState {
  factory ApplicationCollectionError(
      {final List<ApplicationModel> applications,
      final BaseException? error}) = _$ApplicationCollectionError;

  @override
  List<ApplicationModel> get applications;
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionErrorCopyWith<_$ApplicationCollectionError>
      get copyWith => throw _privateConstructorUsedError;
}
