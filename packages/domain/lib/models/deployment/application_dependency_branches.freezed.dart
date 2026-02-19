// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_dependency_branches.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationDependencyBranches {

 List<PhoneBranch> get phoneBranches; List<CallkeepBranch> get callkeepBranches; String get phoneSourceBranch; String get callkeepSourceBranch; String get configuratorSourceBranch; String get phoneConfiguratorToolSourceBranch; String get keystoreSourceBranch;
/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationDependencyBranchesCopyWith<ApplicationDependencyBranches> get copyWith => _$ApplicationDependencyBranchesCopyWithImpl<ApplicationDependencyBranches>(this as ApplicationDependencyBranches, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationDependencyBranches&&const DeepCollectionEquality().equals(other.phoneBranches, phoneBranches)&&const DeepCollectionEquality().equals(other.callkeepBranches, callkeepBranches)&&(identical(other.phoneSourceBranch, phoneSourceBranch) || other.phoneSourceBranch == phoneSourceBranch)&&(identical(other.callkeepSourceBranch, callkeepSourceBranch) || other.callkeepSourceBranch == callkeepSourceBranch)&&(identical(other.configuratorSourceBranch, configuratorSourceBranch) || other.configuratorSourceBranch == configuratorSourceBranch)&&(identical(other.phoneConfiguratorToolSourceBranch, phoneConfiguratorToolSourceBranch) || other.phoneConfiguratorToolSourceBranch == phoneConfiguratorToolSourceBranch)&&(identical(other.keystoreSourceBranch, keystoreSourceBranch) || other.keystoreSourceBranch == keystoreSourceBranch));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(phoneBranches),const DeepCollectionEquality().hash(callkeepBranches),phoneSourceBranch,callkeepSourceBranch,configuratorSourceBranch,phoneConfiguratorToolSourceBranch,keystoreSourceBranch);

@override
String toString() {
  return 'ApplicationDependencyBranches(phoneBranches: $phoneBranches, callkeepBranches: $callkeepBranches, phoneSourceBranch: $phoneSourceBranch, callkeepSourceBranch: $callkeepSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, keystoreSourceBranch: $keystoreSourceBranch)';
}


}

