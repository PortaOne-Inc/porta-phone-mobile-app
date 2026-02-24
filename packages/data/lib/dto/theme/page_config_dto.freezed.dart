// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageConfigDto {

 String get id;// themeId_variant
 String get applicationId; String get themeId; String get variant;// "light" | "dark"
 Map<String, dynamic> get config; int? get version; String? get createdAt; String? get updatedAt;
/// Create a copy of PageConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageConfigDtoCopyWith<PageConfigDto> get copyWith => _$PageConfigDtoCopyWithImpl<PageConfigDto>(this as PageConfigDto, _$identity);

  /// Serializes this PageConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageConfigDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,variant,const DeepCollectionEquality().hash(config),version,createdAt,updatedAt);

@override
String toString() {
  return 'PageConfigDto(id: $id, applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PageConfigDtoCopyWith<$Res>  {
  factory $PageConfigDtoCopyWith(PageConfigDto value, $Res Function(PageConfigDto) _then) = _$PageConfigDtoCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String themeId, String variant, Map<String, dynamic> config, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$PageConfigDtoCopyWithImpl<$Res>
    implements $PageConfigDtoCopyWith<$Res> {
  _$PageConfigDtoCopyWithImpl(this._self, this._then);

  final PageConfigDto _self;
  final $Res Function(PageConfigDto) _then;

/// Create a copy of PageConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PageConfigDto].
extension PageConfigDtoPatterns on PageConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _PageConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _PageConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  int? version,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageConfigDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.variant,_that.config,_that.version,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  int? version,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PageConfigDto():
return $default(_that.id,_that.applicationId,_that.themeId,_that.variant,_that.config,_that.version,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String themeId,  String variant,  Map<String, dynamic> config,  int? version,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PageConfigDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.variant,_that.config,_that.version,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageConfigDto implements PageConfigDto {
  const _PageConfigDto({required this.id, required this.applicationId, required this.themeId, required this.variant, required final  Map<String, dynamic> config, this.version, this.createdAt, this.updatedAt}): _config = config;
  factory _PageConfigDto.fromJson(Map<String, dynamic> json) => _$PageConfigDtoFromJson(json);

@override final  String id;
// themeId_variant
@override final  String applicationId;
@override final  String themeId;
@override final  String variant;
// "light" | "dark"
 final  Map<String, dynamic> _config;
// "light" | "dark"
@override Map<String, dynamic> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

@override final  int? version;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of PageConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageConfigDtoCopyWith<_PageConfigDto> get copyWith => __$PageConfigDtoCopyWithImpl<_PageConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageConfigDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,variant,const DeepCollectionEquality().hash(_config),version,createdAt,updatedAt);

@override
String toString() {
  return 'PageConfigDto(id: $id, applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PageConfigDtoCopyWith<$Res> implements $PageConfigDtoCopyWith<$Res> {
  factory _$PageConfigDtoCopyWith(_PageConfigDto value, $Res Function(_PageConfigDto) _then) = __$PageConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String themeId, String variant, Map<String, dynamic> config, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$PageConfigDtoCopyWithImpl<$Res>
    implements _$PageConfigDtoCopyWith<$Res> {
  __$PageConfigDtoCopyWithImpl(this._self, this._then);

  final _PageConfigDto _self;
  final $Res Function(_PageConfigDto) _then;

/// Create a copy of PageConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PageConfigDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
