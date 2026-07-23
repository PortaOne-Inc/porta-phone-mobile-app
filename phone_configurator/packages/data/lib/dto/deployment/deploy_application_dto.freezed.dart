// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deploy_application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeployApplicationDto {

 String get applicationId; set applicationId(String value); String get token; set token(String value); String get platforms; set platforms(String value); String get phoneSourceBranch; set phoneSourceBranch(String value); String get phoneConfiguratorToolSourceBranch; set phoneConfiguratorToolSourceBranch(String value); String get configuratorSourceBranch; set configuratorSourceBranch(String value); String get keystoreSourceBranch; set keystoreSourceBranch(String value); String get androidPlayStoreConfig; set androidPlayStoreConfig(String value);
/// Create a copy of DeployApplicationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeployApplicationDtoCopyWith<DeployApplicationDto> get copyWith => _$DeployApplicationDtoCopyWithImpl<DeployApplicationDto>(this as DeployApplicationDto, _$identity);

  /// Serializes this DeployApplicationDto to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'DeployApplicationDto(applicationId: $applicationId, token: $token, platforms: $platforms, phoneSourceBranch: $phoneSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, keystoreSourceBranch: $keystoreSourceBranch, androidPlayStoreConfig: $androidPlayStoreConfig)';
}


}

/// @nodoc
abstract mixin class $DeployApplicationDtoCopyWith<$Res>  {
  factory $DeployApplicationDtoCopyWith(DeployApplicationDto value, $Res Function(DeployApplicationDto) _then) = _$DeployApplicationDtoCopyWithImpl;
@useResult
$Res call({
 String applicationId, String token, String platforms, String phoneSourceBranch, String phoneConfiguratorToolSourceBranch, String configuratorSourceBranch, String keystoreSourceBranch, String androidPlayStoreConfig
});




}
/// @nodoc
class _$DeployApplicationDtoCopyWithImpl<$Res>
    implements $DeployApplicationDtoCopyWith<$Res> {
  _$DeployApplicationDtoCopyWithImpl(this._self, this._then);

  final DeployApplicationDto _self;
  final $Res Function(DeployApplicationDto) _then;

/// Create a copy of DeployApplicationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? token = null,Object? platforms = null,Object? phoneSourceBranch = null,Object? phoneConfiguratorToolSourceBranch = null,Object? configuratorSourceBranch = null,Object? keystoreSourceBranch = null,Object? androidPlayStoreConfig = null,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as String,phoneSourceBranch: null == phoneSourceBranch ? _self.phoneSourceBranch : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
as String,phoneConfiguratorToolSourceBranch: null == phoneConfiguratorToolSourceBranch ? _self.phoneConfiguratorToolSourceBranch : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
as String,configuratorSourceBranch: null == configuratorSourceBranch ? _self.configuratorSourceBranch : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
as String,keystoreSourceBranch: null == keystoreSourceBranch ? _self.keystoreSourceBranch : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
as String,androidPlayStoreConfig: null == androidPlayStoreConfig ? _self.androidPlayStoreConfig : androidPlayStoreConfig // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeployApplicationDto].
extension DeployApplicationDtoPatterns on DeployApplicationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeployApplicationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeployApplicationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeployApplicationDto value)  $default,){
final _that = this;
switch (_that) {
case _DeployApplicationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeployApplicationDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeployApplicationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String token,  String platforms,  String phoneSourceBranch,  String phoneConfiguratorToolSourceBranch,  String configuratorSourceBranch,  String keystoreSourceBranch,  String androidPlayStoreConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeployApplicationDto() when $default != null:
return $default(_that.applicationId,_that.token,_that.platforms,_that.phoneSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.configuratorSourceBranch,_that.keystoreSourceBranch,_that.androidPlayStoreConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String token,  String platforms,  String phoneSourceBranch,  String phoneConfiguratorToolSourceBranch,  String configuratorSourceBranch,  String keystoreSourceBranch,  String androidPlayStoreConfig)  $default,) {final _that = this;
switch (_that) {
case _DeployApplicationDto():
return $default(_that.applicationId,_that.token,_that.platforms,_that.phoneSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.configuratorSourceBranch,_that.keystoreSourceBranch,_that.androidPlayStoreConfig);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String token,  String platforms,  String phoneSourceBranch,  String phoneConfiguratorToolSourceBranch,  String configuratorSourceBranch,  String keystoreSourceBranch,  String androidPlayStoreConfig)?  $default,) {final _that = this;
switch (_that) {
case _DeployApplicationDto() when $default != null:
return $default(_that.applicationId,_that.token,_that.platforms,_that.phoneSourceBranch,_that.phoneConfiguratorToolSourceBranch,_that.configuratorSourceBranch,_that.keystoreSourceBranch,_that.androidPlayStoreConfig);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeployApplicationDto implements DeployApplicationDto {
   _DeployApplicationDto({required this.applicationId, required this.token, required this.platforms, required this.phoneSourceBranch, required this.phoneConfiguratorToolSourceBranch, required this.configuratorSourceBranch, required this.keystoreSourceBranch, required this.androidPlayStoreConfig});
  factory _DeployApplicationDto.fromJson(Map<String, dynamic> json) => _$DeployApplicationDtoFromJson(json);

@override  String applicationId;
@override  String token;
@override  String platforms;
@override  String phoneSourceBranch;
@override  String phoneConfiguratorToolSourceBranch;
@override  String configuratorSourceBranch;
@override  String keystoreSourceBranch;
@override  String androidPlayStoreConfig;

/// Create a copy of DeployApplicationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeployApplicationDtoCopyWith<_DeployApplicationDto> get copyWith => __$DeployApplicationDtoCopyWithImpl<_DeployApplicationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeployApplicationDtoToJson(this, );
}



@override
String toString() {
  return 'DeployApplicationDto(applicationId: $applicationId, token: $token, platforms: $platforms, phoneSourceBranch: $phoneSourceBranch, phoneConfiguratorToolSourceBranch: $phoneConfiguratorToolSourceBranch, configuratorSourceBranch: $configuratorSourceBranch, keystoreSourceBranch: $keystoreSourceBranch, androidPlayStoreConfig: $androidPlayStoreConfig)';
}


}

/// @nodoc
abstract mixin class _$DeployApplicationDtoCopyWith<$Res> implements $DeployApplicationDtoCopyWith<$Res> {
  factory _$DeployApplicationDtoCopyWith(_DeployApplicationDto value, $Res Function(_DeployApplicationDto) _then) = __$DeployApplicationDtoCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String token, String platforms, String phoneSourceBranch, String phoneConfiguratorToolSourceBranch, String configuratorSourceBranch, String keystoreSourceBranch, String androidPlayStoreConfig
});




}
/// @nodoc
class __$DeployApplicationDtoCopyWithImpl<$Res>
    implements _$DeployApplicationDtoCopyWith<$Res> {
  __$DeployApplicationDtoCopyWithImpl(this._self, this._then);

  final _DeployApplicationDto _self;
  final $Res Function(_DeployApplicationDto) _then;

/// Create a copy of DeployApplicationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? token = null,Object? platforms = null,Object? phoneSourceBranch = null,Object? phoneConfiguratorToolSourceBranch = null,Object? configuratorSourceBranch = null,Object? keystoreSourceBranch = null,Object? androidPlayStoreConfig = null,}) {
  return _then(_DeployApplicationDto(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as String,phoneSourceBranch: null == phoneSourceBranch ? _self.phoneSourceBranch : phoneSourceBranch // ignore: cast_nullable_to_non_nullable
as String,phoneConfiguratorToolSourceBranch: null == phoneConfiguratorToolSourceBranch ? _self.phoneConfiguratorToolSourceBranch : phoneConfiguratorToolSourceBranch // ignore: cast_nullable_to_non_nullable
as String,configuratorSourceBranch: null == configuratorSourceBranch ? _self.configuratorSourceBranch : configuratorSourceBranch // ignore: cast_nullable_to_non_nullable
as String,keystoreSourceBranch: null == keystoreSourceBranch ? _self.keystoreSourceBranch : keystoreSourceBranch // ignore: cast_nullable_to_non_nullable
as String,androidPlayStoreConfig: null == androidPlayStoreConfig ? _self.androidPlayStoreConfig : androidPlayStoreConfig // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
