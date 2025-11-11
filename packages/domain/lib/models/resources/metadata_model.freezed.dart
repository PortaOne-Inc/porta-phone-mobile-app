// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetadataModel {

 Map<String, dynamic> get attributes;
/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<MetadataModel> get copyWith => _$MetadataModelCopyWithImpl<MetadataModel>(this as MetadataModel, _$identity);

  /// Serializes this MetadataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataModel&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'MetadataModel(attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $MetadataModelCopyWith<$Res>  {
  factory $MetadataModelCopyWith(MetadataModel value, $Res Function(MetadataModel) _then) = _$MetadataModelCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> attributes
});




}
/// @nodoc
class _$MetadataModelCopyWithImpl<$Res>
    implements $MetadataModelCopyWith<$Res> {
  _$MetadataModelCopyWithImpl(this._self, this._then);

  final MetadataModel _self;
  final $Res Function(MetadataModel) _then;

/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributes = null,}) {
  return _then(_self.copyWith(
attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataModel].
extension MetadataModelPatterns on MetadataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataModel value)  $default,){
final _that = this;
switch (_that) {
case _MetadataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataModel value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
return $default(_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> attributes)  $default,) {final _that = this;
switch (_that) {
case _MetadataModel():
return $default(_that.attributes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> attributes)?  $default,) {final _that = this;
switch (_that) {
case _MetadataModel() when $default != null:
return $default(_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetadataModel extends MetadataModel {
  const _MetadataModel({final  Map<String, dynamic> attributes = const {}}): _attributes = attributes,super._();
  factory _MetadataModel.fromJson(Map<String, dynamic> json) => _$MetadataModelFromJson(json);

 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataModelCopyWith<_MetadataModel> get copyWith => __$MetadataModelCopyWithImpl<_MetadataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataModel&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'MetadataModel(attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$MetadataModelCopyWith<$Res> implements $MetadataModelCopyWith<$Res> {
  factory _$MetadataModelCopyWith(_MetadataModel value, $Res Function(_MetadataModel) _then) = __$MetadataModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> attributes
});




}
/// @nodoc
class __$MetadataModelCopyWithImpl<$Res>
    implements _$MetadataModelCopyWith<$Res> {
  __$MetadataModelCopyWithImpl(this._self, this._then);

  final _MetadataModel _self;
  final $Res Function(_MetadataModel) _then;

/// Create a copy of MetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributes = null,}) {
  return _then(_MetadataModel(
attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
