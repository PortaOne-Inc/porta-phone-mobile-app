// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_build_platform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AndroidBuildPlatform {

 String get key; bool get deploy; AndroidPlayStoreConfig get playStoreConfig;
/// Create a copy of AndroidBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AndroidBuildPlatformCopyWith<AndroidBuildPlatform> get copyWith => _$AndroidBuildPlatformCopyWithImpl<AndroidBuildPlatform>(this as AndroidBuildPlatform, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AndroidBuildPlatform&&(identical(other.key, key) || other.key == key)&&(identical(other.deploy, deploy) || other.deploy == deploy)&&(identical(other.playStoreConfig, playStoreConfig) || other.playStoreConfig == playStoreConfig));
}


@override
int get hashCode => Object.hash(runtimeType,key,deploy,playStoreConfig);

@override
String toString() {
  return 'AndroidBuildPlatform(key: $key, deploy: $deploy, playStoreConfig: $playStoreConfig)';
}


}

/// @nodoc
abstract mixin class $AndroidBuildPlatformCopyWith<$Res>  {
  factory $AndroidBuildPlatformCopyWith(AndroidBuildPlatform value, $Res Function(AndroidBuildPlatform) _then) = _$AndroidBuildPlatformCopyWithImpl;
@useResult
$Res call({
 String key, bool deploy, AndroidPlayStoreConfig playStoreConfig
});


$AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig;

}
/// @nodoc
class _$AndroidBuildPlatformCopyWithImpl<$Res>
    implements $AndroidBuildPlatformCopyWith<$Res> {
  _$AndroidBuildPlatformCopyWithImpl(this._self, this._then);

  final AndroidBuildPlatform _self;
  final $Res Function(AndroidBuildPlatform) _then;

/// Create a copy of AndroidBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? deploy = null,Object? playStoreConfig = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,deploy: null == deploy ? _self.deploy : deploy // ignore: cast_nullable_to_non_nullable
as bool,playStoreConfig: null == playStoreConfig ? _self.playStoreConfig : playStoreConfig // ignore: cast_nullable_to_non_nullable
as AndroidPlayStoreConfig,
  ));
}
/// Create a copy of AndroidBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig {
  
  return $AndroidPlayStoreConfigCopyWith<$Res>(_self.playStoreConfig, (value) {
    return _then(_self.copyWith(playStoreConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [AndroidBuildPlatform].
extension AndroidBuildPlatformPatterns on AndroidBuildPlatform {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AndroidBuildPlatform value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AndroidBuildPlatform() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AndroidBuildPlatform value)  $default,){
final _that = this;
switch (_that) {
case _AndroidBuildPlatform():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AndroidBuildPlatform value)?  $default,){
final _that = this;
switch (_that) {
case _AndroidBuildPlatform() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  bool deploy,  AndroidPlayStoreConfig playStoreConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AndroidBuildPlatform() when $default != null:
return $default(_that.key,_that.deploy,_that.playStoreConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  bool deploy,  AndroidPlayStoreConfig playStoreConfig)  $default,) {final _that = this;
switch (_that) {
case _AndroidBuildPlatform():
return $default(_that.key,_that.deploy,_that.playStoreConfig);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  bool deploy,  AndroidPlayStoreConfig playStoreConfig)?  $default,) {final _that = this;
switch (_that) {
case _AndroidBuildPlatform() when $default != null:
return $default(_that.key,_that.deploy,_that.playStoreConfig);case _:
  return null;

}
}

}

/// @nodoc


class _AndroidBuildPlatform extends AndroidBuildPlatform {
  const _AndroidBuildPlatform({this.key = _kPlatformAndroidKey, this.deploy = false, this.playStoreConfig = const AndroidPlayStoreConfig(track: _kPlayStoreTrackBeta, status: _kPlayStoreStatusDraft, updatePriority: 0, userFraction: _kPlayStoreUserFractionMax)}): super._();
  

@override@JsonKey() final  String key;
@override@JsonKey() final  bool deploy;
@override@JsonKey() final  AndroidPlayStoreConfig playStoreConfig;

/// Create a copy of AndroidBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AndroidBuildPlatformCopyWith<_AndroidBuildPlatform> get copyWith => __$AndroidBuildPlatformCopyWithImpl<_AndroidBuildPlatform>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AndroidBuildPlatform&&(identical(other.key, key) || other.key == key)&&(identical(other.deploy, deploy) || other.deploy == deploy)&&(identical(other.playStoreConfig, playStoreConfig) || other.playStoreConfig == playStoreConfig));
}


@override
int get hashCode => Object.hash(runtimeType,key,deploy,playStoreConfig);

@override
String toString() {
  return 'AndroidBuildPlatform(key: $key, deploy: $deploy, playStoreConfig: $playStoreConfig)';
}


}

/// @nodoc
abstract mixin class _$AndroidBuildPlatformCopyWith<$Res> implements $AndroidBuildPlatformCopyWith<$Res> {
  factory _$AndroidBuildPlatformCopyWith(_AndroidBuildPlatform value, $Res Function(_AndroidBuildPlatform) _then) = __$AndroidBuildPlatformCopyWithImpl;
@override @useResult
$Res call({
 String key, bool deploy, AndroidPlayStoreConfig playStoreConfig
});


@override $AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig;

}
/// @nodoc
class __$AndroidBuildPlatformCopyWithImpl<$Res>
    implements _$AndroidBuildPlatformCopyWith<$Res> {
  __$AndroidBuildPlatformCopyWithImpl(this._self, this._then);

  final _AndroidBuildPlatform _self;
  final $Res Function(_AndroidBuildPlatform) _then;

/// Create a copy of AndroidBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? deploy = null,Object? playStoreConfig = null,}) {
  return _then(_AndroidBuildPlatform(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,deploy: null == deploy ? _self.deploy : deploy // ignore: cast_nullable_to_non_nullable
as bool,playStoreConfig: null == playStoreConfig ? _self.playStoreConfig : playStoreConfig // ignore: cast_nullable_to_non_nullable
as AndroidPlayStoreConfig,
  ));
}

/// Create a copy of AndroidBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AndroidPlayStoreConfigCopyWith<$Res> get playStoreConfig {
  
  return $AndroidPlayStoreConfigCopyWith<$Res>(_self.playStoreConfig, (value) {
    return _then(_self.copyWith(playStoreConfig: value));
  });
}
}

