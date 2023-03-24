// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeCollectionState {
  List<AppConfigurationModel> get themes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes) $default, {
    required TResult Function(List<AppConfigurationModel> themes) progress,
    required TResult Function(List<AppConfigurationModel> themes) success,
    required TResult Function(
            List<AppConfigurationModel> themes, BaseException? error)
        error,
    required TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)
        navigateToEditTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppConfigurationModel> themes)? $default, {
    TResult? Function(List<AppConfigurationModel> themes)? progress,
    TResult? Function(List<AppConfigurationModel> themes)? success,
    TResult? Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult? Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes)? $default, {
    TResult Function(List<AppConfigurationModel> themes)? progress,
    TResult Function(List<AppConfigurationModel> themes)? success,
    TResult Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value) $default, {
    required TResult Function(ThemeCollectionStateProgress value) progress,
    required TResult Function(ThemeCollectionStateSuccess value) success,
    required TResult Function(ThemeCollectionStateError value) error,
    required TResult Function(ThemeCollectionNavigateToEditTheme value)
        navigateToEditTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeCollectionState value)? $default, {
    TResult? Function(ThemeCollectionStateProgress value)? progress,
    TResult? Function(ThemeCollectionStateSuccess value)? success,
    TResult? Function(ThemeCollectionStateError value)? error,
    TResult? Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value)? $default, {
    TResult Function(ThemeCollectionStateProgress value)? progress,
    TResult Function(ThemeCollectionStateSuccess value)? success,
    TResult Function(ThemeCollectionStateError value)? error,
    TResult Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeCollectionStateCopyWith<ThemeCollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeCollectionStateCopyWith<$Res> {
  factory $ThemeCollectionStateCopyWith(ThemeCollectionState value,
          $Res Function(ThemeCollectionState) then) =
      _$ThemeCollectionStateCopyWithImpl<$Res, ThemeCollectionState>;
  @useResult
  $Res call({List<AppConfigurationModel> themes});
}

/// @nodoc
class _$ThemeCollectionStateCopyWithImpl<$Res,
        $Val extends ThemeCollectionState>
    implements $ThemeCollectionStateCopyWith<$Res> {
  _$ThemeCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themes = null,
  }) {
    return _then(_value.copyWith(
      themes: null == themes
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<AppConfigurationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThemeCollectionStateCopyWith<$Res>
    implements $ThemeCollectionStateCopyWith<$Res> {
  factory _$$_ThemeCollectionStateCopyWith(_$_ThemeCollectionState value,
          $Res Function(_$_ThemeCollectionState) then) =
      __$$_ThemeCollectionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppConfigurationModel> themes});
}

/// @nodoc
class __$$_ThemeCollectionStateCopyWithImpl<$Res>
    extends _$ThemeCollectionStateCopyWithImpl<$Res, _$_ThemeCollectionState>
    implements _$$_ThemeCollectionStateCopyWith<$Res> {
  __$$_ThemeCollectionStateCopyWithImpl(_$_ThemeCollectionState _value,
      $Res Function(_$_ThemeCollectionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themes = null,
  }) {
    return _then(_$_ThemeCollectionState(
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<AppConfigurationModel>,
    ));
  }
}

/// @nodoc

class _$_ThemeCollectionState implements _ThemeCollectionState {
  _$_ThemeCollectionState({final List<AppConfigurationModel> themes = const []})
      : _themes = themes;

  final List<AppConfigurationModel> _themes;
  @override
  @JsonKey()
  List<AppConfigurationModel> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  String toString() {
    return 'ThemeCollectionState(themes: $themes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeCollectionState &&
            const DeepCollectionEquality().equals(other._themes, _themes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_themes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemeCollectionStateCopyWith<_$_ThemeCollectionState> get copyWith =>
      __$$_ThemeCollectionStateCopyWithImpl<_$_ThemeCollectionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes) $default, {
    required TResult Function(List<AppConfigurationModel> themes) progress,
    required TResult Function(List<AppConfigurationModel> themes) success,
    required TResult Function(
            List<AppConfigurationModel> themes, BaseException? error)
        error,
    required TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)
        navigateToEditTheme,
  }) {
    return $default(themes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppConfigurationModel> themes)? $default, {
    TResult? Function(List<AppConfigurationModel> themes)? progress,
    TResult? Function(List<AppConfigurationModel> themes)? success,
    TResult? Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult? Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
  }) {
    return $default?.call(themes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes)? $default, {
    TResult Function(List<AppConfigurationModel> themes)? progress,
    TResult Function(List<AppConfigurationModel> themes)? success,
    TResult Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(themes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value) $default, {
    required TResult Function(ThemeCollectionStateProgress value) progress,
    required TResult Function(ThemeCollectionStateSuccess value) success,
    required TResult Function(ThemeCollectionStateError value) error,
    required TResult Function(ThemeCollectionNavigateToEditTheme value)
        navigateToEditTheme,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeCollectionState value)? $default, {
    TResult? Function(ThemeCollectionStateProgress value)? progress,
    TResult? Function(ThemeCollectionStateSuccess value)? success,
    TResult? Function(ThemeCollectionStateError value)? error,
    TResult? Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value)? $default, {
    TResult Function(ThemeCollectionStateProgress value)? progress,
    TResult Function(ThemeCollectionStateSuccess value)? success,
    TResult Function(ThemeCollectionStateError value)? error,
    TResult Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ThemeCollectionState implements ThemeCollectionState {
  factory _ThemeCollectionState({final List<AppConfigurationModel> themes}) =
      _$_ThemeCollectionState;

  @override
  List<AppConfigurationModel> get themes;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeCollectionStateCopyWith<_$_ThemeCollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeCollectionStateProgressCopyWith<$Res>
    implements $ThemeCollectionStateCopyWith<$Res> {
  factory _$$ThemeCollectionStateProgressCopyWith(
          _$ThemeCollectionStateProgress value,
          $Res Function(_$ThemeCollectionStateProgress) then) =
      __$$ThemeCollectionStateProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppConfigurationModel> themes});
}

/// @nodoc
class __$$ThemeCollectionStateProgressCopyWithImpl<$Res>
    extends _$ThemeCollectionStateCopyWithImpl<$Res,
        _$ThemeCollectionStateProgress>
    implements _$$ThemeCollectionStateProgressCopyWith<$Res> {
  __$$ThemeCollectionStateProgressCopyWithImpl(
      _$ThemeCollectionStateProgress _value,
      $Res Function(_$ThemeCollectionStateProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themes = null,
  }) {
    return _then(_$ThemeCollectionStateProgress(
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<AppConfigurationModel>,
    ));
  }
}

/// @nodoc

class _$ThemeCollectionStateProgress implements ThemeCollectionStateProgress {
  _$ThemeCollectionStateProgress(
      {final List<AppConfigurationModel> themes = const []})
      : _themes = themes;

  final List<AppConfigurationModel> _themes;
  @override
  @JsonKey()
  List<AppConfigurationModel> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  String toString() {
    return 'ThemeCollectionState.progress(themes: $themes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeCollectionStateProgress &&
            const DeepCollectionEquality().equals(other._themes, _themes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_themes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeCollectionStateProgressCopyWith<_$ThemeCollectionStateProgress>
      get copyWith => __$$ThemeCollectionStateProgressCopyWithImpl<
          _$ThemeCollectionStateProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes) $default, {
    required TResult Function(List<AppConfigurationModel> themes) progress,
    required TResult Function(List<AppConfigurationModel> themes) success,
    required TResult Function(
            List<AppConfigurationModel> themes, BaseException? error)
        error,
    required TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)
        navigateToEditTheme,
  }) {
    return progress(themes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppConfigurationModel> themes)? $default, {
    TResult? Function(List<AppConfigurationModel> themes)? progress,
    TResult? Function(List<AppConfigurationModel> themes)? success,
    TResult? Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult? Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
  }) {
    return progress?.call(themes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes)? $default, {
    TResult Function(List<AppConfigurationModel> themes)? progress,
    TResult Function(List<AppConfigurationModel> themes)? success,
    TResult Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(themes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value) $default, {
    required TResult Function(ThemeCollectionStateProgress value) progress,
    required TResult Function(ThemeCollectionStateSuccess value) success,
    required TResult Function(ThemeCollectionStateError value) error,
    required TResult Function(ThemeCollectionNavigateToEditTheme value)
        navigateToEditTheme,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeCollectionState value)? $default, {
    TResult? Function(ThemeCollectionStateProgress value)? progress,
    TResult? Function(ThemeCollectionStateSuccess value)? success,
    TResult? Function(ThemeCollectionStateError value)? error,
    TResult? Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value)? $default, {
    TResult Function(ThemeCollectionStateProgress value)? progress,
    TResult Function(ThemeCollectionStateSuccess value)? success,
    TResult Function(ThemeCollectionStateError value)? error,
    TResult Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ThemeCollectionStateProgress implements ThemeCollectionState {
  factory ThemeCollectionStateProgress(
          {final List<AppConfigurationModel> themes}) =
      _$ThemeCollectionStateProgress;

  @override
  List<AppConfigurationModel> get themes;
  @override
  @JsonKey(ignore: true)
  _$$ThemeCollectionStateProgressCopyWith<_$ThemeCollectionStateProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeCollectionStateSuccessCopyWith<$Res>
    implements $ThemeCollectionStateCopyWith<$Res> {
  factory _$$ThemeCollectionStateSuccessCopyWith(
          _$ThemeCollectionStateSuccess value,
          $Res Function(_$ThemeCollectionStateSuccess) then) =
      __$$ThemeCollectionStateSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppConfigurationModel> themes});
}

/// @nodoc
class __$$ThemeCollectionStateSuccessCopyWithImpl<$Res>
    extends _$ThemeCollectionStateCopyWithImpl<$Res,
        _$ThemeCollectionStateSuccess>
    implements _$$ThemeCollectionStateSuccessCopyWith<$Res> {
  __$$ThemeCollectionStateSuccessCopyWithImpl(
      _$ThemeCollectionStateSuccess _value,
      $Res Function(_$ThemeCollectionStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themes = null,
  }) {
    return _then(_$ThemeCollectionStateSuccess(
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<AppConfigurationModel>,
    ));
  }
}

/// @nodoc

class _$ThemeCollectionStateSuccess implements ThemeCollectionStateSuccess {
  _$ThemeCollectionStateSuccess(
      {final List<AppConfigurationModel> themes = const []})
      : _themes = themes;

  final List<AppConfigurationModel> _themes;
  @override
  @JsonKey()
  List<AppConfigurationModel> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  String toString() {
    return 'ThemeCollectionState.success(themes: $themes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeCollectionStateSuccess &&
            const DeepCollectionEquality().equals(other._themes, _themes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_themes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeCollectionStateSuccessCopyWith<_$ThemeCollectionStateSuccess>
      get copyWith => __$$ThemeCollectionStateSuccessCopyWithImpl<
          _$ThemeCollectionStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes) $default, {
    required TResult Function(List<AppConfigurationModel> themes) progress,
    required TResult Function(List<AppConfigurationModel> themes) success,
    required TResult Function(
            List<AppConfigurationModel> themes, BaseException? error)
        error,
    required TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)
        navigateToEditTheme,
  }) {
    return success(themes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppConfigurationModel> themes)? $default, {
    TResult? Function(List<AppConfigurationModel> themes)? progress,
    TResult? Function(List<AppConfigurationModel> themes)? success,
    TResult? Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult? Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
  }) {
    return success?.call(themes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes)? $default, {
    TResult Function(List<AppConfigurationModel> themes)? progress,
    TResult Function(List<AppConfigurationModel> themes)? success,
    TResult Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(themes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value) $default, {
    required TResult Function(ThemeCollectionStateProgress value) progress,
    required TResult Function(ThemeCollectionStateSuccess value) success,
    required TResult Function(ThemeCollectionStateError value) error,
    required TResult Function(ThemeCollectionNavigateToEditTheme value)
        navigateToEditTheme,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeCollectionState value)? $default, {
    TResult? Function(ThemeCollectionStateProgress value)? progress,
    TResult? Function(ThemeCollectionStateSuccess value)? success,
    TResult? Function(ThemeCollectionStateError value)? error,
    TResult? Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value)? $default, {
    TResult Function(ThemeCollectionStateProgress value)? progress,
    TResult Function(ThemeCollectionStateSuccess value)? success,
    TResult Function(ThemeCollectionStateError value)? error,
    TResult Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ThemeCollectionStateSuccess implements ThemeCollectionState {
  factory ThemeCollectionStateSuccess(
          {final List<AppConfigurationModel> themes}) =
      _$ThemeCollectionStateSuccess;

  @override
  List<AppConfigurationModel> get themes;
  @override
  @JsonKey(ignore: true)
  _$$ThemeCollectionStateSuccessCopyWith<_$ThemeCollectionStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeCollectionStateErrorCopyWith<$Res>
    implements $ThemeCollectionStateCopyWith<$Res> {
  factory _$$ThemeCollectionStateErrorCopyWith(
          _$ThemeCollectionStateError value,
          $Res Function(_$ThemeCollectionStateError) then) =
      __$$ThemeCollectionStateErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppConfigurationModel> themes, BaseException? error});
}

/// @nodoc
class __$$ThemeCollectionStateErrorCopyWithImpl<$Res>
    extends _$ThemeCollectionStateCopyWithImpl<$Res,
        _$ThemeCollectionStateError>
    implements _$$ThemeCollectionStateErrorCopyWith<$Res> {
  __$$ThemeCollectionStateErrorCopyWithImpl(_$ThemeCollectionStateError _value,
      $Res Function(_$ThemeCollectionStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themes = null,
    Object? error = freezed,
  }) {
    return _then(_$ThemeCollectionStateError(
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<AppConfigurationModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$ThemeCollectionStateError implements ThemeCollectionStateError {
  _$ThemeCollectionStateError(
      {final List<AppConfigurationModel> themes = const [], this.error})
      : _themes = themes;

  final List<AppConfigurationModel> _themes;
  @override
  @JsonKey()
  List<AppConfigurationModel> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  final BaseException? error;

  @override
  String toString() {
    return 'ThemeCollectionState.error(themes: $themes, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeCollectionStateError &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_themes), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeCollectionStateErrorCopyWith<_$ThemeCollectionStateError>
      get copyWith => __$$ThemeCollectionStateErrorCopyWithImpl<
          _$ThemeCollectionStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes) $default, {
    required TResult Function(List<AppConfigurationModel> themes) progress,
    required TResult Function(List<AppConfigurationModel> themes) success,
    required TResult Function(
            List<AppConfigurationModel> themes, BaseException? error)
        error,
    required TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)
        navigateToEditTheme,
  }) {
    return error(themes, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppConfigurationModel> themes)? $default, {
    TResult? Function(List<AppConfigurationModel> themes)? progress,
    TResult? Function(List<AppConfigurationModel> themes)? success,
    TResult? Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult? Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
  }) {
    return error?.call(themes, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes)? $default, {
    TResult Function(List<AppConfigurationModel> themes)? progress,
    TResult Function(List<AppConfigurationModel> themes)? success,
    TResult Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(themes, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value) $default, {
    required TResult Function(ThemeCollectionStateProgress value) progress,
    required TResult Function(ThemeCollectionStateSuccess value) success,
    required TResult Function(ThemeCollectionStateError value) error,
    required TResult Function(ThemeCollectionNavigateToEditTheme value)
        navigateToEditTheme,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeCollectionState value)? $default, {
    TResult? Function(ThemeCollectionStateProgress value)? progress,
    TResult? Function(ThemeCollectionStateSuccess value)? success,
    TResult? Function(ThemeCollectionStateError value)? error,
    TResult? Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value)? $default, {
    TResult Function(ThemeCollectionStateProgress value)? progress,
    TResult Function(ThemeCollectionStateSuccess value)? success,
    TResult Function(ThemeCollectionStateError value)? error,
    TResult Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ThemeCollectionStateError implements ThemeCollectionState {
  factory ThemeCollectionStateError(
      {final List<AppConfigurationModel> themes,
      final BaseException? error}) = _$ThemeCollectionStateError;

  @override
  List<AppConfigurationModel> get themes;
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ThemeCollectionStateErrorCopyWith<_$ThemeCollectionStateError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThemeCollectionNavigateToEditThemeCopyWith<$Res>
    implements $ThemeCollectionStateCopyWith<$Res> {
  factory _$$ThemeCollectionNavigateToEditThemeCopyWith(
          _$ThemeCollectionNavigateToEditTheme value,
          $Res Function(_$ThemeCollectionNavigateToEditTheme) then) =
      __$$ThemeCollectionNavigateToEditThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AppConfigurationModel> themes,
      AppConfigurationModel? theme,
      BaseException? error});
}

/// @nodoc
class __$$ThemeCollectionNavigateToEditThemeCopyWithImpl<$Res>
    extends _$ThemeCollectionStateCopyWithImpl<$Res,
        _$ThemeCollectionNavigateToEditTheme>
    implements _$$ThemeCollectionNavigateToEditThemeCopyWith<$Res> {
  __$$ThemeCollectionNavigateToEditThemeCopyWithImpl(
      _$ThemeCollectionNavigateToEditTheme _value,
      $Res Function(_$ThemeCollectionNavigateToEditTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themes = null,
    Object? theme = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ThemeCollectionNavigateToEditTheme(
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<AppConfigurationModel>,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppConfigurationModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$ThemeCollectionNavigateToEditTheme
    implements ThemeCollectionNavigateToEditTheme {
  _$ThemeCollectionNavigateToEditTheme(
      {final List<AppConfigurationModel> themes = const [],
      this.theme,
      this.error})
      : _themes = themes;

  final List<AppConfigurationModel> _themes;
  @override
  @JsonKey()
  List<AppConfigurationModel> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  final AppConfigurationModel? theme;
  @override
  final BaseException? error;

  @override
  String toString() {
    return 'ThemeCollectionState.navigateToEditTheme(themes: $themes, theme: $theme, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeCollectionNavigateToEditTheme &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_themes), theme, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeCollectionNavigateToEditThemeCopyWith<
          _$ThemeCollectionNavigateToEditTheme>
      get copyWith => __$$ThemeCollectionNavigateToEditThemeCopyWithImpl<
          _$ThemeCollectionNavigateToEditTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes) $default, {
    required TResult Function(List<AppConfigurationModel> themes) progress,
    required TResult Function(List<AppConfigurationModel> themes) success,
    required TResult Function(
            List<AppConfigurationModel> themes, BaseException? error)
        error,
    required TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)
        navigateToEditTheme,
  }) {
    return navigateToEditTheme(themes, theme, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<AppConfigurationModel> themes)? $default, {
    TResult? Function(List<AppConfigurationModel> themes)? progress,
    TResult? Function(List<AppConfigurationModel> themes)? success,
    TResult? Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult? Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
  }) {
    return navigateToEditTheme?.call(themes, theme, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<AppConfigurationModel> themes)? $default, {
    TResult Function(List<AppConfigurationModel> themes)? progress,
    TResult Function(List<AppConfigurationModel> themes)? success,
    TResult Function(List<AppConfigurationModel> themes, BaseException? error)?
        error,
    TResult Function(List<AppConfigurationModel> themes,
            AppConfigurationModel? theme, BaseException? error)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (navigateToEditTheme != null) {
      return navigateToEditTheme(themes, theme, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value) $default, {
    required TResult Function(ThemeCollectionStateProgress value) progress,
    required TResult Function(ThemeCollectionStateSuccess value) success,
    required TResult Function(ThemeCollectionStateError value) error,
    required TResult Function(ThemeCollectionNavigateToEditTheme value)
        navigateToEditTheme,
  }) {
    return navigateToEditTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeCollectionState value)? $default, {
    TResult? Function(ThemeCollectionStateProgress value)? progress,
    TResult? Function(ThemeCollectionStateSuccess value)? success,
    TResult? Function(ThemeCollectionStateError value)? error,
    TResult? Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
  }) {
    return navigateToEditTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeCollectionState value)? $default, {
    TResult Function(ThemeCollectionStateProgress value)? progress,
    TResult Function(ThemeCollectionStateSuccess value)? success,
    TResult Function(ThemeCollectionStateError value)? error,
    TResult Function(ThemeCollectionNavigateToEditTheme value)?
        navigateToEditTheme,
    required TResult orElse(),
  }) {
    if (navigateToEditTheme != null) {
      return navigateToEditTheme(this);
    }
    return orElse();
  }
}

abstract class ThemeCollectionNavigateToEditTheme
    implements ThemeCollectionState {
  factory ThemeCollectionNavigateToEditTheme(
      {final List<AppConfigurationModel> themes,
      final AppConfigurationModel? theme,
      final BaseException? error}) = _$ThemeCollectionNavigateToEditTheme;

  @override
  List<AppConfigurationModel> get themes;
  AppConfigurationModel? get theme;
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ThemeCollectionNavigateToEditThemeCopyWith<
          _$ThemeCollectionNavigateToEditTheme>
      get copyWith => throw _privateConstructorUsedError;
}
