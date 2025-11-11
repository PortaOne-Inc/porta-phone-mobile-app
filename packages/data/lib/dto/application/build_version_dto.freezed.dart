// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_version_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuildVersionDTO {

 String? get buildName; int? get buildNumber;
/// Create a copy of BuildVersionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<BuildVersionDTO> get copyWith => _$BuildVersionDTOCopyWithImpl<BuildVersionDTO>(this as BuildVersionDTO, _$identity);

  /// Serializes this BuildVersionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildVersionDTO&&(identical(other.buildName, buildName) || other.buildName == buildName)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildName,buildNumber);

@override
String toString() {
  return 'BuildVersionDTO(buildName: $buildName, buildNumber: $buildNumber)';
}


}

/// @nodoc
abstract mixin class $BuildVersionDTOCopyWith<$Res>  {
  factory $BuildVersionDTOCopyWith(BuildVersionDTO value, $Res Function(BuildVersionDTO) _then) = _$BuildVersionDTOCopyWithImpl;
@useResult
$Res call({
 String? buildName, int? buildNumber
});




}
/// @nodoc
class _$BuildVersionDTOCopyWithImpl<$Res>
    implements $BuildVersionDTOCopyWith<$Res> {
  _$BuildVersionDTOCopyWithImpl(this._self, this._then);

  final BuildVersionDTO _self;
  final $Res Function(BuildVersionDTO) _then;

/// Create a copy of BuildVersionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildName = freezed,Object? buildNumber = freezed,}) {
  return _then(_self.copyWith(
buildName: freezed == buildName ? _self.buildName : buildName // ignore: cast_nullable_to_non_nullable
as String?,buildNumber: freezed == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildVersionDTO].
extension BuildVersionDTOPatterns on BuildVersionDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildVersionDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildVersionDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildVersionDTO value)  $default,){
final _that = this;
switch (_that) {
case _BuildVersionDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildVersionDTO value)?  $default,){
final _that = this;
switch (_that) {
case _BuildVersionDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? buildName,  int? buildNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildVersionDTO() when $default != null:
return $default(_that.buildName,_that.buildNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? buildName,  int? buildNumber)  $default,) {final _that = this;
switch (_that) {
case _BuildVersionDTO():
return $default(_that.buildName,_that.buildNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? buildName,  int? buildNumber)?  $default,) {final _that = this;
switch (_that) {
case _BuildVersionDTO() when $default != null:
return $default(_that.buildName,_that.buildNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildVersionDTO implements BuildVersionDTO {
  const _BuildVersionDTO({this.buildName, this.buildNumber});
  factory _BuildVersionDTO.fromJson(Map<String, dynamic> json) => _$BuildVersionDTOFromJson(json);

@override final  String? buildName;
@override final  int? buildNumber;

/// Create a copy of BuildVersionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildVersionDTOCopyWith<_BuildVersionDTO> get copyWith => __$BuildVersionDTOCopyWithImpl<_BuildVersionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildVersionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildVersionDTO&&(identical(other.buildName, buildName) || other.buildName == buildName)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildName,buildNumber);

@override
String toString() {
  return 'BuildVersionDTO(buildName: $buildName, buildNumber: $buildNumber)';
}


}

/// @nodoc
abstract mixin class _$BuildVersionDTOCopyWith<$Res> implements $BuildVersionDTOCopyWith<$Res> {
  factory _$BuildVersionDTOCopyWith(_BuildVersionDTO value, $Res Function(_BuildVersionDTO) _then) = __$BuildVersionDTOCopyWithImpl;
@override @useResult
$Res call({
 String? buildName, int? buildNumber
});




}
/// @nodoc
class __$BuildVersionDTOCopyWithImpl<$Res>
    implements _$BuildVersionDTOCopyWith<$Res> {
  __$BuildVersionDTOCopyWithImpl(this._self, this._then);

  final _BuildVersionDTO _self;
  final $Res Function(_BuildVersionDTO) _then;

/// Create a copy of BuildVersionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildName = freezed,Object? buildNumber = freezed,}) {
  return _then(_BuildVersionDTO(
buildName: freezed == buildName ? _self.buildName : buildName // ignore: cast_nullable_to_non_nullable
as String?,buildNumber: freezed == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
