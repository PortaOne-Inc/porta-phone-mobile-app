// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_build_version_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationBuildVersionProgress {

 List<BuildPlatform> get progressNameUpdating; List<BuildPlatform> get progressNumberUpdating;
/// Create a copy of ApplicationBuildVersionProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationBuildVersionProgressCopyWith<ApplicationBuildVersionProgress> get copyWith => _$ApplicationBuildVersionProgressCopyWithImpl<ApplicationBuildVersionProgress>(this as ApplicationBuildVersionProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationBuildVersionProgress&&const DeepCollectionEquality().equals(other.progressNameUpdating, progressNameUpdating)&&const DeepCollectionEquality().equals(other.progressNumberUpdating, progressNumberUpdating));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(progressNameUpdating),const DeepCollectionEquality().hash(progressNumberUpdating));

@override
String toString() {
  return 'ApplicationBuildVersionProgress(progressNameUpdating: $progressNameUpdating, progressNumberUpdating: $progressNumberUpdating)';
}


}

/// @nodoc
abstract mixin class $ApplicationBuildVersionProgressCopyWith<$Res>  {
  factory $ApplicationBuildVersionProgressCopyWith(ApplicationBuildVersionProgress value, $Res Function(ApplicationBuildVersionProgress) _then) = _$ApplicationBuildVersionProgressCopyWithImpl;
@useResult
$Res call({
 List<BuildPlatform> progressNameUpdating, List<BuildPlatform> progressNumberUpdating
});




}
/// @nodoc
class _$ApplicationBuildVersionProgressCopyWithImpl<$Res>
    implements $ApplicationBuildVersionProgressCopyWith<$Res> {
  _$ApplicationBuildVersionProgressCopyWithImpl(this._self, this._then);

  final ApplicationBuildVersionProgress _self;
  final $Res Function(ApplicationBuildVersionProgress) _then;

/// Create a copy of ApplicationBuildVersionProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progressNameUpdating = null,Object? progressNumberUpdating = null,}) {
  return _then(_self.copyWith(
progressNameUpdating: null == progressNameUpdating ? _self.progressNameUpdating : progressNameUpdating // ignore: cast_nullable_to_non_nullable
as List<BuildPlatform>,progressNumberUpdating: null == progressNumberUpdating ? _self.progressNumberUpdating : progressNumberUpdating // ignore: cast_nullable_to_non_nullable
as List<BuildPlatform>,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationBuildVersionProgress].
extension ApplicationBuildVersionProgressPatterns on ApplicationBuildVersionProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationBuildVersionProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationBuildVersionProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationBuildVersionProgress value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationBuildVersionProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationBuildVersionProgress value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationBuildVersionProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BuildPlatform> progressNameUpdating,  List<BuildPlatform> progressNumberUpdating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationBuildVersionProgress() when $default != null:
return $default(_that.progressNameUpdating,_that.progressNumberUpdating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BuildPlatform> progressNameUpdating,  List<BuildPlatform> progressNumberUpdating)  $default,) {final _that = this;
switch (_that) {
case _ApplicationBuildVersionProgress():
return $default(_that.progressNameUpdating,_that.progressNumberUpdating);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BuildPlatform> progressNameUpdating,  List<BuildPlatform> progressNumberUpdating)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationBuildVersionProgress() when $default != null:
return $default(_that.progressNameUpdating,_that.progressNumberUpdating);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationBuildVersionProgress extends ApplicationBuildVersionProgress {
  const _ApplicationBuildVersionProgress({required final  List<BuildPlatform> progressNameUpdating, required final  List<BuildPlatform> progressNumberUpdating}): _progressNameUpdating = progressNameUpdating,_progressNumberUpdating = progressNumberUpdating,super._();
  

 final  List<BuildPlatform> _progressNameUpdating;
@override List<BuildPlatform> get progressNameUpdating {
  if (_progressNameUpdating is EqualUnmodifiableListView) return _progressNameUpdating;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_progressNameUpdating);
}

 final  List<BuildPlatform> _progressNumberUpdating;
@override List<BuildPlatform> get progressNumberUpdating {
  if (_progressNumberUpdating is EqualUnmodifiableListView) return _progressNumberUpdating;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_progressNumberUpdating);
}


/// Create a copy of ApplicationBuildVersionProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationBuildVersionProgressCopyWith<_ApplicationBuildVersionProgress> get copyWith => __$ApplicationBuildVersionProgressCopyWithImpl<_ApplicationBuildVersionProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationBuildVersionProgress&&const DeepCollectionEquality().equals(other._progressNameUpdating, _progressNameUpdating)&&const DeepCollectionEquality().equals(other._progressNumberUpdating, _progressNumberUpdating));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_progressNameUpdating),const DeepCollectionEquality().hash(_progressNumberUpdating));

@override
String toString() {
  return 'ApplicationBuildVersionProgress(progressNameUpdating: $progressNameUpdating, progressNumberUpdating: $progressNumberUpdating)';
}


}

/// @nodoc
abstract mixin class _$ApplicationBuildVersionProgressCopyWith<$Res> implements $ApplicationBuildVersionProgressCopyWith<$Res> {
  factory _$ApplicationBuildVersionProgressCopyWith(_ApplicationBuildVersionProgress value, $Res Function(_ApplicationBuildVersionProgress) _then) = __$ApplicationBuildVersionProgressCopyWithImpl;
@override @useResult
$Res call({
 List<BuildPlatform> progressNameUpdating, List<BuildPlatform> progressNumberUpdating
});




}
/// @nodoc
class __$ApplicationBuildVersionProgressCopyWithImpl<$Res>
    implements _$ApplicationBuildVersionProgressCopyWith<$Res> {
  __$ApplicationBuildVersionProgressCopyWithImpl(this._self, this._then);

  final _ApplicationBuildVersionProgress _self;
  final $Res Function(_ApplicationBuildVersionProgress) _then;

/// Create a copy of ApplicationBuildVersionProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progressNameUpdating = null,Object? progressNumberUpdating = null,}) {
  return _then(_ApplicationBuildVersionProgress(
progressNameUpdating: null == progressNameUpdating ? _self._progressNameUpdating : progressNameUpdating // ignore: cast_nullable_to_non_nullable
as List<BuildPlatform>,progressNumberUpdating: null == progressNumberUpdating ? _self._progressNumberUpdating : progressNumberUpdating // ignore: cast_nullable_to_non_nullable
as List<BuildPlatform>,
  ));
}


}

// dart format on