/// @nodoc
abstract mixin class $ApplicationDependencyBranchesCopyWith<$Res>  {
  factory $ApplicationDependencyBranchesCopyWith(ApplicationDependencyBranches value, $Res Function(ApplicationDependencyBranches) _then) = _$ApplicationDependencyBranchesCopyWithImpl;
@useResult
$Res call({
 List<PhoneBranch> phoneBranches, List<CallkeepBranch> callkeepBranches, String phoneSourceBranch, String callkeepSourceBranch, String configuratorSourceBranch, String phoneConfiguratorToolSourceBranch, String keystoreSourceBranch
});




}
/// @nodoc
class _$ApplicationDependencyBranchesCopyWithImpl<$Res>
    implements $ApplicationDependencyBranchesCopyWith<$Res> {
  _$ApplicationDependencyBranchesCopyWithImpl(this._self, this._then);

  final ApplicationDependencyBranches _self;
  final $Res Function(ApplicationDependencyBranches) _then;

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneBranches = null,Object? callkeepBranches = null,Object? phoneSourceBranch = null,Object? callkeepSourceBranch = null,Object? configuratorSourceBranch = null,Object? phoneConfiguratorToolSourceBranch = null,Object? keystoreSourceBranch = null,}) {
  return _then(_self.copyWith(
phoneBranches: null == phoneBranches ? _self.phoneBranches : phoneBranches // ignore: cast_nullable_to_non_nullable
as List<PhoneBranch>,callkeepBranches: null == callkeepBranches ? _self.callkeepBranches : callkeepBranches // ignore: cast_nullable_to_non_nullable
as List<CallkeepBranch>,phoneSourceBranch: null == phoneSourceBranch ? _self.phoneSourceBranch : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
as String,callkeepSourceBranch: null == callkeepSourceBranch ? _self.callkeepSourceBranch : callkeepSourceBranch // ignore: cast_nullable_to_non_nullable
as String,configuratorSourceBranch: null == configuratorSourceBranch ? _self.configuratorSourceBranch : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
as String,phoneConfiguratorToolSourceBranch: null == phoneConfiguratorToolSourceBranch ? _self.phoneConfiguratorToolSourceBranch : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
as String,keystoreSourceBranch: null == keystoreSourceBranch ? _self.keystoreSourceBranch : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationDependencyBranches].
extension ApplicationDependencyBranchesPatterns on ApplicationDependencyBranches {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationDependencyBranches value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationDependencyBranches value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationDependencyBranches():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationDependencyBranches value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PhoneBranch> phoneBranches,  List<CallkeepBranch> callkeepBranches,  String phoneSourceBranch,  String callkeepSourceBranch,  String configuratorSourceBranch,  String phoneConfiguratorToolSourceBranch,  String keystoreSourceBranch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
return $default(_that.phoneBranches,_that.callkeepBranches,_that.phoneSourceBranch,_that.callkeepSourceBranch,_that.configuratorSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.keystoreSourceBranch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PhoneBranch> phoneBranches,  List<CallkeepBranch> callkeepBranches,  String phoneSourceBranch,  String callkeepSourceBranch,  String configuratorSourceBranch,  String phoneConfiguratorToolSourceBranch,  String keystoreSourceBranch)  $default,) {final _that = this;
switch (_that) {
case _ApplicationDependencyBranches():
return $default(_that.phoneBranches,_that.callkeepBranches,_that.phoneSourceBranch,_that.callkeepSourceBranch,_that.configuratorSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.keystoreSourceBranch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PhoneBranch> phoneBranches,  List<CallkeepBranch> callkeepBranches,  String phoneSourceBranch,  String callkeepSourceBranch,  String configuratorSourceBranch,  String phoneConfiguratorToolSourceBranch,  String keystoreSourceBranch)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
return $default(_that.phoneBranches,_that.callkeepBranches,_that.phoneSourceBranch,_that.callkeepSourceBranch,_that.configuratorSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.keystoreSourceBranch);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationDependencyBranches extends ApplicationDependencyBranches {
  const _ApplicationDependencyBranches({final  List<PhoneBranch> phoneBranches = const [], final  List<CallkeepBranch> callkeepBranches = const [], this.phoneSourceBranch = _kDefaultPhoneMainSourceBranch, this.callkeepSourceBranch = _kDefaultCallkeepSourceBranch, this.configuratorSourceBranch = _kConfiguratorSourceBranch, this.phoneConfiguratorToolSourceBranch = _kDefaultPhoneConfiguratorToolSourceBranch, this.keystoreSourceBranch = _kDefaultKeystoreSourceBranch}): _phoneBranches = phoneBranches, _callkeepBranches = callkeepBranches,super._();
  

 final  List<PhoneBranch> _phoneBranches;
@override@JsonKey() List<PhoneBranch> get phoneBranches {
  if (_phoneBranches is EqualUnmodifiableListView) return _phoneBranches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phoneBranches);
}

 final  List<CallkeepBranch> _callkeepBranches;
@override@JsonKey() List<CallkeepBranch> get callkeepBranches {
  if (_callkeepBranches is EqualUnmodifiableListView) return _callkeepBranches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_callkeepBranches);
}

@override@JsonKey() final  String phoneSourceBranch;
@override@JsonKey() final  String callkeepSourceBranch;
@override@JsonKey() final  String configuratorSourceBranch;
@override@JsonKey() final  String phoneConfiguratorToolSourceBranch;
@override@JsonKey() final  String keystoreSourceBranch;

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationDependencyBranchesCopyWith<_ApplicationDependencyBranches> get copyWith => __$ApplicationDependencyBranchesCopyWithImpl<_ApplicationDependencyBranches>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationDependencyBranches&&const DeepCollectionEquality().equals(other._phoneBranches, _phoneBranches)&&const DeepCollectionEquality().equals(other._callkeepBranches, _callkeepBranches)&&(identical(other.phoneSourceBranch, phoneSourceBranch) || other.phoneSourceBranch == phoneSourceBranch)&&(identical(other.callkeepSourceBranch, callkeepSourceBranch) || other.callkeepSourceBranch == callkeepSourceBranch)&&(identical(other.configuratorSourceBranch, configuratorSourceBranch) || other.configuratorSourceBranch == configuratorSourceBranch)&&(identical(other.phoneConfiguratorToolSourceBranch, phoneConfiguratorToolSourceBranch) || other.phoneConfiguratorToolSourceBranch == phoneConfiguratorToolSourceBranch)&&(identical(other.keystoreSourceBranch, keystoreSourceBranch) || other.keystoreSourceBranch == keystoreSourceBranch));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_phoneBranches),const DeepCollectionEquality().hash(_callkeepBranches),phoneSourceBranch,callkeepSourceBranch,configuratorSourceBranch,phoneConfiguratorToolSourceBranch,keystoreSourceBranch);

