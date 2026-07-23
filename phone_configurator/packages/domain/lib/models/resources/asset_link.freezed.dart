// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetLink {

 String get type;// e.g. "embed" | "post" | "user" | "asset"
 String get id;
/// Create a copy of AssetLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetLinkCopyWith<AssetLink> get copyWith => _$AssetLinkCopyWithImpl<AssetLink>(this as AssetLink, _$identity);

  /// Serializes this AssetLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetLink&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'AssetLink(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class $AssetLinkCopyWith<$Res>  {
  factory $AssetLinkCopyWith(AssetLink value, $Res Function(AssetLink) _then) = _$AssetLinkCopyWithImpl;
@useResult
$Res call({
 String type, String id
});




}
/// @nodoc
class _$AssetLinkCopyWithImpl<$Res>
    implements $AssetLinkCopyWith<$Res> {
  _$AssetLinkCopyWithImpl(this._self, this._then);

  final AssetLink _self;
  final $Res Function(AssetLink) _then;

/// Create a copy of AssetLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetLink].
extension AssetLinkPatterns on AssetLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetLink value)  $default,){
final _that = this;
switch (_that) {
case _AssetLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetLink value)?  $default,){
final _that = this;
switch (_that) {
case _AssetLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetLink() when $default != null:
return $default(_that.type,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String id)  $default,) {final _that = this;
switch (_that) {
case _AssetLink():
return $default(_that.type,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String id)?  $default,) {final _that = this;
switch (_that) {
case _AssetLink() when $default != null:
return $default(_that.type,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetLink implements AssetLink {
  const _AssetLink({required this.type, required this.id});
  factory _AssetLink.fromJson(Map<String, dynamic> json) => _$AssetLinkFromJson(json);

@override final  String type;
// e.g. "embed" | "post" | "user" | "asset"
@override final  String id;

/// Create a copy of AssetLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetLinkCopyWith<_AssetLink> get copyWith => __$AssetLinkCopyWithImpl<_AssetLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetLink&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id);

@override
String toString() {
  return 'AssetLink(type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class _$AssetLinkCopyWith<$Res> implements $AssetLinkCopyWith<$Res> {
  factory _$AssetLinkCopyWith(_AssetLink value, $Res Function(_AssetLink) _then) = __$AssetLinkCopyWithImpl;
@override @useResult
$Res call({
 String type, String id
});




}
/// @nodoc
class __$AssetLinkCopyWithImpl<$Res>
    implements _$AssetLinkCopyWith<$Res> {
  __$AssetLinkCopyWithImpl(this._self, this._then);

  final _AssetLink _self;
  final $Res Function(_AssetLink) _then;

/// Create a copy of AssetLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,}) {
  return _then(_AssetLink(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