/// @nodoc
mixin _$IOSBuildPlatform {

 String get key; bool get deploy;
/// Create a copy of IOSBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IOSBuildPlatformCopyWith<IOSBuildPlatform> get copyWith => _$IOSBuildPlatformCopyWithImpl<IOSBuildPlatform>(this as IOSBuildPlatform, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IOSBuildPlatform&&(identical(other.key, key) || other.key == key)&&(identical(other.deploy, deploy) || other.deploy == deploy));
}


@override
int get hashCode => Object.hash(runtimeType,key,deploy);

@override
String toString() {
  return 'IOSBuildPlatform(key: $key, deploy: $deploy)';
}


}

/// @nodoc
abstract mixin class $IOSBuildPlatformCopyWith<$Res>  {
  factory $IOSBuildPlatformCopyWith(IOSBuildPlatform value, $Res Function(IOSBuildPlatform) _then) = _$IOSBuildPlatformCopyWithImpl;
@useResult
$Res call({
 String key, bool deploy
});




}
/// @nodoc
class _$IOSBuildPlatformCopyWithImpl<$Res>
    implements $IOSBuildPlatformCopyWith<$Res> {
  _$IOSBuildPlatformCopyWithImpl(this._self, this._then);

  final IOSBuildPlatform _self;
  final $Res Function(IOSBuildPlatform) _then;

/// Create a copy of IOSBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? deploy = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,deploy: null == deploy ? _self.deploy : deploy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [IOSBuildPlatform].
extension IOSBuildPlatformPatterns on IOSBuildPlatform {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IOSBuildPlatform value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IOSBuildPlatform() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IOSBuildPlatform value)  $default,){
final _that = this;
switch (_that) {
case _IOSBuildPlatform():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IOSBuildPlatform value)?  $default,){
final _that = this;
switch (_that) {
case _IOSBuildPlatform() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  bool deploy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IOSBuildPlatform() when $default != null:
return $default(_that.key,_that.deploy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  bool deploy)  $default,) {final _that = this;
switch (_that) {
case _IOSBuildPlatform():
return $default(_that.key,_that.deploy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  bool deploy)?  $default,) {final _that = this;
switch (_that) {
case _IOSBuildPlatform() when $default != null:
return $default(_that.key,_that.deploy);case _:
  return null;

}
}

}

/// @nodoc


class _IOSBuildPlatform extends IOSBuildPlatform {
  const _IOSBuildPlatform({this.key = _kPlatformIOSKey, this.deploy = false}): super._();
  

@override@JsonKey() final  String key;
@override@JsonKey() final  bool deploy;

/// Create a copy of IOSBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IOSBuildPlatformCopyWith<_IOSBuildPlatform> get copyWith => __$IOSBuildPlatformCopyWithImpl<_IOSBuildPlatform>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IOSBuildPlatform&&(identical(other.key, key) || other.key == key)&&(identical(other.deploy, deploy) || other.deploy == deploy));
}


@override
int get hashCode => Object.hash(runtimeType,key,deploy);

@override
String toString() {
  return 'IOSBuildPlatform(key: $key, deploy: $deploy)';
}


}