@override
String toString() {
  return 'ApplicationDependencyBranches(phoneBranches: $phoneBranches, callkeepBranches: $callkeepBranches, phoneSourceBranch: $phoneSourceBranch, callkeepSourceBranch: $callkeepSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, keystoreSourceBranch: $keystoreSourceBranch)';
}


}

/// @nodoc
abstract mixin class _$ApplicationDependencyBranchesCopyWith<$Res> implements $ApplicationDependencyBranchesCopyWith<$Res> {
  factory _$ApplicationDependencyBranchesCopyWith(_ApplicationDependencyBranches value, $Res Function(_ApplicationDependencyBranches) _then) = __$ApplicationDependencyBranchesCopyWithImpl;
@override @useResult
$Res call({
 List<PhoneBranch> phoneBranches, List<CallkeepBranch> callkeepBranches, String phoneSourceBranch, String callkeepSourceBranch, String configuratorSourceBranch, String phoneConfiguratorToolSourceBranch, String keystoreSourceBranch
});




}
/// @nodoc
class __$ApplicationDependencyBranchesCopyWithImpl<$Res>
    implements _$ApplicationDependencyBranchesCopyWith<$Res> {
  __$ApplicationDependencyBranchesCopyWithImpl(this._self, this._then);

  final _ApplicationDependencyBranches _self;
  final $Res Function(_ApplicationDependencyBranches) _then;

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneBranches = null,Object? callkeepBranches = null,Object? phoneSourceBranch = null,Object? callkeepSourceBranch = null,Object? configuratorSourceBranch = null,Object? phoneConfiguratorToolSourceBranch = null,Object? keystoreSourceBranch = null,}) {
  return _then(_ApplicationDependencyBranches(
phoneBranches: null == phoneBranches ? _self._phoneBranches : phoneBranches // ignore: cast_nullable_to_non_nullable
as List<PhoneBranch>,callkeepBranches: null == callkeepBranches ? _self._callkeepBranches : callkeepBranches // ignore: cast_nullable_to_non_nullable
as List<CallkeepBranch>,phoneSourceBranch: null == phoneSourceBranch ? _self.phoneSourceBranch : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
as String,callkeepSourceBranch: null == callkeepSourceBranch ? _self.callkeepSourceBranch : callkeepSourceBranch // ignore: cast_nullable_to_non_nullable
as String,configuratorSourceBranch: null == configuratorSourceBranch ? _self.configuratorSourceBranch : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
as String,phoneConfiguratorToolSourceBranch: null == phoneConfiguratorToolSourceBranch ? _self.phoneConfiguratorToolSourceBranch : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
as String,keystoreSourceBranch: null == keystoreSourceBranch ? _self.keystoreSourceBranch : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationDependencyBranchesCopyWith<ApplicationDependencyBranches> get copyWith => _$ApplicationDependencyBranchesCopyWithImpl<ApplicationDependencyBranches>(this as ApplicationDependencyBranches, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationDependencyBranches&&const DeepCollectionEquality().equals(other.phoneBranches, phoneBranches)&&(identical(other.phoneSourceBranch, phoneSourceBranch) || other.phoneSourceBranch == phoneSourceBranch)&&(identical(other.callkeepSourceBranch, callkeepSourceBranch) || other.callkeepSourceBranch == callkeepSourceBranch)&&(identical(other.configuratorSourceBranch, configuratorSourceBranch) || other.configuratorSourceBranch == configuratorSourceBranch)&&(identical(other.phoneConfiguratorToolSourceBranch, phoneConfiguratorToolSourceBranch) || other.phoneConfiguratorToolSourceBranch == phoneConfiguratorToolSourceBranch)&&(identical(other.keystoreSourceBranch, keystoreSourceBranch) || other.keystoreSourceBranch == keystoreSourceBranch));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(phoneBranches),phoneSourceBranch,callkeepSourceBranch,configuratorSourceBranch,phoneConfiguratorToolSourceBranch,keystoreSourceBranch);

@override
String toString() {
  return 'ApplicationDependencyBranches(phoneBranches: $phoneBranches, phoneSourceBranch: $phoneSourceBranch, callkeepSourceBranch: $callkeepSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, keystoreSourceBranch: $keystoreSourceBranch)';
}


}

/// @nodoc
abstract mixin class $ApplicationDependencyBranchesCopyWith<$Res>  {
  factory $ApplicationDependencyBranchesCopyWith(ApplicationDependencyBranches value, $Res Function(ApplicationDependencyBranches) _then) = _$ApplicationDependencyBranchesCopyWithImpl;
@useResult
$Res call({
 List<PhoneBranch> phoneBranches, String phoneSourceBranch, String callkeepSourceBranch, String configuratorSourceBranch, String phoneConfiguratorToolSourceBranch, String keystoreSourceBranch
});




}
/// @nodoc
class _$ApplicationDependencyBranchesCopyWithImpl<$Res>
    implements $ApplicationDependencyBranchesCopyWith<$Res> {
  _$ApplicationDependencyBranchesCopyWithImpl(this._self, this._then);

  final ApplicationDependencyBranches _self;
  final $Res Function(ApplicationDependencyBranches) _then;

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneBranches = null,Object? phoneSourceBranch = null,Object? callkeepSourceBranch = null,Object? configuratorSourceBranch = null,Object? phoneConfiguratorToolSourceBranch = null,Object? keystoreSourceBranch = null,}) {
  return _then(_self.copyWith(
phoneBranches: null == phoneBranches ? _self.phoneBranches : phoneBranches // ignore: cast_nullable_to_non_nullable
as List<PhoneBranch>,phoneSourceBranch: null == phoneSourceBranch ? _self.phoneSourceBranch : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
as String,callkeepSourceBranch: null == callkeepSourceBranch ? _self.callkeepSourceBranch : callkeepSourceBranch // ignore: cast_nullable_to_non_nullable
as String,configuratorSourceBranch: null == configuratorSourceBranch ? _self.configuratorSourceBranch : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
as String,phoneConfiguratorToolSourceBranch: null == phoneConfiguratorToolSourceBranch ? _self.phoneConfiguratorToolSourceBranch : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
as String,keystoreSourceBranch: null == keystoreSourceBranch ? _self.keystoreSourceBranch : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationDependencyBranches].
extension ApplicationDependencyBranchesPatterns on ApplicationDependencyBranches {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationDependencyBranches value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationDependencyBranches value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationDependencyBranches():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationDependencyBranches value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PhoneBranch> phoneBranches,  String phoneSourceBranch,  String callkeepSourceBranch,  String configuratorSourceBranch,  String phoneConfiguratorToolSourceBranch,  String keystoreSourceBranch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
return $default(_that.phoneBranches,_that.phoneSourceBranch,_that.callkeepSourceBranch,_that.configuratorSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.keystoreSourceBranch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PhoneBranch> phoneBranches,  String phoneSourceBranch,  String callkeepSourceBranch,  String configuratorSourceBranch,  String phoneConfiguratorToolSourceBranch,  String keystoreSourceBranch)  $default,) {final _that = this;
switch (_that) {
case _ApplicationDependencyBranches():
return $default(_that.phoneBranches,_that.phoneSourceBranch,_that.callkeepSourceBranch,_that.configuratorSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.keystoreSourceBranch);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PhoneBranch> phoneBranches,  String phoneSourceBranch,  String callkeepSourceBranch,  String configuratorSourceBranch,  String phoneConfiguratorToolSourceBranch,  String keystoreSourceBranch)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationDependencyBranches() when $default != null:
return $default(_that.phoneBranches,_that.phoneSourceBranch,_that.callkeepSourceBranch,_that.configuratorSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.keystoreSourceBranch);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationDependencyBranches extends ApplicationDependencyBranches {
  const _ApplicationDependencyBranches({final  List<PhoneBranch> phoneBranches = const [], this.phoneSourceBranch = _kDefaultPhoneMainSourceBranch, this.callkeepSourceBranch = _kDefaultCallkeepSourceBranch, this.configuratorSourceBranch = _kConfiguratorSourceBranch, this.phoneConfiguratorToolSourceBranch = _kDefaultPhoneConfiguratorToolSourceBranch, this.keystoreSourceBranch = _kDefaultKeystoreSourceBranch}): _phoneBranches = phoneBranches,super._();
  

 final  List<PhoneBranch> _phoneBranches;
@override@JsonKey() List<PhoneBranch> get phoneBranches {
  if (_phoneBranches is EqualUnmodifiableListView) return _phoneBranches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phoneBranches);
}

@override@JsonKey() final  String phoneSourceBranch;
@override@JsonKey() final  String callkeepSourceBranch;
@override@JsonKey() final  String configuratorSourceBranch;
@override@JsonKey() final  String phoneConfiguratorToolSourceBranch;
@override@JsonKey() final  String keystoreSourceBranch;

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationDependencyBranchesCopyWith<_ApplicationDependencyBranches> get copyWith => __$ApplicationDependencyBranchesCopyWithImpl<_ApplicationDependencyBranches>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationDependencyBranches&&const DeepCollectionEquality().equals(other._phoneBranches, _phoneBranches)&&(identical(other.phoneSourceBranch, phoneSourceBranch) || other.phoneSourceBranch == phoneSourceBranch)&&(identical(other.callkeepSourceBranch, callkeepSourceBranch) || other.callkeepSourceBranch == callkeepSourceBranch)&&(identical(other.configuratorSourceBranch, configuratorSourceBranch) || other.configuratorSourceBranch == configuratorSourceBranch)&&(identical(other.phoneConfiguratorToolSourceBranch, phoneConfiguratorToolSourceBranch) || other.phoneConfiguratorToolSourceBranch == phoneConfiguratorToolSourceBranch)&&(identical(other.keystoreSourceBranch, keystoreSourceBranch) || other.keystoreSourceBranch == keystoreSourceBranch));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_phoneBranches),phoneSourceBranch,callkeepSourceBranch,configuratorSourceBranch,phoneConfiguratorToolSourceBranch,keystoreSourceBranch);

