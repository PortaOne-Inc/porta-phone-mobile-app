// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_access_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureAccessDto {

 String get applicationId; String get status; Map<String, dynamic> get config; String? get themeId; int? get version; String? get createdAt; String? get updatedAt;
/// Create a copy of FeatureAccessDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureAccessDtoCopyWith<FeatureAccessDto> get copyWith => _$FeatureAccessDtoCopyWithImpl<FeatureAccessDto>(this as FeatureAccessDto, _$identity);

  /// Serializes this FeatureAccessDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureAccessDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,status,const DeepCollectionEquality().hash(config),themeId,version,createdAt,updatedAt);

@override
String toString() {
  return 'FeatureAccessDto(applicationId: $applicationId, status: $status, config: $config, themeId: $themeId, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FeatureAccessDtoCopyWith<$Res>  {
  factory $FeatureAccessDtoCopyWith(FeatureAccessDto value, $Res Function(FeatureAccessDto) _then) = _$FeatureAccessDtoCopyWithImpl;
@useResult
$Res call({
 String applicationId, String status, Map<String, dynamic> config, String? themeId, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$FeatureAccessDtoCopyWithImpl<$Res>
    implements $FeatureAccessDtoCopyWith<$Res> {
  _$FeatureAccessDtoCopyWithImpl(this._self, this._then);

  final FeatureAccessDto _self;
  final $Res Function(FeatureAccessDto) _then;

/// Create a copy of FeatureAccessDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? status = null,Object? config = null,Object? themeId = freezed,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,themeId: freezed == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureAccessDto].
extension FeatureAccessDtoPatterns on FeatureAccessDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureAccessDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureAccessDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureAccessDto value)  $default,){
final _that = this;
switch (_that) {
case _FeatureAccessDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureAccessDto value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureAccessDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String status,  Map<String, dynamic> config,  String? themeId,  int? version,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureAccessDto() when $default != null:
return $default(_that.applicationId,_that.status,_that.config,_that.themeId,_that.version,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String status,  Map<String, dynamic> config,  String? themeId,  int? version,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FeatureAccessDto():
return $default(_that.applicationId,_that.status,_that.config,_that.themeId,_that.version,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String status,  Map<String, dynamic> config,  String? themeId,  int? version,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FeatureAccessDto() when $default != null:
return $default(_that.applicationId,_that.status,_that.config,_that.themeId,_that.version,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeatureAccessDto implements FeatureAccessDto {
  const _FeatureAccessDto({required this.applicationId, required this.status, required final  Map<String, dynamic> config, this.themeId, this.version, this.createdAt, this.updatedAt}): _config = config;
  factory _FeatureAccessDto.fromJson(Map<String, dynamic> json) => _$FeatureAccessDtoFromJson(json);

@override final  String applicationId;
@override final  String status;
 final  Map<String, dynamic> _config;
@override Map<String, dynamic> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

@override final  String? themeId;
@override final  int? version;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of FeatureAccessDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureAccessDtoCopyWith<_FeatureAccessDto> get copyWith => __$FeatureAccessDtoCopyWithImpl<_FeatureAccessDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureAccessDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureAccessDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,status,const DeepCollectionEquality().hash(_config),themeId,version,createdAt,updatedAt);

@override
String toString() {
  return 'FeatureAccessDto(applicationId: $applicationId, status: $status, config: $config, themeId: $themeId, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FeatureAccessDtoCopyWith<$Res> implements $FeatureAccessDtoCopyWith<$Res> {
  factory _$FeatureAccessDtoCopyWith(_FeatureAccessDto value, $Res Function(_FeatureAccessDto) _then) = __$FeatureAccessDtoCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String status, Map<String, dynamic> config, String? themeId, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$FeatureAccessDtoCopyWithImpl<$Res>
    implements _$FeatureAccessDtoCopyWith<$Res> {
  __$FeatureAccessDtoCopyWithImpl(this._self, this._then);

  final _FeatureAccessDto _self;
  final $Res Function(_FeatureAccessDto) _then;

/// Create a copy of FeatureAccessDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? status = null,Object? config = null,Object? themeId = freezed,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FeatureAccessDto(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,themeId: freezed == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
