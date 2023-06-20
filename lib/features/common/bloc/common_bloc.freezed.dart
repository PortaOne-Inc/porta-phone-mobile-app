// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) initial,
    required TResult Function(ThemeMode themeMode) logout,
    required TResult Function(ThemeMode themeMode) themeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? initial,
    TResult? Function(ThemeMode themeMode)? logout,
    TResult? Function(ThemeMode themeMode)? themeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? initial,
    TResult Function(ThemeMode themeMode)? logout,
    TResult Function(ThemeMode themeMode)? themeMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CommonStateLogout value) logout,
    required TResult Function(CommonStateThemeMode value) themeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CommonStateLogout value)? logout,
    TResult? Function(CommonStateThemeMode value)? themeMode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CommonStateLogout value)? logout,
    TResult Function(CommonStateThemeMode value)? themeMode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonStateCopyWith<CommonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonStateCopyWith<$Res> {
  factory $CommonStateCopyWith(
          CommonState value, $Res Function(CommonState) then) =
      _$CommonStateCopyWithImpl<$Res, CommonState>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$CommonStateCopyWithImpl<$Res, $Val extends CommonState>
    implements $CommonStateCopyWith<$Res> {
  _$CommonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $CommonStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CommonStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$_Initial(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.themeMode = ThemeMode.system});

  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'CommonState.initial(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) initial,
    required TResult Function(ThemeMode themeMode) logout,
    required TResult Function(ThemeMode themeMode) themeMode,
  }) {
    return initial(this.themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? initial,
    TResult? Function(ThemeMode themeMode)? logout,
    TResult? Function(ThemeMode themeMode)? themeMode,
  }) {
    return initial?.call(this.themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? initial,
    TResult Function(ThemeMode themeMode)? logout,
    TResult Function(ThemeMode themeMode)? themeMode,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this.themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CommonStateLogout value) logout,
    required TResult Function(CommonStateThemeMode value) themeMode,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CommonStateLogout value)? logout,
    TResult? Function(CommonStateThemeMode value)? themeMode,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CommonStateLogout value)? logout,
    TResult Function(CommonStateThemeMode value)? themeMode,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CommonState {
  const factory _Initial({final ThemeMode themeMode}) = _$_Initial;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommonStateLogoutCopyWith<$Res>
    implements $CommonStateCopyWith<$Res> {
  factory _$$CommonStateLogoutCopyWith(
          _$CommonStateLogout value, $Res Function(_$CommonStateLogout) then) =
      __$$CommonStateLogoutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$CommonStateLogoutCopyWithImpl<$Res>
    extends _$CommonStateCopyWithImpl<$Res, _$CommonStateLogout>
    implements _$$CommonStateLogoutCopyWith<$Res> {
  __$$CommonStateLogoutCopyWithImpl(
      _$CommonStateLogout _value, $Res Function(_$CommonStateLogout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$CommonStateLogout(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$CommonStateLogout implements CommonStateLogout {
  const _$CommonStateLogout({this.themeMode = ThemeMode.system});

  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'CommonState.logout(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonStateLogout &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonStateLogoutCopyWith<_$CommonStateLogout> get copyWith =>
      __$$CommonStateLogoutCopyWithImpl<_$CommonStateLogout>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) initial,
    required TResult Function(ThemeMode themeMode) logout,
    required TResult Function(ThemeMode themeMode) themeMode,
  }) {
    return logout(this.themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? initial,
    TResult? Function(ThemeMode themeMode)? logout,
    TResult? Function(ThemeMode themeMode)? themeMode,
  }) {
    return logout?.call(this.themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? initial,
    TResult Function(ThemeMode themeMode)? logout,
    TResult Function(ThemeMode themeMode)? themeMode,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this.themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CommonStateLogout value) logout,
    required TResult Function(CommonStateThemeMode value) themeMode,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CommonStateLogout value)? logout,
    TResult? Function(CommonStateThemeMode value)? themeMode,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CommonStateLogout value)? logout,
    TResult Function(CommonStateThemeMode value)? themeMode,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class CommonStateLogout implements CommonState {
  const factory CommonStateLogout({final ThemeMode themeMode}) =
      _$CommonStateLogout;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$CommonStateLogoutCopyWith<_$CommonStateLogout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommonStateThemeModeCopyWith<$Res>
    implements $CommonStateCopyWith<$Res> {
  factory _$$CommonStateThemeModeCopyWith(_$CommonStateThemeMode value,
          $Res Function(_$CommonStateThemeMode) then) =
      __$$CommonStateThemeModeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$CommonStateThemeModeCopyWithImpl<$Res>
    extends _$CommonStateCopyWithImpl<$Res, _$CommonStateThemeMode>
    implements _$$CommonStateThemeModeCopyWith<$Res> {
  __$$CommonStateThemeModeCopyWithImpl(_$CommonStateThemeMode _value,
      $Res Function(_$CommonStateThemeMode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$CommonStateThemeMode(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$CommonStateThemeMode implements CommonStateThemeMode {
  const _$CommonStateThemeMode({this.themeMode = ThemeMode.system});

  @override
  @JsonKey()
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'CommonState.themeMode(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonStateThemeMode &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonStateThemeModeCopyWith<_$CommonStateThemeMode> get copyWith =>
      __$$CommonStateThemeModeCopyWithImpl<_$CommonStateThemeMode>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeMode themeMode) initial,
    required TResult Function(ThemeMode themeMode) logout,
    required TResult Function(ThemeMode themeMode) themeMode,
  }) {
    return themeMode(this.themeMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeMode themeMode)? initial,
    TResult? Function(ThemeMode themeMode)? logout,
    TResult? Function(ThemeMode themeMode)? themeMode,
  }) {
    return themeMode?.call(this.themeMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeMode themeMode)? initial,
    TResult Function(ThemeMode themeMode)? logout,
    TResult Function(ThemeMode themeMode)? themeMode,
    required TResult orElse(),
  }) {
    if (themeMode != null) {
      return themeMode(this.themeMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CommonStateLogout value) logout,
    required TResult Function(CommonStateThemeMode value) themeMode,
  }) {
    return themeMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CommonStateLogout value)? logout,
    TResult? Function(CommonStateThemeMode value)? themeMode,
  }) {
    return themeMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CommonStateLogout value)? logout,
    TResult Function(CommonStateThemeMode value)? themeMode,
    required TResult orElse(),
  }) {
    if (themeMode != null) {
      return themeMode(this);
    }
    return orElse();
  }
}

abstract class CommonStateThemeMode implements CommonState {
  const factory CommonStateThemeMode({final ThemeMode themeMode}) =
      _$CommonStateThemeMode;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$$CommonStateThemeModeCopyWith<_$CommonStateThemeMode> get copyWith =>
      throw _privateConstructorUsedError;
}
