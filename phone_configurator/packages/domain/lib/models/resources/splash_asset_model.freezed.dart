// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashSource {

 String? get foregroundAssetId; String? get backgroundAssetId; String? get backgroundColorHex;
/// Create a copy of SplashSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashSourceCopyWith<SplashSource> get copyWith => _$SplashSourceCopyWithImpl<SplashSource>(this as SplashSource, _$identity);

  /// Serializes this SplashSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashSource&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SplashSource(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class $SplashSourceCopyWith<$Res>  {
  factory $SplashSourceCopyWith(SplashSource value, $Res Function(SplashSource) _then) = _$SplashSourceCopyWithImpl;
@useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class _$SplashSourceCopyWithImpl<$Res>
    implements $SplashSourceCopyWith<$Res> {
  _$SplashSourceCopyWithImpl(this._self, this._then);

  final SplashSource _self;
  final $Res Function(SplashSource) _then;

/// Create a copy of SplashSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foregroundAssetId = freezed,Object? backgroundAssetId = freezed,Object? backgroundColorHex = freezed,}) {
  return _then(_self.copyWith(
foregroundAssetId: freezed == foregroundAssetId ? _self.foregroundAssetId : foregroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundAssetId: freezed == backgroundAssetId ? _self.backgroundAssetId : backgroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashSource].
extension SplashSourcePatterns on SplashSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashSource value)  $default,){
final _that = this;
switch (_that) {
case _SplashSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashSource value)?  $default,){
final _that = this;
switch (_that) {
case _SplashSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? foregroundAssetId,  String? backgroundAssetId,  String? backgroundColorHex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashSource() when $default != null:
return $default(_that.foregroundAssetId,_that.backgroundAssetId,_that.backgroundColorHex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? foregroundAssetId,  String? backgroundAssetId,  String? backgroundColorHex)  $default,) {final _that = this;
switch (_that) {
case _SplashSource():
return $default(_that.foregroundAssetId,_that.backgroundAssetId,_that.backgroundColorHex);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? foregroundAssetId,  String? backgroundAssetId,  String? backgroundColorHex)?  $default,) {final _that = this;
switch (_that) {
case _SplashSource() when $default != null:
return $default(_that.foregroundAssetId,_that.backgroundAssetId,_that.backgroundColorHex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashSource implements SplashSource {
  const _SplashSource({this.foregroundAssetId, this.backgroundAssetId, this.backgroundColorHex});
  factory _SplashSource.fromJson(Map<String, dynamic> json) => _$SplashSourceFromJson(json);

@override final  String? foregroundAssetId;
@override final  String? backgroundAssetId;
@override final  String? backgroundColorHex;

/// Create a copy of SplashSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashSourceCopyWith<_SplashSource> get copyWith => __$SplashSourceCopyWithImpl<_SplashSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashSource&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SplashSource(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class _$SplashSourceCopyWith<$Res> implements $SplashSourceCopyWith<$Res> {
  factory _$SplashSourceCopyWith(_SplashSource value, $Res Function(_SplashSource) _then) = __$SplashSourceCopyWithImpl;
@override @useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class __$SplashSourceCopyWithImpl<$Res>
    implements _$SplashSourceCopyWith<$Res> {
  __$SplashSourceCopyWithImpl(this._self, this._then);

  final _SplashSource _self;
  final $Res Function(_SplashSource) _then;

/// Create a copy of SplashSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foregroundAssetId = freezed,Object? backgroundAssetId = freezed,Object? backgroundColorHex = freezed,}) {
  return _then(_SplashSource(
foregroundAssetId: freezed == foregroundAssetId ? _self.foregroundAssetId : foregroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundAssetId: freezed == backgroundAssetId ? _self.backgroundAssetId : backgroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SplashAssetParams {

 FitModel? get fit; double? get padding;
/// Create a copy of SplashAssetParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashAssetParamsCopyWith<SplashAssetParams> get copyWith => _$SplashAssetParamsCopyWithImpl<SplashAssetParams>(this as SplashAssetParams, _$identity);

  /// Serializes this SplashAssetParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashAssetParams&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,padding);

@override
String toString() {
  return 'SplashAssetParams(fit: $fit, padding: $padding)';
}


}

/// @nodoc
abstract mixin class $SplashAssetParamsCopyWith<$Res>  {
  factory $SplashAssetParamsCopyWith(SplashAssetParams value, $Res Function(SplashAssetParams) _then) = _$SplashAssetParamsCopyWithImpl;
@useResult
$Res call({
 FitModel? fit, double? padding
});




}
/// @nodoc
class _$SplashAssetParamsCopyWithImpl<$Res>
    implements $SplashAssetParamsCopyWith<$Res> {
  _$SplashAssetParamsCopyWithImpl(this._self, this._then);

  final SplashAssetParams _self;
  final $Res Function(SplashAssetParams) _then;

/// Create a copy of SplashAssetParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fit = freezed,Object? padding = freezed,}) {
  return _then(_self.copyWith(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitModel?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashAssetParams].
extension SplashAssetParamsPatterns on SplashAssetParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashAssetParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashAssetParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashAssetParams value)  $default,){
final _that = this;
switch (_that) {
case _SplashAssetParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashAssetParams value)?  $default,){
final _that = this;
switch (_that) {
case _SplashAssetParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FitModel? fit,  double? padding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashAssetParams() when $default != null:
return $default(_that.fit,_that.padding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FitModel? fit,  double? padding)  $default,) {final _that = this;
switch (_that) {
case _SplashAssetParams():
return $default(_that.fit,_that.padding);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FitModel? fit,  double? padding)?  $default,) {final _that = this;
switch (_that) {
case _SplashAssetParams() when $default != null:
return $default(_that.fit,_that.padding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashAssetParams implements SplashAssetParams {
  const _SplashAssetParams({this.fit, this.padding});
  factory _SplashAssetParams.fromJson(Map<String, dynamic> json) => _$SplashAssetParamsFromJson(json);

@override final  FitModel? fit;
@override final  double? padding;

/// Create a copy of SplashAssetParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashAssetParamsCopyWith<_SplashAssetParams> get copyWith => __$SplashAssetParamsCopyWithImpl<_SplashAssetParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashAssetParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashAssetParams&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,padding);

@override
String toString() {
  return 'SplashAssetParams(fit: $fit, padding: $padding)';
}


}

/// @nodoc
abstract mixin class _$SplashAssetParamsCopyWith<$Res> implements $SplashAssetParamsCopyWith<$Res> {
  factory _$SplashAssetParamsCopyWith(_SplashAssetParams value, $Res Function(_SplashAssetParams) _then) = __$SplashAssetParamsCopyWithImpl;
@override @useResult
$Res call({
 FitModel? fit, double? padding
});




}
/// @nodoc
class __$SplashAssetParamsCopyWithImpl<$Res>
    implements _$SplashAssetParamsCopyWith<$Res> {
  __$SplashAssetParamsCopyWithImpl(this._self, this._then);

  final _SplashAssetParams _self;
  final $Res Function(_SplashAssetParams) _then;

/// Create a copy of SplashAssetParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fit = freezed,Object? padding = freezed,}) {
  return _then(_SplashAssetParams(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitModel?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$SplashConstraintsValidation {

 bool get compliant; double get delta; String get message; double? get tolerance;
/// Create a copy of SplashConstraintsValidation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashConstraintsValidationCopyWith<SplashConstraintsValidation> get copyWith => _$SplashConstraintsValidationCopyWithImpl<SplashConstraintsValidation>(this as SplashConstraintsValidation, _$identity);

  /// Serializes this SplashConstraintsValidation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashConstraintsValidation&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.message, message) || other.message == message)&&(identical(other.tolerance, tolerance) || other.tolerance == tolerance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,delta,message,tolerance);

@override
String toString() {
  return 'SplashConstraintsValidation(compliant: $compliant, delta: $delta, message: $message, tolerance: $tolerance)';
}


}

/// @nodoc
abstract mixin class $SplashConstraintsValidationCopyWith<$Res>  {
  factory $SplashConstraintsValidationCopyWith(SplashConstraintsValidation value, $Res Function(SplashConstraintsValidation) _then) = _$SplashConstraintsValidationCopyWithImpl;
@useResult
$Res call({
 bool compliant, double delta, String message, double? tolerance
});




}
/// @nodoc
class _$SplashConstraintsValidationCopyWithImpl<$Res>
    implements $SplashConstraintsValidationCopyWith<$Res> {
  _$SplashConstraintsValidationCopyWithImpl(this._self, this._then);

  final SplashConstraintsValidation _self;
  final $Res Function(SplashConstraintsValidation) _then;

/// Create a copy of SplashConstraintsValidation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? compliant = null,Object? delta = null,Object? message = null,Object? tolerance = freezed,}) {
  return _then(_self.copyWith(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as double,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,tolerance: freezed == tolerance ? _self.tolerance : tolerance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashConstraintsValidation].
extension SplashConstraintsValidationPatterns on SplashConstraintsValidation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashConstraintsValidation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashConstraintsValidation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashConstraintsValidation value)  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsValidation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashConstraintsValidation value)?  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsValidation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool compliant,  double delta,  String message,  double? tolerance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashConstraintsValidation() when $default != null:
return $default(_that.compliant,_that.delta,_that.message,_that.tolerance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool compliant,  double delta,  String message,  double? tolerance)  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsValidation():
return $default(_that.compliant,_that.delta,_that.message,_that.tolerance);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool compliant,  double delta,  String message,  double? tolerance)?  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsValidation() when $default != null:
return $default(_that.compliant,_that.delta,_that.message,_that.tolerance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashConstraintsValidation implements SplashConstraintsValidation {
  const _SplashConstraintsValidation({required this.compliant, required this.delta, required this.message, this.tolerance});
  factory _SplashConstraintsValidation.fromJson(Map<String, dynamic> json) => _$SplashConstraintsValidationFromJson(json);

@override final  bool compliant;
@override final  double delta;
@override final  String message;
@override final  double? tolerance;

/// Create a copy of SplashConstraintsValidation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashConstraintsValidationCopyWith<_SplashConstraintsValidation> get copyWith => __$SplashConstraintsValidationCopyWithImpl<_SplashConstraintsValidation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashConstraintsValidationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashConstraintsValidation&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.message, message) || other.message == message)&&(identical(other.tolerance, tolerance) || other.tolerance == tolerance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,delta,message,tolerance);

@override
String toString() {
  return 'SplashConstraintsValidation(compliant: $compliant, delta: $delta, message: $message, tolerance: $tolerance)';
}


}

/// @nodoc
abstract mixin class _$SplashConstraintsValidationCopyWith<$Res> implements $SplashConstraintsValidationCopyWith<$Res> {
  factory _$SplashConstraintsValidationCopyWith(_SplashConstraintsValidation value, $Res Function(_SplashConstraintsValidation) _then) = __$SplashConstraintsValidationCopyWithImpl;
@override @useResult
$Res call({
 bool compliant, double delta, String message, double? tolerance
});




}
/// @nodoc
class __$SplashConstraintsValidationCopyWithImpl<$Res>
    implements _$SplashConstraintsValidationCopyWith<$Res> {
  __$SplashConstraintsValidationCopyWithImpl(this._self, this._then);

  final _SplashConstraintsValidation _self;
  final $Res Function(_SplashConstraintsValidation) _then;

/// Create a copy of SplashConstraintsValidation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? compliant = null,Object? delta = null,Object? message = null,Object? tolerance = freezed,}) {
  return _then(_SplashConstraintsValidation(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as double,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,tolerance: freezed == tolerance ? _self.tolerance : tolerance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$SplashIconConstraints {

 double get fullSize; double get maskDiameter; double get recommendedPadding; SplashConstraintsValidation get validation; SplashMode? get mode; String? get recommendationBasis;
/// Create a copy of SplashIconConstraints
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashIconConstraintsCopyWith<SplashIconConstraints> get copyWith => _$SplashIconConstraintsCopyWithImpl<SplashIconConstraints>(this as SplashIconConstraints, _$identity);

  /// Serializes this SplashIconConstraints to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashIconConstraints&&(identical(other.fullSize, fullSize) || other.fullSize == fullSize)&&(identical(other.maskDiameter, maskDiameter) || other.maskDiameter == maskDiameter)&&(identical(other.recommendedPadding, recommendedPadding) || other.recommendedPadding == recommendedPadding)&&(identical(other.validation, validation) || other.validation == validation)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.recommendationBasis, recommendationBasis) || other.recommendationBasis == recommendationBasis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSize,maskDiameter,recommendedPadding,validation,mode,recommendationBasis);

@override
String toString() {
  return 'SplashIconConstraints(fullSize: $fullSize, maskDiameter: $maskDiameter, recommendedPadding: $recommendedPadding, validation: $validation, mode: $mode, recommendationBasis: $recommendationBasis)';
}


}

/// @nodoc
abstract mixin class $SplashIconConstraintsCopyWith<$Res>  {
  factory $SplashIconConstraintsCopyWith(SplashIconConstraints value, $Res Function(SplashIconConstraints) _then) = _$SplashIconConstraintsCopyWithImpl;
@useResult
$Res call({
 double fullSize, double maskDiameter, double recommendedPadding, SplashConstraintsValidation validation, SplashMode? mode, String? recommendationBasis
});


$SplashConstraintsValidationCopyWith<$Res> get validation;

}
/// @nodoc
class _$SplashIconConstraintsCopyWithImpl<$Res>
    implements $SplashIconConstraintsCopyWith<$Res> {
  _$SplashIconConstraintsCopyWithImpl(this._self, this._then);

  final SplashIconConstraints _self;
  final $Res Function(SplashIconConstraints) _then;

/// Create a copy of SplashIconConstraints
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullSize = null,Object? maskDiameter = null,Object? recommendedPadding = null,Object? validation = null,Object? mode = freezed,Object? recommendationBasis = freezed,}) {
  return _then(_self.copyWith(
fullSize: null == fullSize ? _self.fullSize : fullSize // ignore: cast_nullable_to_non_nullable
as double,maskDiameter: null == maskDiameter ? _self.maskDiameter : maskDiameter // ignore: cast_nullable_to_non_nullable
as double,recommendedPadding: null == recommendedPadding ? _self.recommendedPadding : recommendedPadding // ignore: cast_nullable_to_non_nullable
as double,validation: null == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as SplashConstraintsValidation,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashMode?,recommendationBasis: freezed == recommendationBasis ? _self.recommendationBasis : recommendationBasis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SplashIconConstraints
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsValidationCopyWith<$Res> get validation {
  
  return $SplashConstraintsValidationCopyWith<$Res>(_self.validation, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashIconConstraints].
extension SplashIconConstraintsPatterns on SplashIconConstraints {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashIconConstraints value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashIconConstraints() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashIconConstraints value)  $default,){
final _that = this;
switch (_that) {
case _SplashIconConstraints():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashIconConstraints value)?  $default,){
final _that = this;
switch (_that) {
case _SplashIconConstraints() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fullSize,  double maskDiameter,  double recommendedPadding,  SplashConstraintsValidation validation,  SplashMode? mode,  String? recommendationBasis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashIconConstraints() when $default != null:
return $default(_that.fullSize,_that.maskDiameter,_that.recommendedPadding,_that.validation,_that.mode,_that.recommendationBasis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fullSize,  double maskDiameter,  double recommendedPadding,  SplashConstraintsValidation validation,  SplashMode? mode,  String? recommendationBasis)  $default,) {final _that = this;
switch (_that) {
case _SplashIconConstraints():
return $default(_that.fullSize,_that.maskDiameter,_that.recommendedPadding,_that.validation,_that.mode,_that.recommendationBasis);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fullSize,  double maskDiameter,  double recommendedPadding,  SplashConstraintsValidation validation,  SplashMode? mode,  String? recommendationBasis)?  $default,) {final _that = this;
switch (_that) {
case _SplashIconConstraints() when $default != null:
return $default(_that.fullSize,_that.maskDiameter,_that.recommendedPadding,_that.validation,_that.mode,_that.recommendationBasis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashIconConstraints implements SplashIconConstraints {
  const _SplashIconConstraints({required this.fullSize, required this.maskDiameter, required this.recommendedPadding, required this.validation, this.mode, this.recommendationBasis});
  factory _SplashIconConstraints.fromJson(Map<String, dynamic> json) => _$SplashIconConstraintsFromJson(json);

@override final  double fullSize;
@override final  double maskDiameter;
@override final  double recommendedPadding;
@override final  SplashConstraintsValidation validation;
@override final  SplashMode? mode;
@override final  String? recommendationBasis;

/// Create a copy of SplashIconConstraints
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashIconConstraintsCopyWith<_SplashIconConstraints> get copyWith => __$SplashIconConstraintsCopyWithImpl<_SplashIconConstraints>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashIconConstraintsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashIconConstraints&&(identical(other.fullSize, fullSize) || other.fullSize == fullSize)&&(identical(other.maskDiameter, maskDiameter) || other.maskDiameter == maskDiameter)&&(identical(other.recommendedPadding, recommendedPadding) || other.recommendedPadding == recommendedPadding)&&(identical(other.validation, validation) || other.validation == validation)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.recommendationBasis, recommendationBasis) || other.recommendationBasis == recommendationBasis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSize,maskDiameter,recommendedPadding,validation,mode,recommendationBasis);

@override
String toString() {
  return 'SplashIconConstraints(fullSize: $fullSize, maskDiameter: $maskDiameter, recommendedPadding: $recommendedPadding, validation: $validation, mode: $mode, recommendationBasis: $recommendationBasis)';
}


}

/// @nodoc
abstract mixin class _$SplashIconConstraintsCopyWith<$Res> implements $SplashIconConstraintsCopyWith<$Res> {
  factory _$SplashIconConstraintsCopyWith(_SplashIconConstraints value, $Res Function(_SplashIconConstraints) _then) = __$SplashIconConstraintsCopyWithImpl;
@override @useResult
$Res call({
 double fullSize, double maskDiameter, double recommendedPadding, SplashConstraintsValidation validation, SplashMode? mode, String? recommendationBasis
});


@override $SplashConstraintsValidationCopyWith<$Res> get validation;

}
/// @nodoc
class __$SplashIconConstraintsCopyWithImpl<$Res>
    implements _$SplashIconConstraintsCopyWith<$Res> {
  __$SplashIconConstraintsCopyWithImpl(this._self, this._then);

  final _SplashIconConstraints _self;
  final $Res Function(_SplashIconConstraints) _then;

/// Create a copy of SplashIconConstraints
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullSize = null,Object? maskDiameter = null,Object? recommendedPadding = null,Object? validation = null,Object? mode = freezed,Object? recommendationBasis = freezed,}) {
  return _then(_SplashIconConstraints(
fullSize: null == fullSize ? _self.fullSize : fullSize // ignore: cast_nullable_to_non_nullable
as double,maskDiameter: null == maskDiameter ? _self.maskDiameter : maskDiameter // ignore: cast_nullable_to_non_nullable
as double,recommendedPadding: null == recommendedPadding ? _self.recommendedPadding : recommendedPadding // ignore: cast_nullable_to_non_nullable
as double,validation: null == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as SplashConstraintsValidation,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashMode?,recommendationBasis: freezed == recommendationBasis ? _self.recommendationBasis : recommendationBasis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SplashIconConstraints
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsValidationCopyWith<$Res> get validation {
  
  return $SplashConstraintsValidationCopyWith<$Res>(_self.validation, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// @nodoc
mixin _$SplashAssetModel {

 String get id; String get applicationId; String get themeId;/// ISO 8601 timestamps
 String get createdAt; String get updatedAt;/// Source config (optional foreground/background/color)
 SplashSource? get source;/// Render parameters
 SplashAssetParams? get params;/// Mode (withBackground / withoutBackground)
 SplashMode? get mode;/// outputsArtifacts.splashArtifactId
 String? get splashArtifactId;/// outputsArtifacts.android12SplashArtifactId
 String? get android12SplashArtifactId;/// Computed constraints & validation
 SplashIconConstraints? get iconConstraints;
/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashAssetModelCopyWith<SplashAssetModel> get copyWith => _$SplashAssetModelCopyWithImpl<SplashAssetModel>(this as SplashAssetModel, _$identity);

  /// Serializes this SplashAssetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashAssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.splashArtifactId, splashArtifactId) || other.splashArtifactId == splashArtifactId)&&(identical(other.android12SplashArtifactId, android12SplashArtifactId) || other.android12SplashArtifactId == android12SplashArtifactId)&&(identical(other.iconConstraints, iconConstraints) || other.iconConstraints == iconConstraints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,createdAt,updatedAt,source,params,mode,splashArtifactId,android12SplashArtifactId,iconConstraints);

@override
String toString() {
  return 'SplashAssetModel(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, mode: $mode, splashArtifactId: $splashArtifactId, android12SplashArtifactId: $android12SplashArtifactId, iconConstraints: $iconConstraints)';
}


}

/// @nodoc
abstract mixin class $SplashAssetModelCopyWith<$Res>  {
  factory $SplashAssetModelCopyWith(SplashAssetModel value, $Res Function(SplashAssetModel) _then) = _$SplashAssetModelCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String themeId, String createdAt, String updatedAt, SplashSource? source, SplashAssetParams? params, SplashMode? mode, String? splashArtifactId, String? android12SplashArtifactId, SplashIconConstraints? iconConstraints
});


$SplashSourceCopyWith<$Res>? get source;$SplashAssetParamsCopyWith<$Res>? get params;$SplashIconConstraintsCopyWith<$Res>? get iconConstraints;

}
/// @nodoc
class _$SplashAssetModelCopyWithImpl<$Res>
    implements $SplashAssetModelCopyWith<$Res> {
  _$SplashAssetModelCopyWithImpl(this._self, this._then);

  final SplashAssetModel _self;
  final $Res Function(SplashAssetModel) _then;

/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? createdAt = null,Object? updatedAt = null,Object? source = freezed,Object? params = freezed,Object? mode = freezed,Object? splashArtifactId = freezed,Object? android12SplashArtifactId = freezed,Object? iconConstraints = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SplashSource?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SplashAssetParams?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashMode?,splashArtifactId: freezed == splashArtifactId ? _self.splashArtifactId : splashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,android12SplashArtifactId: freezed == android12SplashArtifactId ? _self.android12SplashArtifactId : android12SplashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,iconConstraints: freezed == iconConstraints ? _self.iconConstraints : iconConstraints // ignore: cast_nullable_to_non_nullable
as SplashIconConstraints?,
  ));
}
/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SplashSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashAssetParamsCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $SplashAssetParamsCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashIconConstraintsCopyWith<$Res>? get iconConstraints {
    if (_self.iconConstraints == null) {
    return null;
  }

  return $SplashIconConstraintsCopyWith<$Res>(_self.iconConstraints!, (value) {
    return _then(_self.copyWith(iconConstraints: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashAssetModel].
extension SplashAssetModelPatterns on SplashAssetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashAssetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashAssetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashAssetModel value)  $default,){
final _that = this;
switch (_that) {
case _SplashAssetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashAssetModel value)?  $default,){
final _that = this;
switch (_that) {
case _SplashAssetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String createdAt,  String updatedAt,  SplashSource? source,  SplashAssetParams? params,  SplashMode? mode,  String? splashArtifactId,  String? android12SplashArtifactId,  SplashIconConstraints? iconConstraints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashAssetModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.mode,_that.splashArtifactId,_that.android12SplashArtifactId,_that.iconConstraints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String createdAt,  String updatedAt,  SplashSource? source,  SplashAssetParams? params,  SplashMode? mode,  String? splashArtifactId,  String? android12SplashArtifactId,  SplashIconConstraints? iconConstraints)  $default,) {final _that = this;
switch (_that) {
case _SplashAssetModel():
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.mode,_that.splashArtifactId,_that.android12SplashArtifactId,_that.iconConstraints);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String themeId,  String createdAt,  String updatedAt,  SplashSource? source,  SplashAssetParams? params,  SplashMode? mode,  String? splashArtifactId,  String? android12SplashArtifactId,  SplashIconConstraints? iconConstraints)?  $default,) {final _that = this;
switch (_that) {
case _SplashAssetModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.mode,_that.splashArtifactId,_that.android12SplashArtifactId,_that.iconConstraints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashAssetModel implements SplashAssetModel {
  const _SplashAssetModel({required this.id, required this.applicationId, required this.themeId, required this.createdAt, required this.updatedAt, this.source, this.params, this.mode, this.splashArtifactId, this.android12SplashArtifactId, this.iconConstraints});
  factory _SplashAssetModel.fromJson(Map<String, dynamic> json) => _$SplashAssetModelFromJson(json);

@override final  String id;
@override final  String applicationId;
@override final  String themeId;
/// ISO 8601 timestamps
@override final  String createdAt;
@override final  String updatedAt;
/// Source config (optional foreground/background/color)
@override final  SplashSource? source;
/// Render parameters
@override final  SplashAssetParams? params;
/// Mode (withBackground / withoutBackground)
@override final  SplashMode? mode;
/// outputsArtifacts.splashArtifactId
@override final  String? splashArtifactId;
/// outputsArtifacts.android12SplashArtifactId
@override final  String? android12SplashArtifactId;
/// Computed constraints & validation
@override final  SplashIconConstraints? iconConstraints;

/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashAssetModelCopyWith<_SplashAssetModel> get copyWith => __$SplashAssetModelCopyWithImpl<_SplashAssetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashAssetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashAssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.splashArtifactId, splashArtifactId) || other.splashArtifactId == splashArtifactId)&&(identical(other.android12SplashArtifactId, android12SplashArtifactId) || other.android12SplashArtifactId == android12SplashArtifactId)&&(identical(other.iconConstraints, iconConstraints) || other.iconConstraints == iconConstraints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,createdAt,updatedAt,source,params,mode,splashArtifactId,android12SplashArtifactId,iconConstraints);

@override
String toString() {
  return 'SplashAssetModel(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, mode: $mode, splashArtifactId: $splashArtifactId, android12SplashArtifactId: $android12SplashArtifactId, iconConstraints: $iconConstraints)';
}


}

/// @nodoc
abstract mixin class _$SplashAssetModelCopyWith<$Res> implements $SplashAssetModelCopyWith<$Res> {
  factory _$SplashAssetModelCopyWith(_SplashAssetModel value, $Res Function(_SplashAssetModel) _then) = __$SplashAssetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String themeId, String createdAt, String updatedAt, SplashSource? source, SplashAssetParams? params, SplashMode? mode, String? splashArtifactId, String? android12SplashArtifactId, SplashIconConstraints? iconConstraints
});


@override $SplashSourceCopyWith<$Res>? get source;@override $SplashAssetParamsCopyWith<$Res>? get params;@override $SplashIconConstraintsCopyWith<$Res>? get iconConstraints;

}
/// @nodoc
class __$SplashAssetModelCopyWithImpl<$Res>
    implements _$SplashAssetModelCopyWith<$Res> {
  __$SplashAssetModelCopyWithImpl(this._self, this._then);

  final _SplashAssetModel _self;
  final $Res Function(_SplashAssetModel) _then;

/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? createdAt = null,Object? updatedAt = null,Object? source = freezed,Object? params = freezed,Object? mode = freezed,Object? splashArtifactId = freezed,Object? android12SplashArtifactId = freezed,Object? iconConstraints = freezed,}) {
  return _then(_SplashAssetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SplashSource?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SplashAssetParams?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashMode?,splashArtifactId: freezed == splashArtifactId ? _self.splashArtifactId : splashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,android12SplashArtifactId: freezed == android12SplashArtifactId ? _self.android12SplashArtifactId : android12SplashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,iconConstraints: freezed == iconConstraints ? _self.iconConstraints : iconConstraints // ignore: cast_nullable_to_non_nullable
as SplashIconConstraints?,
  ));
}

/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashSourceCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SplashSourceCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashAssetParamsCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $SplashAssetParamsCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of SplashAssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashIconConstraintsCopyWith<$Res>? get iconConstraints {
    if (_self.iconConstraints == null) {
    return null;
  }

  return $SplashIconConstraintsCopyWith<$Res>(_self.iconConstraints!, (value) {
    return _then(_self.copyWith(iconConstraints: value));
  });
}
}

// dart format on
