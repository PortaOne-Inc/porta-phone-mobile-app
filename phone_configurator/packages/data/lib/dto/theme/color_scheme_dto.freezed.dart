// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_scheme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColorSchemeDto {

 String get applicationId; String get themeId; String get variant; Map<String, dynamic> get config; String? get id; int? get version; String? get createdAt; String? get updatedAt;
/// Create a copy of ColorSchemeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorSchemeDtoCopyWith<ColorSchemeDto> get copyWith => _$ColorSchemeDtoCopyWithImpl<ColorSchemeDto>(this as ColorSchemeDto, _$identity);

  /// Serializes this ColorSchemeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorSchemeDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,variant,const DeepCollectionEquality().hash(config),id,version,createdAt,updatedAt);

@override
String toString() {
  return 'ColorSchemeDto(applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, id: $id, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ColorSchemeDtoCopyWith<$Res>  {
  factory $ColorSchemeDtoCopyWith(ColorSchemeDto value, $Res Function(ColorSchemeDto) _then) = _$ColorSchemeDtoCopyWithImpl;
@useResult
$Res call({
 String applicationId, String themeId, String variant, Map<String, dynamic> config, String? id, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$ColorSchemeDtoCopyWithImpl<$Res>
    implements $ColorSchemeDtoCopyWith<$Res> {
  _$ColorSchemeDtoCopyWithImpl(this._self, this._then);

  final ColorSchemeDto _self;
  final $Res Function(ColorSchemeDto) _then;

/// Create a copy of ColorSchemeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? id = freezed,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorSchemeDto].
extension ColorSchemeDtoPatterns on ColorSchemeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorSchemeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorSchemeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorSchemeDto value)  $default,){
final _that = this;
switch (_that) {
case _ColorSchemeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorSchemeDto value)?  $default,){
final _that = this;
switch (_that) {
case _ColorSchemeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  String? id,  int? version,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorSchemeDto() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.variant,_that.config,_that.id,_that.version,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  String? id,  int? version,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ColorSchemeDto():
return $default(_that.applicationId,_that.themeId,_that.variant,_that.config,_that.id,_that.version,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  String? id,  int? version,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ColorSchemeDto() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.variant,_that.config,_that.id,_that.version,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorSchemeDto implements ColorSchemeDto {
  const _ColorSchemeDto({required this.applicationId, required this.themeId, required this.variant, required final  Map<String, dynamic> config, this.id, this.version, this.createdAt, this.updatedAt}): _config = config;
  factory _ColorSchemeDto.fromJson(Map<String, dynamic> json) => _$ColorSchemeDtoFromJson(json);

@override final  String applicationId;
@override final  String themeId;
@override final  String variant;
 final  Map<String, dynamic> _config;
@override Map<String, dynamic> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

@override final  String? id;
@override final  int? version;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of ColorSchemeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorSchemeDtoCopyWith<_ColorSchemeDto> get copyWith => __$ColorSchemeDtoCopyWithImpl<_ColorSchemeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorSchemeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorSchemeDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,variant,const DeepCollectionEquality().hash(_config),id,version,createdAt,updatedAt);

@override
String toString() {
  return 'ColorSchemeDto(applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, id: $id, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ColorSchemeDtoCopyWith<$Res> implements $ColorSchemeDtoCopyWith<$Res> {
  factory _$ColorSchemeDtoCopyWith(_ColorSchemeDto value, $Res Function(_ColorSchemeDto) _then) = __$ColorSchemeDtoCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String themeId, String variant, Map<String, dynamic> config, String? id, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$ColorSchemeDtoCopyWithImpl<$Res>
    implements _$ColorSchemeDtoCopyWith<$Res> {
  __$ColorSchemeDtoCopyWithImpl(this._self, this._then);

  final _ColorSchemeDto _self;
  final $Res Function(_ColorSchemeDto) _then;

/// Create a copy of ColorSchemeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? id = freezed,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ColorSchemeDto(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
