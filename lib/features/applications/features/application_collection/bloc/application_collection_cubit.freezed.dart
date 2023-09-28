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
abstract class _$$ApplicationCollectionStateImplCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionStateImplCopyWith(
          _$ApplicationCollectionStateImpl value,
          $Res Function(_$ApplicationCollectionStateImpl) then) =
      __$$ApplicationCollectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class __$$ApplicationCollectionStateImplCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionStateImpl>
    implements _$$ApplicationCollectionStateImplCopyWith<$Res> {
  __$$ApplicationCollectionStateImplCopyWithImpl(
      _$ApplicationCollectionStateImpl _value,
      $Res Function(_$ApplicationCollectionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_$ApplicationCollectionStateImpl(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionStateImpl implements _ApplicationCollectionState {
  _$ApplicationCollectionStateImpl(
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
            other is _$ApplicationCollectionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionStateImplCopyWith<_$ApplicationCollectionStateImpl>
      get copyWith => __$$ApplicationCollectionStateImplCopyWithImpl<
          _$ApplicationCollectionStateImpl>(this, _$identity);

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
      _$ApplicationCollectionStateImpl;

  @override
  List<ApplicationModel> get applications;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionStateImplCopyWith<_$ApplicationCollectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationCollectionProgressImplCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionProgressImplCopyWith(
          _$ApplicationCollectionProgressImpl value,
          $Res Function(_$ApplicationCollectionProgressImpl) then) =
      __$$ApplicationCollectionProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class __$$ApplicationCollectionProgressImplCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionProgressImpl>
    implements _$$ApplicationCollectionProgressImplCopyWith<$Res> {
  __$$ApplicationCollectionProgressImplCopyWithImpl(
      _$ApplicationCollectionProgressImpl _value,
      $Res Function(_$ApplicationCollectionProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_$ApplicationCollectionProgressImpl(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionProgressImpl
    implements ApplicationCollectionProgress {
  _$ApplicationCollectionProgressImpl(
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
            other is _$ApplicationCollectionProgressImpl &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionProgressImplCopyWith<
          _$ApplicationCollectionProgressImpl>
      get copyWith => __$$ApplicationCollectionProgressImplCopyWithImpl<
          _$ApplicationCollectionProgressImpl>(this, _$identity);

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
      _$ApplicationCollectionProgressImpl;

  @override
  List<ApplicationModel> get applications;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionProgressImplCopyWith<
          _$ApplicationCollectionProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationCollectionSuccessImplCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionSuccessImplCopyWith(
          _$ApplicationCollectionSuccessImpl value,
          $Res Function(_$ApplicationCollectionSuccessImpl) then) =
      __$$ApplicationCollectionSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications});
}

/// @nodoc
class __$$ApplicationCollectionSuccessImplCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionSuccessImpl>
    implements _$$ApplicationCollectionSuccessImplCopyWith<$Res> {
  __$$ApplicationCollectionSuccessImplCopyWithImpl(
      _$ApplicationCollectionSuccessImpl _value,
      $Res Function(_$ApplicationCollectionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
  }) {
    return _then(_$ApplicationCollectionSuccessImpl(
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionSuccessImpl
    implements ApplicationCollectionSuccess {
  _$ApplicationCollectionSuccessImpl(
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
            other is _$ApplicationCollectionSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionSuccessImplCopyWith<
          _$ApplicationCollectionSuccessImpl>
      get copyWith => __$$ApplicationCollectionSuccessImplCopyWithImpl<
          _$ApplicationCollectionSuccessImpl>(this, _$identity);

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
      _$ApplicationCollectionSuccessImpl;

  @override
  List<ApplicationModel> get applications;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionSuccessImplCopyWith<
          _$ApplicationCollectionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplicationCollectionErrorImplCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionErrorImplCopyWith(
          _$ApplicationCollectionErrorImpl value,
          $Res Function(_$ApplicationCollectionErrorImpl) then) =
      __$$ApplicationCollectionErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApplicationModel> applications, BaseException? error});
}

/// @nodoc
class __$$ApplicationCollectionErrorImplCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionErrorImpl>
    implements _$$ApplicationCollectionErrorImplCopyWith<$Res> {
  __$$ApplicationCollectionErrorImplCopyWithImpl(
      _$ApplicationCollectionErrorImpl _value,
      $Res Function(_$ApplicationCollectionErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applications = null,
    Object? error = freezed,
  }) {
    return _then(_$ApplicationCollectionErrorImpl(
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

class _$ApplicationCollectionErrorImpl implements ApplicationCollectionError {
  _$ApplicationCollectionErrorImpl(
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
            other is _$ApplicationCollectionErrorImpl &&
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
  _$$ApplicationCollectionErrorImplCopyWith<_$ApplicationCollectionErrorImpl>
      get copyWith => __$$ApplicationCollectionErrorImplCopyWithImpl<
          _$ApplicationCollectionErrorImpl>(this, _$identity);

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
      final BaseException? error}) = _$ApplicationCollectionErrorImpl;

  @override
  List<ApplicationModel> get applications;
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionErrorImplCopyWith<_$ApplicationCollectionErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
