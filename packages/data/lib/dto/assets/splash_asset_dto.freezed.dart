// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_asset_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashSourceDto {

 String? get foregroundAssetId; String? get backgroundAssetId; String? get backgroundColorHex;
/// Create a copy of SplashSourceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashSourceDtoCopyWith<SplashSourceDto> get copyWith => _$SplashSourceDtoCopyWithImpl<SplashSourceDto>(this as SplashSourceDto, _$identity);

  /// Serializes this SplashSourceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashSourceDto&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SplashSourceDto(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class $SplashSourceDtoCopyWith<$Res>  {
  factory $SplashSourceDtoCopyWith(SplashSourceDto value, $Res Function(SplashSourceDto) _then) = _$SplashSourceDtoCopyWithImpl;
@useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class _$SplashSourceDtoCopyWithImpl<$Res>
    implements $SplashSourceDtoCopyWith<$Res> {
  _$SplashSourceDtoCopyWithImpl(this._self, this._then);

  final SplashSourceDto _self;
  final $Res Function(SplashSourceDto) _then;

/// Create a copy of SplashSourceDto
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


/// Adds pattern-matching-related methods to [SplashSourceDto].
extension SplashSourceDtoPatterns on SplashSourceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashSourceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashSourceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashSourceDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashSourceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashSourceDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashSourceDto() when $default != null:
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
case _SplashSourceDto() when $default != null:
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
case _SplashSourceDto():
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
case _SplashSourceDto() when $default != null:
return $default(_that.foregroundAssetId,_that.backgroundAssetId,_that.backgroundColorHex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashSourceDto implements SplashSourceDto {
  const _SplashSourceDto({this.foregroundAssetId, this.backgroundAssetId, this.backgroundColorHex});
  factory _SplashSourceDto.fromJson(Map<String, dynamic> json) => _$SplashSourceDtoFromJson(json);

@override final  String? foregroundAssetId;
@override final  String? backgroundAssetId;
@override final  String? backgroundColorHex;

/// Create a copy of SplashSourceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashSourceDtoCopyWith<_SplashSourceDto> get copyWith => __$SplashSourceDtoCopyWithImpl<_SplashSourceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashSourceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashSourceDto&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SplashSourceDto(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class _$SplashSourceDtoCopyWith<$Res> implements $SplashSourceDtoCopyWith<$Res> {
  factory _$SplashSourceDtoCopyWith(_SplashSourceDto value, $Res Function(_SplashSourceDto) _then) = __$SplashSourceDtoCopyWithImpl;
@override @useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class __$SplashSourceDtoCopyWithImpl<$Res>
    implements _$SplashSourceDtoCopyWith<$Res> {
  __$SplashSourceDtoCopyWithImpl(this._self, this._then);

  final _SplashSourceDto _self;
  final $Res Function(_SplashSourceDto) _then;

/// Create a copy of SplashSourceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foregroundAssetId = freezed,Object? backgroundAssetId = freezed,Object? backgroundColorHex = freezed,}) {
  return _then(_SplashSourceDto(
foregroundAssetId: freezed == foregroundAssetId ? _self.foregroundAssetId : foregroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundAssetId: freezed == backgroundAssetId ? _self.backgroundAssetId : backgroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SplashAssetParamsDto {

 FitDto? get fit; double? get padding;
/// Create a copy of SplashAssetParamsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashAssetParamsDtoCopyWith<SplashAssetParamsDto> get copyWith => _$SplashAssetParamsDtoCopyWithImpl<SplashAssetParamsDto>(this as SplashAssetParamsDto, _$identity);

  /// Serializes this SplashAssetParamsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashAssetParamsDto&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,padding);

@override
String toString() {
  return 'SplashAssetParamsDto(fit: $fit, padding: $padding)';
}


}

/// @nodoc
abstract mixin class $SplashAssetParamsDtoCopyWith<$Res>  {
  factory $SplashAssetParamsDtoCopyWith(SplashAssetParamsDto value, $Res Function(SplashAssetParamsDto) _then) = _$SplashAssetParamsDtoCopyWithImpl;
@useResult
$Res call({
 FitDto? fit, double? padding
});




}
/// @nodoc
class _$SplashAssetParamsDtoCopyWithImpl<$Res>
    implements $SplashAssetParamsDtoCopyWith<$Res> {
  _$SplashAssetParamsDtoCopyWithImpl(this._self, this._then);

  final SplashAssetParamsDto _self;
  final $Res Function(SplashAssetParamsDto) _then;

/// Create a copy of SplashAssetParamsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fit = freezed,Object? padding = freezed,}) {
  return _then(_self.copyWith(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitDto?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashAssetParamsDto].
extension SplashAssetParamsDtoPatterns on SplashAssetParamsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashAssetParamsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashAssetParamsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashAssetParamsDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashAssetParamsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashAssetParamsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashAssetParamsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FitDto? fit,  double? padding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashAssetParamsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FitDto? fit,  double? padding)  $default,) {final _that = this;
switch (_that) {
case _SplashAssetParamsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FitDto? fit,  double? padding)?  $default,) {final _that = this;
switch (_that) {
case _SplashAssetParamsDto() when $default != null:
return $default(_that.fit,_that.padding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashAssetParamsDto implements SplashAssetParamsDto {
  const _SplashAssetParamsDto({this.fit, this.padding});
  factory _SplashAssetParamsDto.fromJson(Map<String, dynamic> json) => _$SplashAssetParamsDtoFromJson(json);

@override final  FitDto? fit;
@override final  double? padding;

/// Create a copy of SplashAssetParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashAssetParamsDtoCopyWith<_SplashAssetParamsDto> get copyWith => __$SplashAssetParamsDtoCopyWithImpl<_SplashAssetParamsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashAssetParamsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashAssetParamsDto&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.padding, padding) || other.padding == padding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,padding);

@override
String toString() {
  return 'SplashAssetParamsDto(fit: $fit, padding: $padding)';
}


}

/// @nodoc
abstract mixin class _$SplashAssetParamsDtoCopyWith<$Res> implements $SplashAssetParamsDtoCopyWith<$Res> {
  factory _$SplashAssetParamsDtoCopyWith(_SplashAssetParamsDto value, $Res Function(_SplashAssetParamsDto) _then) = __$SplashAssetParamsDtoCopyWithImpl;
@override @useResult
$Res call({
 FitDto? fit, double? padding
});




}
/// @nodoc
class __$SplashAssetParamsDtoCopyWithImpl<$Res>
    implements _$SplashAssetParamsDtoCopyWith<$Res> {
  __$SplashAssetParamsDtoCopyWithImpl(this._self, this._then);

  final _SplashAssetParamsDto _self;
  final $Res Function(_SplashAssetParamsDto) _then;

/// Create a copy of SplashAssetParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fit = freezed,Object? padding = freezed,}) {
  return _then(_SplashAssetParamsDto(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitDto?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$SplashConstraintsValidationDto {

 bool get compliant; double get deltaDp; String get message; double? get toleranceDp;
/// Create a copy of SplashConstraintsValidationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashConstraintsValidationDtoCopyWith<SplashConstraintsValidationDto> get copyWith => _$SplashConstraintsValidationDtoCopyWithImpl<SplashConstraintsValidationDto>(this as SplashConstraintsValidationDto, _$identity);

  /// Serializes this SplashConstraintsValidationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashConstraintsValidationDto&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp)&&(identical(other.message, message) || other.message == message)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,deltaDp,message,toleranceDp);

@override
String toString() {
  return 'SplashConstraintsValidationDto(compliant: $compliant, deltaDp: $deltaDp, message: $message, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class $SplashConstraintsValidationDtoCopyWith<$Res>  {
  factory $SplashConstraintsValidationDtoCopyWith(SplashConstraintsValidationDto value, $Res Function(SplashConstraintsValidationDto) _then) = _$SplashConstraintsValidationDtoCopyWithImpl;
@useResult
$Res call({
 bool compliant, double deltaDp, String message, double? toleranceDp
});




}
/// @nodoc
class _$SplashConstraintsValidationDtoCopyWithImpl<$Res>
    implements $SplashConstraintsValidationDtoCopyWith<$Res> {
  _$SplashConstraintsValidationDtoCopyWithImpl(this._self, this._then);

  final SplashConstraintsValidationDto _self;
  final $Res Function(SplashConstraintsValidationDto) _then;

/// Create a copy of SplashConstraintsValidationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? compliant = null,Object? deltaDp = null,Object? message = null,Object? toleranceDp = freezed,}) {
  return _then(_self.copyWith(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,deltaDp: null == deltaDp ? _self.deltaDp : deltaDp // ignore: cast_nullable_to_non_nullable
as double,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,toleranceDp: freezed == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashConstraintsValidationDto].
extension SplashConstraintsValidationDtoPatterns on SplashConstraintsValidationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashConstraintsValidationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashConstraintsValidationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashConstraintsValidationDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsValidationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashConstraintsValidationDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsValidationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool compliant,  double deltaDp,  String message,  double? toleranceDp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashConstraintsValidationDto() when $default != null:
return $default(_that.compliant,_that.deltaDp,_that.message,_that.toleranceDp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool compliant,  double deltaDp,  String message,  double? toleranceDp)  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsValidationDto():
return $default(_that.compliant,_that.deltaDp,_that.message,_that.toleranceDp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool compliant,  double deltaDp,  String message,  double? toleranceDp)?  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsValidationDto() when $default != null:
return $default(_that.compliant,_that.deltaDp,_that.message,_that.toleranceDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashConstraintsValidationDto implements SplashConstraintsValidationDto {
  const _SplashConstraintsValidationDto({required this.compliant, required this.deltaDp, required this.message, this.toleranceDp});
  factory _SplashConstraintsValidationDto.fromJson(Map<String, dynamic> json) => _$SplashConstraintsValidationDtoFromJson(json);

@override final  bool compliant;
@override final  double deltaDp;
@override final  String message;
@override final  double? toleranceDp;

/// Create a copy of SplashConstraintsValidationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashConstraintsValidationDtoCopyWith<_SplashConstraintsValidationDto> get copyWith => __$SplashConstraintsValidationDtoCopyWithImpl<_SplashConstraintsValidationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashConstraintsValidationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashConstraintsValidationDto&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp)&&(identical(other.message, message) || other.message == message)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,deltaDp,message,toleranceDp);

@override
String toString() {
  return 'SplashConstraintsValidationDto(compliant: $compliant, deltaDp: $deltaDp, message: $message, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class _$SplashConstraintsValidationDtoCopyWith<$Res> implements $SplashConstraintsValidationDtoCopyWith<$Res> {
  factory _$SplashConstraintsValidationDtoCopyWith(_SplashConstraintsValidationDto value, $Res Function(_SplashConstraintsValidationDto) _then) = __$SplashConstraintsValidationDtoCopyWithImpl;
@override @useResult
$Res call({
 bool compliant, double deltaDp, String message, double? toleranceDp
});




}
/// @nodoc
class __$SplashConstraintsValidationDtoCopyWithImpl<$Res>
    implements _$SplashConstraintsValidationDtoCopyWith<$Res> {
  __$SplashConstraintsValidationDtoCopyWithImpl(this._self, this._then);

  final _SplashConstraintsValidationDto _self;
  final $Res Function(_SplashConstraintsValidationDto) _then;

/// Create a copy of SplashConstraintsValidationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? compliant = null,Object? deltaDp = null,Object? message = null,Object? toleranceDp = freezed,}) {
  return _then(_SplashConstraintsValidationDto(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,deltaDp: null == deltaDp ? _self.deltaDp : deltaDp // ignore: cast_nullable_to_non_nullable
as double,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,toleranceDp: freezed == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$SplashIconConstraintsDto {

 double get fullSizeDp; double get maskDiameterDp; double get recommendedPaddingDp; SplashConstraintsValidationDto get validation; SplashModeDto get mode; String get recommendationBasis;
/// Create a copy of SplashIconConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashIconConstraintsDtoCopyWith<SplashIconConstraintsDto> get copyWith => _$SplashIconConstraintsDtoCopyWithImpl<SplashIconConstraintsDto>(this as SplashIconConstraintsDto, _$identity);

  /// Serializes this SplashIconConstraintsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashIconConstraintsDto&&(identical(other.fullSizeDp, fullSizeDp) || other.fullSizeDp == fullSizeDp)&&(identical(other.maskDiameterDp, maskDiameterDp) || other.maskDiameterDp == maskDiameterDp)&&(identical(other.recommendedPaddingDp, recommendedPaddingDp) || other.recommendedPaddingDp == recommendedPaddingDp)&&(identical(other.validation, validation) || other.validation == validation)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.recommendationBasis, recommendationBasis) || other.recommendationBasis == recommendationBasis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeDp,maskDiameterDp,recommendedPaddingDp,validation,mode,recommendationBasis);

@override
String toString() {
  return 'SplashIconConstraintsDto(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, recommendedPaddingDp: $recommendedPaddingDp, validation: $validation, mode: $mode, recommendationBasis: $recommendationBasis)';
}


}

/// @nodoc
abstract mixin class $SplashIconConstraintsDtoCopyWith<$Res>  {
  factory $SplashIconConstraintsDtoCopyWith(SplashIconConstraintsDto value, $Res Function(SplashIconConstraintsDto) _then) = _$SplashIconConstraintsDtoCopyWithImpl;
@useResult
$Res call({
 double fullSizeDp, double maskDiameterDp, double recommendedPaddingDp, SplashConstraintsValidationDto validation, SplashModeDto mode, String recommendationBasis
});


$SplashConstraintsValidationDtoCopyWith<$Res> get validation;

}
/// @nodoc
class _$SplashIconConstraintsDtoCopyWithImpl<$Res>
    implements $SplashIconConstraintsDtoCopyWith<$Res> {
  _$SplashIconConstraintsDtoCopyWithImpl(this._self, this._then);

  final SplashIconConstraintsDto _self;
  final $Res Function(SplashIconConstraintsDto) _then;

/// Create a copy of SplashIconConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullSizeDp = null,Object? maskDiameterDp = null,Object? recommendedPaddingDp = null,Object? validation = null,Object? mode = null,Object? recommendationBasis = null,}) {
  return _then(_self.copyWith(
fullSizeDp: null == fullSizeDp ? _self.fullSizeDp : fullSizeDp // ignore: cast_nullable_to_non_nullable
as double,maskDiameterDp: null == maskDiameterDp ? _self.maskDiameterDp : maskDiameterDp // ignore: cast_nullable_to_non_nullable
as double,recommendedPaddingDp: null == recommendedPaddingDp ? _self.recommendedPaddingDp : recommendedPaddingDp // ignore: cast_nullable_to_non_nullable
as double,validation: null == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as SplashConstraintsValidationDto,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashModeDto,recommendationBasis: null == recommendationBasis ? _self.recommendationBasis : recommendationBasis // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SplashIconConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsValidationDtoCopyWith<$Res> get validation {
  
  return $SplashConstraintsValidationDtoCopyWith<$Res>(_self.validation, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashIconConstraintsDto].
extension SplashIconConstraintsDtoPatterns on SplashIconConstraintsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashIconConstraintsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashIconConstraintsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashIconConstraintsDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashIconConstraintsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashIconConstraintsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashIconConstraintsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fullSizeDp,  double maskDiameterDp,  double recommendedPaddingDp,  SplashConstraintsValidationDto validation,  SplashModeDto mode,  String recommendationBasis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashIconConstraintsDto() when $default != null:
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.recommendedPaddingDp,_that.validation,_that.mode,_that.recommendationBasis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fullSizeDp,  double maskDiameterDp,  double recommendedPaddingDp,  SplashConstraintsValidationDto validation,  SplashModeDto mode,  String recommendationBasis)  $default,) {final _that = this;
switch (_that) {
case _SplashIconConstraintsDto():
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.recommendedPaddingDp,_that.validation,_that.mode,_that.recommendationBasis);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fullSizeDp,  double maskDiameterDp,  double recommendedPaddingDp,  SplashConstraintsValidationDto validation,  SplashModeDto mode,  String recommendationBasis)?  $default,) {final _that = this;
switch (_that) {
case _SplashIconConstraintsDto() when $default != null:
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.recommendedPaddingDp,_that.validation,_that.mode,_that.recommendationBasis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashIconConstraintsDto implements SplashIconConstraintsDto {
  const _SplashIconConstraintsDto({required this.fullSizeDp, required this.maskDiameterDp, required this.recommendedPaddingDp, required this.validation, this.mode = SplashModeDto.withBackground, this.recommendationBasis = 'safeZone'});
  factory _SplashIconConstraintsDto.fromJson(Map<String, dynamic> json) => _$SplashIconConstraintsDtoFromJson(json);

@override final  double fullSizeDp;
@override final  double maskDiameterDp;
@override final  double recommendedPaddingDp;
@override final  SplashConstraintsValidationDto validation;
@override@JsonKey() final  SplashModeDto mode;
@override@JsonKey() final  String recommendationBasis;

/// Create a copy of SplashIconConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashIconConstraintsDtoCopyWith<_SplashIconConstraintsDto> get copyWith => __$SplashIconConstraintsDtoCopyWithImpl<_SplashIconConstraintsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashIconConstraintsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashIconConstraintsDto&&(identical(other.fullSizeDp, fullSizeDp) || other.fullSizeDp == fullSizeDp)&&(identical(other.maskDiameterDp, maskDiameterDp) || other.maskDiameterDp == maskDiameterDp)&&(identical(other.recommendedPaddingDp, recommendedPaddingDp) || other.recommendedPaddingDp == recommendedPaddingDp)&&(identical(other.validation, validation) || other.validation == validation)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.recommendationBasis, recommendationBasis) || other.recommendationBasis == recommendationBasis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeDp,maskDiameterDp,recommendedPaddingDp,validation,mode,recommendationBasis);

@override
String toString() {
  return 'SplashIconConstraintsDto(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, recommendedPaddingDp: $recommendedPaddingDp, validation: $validation, mode: $mode, recommendationBasis: $recommendationBasis)';
}


}

/// @nodoc
abstract mixin class _$SplashIconConstraintsDtoCopyWith<$Res> implements $SplashIconConstraintsDtoCopyWith<$Res> {
  factory _$SplashIconConstraintsDtoCopyWith(_SplashIconConstraintsDto value, $Res Function(_SplashIconConstraintsDto) _then) = __$SplashIconConstraintsDtoCopyWithImpl;
@override @useResult
$Res call({
 double fullSizeDp, double maskDiameterDp, double recommendedPaddingDp, SplashConstraintsValidationDto validation, SplashModeDto mode, String recommendationBasis
});


@override $SplashConstraintsValidationDtoCopyWith<$Res> get validation;

}
/// @nodoc
class __$SplashIconConstraintsDtoCopyWithImpl<$Res>
    implements _$SplashIconConstraintsDtoCopyWith<$Res> {
  __$SplashIconConstraintsDtoCopyWithImpl(this._self, this._then);

  final _SplashIconConstraintsDto _self;
  final $Res Function(_SplashIconConstraintsDto) _then;

/// Create a copy of SplashIconConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullSizeDp = null,Object? maskDiameterDp = null,Object? recommendedPaddingDp = null,Object? validation = null,Object? mode = null,Object? recommendationBasis = null,}) {
  return _then(_SplashIconConstraintsDto(
fullSizeDp: null == fullSizeDp ? _self.fullSizeDp : fullSizeDp // ignore: cast_nullable_to_non_nullable
as double,maskDiameterDp: null == maskDiameterDp ? _self.maskDiameterDp : maskDiameterDp // ignore: cast_nullable_to_non_nullable
as double,recommendedPaddingDp: null == recommendedPaddingDp ? _self.recommendedPaddingDp : recommendedPaddingDp // ignore: cast_nullable_to_non_nullable
as double,validation: null == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as SplashConstraintsValidationDto,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashModeDto,recommendationBasis: null == recommendationBasis ? _self.recommendationBasis : recommendationBasis // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SplashIconConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsValidationDtoCopyWith<$Res> get validation {
  
  return $SplashConstraintsValidationDtoCopyWith<$Res>(_self.validation, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// @nodoc
mixin _$SplashAssetDto {

 String get id;// themeId
 String get applicationId; String get themeId; SplashSourceDto? get source; SplashAssetParamsDto? get params; SplashModeDto? get mode; SplashOutputsArtifactsDto? get outputsArtifacts; String? get splashArtifactId; SplashIconConstraintsDto? get iconConstraints; String? get createdAt; String? get updatedAt; Map<String, String>? get urls;
/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashAssetDtoCopyWith<SplashAssetDto> get copyWith => _$SplashAssetDtoCopyWithImpl<SplashAssetDto>(this as SplashAssetDto, _$identity);

  /// Serializes this SplashAssetDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashAssetDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.outputsArtifacts, outputsArtifacts) || other.outputsArtifacts == outputsArtifacts)&&(identical(other.splashArtifactId, splashArtifactId) || other.splashArtifactId == splashArtifactId)&&(identical(other.iconConstraints, iconConstraints) || other.iconConstraints == iconConstraints)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.urls, urls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,source,params,mode,outputsArtifacts,splashArtifactId,iconConstraints,createdAt,updatedAt,const DeepCollectionEquality().hash(urls));

@override
String toString() {
  return 'SplashAssetDto(id: $id, applicationId: $applicationId, themeId: $themeId, source: $source, params: $params, mode: $mode, outputsArtifacts: $outputsArtifacts, splashArtifactId: $splashArtifactId, iconConstraints: $iconConstraints, createdAt: $createdAt, updatedAt: $updatedAt, urls: $urls)';
}


}

/// @nodoc
abstract mixin class $SplashAssetDtoCopyWith<$Res>  {
  factory $SplashAssetDtoCopyWith(SplashAssetDto value, $Res Function(SplashAssetDto) _then) = _$SplashAssetDtoCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String themeId, SplashSourceDto? source, SplashAssetParamsDto? params, SplashModeDto? mode, SplashOutputsArtifactsDto? outputsArtifacts, String? splashArtifactId, SplashIconConstraintsDto? iconConstraints, String? createdAt, String? updatedAt, Map<String, String>? urls
});


$SplashSourceDtoCopyWith<$Res>? get source;$SplashAssetParamsDtoCopyWith<$Res>? get params;$SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts;$SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints;

}
/// @nodoc
class _$SplashAssetDtoCopyWithImpl<$Res>
    implements $SplashAssetDtoCopyWith<$Res> {
  _$SplashAssetDtoCopyWithImpl(this._self, this._then);

  final SplashAssetDto _self;
  final $Res Function(SplashAssetDto) _then;

/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? source = freezed,Object? params = freezed,Object? mode = freezed,Object? outputsArtifacts = freezed,Object? splashArtifactId = freezed,Object? iconConstraints = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? urls = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SplashSourceDto?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SplashAssetParamsDto?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashModeDto?,outputsArtifacts: freezed == outputsArtifacts ? _self.outputsArtifacts : outputsArtifacts // ignore: cast_nullable_to_non_nullable
as SplashOutputsArtifactsDto?,splashArtifactId: freezed == splashArtifactId ? _self.splashArtifactId : splashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,iconConstraints: freezed == iconConstraints ? _self.iconConstraints : iconConstraints // ignore: cast_nullable_to_non_nullable
as SplashIconConstraintsDto?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,urls: freezed == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}
/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashSourceDtoCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SplashSourceDtoCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashAssetParamsDtoCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $SplashAssetParamsDtoCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts {
    if (_self.outputsArtifacts == null) {
    return null;
  }

  return $SplashOutputsArtifactsDtoCopyWith<$Res>(_self.outputsArtifacts!, (value) {
    return _then(_self.copyWith(outputsArtifacts: value));
  });
}/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints {
    if (_self.iconConstraints == null) {
    return null;
  }

  return $SplashIconConstraintsDtoCopyWith<$Res>(_self.iconConstraints!, (value) {
    return _then(_self.copyWith(iconConstraints: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashAssetDto].
extension SplashAssetDtoPatterns on SplashAssetDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashAssetDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashAssetDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashAssetDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashAssetDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashAssetDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashAssetDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  SplashSourceDto? source,  SplashAssetParamsDto? params,  SplashModeDto? mode,  SplashOutputsArtifactsDto? outputsArtifacts,  String? splashArtifactId,  SplashIconConstraintsDto? iconConstraints,  String? createdAt,  String? updatedAt,  Map<String, String>? urls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashAssetDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.source,_that.params,_that.mode,_that.outputsArtifacts,_that.splashArtifactId,_that.iconConstraints,_that.createdAt,_that.updatedAt,_that.urls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  SplashSourceDto? source,  SplashAssetParamsDto? params,  SplashModeDto? mode,  SplashOutputsArtifactsDto? outputsArtifacts,  String? splashArtifactId,  SplashIconConstraintsDto? iconConstraints,  String? createdAt,  String? updatedAt,  Map<String, String>? urls)  $default,) {final _that = this;
switch (_that) {
case _SplashAssetDto():
return $default(_that.id,_that.applicationId,_that.themeId,_that.source,_that.params,_that.mode,_that.outputsArtifacts,_that.splashArtifactId,_that.iconConstraints,_that.createdAt,_that.updatedAt,_that.urls);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String themeId,  SplashSourceDto? source,  SplashAssetParamsDto? params,  SplashModeDto? mode,  SplashOutputsArtifactsDto? outputsArtifacts,  String? splashArtifactId,  SplashIconConstraintsDto? iconConstraints,  String? createdAt,  String? updatedAt,  Map<String, String>? urls)?  $default,) {final _that = this;
switch (_that) {
case _SplashAssetDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.source,_that.params,_that.mode,_that.outputsArtifacts,_that.splashArtifactId,_that.iconConstraints,_that.createdAt,_that.updatedAt,_that.urls);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _SplashAssetDto extends SplashAssetDto {
  const _SplashAssetDto({required this.id, required this.applicationId, required this.themeId, this.source, this.params, this.mode, this.outputsArtifacts, this.splashArtifactId, this.iconConstraints, this.createdAt, this.updatedAt, this.urls}): super._();
  factory _SplashAssetDto.fromJson(Map<String, dynamic> json) => _$SplashAssetDtoFromJson(json);

@override final  String id;
// themeId
@override final  String applicationId;
@override final  String themeId;
@override final  SplashSourceDto? source;
@override final  SplashAssetParamsDto? params;
@override final  SplashModeDto? mode;
@override final  SplashOutputsArtifactsDto? outputsArtifacts;
@override final  String? splashArtifactId;
@override final  SplashIconConstraintsDto? iconConstraints;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  Map<String, String>? urls;

/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashAssetDtoCopyWith<_SplashAssetDto> get copyWith => __$SplashAssetDtoCopyWithImpl<_SplashAssetDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashAssetDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashAssetDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.outputsArtifacts, outputsArtifacts) || other.outputsArtifacts == outputsArtifacts)&&(identical(other.splashArtifactId, splashArtifactId) || other.splashArtifactId == splashArtifactId)&&(identical(other.iconConstraints, iconConstraints) || other.iconConstraints == iconConstraints)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.urls, urls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,source,params,mode,outputsArtifacts,splashArtifactId,iconConstraints,createdAt,updatedAt,const DeepCollectionEquality().hash(urls));

@override
String toString() {
  return 'SplashAssetDto(id: $id, applicationId: $applicationId, themeId: $themeId, source: $source, params: $params, mode: $mode, outputsArtifacts: $outputsArtifacts, splashArtifactId: $splashArtifactId, iconConstraints: $iconConstraints, createdAt: $createdAt, updatedAt: $updatedAt, urls: $urls)';
}


}

/// @nodoc
abstract mixin class _$SplashAssetDtoCopyWith<$Res> implements $SplashAssetDtoCopyWith<$Res> {
  factory _$SplashAssetDtoCopyWith(_SplashAssetDto value, $Res Function(_SplashAssetDto) _then) = __$SplashAssetDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String themeId, SplashSourceDto? source, SplashAssetParamsDto? params, SplashModeDto? mode, SplashOutputsArtifactsDto? outputsArtifacts, String? splashArtifactId, SplashIconConstraintsDto? iconConstraints, String? createdAt, String? updatedAt, Map<String, String>? urls
});


@override $SplashSourceDtoCopyWith<$Res>? get source;@override $SplashAssetParamsDtoCopyWith<$Res>? get params;@override $SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts;@override $SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints;

}
/// @nodoc
class __$SplashAssetDtoCopyWithImpl<$Res>
    implements _$SplashAssetDtoCopyWith<$Res> {
  __$SplashAssetDtoCopyWithImpl(this._self, this._then);

  final _SplashAssetDto _self;
  final $Res Function(_SplashAssetDto) _then;

/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? source = freezed,Object? params = freezed,Object? mode = freezed,Object? outputsArtifacts = freezed,Object? splashArtifactId = freezed,Object? iconConstraints = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? urls = freezed,}) {
  return _then(_SplashAssetDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SplashSourceDto?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as SplashAssetParamsDto?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as SplashModeDto?,outputsArtifacts: freezed == outputsArtifacts ? _self.outputsArtifacts : outputsArtifacts // ignore: cast_nullable_to_non_nullable
as SplashOutputsArtifactsDto?,splashArtifactId: freezed == splashArtifactId ? _self.splashArtifactId : splashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,iconConstraints: freezed == iconConstraints ? _self.iconConstraints : iconConstraints // ignore: cast_nullable_to_non_nullable
as SplashIconConstraintsDto?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,urls: freezed == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashSourceDtoCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SplashSourceDtoCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashAssetParamsDtoCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $SplashAssetParamsDtoCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts {
    if (_self.outputsArtifacts == null) {
    return null;
  }

  return $SplashOutputsArtifactsDtoCopyWith<$Res>(_self.outputsArtifacts!, (value) {
    return _then(_self.copyWith(outputsArtifacts: value));
  });
}/// Create a copy of SplashAssetDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints {
    if (_self.iconConstraints == null) {
    return null;
  }

  return $SplashIconConstraintsDtoCopyWith<$Res>(_self.iconConstraints!, (value) {
    return _then(_self.copyWith(iconConstraints: value));
  });
}
}


/// @nodoc
mixin _$SplashConstraintsDefaultsSliceDto {

 double get fullSizeDp; double get maskDiameterDp; double get toleranceDp;
/// Create a copy of SplashConstraintsDefaultsSliceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<SplashConstraintsDefaultsSliceDto> get copyWith => _$SplashConstraintsDefaultsSliceDtoCopyWithImpl<SplashConstraintsDefaultsSliceDto>(this as SplashConstraintsDefaultsSliceDto, _$identity);

  /// Serializes this SplashConstraintsDefaultsSliceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashConstraintsDefaultsSliceDto&&(identical(other.fullSizeDp, fullSizeDp) || other.fullSizeDp == fullSizeDp)&&(identical(other.maskDiameterDp, maskDiameterDp) || other.maskDiameterDp == maskDiameterDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeDp,maskDiameterDp,toleranceDp);

@override
String toString() {
  return 'SplashConstraintsDefaultsSliceDto(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>  {
  factory $SplashConstraintsDefaultsSliceDtoCopyWith(SplashConstraintsDefaultsSliceDto value, $Res Function(SplashConstraintsDefaultsSliceDto) _then) = _$SplashConstraintsDefaultsSliceDtoCopyWithImpl;
@useResult
$Res call({
 double fullSizeDp, double maskDiameterDp, double toleranceDp
});




}
/// @nodoc
class _$SplashConstraintsDefaultsSliceDtoCopyWithImpl<$Res>
    implements $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> {
  _$SplashConstraintsDefaultsSliceDtoCopyWithImpl(this._self, this._then);

  final SplashConstraintsDefaultsSliceDto _self;
  final $Res Function(SplashConstraintsDefaultsSliceDto) _then;

/// Create a copy of SplashConstraintsDefaultsSliceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullSizeDp = null,Object? maskDiameterDp = null,Object? toleranceDp = null,}) {
  return _then(_self.copyWith(
fullSizeDp: null == fullSizeDp ? _self.fullSizeDp : fullSizeDp // ignore: cast_nullable_to_non_nullable
as double,maskDiameterDp: null == maskDiameterDp ? _self.maskDiameterDp : maskDiameterDp // ignore: cast_nullable_to_non_nullable
as double,toleranceDp: null == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashConstraintsDefaultsSliceDto].
extension SplashConstraintsDefaultsSliceDtoPatterns on SplashConstraintsDefaultsSliceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsSliceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsSliceDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashConstraintsDefaultsSliceDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double fullSizeDp,  double maskDiameterDp,  double toleranceDp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceDto() when $default != null:
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.toleranceDp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double fullSizeDp,  double maskDiameterDp,  double toleranceDp)  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceDto():
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.toleranceDp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double fullSizeDp,  double maskDiameterDp,  double toleranceDp)?  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceDto() when $default != null:
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.toleranceDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashConstraintsDefaultsSliceDto implements SplashConstraintsDefaultsSliceDto {
  const _SplashConstraintsDefaultsSliceDto({required this.fullSizeDp, required this.maskDiameterDp, required this.toleranceDp});
  factory _SplashConstraintsDefaultsSliceDto.fromJson(Map<String, dynamic> json) => _$SplashConstraintsDefaultsSliceDtoFromJson(json);

@override final  double fullSizeDp;
@override final  double maskDiameterDp;
@override final  double toleranceDp;

/// Create a copy of SplashConstraintsDefaultsSliceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashConstraintsDefaultsSliceDtoCopyWith<_SplashConstraintsDefaultsSliceDto> get copyWith => __$SplashConstraintsDefaultsSliceDtoCopyWithImpl<_SplashConstraintsDefaultsSliceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashConstraintsDefaultsSliceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashConstraintsDefaultsSliceDto&&(identical(other.fullSizeDp, fullSizeDp) || other.fullSizeDp == fullSizeDp)&&(identical(other.maskDiameterDp, maskDiameterDp) || other.maskDiameterDp == maskDiameterDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeDp,maskDiameterDp,toleranceDp);

@override
String toString() {
  return 'SplashConstraintsDefaultsSliceDto(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class _$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> implements $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> {
  factory _$SplashConstraintsDefaultsSliceDtoCopyWith(_SplashConstraintsDefaultsSliceDto value, $Res Function(_SplashConstraintsDefaultsSliceDto) _then) = __$SplashConstraintsDefaultsSliceDtoCopyWithImpl;
@override @useResult
$Res call({
 double fullSizeDp, double maskDiameterDp, double toleranceDp
});




}
/// @nodoc
class __$SplashConstraintsDefaultsSliceDtoCopyWithImpl<$Res>
    implements _$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> {
  __$SplashConstraintsDefaultsSliceDtoCopyWithImpl(this._self, this._then);

  final _SplashConstraintsDefaultsSliceDto _self;
  final $Res Function(_SplashConstraintsDefaultsSliceDto) _then;

/// Create a copy of SplashConstraintsDefaultsSliceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullSizeDp = null,Object? maskDiameterDp = null,Object? toleranceDp = null,}) {
  return _then(_SplashConstraintsDefaultsSliceDto(
fullSizeDp: null == fullSizeDp ? _self.fullSizeDp : fullSizeDp // ignore: cast_nullable_to_non_nullable
as double,maskDiameterDp: null == maskDiameterDp ? _self.maskDiameterDp : maskDiameterDp // ignore: cast_nullable_to_non_nullable
as double,toleranceDp: null == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SplashConstraintsDefaultsDto {

 SplashConstraintsDefaultsSliceDto get withBackground; SplashConstraintsDefaultsSliceDto get withoutBackground; SplashConstraintsDefaultsSliceDto? get android12;
/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsDtoCopyWith<SplashConstraintsDefaultsDto> get copyWith => _$SplashConstraintsDefaultsDtoCopyWithImpl<SplashConstraintsDefaultsDto>(this as SplashConstraintsDefaultsDto, _$identity);

  /// Serializes this SplashConstraintsDefaultsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashConstraintsDefaultsDto&&(identical(other.withBackground, withBackground) || other.withBackground == withBackground)&&(identical(other.withoutBackground, withoutBackground) || other.withoutBackground == withoutBackground)&&(identical(other.android12, android12) || other.android12 == android12));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,withBackground,withoutBackground,android12);

@override
String toString() {
  return 'SplashConstraintsDefaultsDto(withBackground: $withBackground, withoutBackground: $withoutBackground, android12: $android12)';
}


}

/// @nodoc
abstract mixin class $SplashConstraintsDefaultsDtoCopyWith<$Res>  {
  factory $SplashConstraintsDefaultsDtoCopyWith(SplashConstraintsDefaultsDto value, $Res Function(SplashConstraintsDefaultsDto) _then) = _$SplashConstraintsDefaultsDtoCopyWithImpl;
@useResult
$Res call({
 SplashConstraintsDefaultsSliceDto withBackground, SplashConstraintsDefaultsSliceDto withoutBackground, SplashConstraintsDefaultsSliceDto? android12
});


$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground;$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground;$SplashConstraintsDefaultsSliceDtoCopyWith<$Res>? get android12;

}
/// @nodoc
class _$SplashConstraintsDefaultsDtoCopyWithImpl<$Res>
    implements $SplashConstraintsDefaultsDtoCopyWith<$Res> {
  _$SplashConstraintsDefaultsDtoCopyWithImpl(this._self, this._then);

  final SplashConstraintsDefaultsDto _self;
  final $Res Function(SplashConstraintsDefaultsDto) _then;

/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? withBackground = null,Object? withoutBackground = null,Object? android12 = freezed,}) {
  return _then(_self.copyWith(
withBackground: null == withBackground ? _self.withBackground : withBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceDto,withoutBackground: null == withoutBackground ? _self.withoutBackground : withoutBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceDto,android12: freezed == android12 ? _self.android12 : android12 // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceDto?,
  ));
}
/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground {
  
  return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(_self.withBackground, (value) {
    return _then(_self.copyWith(withBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground {
  
  return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(_self.withoutBackground, (value) {
    return _then(_self.copyWith(withoutBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<$Res>? get android12 {
    if (_self.android12 == null) {
    return null;
  }

  return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(_self.android12!, (value) {
    return _then(_self.copyWith(android12: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashConstraintsDefaultsDto].
extension SplashConstraintsDefaultsDtoPatterns on SplashConstraintsDefaultsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashConstraintsDefaultsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SplashConstraintsDefaultsSliceDto withBackground,  SplashConstraintsDefaultsSliceDto withoutBackground,  SplashConstraintsDefaultsSliceDto? android12)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsDto() when $default != null:
return $default(_that.withBackground,_that.withoutBackground,_that.android12);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SplashConstraintsDefaultsSliceDto withBackground,  SplashConstraintsDefaultsSliceDto withoutBackground,  SplashConstraintsDefaultsSliceDto? android12)  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsDto():
return $default(_that.withBackground,_that.withoutBackground,_that.android12);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SplashConstraintsDefaultsSliceDto withBackground,  SplashConstraintsDefaultsSliceDto withoutBackground,  SplashConstraintsDefaultsSliceDto? android12)?  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsDto() when $default != null:
return $default(_that.withBackground,_that.withoutBackground,_that.android12);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashConstraintsDefaultsDto implements SplashConstraintsDefaultsDto {
  const _SplashConstraintsDefaultsDto({required this.withBackground, required this.withoutBackground, this.android12});
  factory _SplashConstraintsDefaultsDto.fromJson(Map<String, dynamic> json) => _$SplashConstraintsDefaultsDtoFromJson(json);

@override final  SplashConstraintsDefaultsSliceDto withBackground;
@override final  SplashConstraintsDefaultsSliceDto withoutBackground;
@override final  SplashConstraintsDefaultsSliceDto? android12;

/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashConstraintsDefaultsDtoCopyWith<_SplashConstraintsDefaultsDto> get copyWith => __$SplashConstraintsDefaultsDtoCopyWithImpl<_SplashConstraintsDefaultsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashConstraintsDefaultsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashConstraintsDefaultsDto&&(identical(other.withBackground, withBackground) || other.withBackground == withBackground)&&(identical(other.withoutBackground, withoutBackground) || other.withoutBackground == withoutBackground)&&(identical(other.android12, android12) || other.android12 == android12));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,withBackground,withoutBackground,android12);

@override
String toString() {
  return 'SplashConstraintsDefaultsDto(withBackground: $withBackground, withoutBackground: $withoutBackground, android12: $android12)';
}


}

/// @nodoc
abstract mixin class _$SplashConstraintsDefaultsDtoCopyWith<$Res> implements $SplashConstraintsDefaultsDtoCopyWith<$Res> {
  factory _$SplashConstraintsDefaultsDtoCopyWith(_SplashConstraintsDefaultsDto value, $Res Function(_SplashConstraintsDefaultsDto) _then) = __$SplashConstraintsDefaultsDtoCopyWithImpl;
@override @useResult
$Res call({
 SplashConstraintsDefaultsSliceDto withBackground, SplashConstraintsDefaultsSliceDto withoutBackground, SplashConstraintsDefaultsSliceDto? android12
});


@override $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground;@override $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground;@override $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>? get android12;

}
/// @nodoc
class __$SplashConstraintsDefaultsDtoCopyWithImpl<$Res>
    implements _$SplashConstraintsDefaultsDtoCopyWith<$Res> {
  __$SplashConstraintsDefaultsDtoCopyWithImpl(this._self, this._then);

  final _SplashConstraintsDefaultsDto _self;
  final $Res Function(_SplashConstraintsDefaultsDto) _then;

/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? withBackground = null,Object? withoutBackground = null,Object? android12 = freezed,}) {
  return _then(_SplashConstraintsDefaultsDto(
withBackground: null == withBackground ? _self.withBackground : withBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceDto,withoutBackground: null == withoutBackground ? _self.withoutBackground : withoutBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceDto,android12: freezed == android12 ? _self.android12 : android12 // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceDto?,
  ));
}

/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground {
  
  return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(_self.withBackground, (value) {
    return _then(_self.copyWith(withBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground {
  
  return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(_self.withoutBackground, (value) {
    return _then(_self.copyWith(withoutBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceDtoCopyWith<$Res>? get android12 {
    if (_self.android12 == null) {
    return null;
  }

  return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(_self.android12!, (value) {
    return _then(_self.copyWith(android12: value));
  });
}
}


/// @nodoc
mixin _$SplashOutputsArtifactsDto {

 String? get splashArtifactId; String? get android12SplashArtifactId;
/// Create a copy of SplashOutputsArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashOutputsArtifactsDtoCopyWith<SplashOutputsArtifactsDto> get copyWith => _$SplashOutputsArtifactsDtoCopyWithImpl<SplashOutputsArtifactsDto>(this as SplashOutputsArtifactsDto, _$identity);

  /// Serializes this SplashOutputsArtifactsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashOutputsArtifactsDto&&(identical(other.splashArtifactId, splashArtifactId) || other.splashArtifactId == splashArtifactId)&&(identical(other.android12SplashArtifactId, android12SplashArtifactId) || other.android12SplashArtifactId == android12SplashArtifactId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,splashArtifactId,android12SplashArtifactId);

@override
String toString() {
  return 'SplashOutputsArtifactsDto(splashArtifactId: $splashArtifactId, android12SplashArtifactId: $android12SplashArtifactId)';
}


}

/// @nodoc
abstract mixin class $SplashOutputsArtifactsDtoCopyWith<$Res>  {
  factory $SplashOutputsArtifactsDtoCopyWith(SplashOutputsArtifactsDto value, $Res Function(SplashOutputsArtifactsDto) _then) = _$SplashOutputsArtifactsDtoCopyWithImpl;
@useResult
$Res call({
 String? splashArtifactId, String? android12SplashArtifactId
});




}
/// @nodoc
class _$SplashOutputsArtifactsDtoCopyWithImpl<$Res>
    implements $SplashOutputsArtifactsDtoCopyWith<$Res> {
  _$SplashOutputsArtifactsDtoCopyWithImpl(this._self, this._then);

  final SplashOutputsArtifactsDto _self;
  final $Res Function(SplashOutputsArtifactsDto) _then;

/// Create a copy of SplashOutputsArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? splashArtifactId = freezed,Object? android12SplashArtifactId = freezed,}) {
  return _then(_self.copyWith(
splashArtifactId: freezed == splashArtifactId ? _self.splashArtifactId : splashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,android12SplashArtifactId: freezed == android12SplashArtifactId ? _self.android12SplashArtifactId : android12SplashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SplashOutputsArtifactsDto].
extension SplashOutputsArtifactsDtoPatterns on SplashOutputsArtifactsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashOutputsArtifactsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashOutputsArtifactsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashOutputsArtifactsDto value)  $default,){
final _that = this;
switch (_that) {
case _SplashOutputsArtifactsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashOutputsArtifactsDto value)?  $default,){
final _that = this;
switch (_that) {
case _SplashOutputsArtifactsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? splashArtifactId,  String? android12SplashArtifactId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashOutputsArtifactsDto() when $default != null:
return $default(_that.splashArtifactId,_that.android12SplashArtifactId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? splashArtifactId,  String? android12SplashArtifactId)  $default,) {final _that = this;
switch (_that) {
case _SplashOutputsArtifactsDto():
return $default(_that.splashArtifactId,_that.android12SplashArtifactId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? splashArtifactId,  String? android12SplashArtifactId)?  $default,) {final _that = this;
switch (_that) {
case _SplashOutputsArtifactsDto() when $default != null:
return $default(_that.splashArtifactId,_that.android12SplashArtifactId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashOutputsArtifactsDto implements SplashOutputsArtifactsDto {
  const _SplashOutputsArtifactsDto({this.splashArtifactId, this.android12SplashArtifactId});
  factory _SplashOutputsArtifactsDto.fromJson(Map<String, dynamic> json) => _$SplashOutputsArtifactsDtoFromJson(json);

@override final  String? splashArtifactId;
@override final  String? android12SplashArtifactId;

/// Create a copy of SplashOutputsArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashOutputsArtifactsDtoCopyWith<_SplashOutputsArtifactsDto> get copyWith => __$SplashOutputsArtifactsDtoCopyWithImpl<_SplashOutputsArtifactsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashOutputsArtifactsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashOutputsArtifactsDto&&(identical(other.splashArtifactId, splashArtifactId) || other.splashArtifactId == splashArtifactId)&&(identical(other.android12SplashArtifactId, android12SplashArtifactId) || other.android12SplashArtifactId == android12SplashArtifactId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,splashArtifactId,android12SplashArtifactId);

@override
String toString() {
  return 'SplashOutputsArtifactsDto(splashArtifactId: $splashArtifactId, android12SplashArtifactId: $android12SplashArtifactId)';
}


}

/// @nodoc
abstract mixin class _$SplashOutputsArtifactsDtoCopyWith<$Res> implements $SplashOutputsArtifactsDtoCopyWith<$Res> {
  factory _$SplashOutputsArtifactsDtoCopyWith(_SplashOutputsArtifactsDto value, $Res Function(_SplashOutputsArtifactsDto) _then) = __$SplashOutputsArtifactsDtoCopyWithImpl;
@override @useResult
$Res call({
 String? splashArtifactId, String? android12SplashArtifactId
});




}
/// @nodoc
class __$SplashOutputsArtifactsDtoCopyWithImpl<$Res>
    implements _$SplashOutputsArtifactsDtoCopyWith<$Res> {
  __$SplashOutputsArtifactsDtoCopyWithImpl(this._self, this._then);

  final _SplashOutputsArtifactsDto _self;
  final $Res Function(_SplashOutputsArtifactsDto) _then;

/// Create a copy of SplashOutputsArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? splashArtifactId = freezed,Object? android12SplashArtifactId = freezed,}) {
  return _then(_SplashOutputsArtifactsDto(
splashArtifactId: freezed == splashArtifactId ? _self.splashArtifactId : splashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,android12SplashArtifactId: freezed == android12SplashArtifactId ? _self.android12SplashArtifactId : android12SplashArtifactId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
