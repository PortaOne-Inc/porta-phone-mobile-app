// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreviewThemeState {

 bool get frameVisible;
/// Create a copy of PreviewThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewThemeStateCopyWith<PreviewThemeState> get copyWith => _$PreviewThemeStateCopyWithImpl<PreviewThemeState>(this as PreviewThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewThemeState&&(identical(other.frameVisible, frameVisible) || other.frameVisible == frameVisible));
}


@override
int get hashCode => Object.hash(runtimeType,frameVisible);

@override
String toString() {
  return 'PreviewThemeState(frameVisible: $frameVisible)';
}


}

/// @nodoc
abstract mixin class $PreviewThemeStateCopyWith<$Res>  {
  factory $PreviewThemeStateCopyWith(PreviewThemeState value, $Res Function(PreviewThemeState) _then) = _$PreviewThemeStateCopyWithImpl;
@useResult
$Res call({
 bool frameVisible
});




}
/// @nodoc
class _$PreviewThemeStateCopyWithImpl<$Res>
    implements $PreviewThemeStateCopyWith<$Res> {
  _$PreviewThemeStateCopyWithImpl(this._self, this._then);

  final PreviewThemeState _self;
  final $Res Function(PreviewThemeState) _then;

/// Create a copy of PreviewThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frameVisible = null,}) {
  return _then(_self.copyWith(
frameVisible: null == frameVisible ? _self.frameVisible : frameVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PreviewThemeState].
extension PreviewThemeStatePatterns on PreviewThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreviewThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreviewThemeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreviewThemeState value)  $default,){
final _that = this;
switch (_that) {
case _PreviewThemeState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreviewThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _PreviewThemeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool frameVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreviewThemeState() when $default != null:
return $default(_that.frameVisible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool frameVisible)  $default,) {final _that = this;
switch (_that) {
case _PreviewThemeState():
return $default(_that.frameVisible);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool frameVisible)?  $default,) {final _that = this;
switch (_that) {
case _PreviewThemeState() when $default != null:
return $default(_that.frameVisible);case _:
  return null;

}
}

}

/// @nodoc


class _PreviewThemeState implements PreviewThemeState {
  const _PreviewThemeState({required this.frameVisible});
  

@override final  bool frameVisible;

/// Create a copy of PreviewThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewThemeStateCopyWith<_PreviewThemeState> get copyWith => __$PreviewThemeStateCopyWithImpl<_PreviewThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewThemeState&&(identical(other.frameVisible, frameVisible) || other.frameVisible == frameVisible));
}


@override
int get hashCode => Object.hash(runtimeType,frameVisible);

@override
String toString() {
  return 'PreviewThemeState(frameVisible: $frameVisible)';
}


}

/// @nodoc
abstract mixin class _$PreviewThemeStateCopyWith<$Res> implements $PreviewThemeStateCopyWith<$Res> {
  factory _$PreviewThemeStateCopyWith(_PreviewThemeState value, $Res Function(_PreviewThemeState) _then) = __$PreviewThemeStateCopyWithImpl;
@override @useResult
$Res call({
 bool frameVisible
});




}
/// @nodoc
class __$PreviewThemeStateCopyWithImpl<$Res>
    implements _$PreviewThemeStateCopyWith<$Res> {
  __$PreviewThemeStateCopyWithImpl(this._self, this._then);

  final _PreviewThemeState _self;
  final $Res Function(_PreviewThemeState) _then;

/// Create a copy of PreviewThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frameVisible = null,}) {
  return _then(_PreviewThemeState(
frameVisible: null == frameVisible ? _self.frameVisible : frameVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
