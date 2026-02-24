// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureAccessModel {

 String get applicationId; Map<String, dynamic> get config; String? get themeId; String get status; String? get createdAt; String? get updatedAt;
/// Create a copy of FeatureAccessModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureAccessModelCopyWith<FeatureAccessModel> get copyWith => _$FeatureAccessModelCopyWithImpl<FeatureAccessModel>(this as FeatureAccessModel, _$identity);

  /// Serializes this FeatureAccessModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureAccessModel&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,const DeepCollectionEquality().hash(config),themeId,status,createdAt,updatedAt);

@override
String toString() {
  return 'FeatureAccessModel(applicationId: $applicationId, config: $config, themeId: $themeId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FeatureAccessModelCopyWith<$Res>  {
  factory $FeatureAccessModelCopyWith(FeatureAccessModel value, $Res Function(FeatureAccessModel) _then) = _$FeatureAccessModelCopyWithImpl;
@useResult
$Res call({
 String applicationId, Map<String, dynamic> config, String? themeId, String status, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$FeatureAccessModelCopyWithImpl<$Res>
    implements $FeatureAccessModelCopyWith<$Res> {
  _$FeatureAccessModelCopyWithImpl(this._self, this._then);

  final FeatureAccessModel _self;
  final $Res Function(FeatureAccessModel) _then;

/// Create a copy of FeatureAccessModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? config = null,Object? themeId = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,themeId: freezed == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeatureAccessModel].
extension FeatureAccessModelPatterns on FeatureAccessModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureAccessModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureAccessModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureAccessModel value)  $default,){
final _that = this;
switch (_that) {
case _FeatureAccessModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureAccessModel value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureAccessModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  Map<String, dynamic> config,  String? themeId,  String status,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureAccessModel() when $default != null:
return $default(_that.applicationId,_that.config,_that.themeId,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  Map<String, dynamic> config,  String? themeId,  String status,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FeatureAccessModel():
return $default(_that.applicationId,_that.config,_that.themeId,_that.status,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  Map<String, dynamic> config,  String? themeId,  String status,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FeatureAccessModel() when $default != null:
return $default(_that.applicationId,_that.config,_that.themeId,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeatureAccessModel implements FeatureAccessModel {
  const _FeatureAccessModel({required this.applicationId, required final  Map<String, dynamic> config, this.themeId, this.status = 'draft', this.createdAt, this.updatedAt}): _config = config;
  factory _FeatureAccessModel.fromJson(Map<String, dynamic> json) => _$FeatureAccessModelFromJson(json);

@override final  String applicationId;
 final  Map<String, dynamic> _config;
@override Map<String, dynamic> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

@override final  String? themeId;
@override@JsonKey() final  String status;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of FeatureAccessModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureAccessModelCopyWith<_FeatureAccessModel> get copyWith => __$FeatureAccessModelCopyWithImpl<_FeatureAccessModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeatureAccessModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureAccessModel&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,const DeepCollectionEquality().hash(_config),themeId,status,createdAt,updatedAt);

@override
String toString() {
  return 'FeatureAccessModel(applicationId: $applicationId, config: $config, themeId: $themeId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FeatureAccessModelCopyWith<$Res> implements $FeatureAccessModelCopyWith<$Res> {
  factory _$FeatureAccessModelCopyWith(_FeatureAccessModel value, $Res Function(_FeatureAccessModel) _then) = __$FeatureAccessModelCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, Map<String, dynamic> config, String? themeId, String status, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$FeatureAccessModelCopyWithImpl<$Res>
    implements _$FeatureAccessModelCopyWith<$Res> {
  __$FeatureAccessModelCopyWithImpl(this._self, this._then);

  final _FeatureAccessModel _self;
  final $Res Function(_FeatureAccessModel) _then;

/// Create a copy of FeatureAccessModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? config = null,Object? themeId = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FeatureAccessModel(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,themeId: freezed == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
