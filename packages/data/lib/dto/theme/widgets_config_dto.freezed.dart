// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widgets_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WidgetsConfigDto {

 String get id; String get applicationId; String get themeId; String get variant; Map<String, dynamic> get config; DateTime get createdAt; DateTime get updatedAt; int? get version;
/// Create a copy of WidgetsConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetsConfigDtoCopyWith<WidgetsConfigDto> get copyWith => _$WidgetsConfigDtoCopyWithImpl<WidgetsConfigDto>(this as WidgetsConfigDto, _$identity);

  /// Serializes this WidgetsConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WidgetsConfigDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,variant,const DeepCollectionEquality().hash(config),createdAt,updatedAt,version);

@override
String toString() {
  return 'WidgetsConfigDto(id: $id, applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class $WidgetsConfigDtoCopyWith<$Res>  {
  factory $WidgetsConfigDtoCopyWith(WidgetsConfigDto value, $Res Function(WidgetsConfigDto) _then) = _$WidgetsConfigDtoCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String themeId, String variant, Map<String, dynamic> config, DateTime createdAt, DateTime updatedAt, int? version
});




}
/// @nodoc
class _$WidgetsConfigDtoCopyWithImpl<$Res>
    implements $WidgetsConfigDtoCopyWith<$Res> {
  _$WidgetsConfigDtoCopyWithImpl(this._self, this._then);

  final WidgetsConfigDto _self;
  final $Res Function(WidgetsConfigDto) _then;

/// Create a copy of WidgetsConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? createdAt = null,Object? updatedAt = null,Object? version = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WidgetsConfigDto].
extension WidgetsConfigDtoPatterns on WidgetsConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetsConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetsConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetsConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _WidgetsConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetsConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetsConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  DateTime createdAt,  DateTime updatedAt,  int? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetsConfigDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.variant,_that.config,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  DateTime createdAt,  DateTime updatedAt,  int? version)  $default,) {final _that = this;
switch (_that) {
case _WidgetsConfigDto():
return $default(_that.id,_that.applicationId,_that.themeId,_that.variant,_that.config,_that.createdAt,_that.updatedAt,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  DateTime createdAt,  DateTime updatedAt,  int? version)?  $default,) {final _that = this;
switch (_that) {
case _WidgetsConfigDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.variant,_that.config,_that.createdAt,_that.updatedAt,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WidgetsConfigDto implements WidgetsConfigDto {
  const _WidgetsConfigDto({required this.id, required this.applicationId, required this.themeId, required this.variant, required final  Map<String, dynamic> config, required this.createdAt, required this.updatedAt, this.version}): _config = config;
  factory _WidgetsConfigDto.fromJson(Map<String, dynamic> json) => _$WidgetsConfigDtoFromJson(json);

@override final  String id;
@override final  String applicationId;
@override final  String themeId;
@override final  String variant;
 final  Map<String, dynamic> _config;
@override Map<String, dynamic> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? version;

/// Create a copy of WidgetsConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetsConfigDtoCopyWith<_WidgetsConfigDto> get copyWith => __$WidgetsConfigDtoCopyWithImpl<_WidgetsConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WidgetsConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WidgetsConfigDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,variant,const DeepCollectionEquality().hash(_config),createdAt,updatedAt,version);

@override
String toString() {
  return 'WidgetsConfigDto(id: $id, applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class _$WidgetsConfigDtoCopyWith<$Res> implements $WidgetsConfigDtoCopyWith<$Res> {
  factory _$WidgetsConfigDtoCopyWith(_WidgetsConfigDto value, $Res Function(_WidgetsConfigDto) _then) = __$WidgetsConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String themeId, String variant, Map<String, dynamic> config, DateTime createdAt, DateTime updatedAt, int? version
});




}
/// @nodoc
class __$WidgetsConfigDtoCopyWithImpl<$Res>
    implements _$WidgetsConfigDtoCopyWith<$Res> {
  __$WidgetsConfigDtoCopyWithImpl(this._self, this._then);

  final _WidgetsConfigDto _self;
  final $Res Function(_WidgetsConfigDto) _then;

/// Create a copy of WidgetsConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? createdAt = null,Object? updatedAt = null,Object? version = freezed,}) {
  return _then(_WidgetsConfigDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
