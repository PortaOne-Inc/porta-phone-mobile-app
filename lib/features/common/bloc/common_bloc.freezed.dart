// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommonState {

 ThemeMode get themeMode;
/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonStateCopyWith<CommonState> get copyWith => _$CommonStateCopyWithImpl<CommonState>(this as CommonState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'CommonState(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $CommonStateCopyWith<$Res>  {
  factory $CommonStateCopyWith(CommonState value, $Res Function(CommonState) _then) = _$CommonStateCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$CommonStateCopyWithImpl<$Res>
    implements $CommonStateCopyWith<$Res> {
  _$CommonStateCopyWithImpl(this._self, this._then);

  final CommonState _self;
  final $Res Function(CommonState) _then;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [CommonState].
extension CommonStatePatterns on CommonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CommonStateLogout value)?  logout,TResult Function( CommonStateThemeMode value)?  themeMode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CommonStateLogout() when logout != null:
return logout(_that);case CommonStateThemeMode() when themeMode != null:
return themeMode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CommonStateLogout value)  logout,required TResult Function( CommonStateThemeMode value)  themeMode,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CommonStateLogout():
return logout(_that);case CommonStateThemeMode():
return themeMode(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CommonStateLogout value)?  logout,TResult? Function( CommonStateThemeMode value)?  themeMode,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CommonStateLogout() when logout != null:
return logout(_that);case CommonStateThemeMode() when themeMode != null:
return themeMode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ThemeMode themeMode)?  initial,TResult Function( ThemeMode themeMode)?  logout,TResult Function( ThemeMode themeMode)?  themeMode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.themeMode);case CommonStateLogout() when logout != null:
return logout(_that.themeMode);case CommonStateThemeMode() when themeMode != null:
return themeMode(_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ThemeMode themeMode)  initial,required TResult Function( ThemeMode themeMode)  logout,required TResult Function( ThemeMode themeMode)  themeMode,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.themeMode);case CommonStateLogout():
return logout(_that.themeMode);case CommonStateThemeMode():
return themeMode(_that.themeMode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ThemeMode themeMode)?  initial,TResult? Function( ThemeMode themeMode)?  logout,TResult? Function( ThemeMode themeMode)?  themeMode,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.themeMode);case CommonStateLogout() when logout != null:
return logout(_that.themeMode);case CommonStateThemeMode() when themeMode != null:
return themeMode(_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CommonState {
  const _Initial({this.themeMode = ThemeMode.system});
  

@override@JsonKey() final  ThemeMode themeMode;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'CommonState.initial(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CommonStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(_Initial(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

/// @nodoc


class CommonStateLogout implements CommonState {
  const CommonStateLogout({this.themeMode = ThemeMode.system});
  

@override@JsonKey() final  ThemeMode themeMode;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonStateLogoutCopyWith<CommonStateLogout> get copyWith => _$CommonStateLogoutCopyWithImpl<CommonStateLogout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonStateLogout&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'CommonState.logout(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $CommonStateLogoutCopyWith<$Res> implements $CommonStateCopyWith<$Res> {
  factory $CommonStateLogoutCopyWith(CommonStateLogout value, $Res Function(CommonStateLogout) _then) = _$CommonStateLogoutCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$CommonStateLogoutCopyWithImpl<$Res>
    implements $CommonStateLogoutCopyWith<$Res> {
  _$CommonStateLogoutCopyWithImpl(this._self, this._then);

  final CommonStateLogout _self;
  final $Res Function(CommonStateLogout) _then;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(CommonStateLogout(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

/// @nodoc


class CommonStateThemeMode implements CommonState {
  const CommonStateThemeMode({this.themeMode = ThemeMode.system});
  

@override@JsonKey() final  ThemeMode themeMode;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonStateThemeModeCopyWith<CommonStateThemeMode> get copyWith => _$CommonStateThemeModeCopyWithImpl<CommonStateThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonStateThemeMode&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'CommonState.themeMode(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $CommonStateThemeModeCopyWith<$Res> implements $CommonStateCopyWith<$Res> {
  factory $CommonStateThemeModeCopyWith(CommonStateThemeMode value, $Res Function(CommonStateThemeMode) _then) = _$CommonStateThemeModeCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$CommonStateThemeModeCopyWithImpl<$Res>
    implements $CommonStateThemeModeCopyWith<$Res> {
  _$CommonStateThemeModeCopyWithImpl(this._self, this._then);

  final CommonStateThemeMode _self;
  final $Res Function(CommonStateThemeMode) _then;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(CommonStateThemeMode(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
