// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminState {
  ColorModel? get colors => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ColorModel? colors) $default, {
    required TResult Function(ColorModel? colors) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ColorModel? colors)? $default, {
    TResult? Function(ColorModel? colors)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ColorModel? colors)? $default, {
    TResult Function(ColorModel? colors)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdminState value) $default, {
    required TResult Function(AdminStateUpdate value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdminState value)? $default, {
    TResult? Function(AdminStateUpdate value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdminState value)? $default, {
    TResult Function(AdminStateUpdate value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminStateCopyWith<AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
  @useResult
  $Res call({ColorModel? colors});
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminStateCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$_AdminStateCopyWith(
          _$_AdminState value, $Res Function(_$_AdminState) then) =
      __$$_AdminStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ColorModel? colors});
}

/// @nodoc
class __$$_AdminStateCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$_AdminState>
    implements _$$_AdminStateCopyWith<$Res> {
  __$$_AdminStateCopyWithImpl(
      _$_AdminState _value, $Res Function(_$_AdminState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = freezed,
  }) {
    return _then(_$_AdminState(
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorModel?,
    ));
  }
}

/// @nodoc

class _$_AdminState implements _AdminState {
  _$_AdminState({this.colors});

  @override
  final ColorModel? colors;

  @override
  String toString() {
    return 'AdminState(colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminState &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminStateCopyWith<_$_AdminState> get copyWith =>
      __$$_AdminStateCopyWithImpl<_$_AdminState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ColorModel? colors) $default, {
    required TResult Function(ColorModel? colors) update,
  }) {
    return $default(colors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ColorModel? colors)? $default, {
    TResult? Function(ColorModel? colors)? update,
  }) {
    return $default?.call(colors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ColorModel? colors)? $default, {
    TResult Function(ColorModel? colors)? update,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(colors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdminState value) $default, {
    required TResult Function(AdminStateUpdate value) update,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdminState value)? $default, {
    TResult? Function(AdminStateUpdate value)? update,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdminState value)? $default, {
    TResult Function(AdminStateUpdate value)? update,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AdminState implements AdminState {
  factory _AdminState({final ColorModel? colors}) = _$_AdminState;

  @override
  ColorModel? get colors;
  @override
  @JsonKey(ignore: true)
  _$$_AdminStateCopyWith<_$_AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminStateUpdateCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$AdminStateUpdateCopyWith(
          _$AdminStateUpdate value, $Res Function(_$AdminStateUpdate) then) =
      __$$AdminStateUpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ColorModel? colors});
}

/// @nodoc
class __$$AdminStateUpdateCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$AdminStateUpdate>
    implements _$$AdminStateUpdateCopyWith<$Res> {
  __$$AdminStateUpdateCopyWithImpl(
      _$AdminStateUpdate _value, $Res Function(_$AdminStateUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colors = freezed,
  }) {
    return _then(_$AdminStateUpdate(
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorModel?,
    ));
  }
}

/// @nodoc

class _$AdminStateUpdate implements AdminStateUpdate {
  _$AdminStateUpdate({this.colors});

  @override
  final ColorModel? colors;

  @override
  String toString() {
    return 'AdminState.update(colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStateUpdate &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStateUpdateCopyWith<_$AdminStateUpdate> get copyWith =>
      __$$AdminStateUpdateCopyWithImpl<_$AdminStateUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(ColorModel? colors) $default, {
    required TResult Function(ColorModel? colors) update,
  }) {
    return update(colors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(ColorModel? colors)? $default, {
    TResult? Function(ColorModel? colors)? update,
  }) {
    return update?.call(colors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(ColorModel? colors)? $default, {
    TResult Function(ColorModel? colors)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(colors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdminState value) $default, {
    required TResult Function(AdminStateUpdate value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdminState value)? $default, {
    TResult? Function(AdminStateUpdate value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdminState value)? $default, {
    TResult Function(AdminStateUpdate value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class AdminStateUpdate implements AdminState {
  factory AdminStateUpdate({final ColorModel? colors}) = _$AdminStateUpdate;

  @override
  ColorModel? get colors;
  @override
  @JsonKey(ignore: true)
  _$$AdminStateUpdateCopyWith<_$AdminStateUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
