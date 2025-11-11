// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_http_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationHttpModel {

 String get locale; String get key; String get value;
/// Create a copy of TranslationHttpModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationHttpModelCopyWith<TranslationHttpModel> get copyWith => _$TranslationHttpModelCopyWithImpl<TranslationHttpModel>(this as TranslationHttpModel, _$identity);

  /// Serializes this TranslationHttpModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationHttpModel&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,key,value);

@override
String toString() {
  return 'TranslationHttpModel(locale: $locale, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $TranslationHttpModelCopyWith<$Res>  {
  factory $TranslationHttpModelCopyWith(TranslationHttpModel value, $Res Function(TranslationHttpModel) _then) = _$TranslationHttpModelCopyWithImpl;
@useResult
$Res call({
 String locale, String key, String value
});




}
/// @nodoc
class _$TranslationHttpModelCopyWithImpl<$Res>
    implements $TranslationHttpModelCopyWith<$Res> {
  _$TranslationHttpModelCopyWithImpl(this._self, this._then);

  final TranslationHttpModel _self;
  final $Res Function(TranslationHttpModel) _then;

/// Create a copy of TranslationHttpModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslationHttpModel].
extension TranslationHttpModelPatterns on TranslationHttpModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationHttpModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationHttpModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationHttpModel value)  $default,){
final _that = this;
switch (_that) {
case _TranslationHttpModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationHttpModel value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationHttpModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String locale,  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationHttpModel() when $default != null:
return $default(_that.locale,_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String locale,  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _TranslationHttpModel():
return $default(_that.locale,_that.key,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String locale,  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _TranslationHttpModel() when $default != null:
return $default(_that.locale,_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslationHttpModel extends TranslationHttpModel {
  const _TranslationHttpModel({required this.locale, required this.key, required this.value}): super._();
  factory _TranslationHttpModel.fromJson(Map<String, dynamic> json) => _$TranslationHttpModelFromJson(json);

@override final  String locale;
@override final  String key;
@override final  String value;

/// Create a copy of TranslationHttpModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationHttpModelCopyWith<_TranslationHttpModel> get copyWith => __$TranslationHttpModelCopyWithImpl<_TranslationHttpModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationHttpModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationHttpModel&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,key,value);

@override
String toString() {
  return 'TranslationHttpModel(locale: $locale, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$TranslationHttpModelCopyWith<$Res> implements $TranslationHttpModelCopyWith<$Res> {
  factory _$TranslationHttpModelCopyWith(_TranslationHttpModel value, $Res Function(_TranslationHttpModel) _then) = __$TranslationHttpModelCopyWithImpl;
@override @useResult
$Res call({
 String locale, String key, String value
});




}
/// @nodoc
class __$TranslationHttpModelCopyWithImpl<$Res>
    implements _$TranslationHttpModelCopyWith<$Res> {
  __$TranslationHttpModelCopyWithImpl(this._self, this._then);

  final _TranslationHttpModel _self;
  final $Res Function(_TranslationHttpModel) _then;

/// Create a copy of TranslationHttpModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? key = null,Object? value = null,}) {
  return _then(_TranslationHttpModel(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