/// @nodoc
abstract mixin class _$IOSBuildPlatformCopyWith<$Res> implements $IOSBuildPlatformCopyWith<$Res> {
  factory _$IOSBuildPlatformCopyWith(_IOSBuildPlatform value, $Res Function(_IOSBuildPlatform) _then) = __$IOSBuildPlatformCopyWithImpl;
@override @useResult
$Res call({
 String key, bool deploy
});




}
/// @nodoc
class __$IOSBuildPlatformCopyWithImpl<$Res>
    implements _$IOSBuildPlatformCopyWith<$Res> {
  __$IOSBuildPlatformCopyWithImpl(this._self, this._then);

  final _IOSBuildPlatform _self;
  final $Res Function(_IOSBuildPlatform) _then;

/// Create a copy of IOSBuildPlatform
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? deploy = null,}) {
  return _then(_IOSBuildPlatform(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,deploy: null == deploy ? _self.deploy : deploy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AndroidPlayStoreConfig {

 String get track; String get status; int get updatePriority; double? get userFraction;
/// Create a copy of AndroidPlayStoreConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AndroidPlayStoreConfigCopyWith<AndroidPlayStoreConfig> get copyWith => _$AndroidPlayStoreConfigCopyWithImpl<AndroidPlayStoreConfig>(this as AndroidPlayStoreConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AndroidPlayStoreConfig&&(identical(other.track, track) || other.track == track)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatePriority, updatePriority) || other.updatePriority == updatePriority)&&(identical(other.userFraction, userFraction) || other.userFraction == userFraction));
}


@override
int get hashCode => Object.hash(runtimeType,track,status,updatePriority,userFraction);

@override
String toString() {
  return 'AndroidPlayStoreConfig(track: $track, status: $status, updatePriority: $updatePriority, userFraction: $userFraction)';
}


}

/// @nodoc
abstract mixin class $AndroidPlayStoreConfigCopyWith<$Res>  {
  factory $AndroidPlayStoreConfigCopyWith(AndroidPlayStoreConfig value, $Res Function(AndroidPlayStoreConfig) _then) = _$AndroidPlayStoreConfigCopyWithImpl;
@useResult
$Res call({
 String track, String status, int updatePriority, double? userFraction
});




}
/// @nodoc
class _$AndroidPlayStoreConfigCopyWithImpl<$Res>
    implements $AndroidPlayStoreConfigCopyWith<$Res> {
  _$AndroidPlayStoreConfigCopyWithImpl(this._self, this._then);

  final AndroidPlayStoreConfig _self;
  final $Res Function(AndroidPlayStoreConfig) _then;

/// Create a copy of AndroidPlayStoreConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? track = null,Object? status = null,Object? updatePriority = null,Object? userFraction = freezed,}) {
  return _then(_self.copyWith(
track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,updatePriority: null == updatePriority ? _self.updatePriority : updatePriority // ignore: cast_nullable_to_non_nullable
as int,userFraction: freezed == userFraction ? _self.userFraction : userFraction // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AndroidPlayStoreConfig].
extension AndroidPlayStoreConfigPatterns on AndroidPlayStoreConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AndroidPlayStoreConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AndroidPlayStoreConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AndroidPlayStoreConfig value)  $default,){
final _that = this;
switch (_that) {
case _AndroidPlayStoreConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AndroidPlayStoreConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AndroidPlayStoreConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String track,  String status,  int updatePriority,  double? userFraction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AndroidPlayStoreConfig() when $default != null:
return $default(_that.track,_that.status,_that.updatePriority,_that.userFraction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String track,  String status,  int updatePriority,  double? userFraction)  $default,) {final _that = this;
switch (_that) {
case _AndroidPlayStoreConfig():
return $default(_that.track,_that.status,_that.updatePriority,_that.userFraction);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String track,  String status,  int updatePriority,  double? userFraction)?  $default,) {final _that = this;
switch (_that) {
case _AndroidPlayStoreConfig() when $default != null:
return $default(_that.track,_that.status,_that.updatePriority,_that.userFraction);case _:
  return null;

}
}

}

/// @nodoc


class _AndroidPlayStoreConfig extends AndroidPlayStoreConfig {
  const _AndroidPlayStoreConfig({required this.track, required this.status, required this.updatePriority, this.userFraction}): super._();
  

@override final  String track;
@override final  String status;
@override final  int updatePriority;
@override final  double? userFraction;

/// Create a copy of AndroidPlayStoreConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AndroidPlayStoreConfigCopyWith<_AndroidPlayStoreConfig> get copyWith => __$AndroidPlayStoreConfigCopyWithImpl<_AndroidPlayStoreConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AndroidPlayStoreConfig&&(identical(other.track, track) || other.track == track)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatePriority, updatePriority) || other.updatePriority == updatePriority)&&(identical(other.userFraction, userFraction) || other.userFraction == userFraction));
}


@override
int get hashCode => Object.hash(runtimeType,track,status,updatePriority,userFraction);

@override
String toString() {
  return 'AndroidPlayStoreConfig(track: $track, status: $status, updatePriority: $updatePriority, userFraction: $userFraction)';
}


}

/// @nodoc
abstract mixin class _$AndroidPlayStoreConfigCopyWith<$Res> implements $AndroidPlayStoreConfigCopyWith<$Res> {
  factory _$AndroidPlayStoreConfigCopyWith(_AndroidPlayStoreConfig value, $Res Function(_AndroidPlayStoreConfig) _then) = __$AndroidPlayStoreConfigCopyWithImpl;
@override @useResult
$Res call({
 String track, String status, int updatePriority, double? userFraction
});




}
/// @nodoc
class __$AndroidPlayStoreConfigCopyWithImpl<$Res>
    implements _$AndroidPlayStoreConfigCopyWith<$Res> {
  __$AndroidPlayStoreConfigCopyWithImpl(this._self, this._then);

  final _AndroidPlayStoreConfig _self;
  final $Res Function(_AndroidPlayStoreConfig) _then;

/// Create a copy of AndroidPlayStoreConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? track = null,Object? status = null,Object? updatePriority = null,Object? userFraction = freezed,}) {
  return _then(_AndroidPlayStoreConfig(
track: null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,updatePriority: null == updatePriority ? _self.updatePriority : updatePriority // ignore: cast_nullable_to_non_nullable
as int,userFraction: freezed == userFraction ? _self.userFraction : userFraction // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
