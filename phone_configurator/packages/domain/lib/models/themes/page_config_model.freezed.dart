// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageConfigModel {

 String get applicationId; String get themeId; BrightnessVariant get variant; Map<String, dynamic> get config; String? get id; int? get version; String? get createdAt; String? get updatedAt;
/// Create a copy of PageConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageConfigModelCopyWith<PageConfigModel> get copyWith => _$PageConfigModelCopyWithImpl<PageConfigModel>(this as PageConfigModel, _$identity);

  /// Serializes this PageConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageConfigModel&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,variant,const DeepCollectionEquality().hash(config),id,version,createdAt,updatedAt);

@override
String toString() {
  return 'PageConfigModel(applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, id: $id, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PageConfigModelCopyWith<$Res>  {
  factory $PageConfigModelCopyWith(PageConfigModel value, $Res Function(PageConfigModel) _then) = _$PageConfigModelCopyWithImpl;
@useResult
$Res call({
 String applicationId, String themeId, BrightnessVariant variant, Map<String, dynamic> config, String? id, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$PageConfigModelCopyWithImpl<$Res>
    implements $PageConfigModelCopyWith<$Res> {
  _$PageConfigModelCopyWithImpl(this._self, this._then);

  final PageConfigModel _self;
  final $Res Function(PageConfigModel) _then;

/// Create a copy of PageConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? id = freezed,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as BrightnessVariant,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PageConfigModel].
extension PageConfigModelPatterns on PageConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _PageConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _PageConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  BrightnessVariant variant,  Map<String, dynamic> config,  String? id,  int? version,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageConfigModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  BrightnessVariant variant,  Map<String, dynamic> config,  String? id,  int? version,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PageConfigModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String themeId,  BrightnessVariant variant,  Map<String, dynamic> config,  String? id,  int? version,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PageConfigModel() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.variant,_that.config,_that.id,_that.version,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageConfigModel implements PageConfigModel {
  const _PageConfigModel({required this.applicationId, required this.themeId, required this.variant, required final  Map<String, dynamic> config, this.id, this.version, this.createdAt, this.updatedAt}): _config = config;
  factory _PageConfigModel.fromJson(Map<String, dynamic> json) => _$PageConfigModelFromJson(json);

@override final  String applicationId;
@override final  String themeId;
@override final  BrightnessVariant variant;
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

/// Create a copy of PageConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageConfigModelCopyWith<_PageConfigModel> get copyWith => __$PageConfigModelCopyWithImpl<_PageConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageConfigModel&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.variant, variant) || other.variant == variant)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,variant,const DeepCollectionEquality().hash(_config),id,version,createdAt,updatedAt);

@override
String toString() {
  return 'PageConfigModel(applicationId: $applicationId, themeId: $themeId, variant: $variant, config: $config, id: $id, version: $version, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PageConfigModelCopyWith<$Res> implements $PageConfigModelCopyWith<$Res> {
  factory _$PageConfigModelCopyWith(_PageConfigModel value, $Res Function(_PageConfigModel) _then) = __$PageConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String themeId, BrightnessVariant variant, Map<String, dynamic> config, String? id, int? version, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$PageConfigModelCopyWithImpl<$Res>
    implements _$PageConfigModelCopyWith<$Res> {
  __$PageConfigModelCopyWithImpl(this._self, this._then);

  final _PageConfigModel _self;
  final $Res Function(_PageConfigModel) _then;

/// Create a copy of PageConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? themeId = null,Object? variant = null,Object? config = null,Object? id = freezed,Object? version = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PageConfigModel(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as BrightnessVariant,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