@override
String toString() {
  return 'ApplicationDependencyBranches(phoneBranches: $phoneBranches, phoneSourceBranch: $phoneSourceBranch, callkeepSourceBranch: $callkeepSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, keystoreSourceBranch: $keystoreSourceBranch)';
}


}

/// @nodoc
abstract mixin class _$ApplicationDependencyBranchesCopyWith<$Res> implements $ApplicationDependencyBranchesCopyWith<$Res> {
  factory _$ApplicationDependencyBranchesCopyWith(_ApplicationDependencyBranches value, $Res Function(_ApplicationDependencyBranches) _then) = __$ApplicationDependencyBranchesCopyWithImpl;
@override @useResult
$Res call({
 List<PhoneBranch> phoneBranches, String phoneSourceBranch, String callkeepSourceBranch, String configuratorSourceBranch, String phoneConfiguratorToolSourceBranch, String keystoreSourceBranch
});




}
/// @nodoc
class __$ApplicationDependencyBranchesCopyWithImpl<$Res>
    implements _$ApplicationDependencyBranchesCopyWith<$Res> {
  __$ApplicationDependencyBranchesCopyWithImpl(this._self, this._then);

  final _ApplicationDependencyBranches _self;
  final $Res Function(_ApplicationDependencyBranches) _then;

/// Create a copy of ApplicationDependencyBranches
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneBranches = null,Object? phoneSourceBranch = null,Object? callkeepSourceBranch = null,Object? configuratorSourceBranch = null,Object? phoneConfiguratorToolSourceBranch = null,Object? keystoreSourceBranch = null,}) {
  return _then(_ApplicationDependencyBranches(
phoneBranches: null == phoneBranches ? _self._phoneBranches : phoneBranches // ignore: cast_nullable_to_non_nullable
as List<PhoneBranch>,phoneSourceBranch: null == phoneSourceBranch ? _self.phoneSourceBranch : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
as String,callkeepSourceBranch: null == callkeepSourceBranch ? _self.callkeepSourceBranch : callkeepSourceBranch // ignore: cast_nullable_to_non_nullable
as String,configuratorSourceBranch: null == configuratorSourceBranch ? _self.configuratorSourceBranch : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
as String,phoneConfiguratorToolSourceBranch: null == phoneConfiguratorToolSourceBranch ? _self.phoneConfiguratorToolSourceBranch : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
as String,keystoreSourceBranch: null == keystoreSourceBranch ? _self.keystoreSourceBranch : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
