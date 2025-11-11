// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuildVersionModel {

 String? get buildName; int? get buildNumber;
/// Create a copy of BuildVersionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<BuildVersionModel> get copyWith => _$BuildVersionModelCopyWithImpl<BuildVersionModel>(this as BuildVersionModel, _$identity);

  /// Serializes this BuildVersionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildVersionModel&&(identical(other.buildName, buildName) || other.buildName == buildName)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildName,buildNumber);

@override
String toString() {
  return 'BuildVersionModel(buildName: $buildName, buildNumber: $buildNumber)';
}


}

/// @nodoc
abstract mixin class $BuildVersionModelCopyWith<$Res>  {
  factory $BuildVersionModelCopyWith(BuildVersionModel value, $Res Function(BuildVersionModel) _then) = _$BuildVersionModelCopyWithImpl;
@useResult
$Res call({
 String? buildName, int? buildNumber
});




}
/// @nodoc
class _$BuildVersionModelCopyWithImpl<$Res>
    implements $BuildVersionModelCopyWith<$Res> {
  _$BuildVersionModelCopyWithImpl(this._self, this._then);

  final BuildVersionModel _self;
  final $Res Function(BuildVersionModel) _then;

/// Create a copy of BuildVersionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildName = freezed,Object? buildNumber = freezed,}) {
  return _then(_self.copyWith(
buildName: freezed == buildName ? _self.buildName : buildName // ignore: cast_nullable_to_non_nullable
as String?,buildNumber: freezed == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildVersionModel].
extension BuildVersionModelPatterns on BuildVersionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildVersionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildVersionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildVersionModel value)  $default,){
final _that = this;
switch (_that) {
case _BuildVersionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildVersionModel value)?  $default,){
final _that = this;
switch (_that) {
case _BuildVersionModel() when $default != null:
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
case _BuildVersionModel() when $default != null:
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
case _BuildVersionModel():
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
case _BuildVersionModel() when $default != null:
return $default(_that.buildName,_that.buildNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildVersionModel implements BuildVersionModel {
  const _BuildVersionModel({this.buildName, this.buildNumber});
  factory _BuildVersionModel.fromJson(Map<String, dynamic> json) => _$BuildVersionModelFromJson(json);

@override final  String? buildName;
@override final  int? buildNumber;

/// Create a copy of BuildVersionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildVersionModelCopyWith<_BuildVersionModel> get copyWith => __$BuildVersionModelCopyWithImpl<_BuildVersionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildVersionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildVersionModel&&(identical(other.buildName, buildName) || other.buildName == buildName)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildName,buildNumber);

@override
String toString() {
  return 'BuildVersionModel(buildName: $buildName, buildNumber: $buildNumber)';
}


}

/// @nodoc
abstract mixin class _$BuildVersionModelCopyWith<$Res> implements $BuildVersionModelCopyWith<$Res> {
  factory _$BuildVersionModelCopyWith(_BuildVersionModel value, $Res Function(_BuildVersionModel) _then) = __$BuildVersionModelCopyWithImpl;
@override @useResult
$Res call({
 String? buildName, int? buildNumber
});




}
/// @nodoc
class __$BuildVersionModelCopyWithImpl<$Res>
    implements _$BuildVersionModelCopyWith<$Res> {
  __$BuildVersionModelCopyWithImpl(this._self, this._then);

  final _BuildVersionModel _self;
  final $Res Function(_BuildVersionModel) _then;

/// Create a copy of BuildVersionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildName = freezed,Object? buildNumber = freezed,}) {
  return _then(_BuildVersionModel(
buildName: freezed == buildName ? _self.buildName : buildName // ignore: cast_nullable_to_non_nullable
as String?,buildNumber: freezed == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
