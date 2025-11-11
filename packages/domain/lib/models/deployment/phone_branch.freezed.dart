// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PhoneBranch {

 String get name; PhoneBranchType get type;
/// Create a copy of PhoneBranch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneBranchCopyWith<PhoneBranch> get copyWith => _$PhoneBranchCopyWithImpl<PhoneBranch>(this as PhoneBranch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneBranch&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'PhoneBranch(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $PhoneBranchCopyWith<$Res>  {
  factory $PhoneBranchCopyWith(PhoneBranch value, $Res Function(PhoneBranch) _then) = _$PhoneBranchCopyWithImpl;
@useResult
$Res call({
 String name, PhoneBranchType type
});




}
/// @nodoc
class _$PhoneBranchCopyWithImpl<$Res>
    implements $PhoneBranchCopyWith<$Res> {
  _$PhoneBranchCopyWithImpl(this._self, this._then);

  final PhoneBranch _self;
  final $Res Function(PhoneBranch) _then;

/// Create a copy of PhoneBranch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PhoneBranchType,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneBranch].
extension PhoneBranchPatterns on PhoneBranch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneBranch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneBranch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneBranch value)  $default,){
final _that = this;
switch (_that) {
case _PhoneBranch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneBranch value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneBranch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  PhoneBranchType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneBranch() when $default != null:
return $default(_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  PhoneBranchType type)  $default,) {final _that = this;
switch (_that) {
case _PhoneBranch():
return $default(_that.name,_that.type);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  PhoneBranchType type)?  $default,) {final _that = this;
switch (_that) {
case _PhoneBranch() when $default != null:
return $default(_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _PhoneBranch extends PhoneBranch {
  const _PhoneBranch({required this.name, this.type = PhoneBranchType.regular}): super._();
  

@override final  String name;
@override@JsonKey() final  PhoneBranchType type;

/// Create a copy of PhoneBranch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneBranchCopyWith<_PhoneBranch> get copyWith => __$PhoneBranchCopyWithImpl<_PhoneBranch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneBranch&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString() {
  return 'PhoneBranch(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PhoneBranchCopyWith<$Res> implements $PhoneBranchCopyWith<$Res> {
  factory _$PhoneBranchCopyWith(_PhoneBranch value, $Res Function(_PhoneBranch) _then) = __$PhoneBranchCopyWithImpl;
@override @useResult
$Res call({
 String name, PhoneBranchType type
});




}
/// @nodoc
class __$PhoneBranchCopyWithImpl<$Res>
    implements _$PhoneBranchCopyWith<$Res> {
  __$PhoneBranchCopyWithImpl(this._self, this._then);

  final _PhoneBranch _self;
  final $Res Function(_PhoneBranch) _then;

/// Create a copy of PhoneBranch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,}) {
  return _then(_PhoneBranch(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PhoneBranchType,
  ));
}


}

// dart format on
