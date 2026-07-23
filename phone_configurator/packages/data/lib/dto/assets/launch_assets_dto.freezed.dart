// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_assets_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FitPaddingDto {

 FitDto? get fit; int? get paddingDp;
/// Create a copy of FitPaddingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<FitPaddingDto> get copyWith => _$FitPaddingDtoCopyWithImpl<FitPaddingDto>(this as FitPaddingDto, _$identity);

  /// Serializes this FitPaddingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitPaddingDto&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.paddingDp, paddingDp) || other.paddingDp == paddingDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,paddingDp);

@override
String toString() {
  return 'FitPaddingDto(fit: $fit, paddingDp: $paddingDp)';
}


}

/// @nodoc
abstract mixin class $FitPaddingDtoCopyWith<$Res>  {
  factory $FitPaddingDtoCopyWith(FitPaddingDto value, $Res Function(FitPaddingDto) _then) = _$FitPaddingDtoCopyWithImpl;
@useResult
$Res call({
 FitDto? fit, int? paddingDp
});




}
/// @nodoc
class _$FitPaddingDtoCopyWithImpl<$Res>
    implements $FitPaddingDtoCopyWith<$Res> {
  _$FitPaddingDtoCopyWithImpl(this._self, this._then);

  final FitPaddingDto _self;
  final $Res Function(FitPaddingDto) _then;

/// Create a copy of FitPaddingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fit = freezed,Object? paddingDp = freezed,}) {
  return _then(_self.copyWith(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitDto?,paddingDp: freezed == paddingDp ? _self.paddingDp : paddingDp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FitPaddingDto].
extension FitPaddingDtoPatterns on FitPaddingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FitPaddingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FitPaddingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FitPaddingDto value)  $default,){
final _that = this;
switch (_that) {
case _FitPaddingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FitPaddingDto value)?  $default,){
final _that = this;
switch (_that) {
case _FitPaddingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FitDto? fit,  int? paddingDp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FitPaddingDto() when $default != null:
return $default(_that.fit,_that.paddingDp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FitDto? fit,  int? paddingDp)  $default,) {final _that = this;
switch (_that) {
case _FitPaddingDto():
return $default(_that.fit,_that.paddingDp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FitDto? fit,  int? paddingDp)?  $default,) {final _that = this;
switch (_that) {
case _FitPaddingDto() when $default != null:
return $default(_that.fit,_that.paddingDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FitPaddingDto implements FitPaddingDto {
  const _FitPaddingDto({this.fit, this.paddingDp});
  factory _FitPaddingDto.fromJson(Map<String, dynamic> json) => _$FitPaddingDtoFromJson(json);

@override final  FitDto? fit;
@override final  int? paddingDp;

/// Create a copy of FitPaddingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FitPaddingDtoCopyWith<_FitPaddingDto> get copyWith => __$FitPaddingDtoCopyWithImpl<_FitPaddingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FitPaddingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FitPaddingDto&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.paddingDp, paddingDp) || other.paddingDp == paddingDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,paddingDp);

@override
String toString() {
  return 'FitPaddingDto(fit: $fit, paddingDp: $paddingDp)';
}


}

/// @nodoc
abstract mixin class _$FitPaddingDtoCopyWith<$Res> implements $FitPaddingDtoCopyWith<$Res> {
  factory _$FitPaddingDtoCopyWith(_FitPaddingDto value, $Res Function(_FitPaddingDto) _then) = __$FitPaddingDtoCopyWithImpl;
@override @useResult
$Res call({
 FitDto? fit, int? paddingDp
});




}
/// @nodoc
class __$FitPaddingDtoCopyWithImpl<$Res>
    implements _$FitPaddingDtoCopyWith<$Res> {
  __$FitPaddingDtoCopyWithImpl(this._self, this._then);

  final _FitPaddingDto _self;
  final $Res Function(_FitPaddingDto) _then;

/// Create a copy of FitPaddingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fit = freezed,Object? paddingDp = freezed,}) {
  return _then(_FitPaddingDto(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitDto?,paddingDp: freezed == paddingDp ? _self.paddingDp : paddingDp // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PlatformParamsDto {

 FitPaddingDto? get androidLegacy; FitPaddingDto? get androidAdaptive; FitPaddingDto? get ios; FitPaddingDto? get web;
/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformParamsDtoCopyWith<PlatformParamsDto> get copyWith => _$PlatformParamsDtoCopyWithImpl<PlatformParamsDto>(this as PlatformParamsDto, _$identity);

  /// Serializes this PlatformParamsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformParamsDto&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'PlatformParamsDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class $PlatformParamsDtoCopyWith<$Res>  {
  factory $PlatformParamsDtoCopyWith(PlatformParamsDto value, $Res Function(PlatformParamsDto) _then) = _$PlatformParamsDtoCopyWithImpl;
@useResult
$Res call({
 FitPaddingDto? androidLegacy, FitPaddingDto? androidAdaptive, FitPaddingDto? ios, FitPaddingDto? web
});


$FitPaddingDtoCopyWith<$Res>? get androidLegacy;$FitPaddingDtoCopyWith<$Res>? get androidAdaptive;$FitPaddingDtoCopyWith<$Res>? get ios;$FitPaddingDtoCopyWith<$Res>? get web;

}
/// @nodoc
class _$PlatformParamsDtoCopyWithImpl<$Res>
    implements $PlatformParamsDtoCopyWith<$Res> {
  _$PlatformParamsDtoCopyWithImpl(this._self, this._then);

  final PlatformParamsDto _self;
  final $Res Function(PlatformParamsDto) _then;

/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_self.copyWith(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,
  ));
}
/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlatformParamsDto].
extension PlatformParamsDtoPatterns on PlatformParamsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformParamsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformParamsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformParamsDto value)  $default,){
final _that = this;
switch (_that) {
case _PlatformParamsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformParamsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformParamsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FitPaddingDto? androidLegacy,  FitPaddingDto? androidAdaptive,  FitPaddingDto? ios,  FitPaddingDto? web)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformParamsDto() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FitPaddingDto? androidLegacy,  FitPaddingDto? androidAdaptive,  FitPaddingDto? ios,  FitPaddingDto? web)  $default,) {final _that = this;
switch (_that) {
case _PlatformParamsDto():
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FitPaddingDto? androidLegacy,  FitPaddingDto? androidAdaptive,  FitPaddingDto? ios,  FitPaddingDto? web)?  $default,) {final _that = this;
switch (_that) {
case _PlatformParamsDto() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformParamsDto implements PlatformParamsDto {
  const _PlatformParamsDto({this.androidLegacy, this.androidAdaptive, this.ios, this.web});
  factory _PlatformParamsDto.fromJson(Map<String, dynamic> json) => _$PlatformParamsDtoFromJson(json);

@override final  FitPaddingDto? androidLegacy;
@override final  FitPaddingDto? androidAdaptive;
@override final  FitPaddingDto? ios;
@override final  FitPaddingDto? web;

/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformParamsDtoCopyWith<_PlatformParamsDto> get copyWith => __$PlatformParamsDtoCopyWithImpl<_PlatformParamsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformParamsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformParamsDto&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'PlatformParamsDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class _$PlatformParamsDtoCopyWith<$Res> implements $PlatformParamsDtoCopyWith<$Res> {
  factory _$PlatformParamsDtoCopyWith(_PlatformParamsDto value, $Res Function(_PlatformParamsDto) _then) = __$PlatformParamsDtoCopyWithImpl;
@override @useResult
$Res call({
 FitPaddingDto? androidLegacy, FitPaddingDto? androidAdaptive, FitPaddingDto? ios, FitPaddingDto? web
});


@override $FitPaddingDtoCopyWith<$Res>? get androidLegacy;@override $FitPaddingDtoCopyWith<$Res>? get androidAdaptive;@override $FitPaddingDtoCopyWith<$Res>? get ios;@override $FitPaddingDtoCopyWith<$Res>? get web;

}
/// @nodoc
class __$PlatformParamsDtoCopyWithImpl<$Res>
    implements _$PlatformParamsDtoCopyWith<$Res> {
  __$PlatformParamsDtoCopyWithImpl(this._self, this._then);

  final _PlatformParamsDto _self;
  final $Res Function(_PlatformParamsDto) _then;

/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_PlatformParamsDto(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as FitPaddingDto?,
  ));
}

/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of PlatformParamsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingDtoCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $FitPaddingDtoCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// @nodoc
mixin _$SourceConfigDto {

 String? get foregroundAssetId; String? get backgroundAssetId; String? get backgroundColorHex;
/// Create a copy of SourceConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceConfigDtoCopyWith<SourceConfigDto> get copyWith => _$SourceConfigDtoCopyWithImpl<SourceConfigDto>(this as SourceConfigDto, _$identity);

  /// Serializes this SourceConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceConfigDto&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SourceConfigDto(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class $SourceConfigDtoCopyWith<$Res>  {
  factory $SourceConfigDtoCopyWith(SourceConfigDto value, $Res Function(SourceConfigDto) _then) = _$SourceConfigDtoCopyWithImpl;
@useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class _$SourceConfigDtoCopyWithImpl<$Res>
    implements $SourceConfigDtoCopyWith<$Res> {
  _$SourceConfigDtoCopyWithImpl(this._self, this._then);

  final SourceConfigDto _self;
  final $Res Function(SourceConfigDto) _then;

/// Create a copy of SourceConfigDto
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


/// Adds pattern-matching-related methods to [SourceConfigDto].
extension SourceConfigDtoPatterns on SourceConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _SourceConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _SourceConfigDto() when $default != null:
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
case _SourceConfigDto() when $default != null:
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
case _SourceConfigDto():
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
case _SourceConfigDto() when $default != null:
return $default(_that.foregroundAssetId,_that.backgroundAssetId,_that.backgroundColorHex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceConfigDto implements SourceConfigDto {
  const _SourceConfigDto({this.foregroundAssetId, this.backgroundAssetId, this.backgroundColorHex});
  factory _SourceConfigDto.fromJson(Map<String, dynamic> json) => _$SourceConfigDtoFromJson(json);

@override final  String? foregroundAssetId;
@override final  String? backgroundAssetId;
@override final  String? backgroundColorHex;

/// Create a copy of SourceConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceConfigDtoCopyWith<_SourceConfigDto> get copyWith => __$SourceConfigDtoCopyWithImpl<_SourceConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceConfigDto&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SourceConfigDto(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class _$SourceConfigDtoCopyWith<$Res> implements $SourceConfigDtoCopyWith<$Res> {
  factory _$SourceConfigDtoCopyWith(_SourceConfigDto value, $Res Function(_SourceConfigDto) _then) = __$SourceConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class __$SourceConfigDtoCopyWithImpl<$Res>
    implements _$SourceConfigDtoCopyWith<$Res> {
  __$SourceConfigDtoCopyWithImpl(this._self, this._then);

  final _SourceConfigDto _self;
  final $Res Function(_SourceConfigDto) _then;

/// Create a copy of SourceConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foregroundAssetId = freezed,Object? backgroundAssetId = freezed,Object? backgroundColorHex = freezed,}) {
  return _then(_SourceConfigDto(
foregroundAssetId: freezed == foregroundAssetId ? _self.foregroundAssetId : foregroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundAssetId: freezed == backgroundAssetId ? _self.backgroundAssetId : backgroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OutputArtifactsDto {

 String? get androidLegacyArtifactId; String? get androidAdaptiveForegroundArtifactId; String? get androidAdaptiveBackgroundArtifactId; String? get iosArtifactId; String? get webArtifactId;
/// Create a copy of OutputArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputArtifactsDtoCopyWith<OutputArtifactsDto> get copyWith => _$OutputArtifactsDtoCopyWithImpl<OutputArtifactsDto>(this as OutputArtifactsDto, _$identity);

  /// Serializes this OutputArtifactsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputArtifactsDto&&(identical(other.androidLegacyArtifactId, androidLegacyArtifactId) || other.androidLegacyArtifactId == androidLegacyArtifactId)&&(identical(other.androidAdaptiveForegroundArtifactId, androidAdaptiveForegroundArtifactId) || other.androidAdaptiveForegroundArtifactId == androidAdaptiveForegroundArtifactId)&&(identical(other.androidAdaptiveBackgroundArtifactId, androidAdaptiveBackgroundArtifactId) || other.androidAdaptiveBackgroundArtifactId == androidAdaptiveBackgroundArtifactId)&&(identical(other.iosArtifactId, iosArtifactId) || other.iosArtifactId == iosArtifactId)&&(identical(other.webArtifactId, webArtifactId) || other.webArtifactId == webArtifactId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacyArtifactId,androidAdaptiveForegroundArtifactId,androidAdaptiveBackgroundArtifactId,iosArtifactId,webArtifactId);

@override
String toString() {
  return 'OutputArtifactsDto(androidLegacyArtifactId: $androidLegacyArtifactId, androidAdaptiveForegroundArtifactId: $androidAdaptiveForegroundArtifactId, androidAdaptiveBackgroundArtifactId: $androidAdaptiveBackgroundArtifactId, iosArtifactId: $iosArtifactId, webArtifactId: $webArtifactId)';
}


}

/// @nodoc
abstract mixin class $OutputArtifactsDtoCopyWith<$Res>  {
  factory $OutputArtifactsDtoCopyWith(OutputArtifactsDto value, $Res Function(OutputArtifactsDto) _then) = _$OutputArtifactsDtoCopyWithImpl;
@useResult
$Res call({
 String? androidLegacyArtifactId, String? androidAdaptiveForegroundArtifactId, String? androidAdaptiveBackgroundArtifactId, String? iosArtifactId, String? webArtifactId
});




}
/// @nodoc
class _$OutputArtifactsDtoCopyWithImpl<$Res>
    implements $OutputArtifactsDtoCopyWith<$Res> {
  _$OutputArtifactsDtoCopyWithImpl(this._self, this._then);

  final OutputArtifactsDto _self;
  final $Res Function(OutputArtifactsDto) _then;

/// Create a copy of OutputArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacyArtifactId = freezed,Object? androidAdaptiveForegroundArtifactId = freezed,Object? androidAdaptiveBackgroundArtifactId = freezed,Object? iosArtifactId = freezed,Object? webArtifactId = freezed,}) {
  return _then(_self.copyWith(
androidLegacyArtifactId: freezed == androidLegacyArtifactId ? _self.androidLegacyArtifactId : androidLegacyArtifactId // ignore: cast_nullable_to_non_nullable
as String?,androidAdaptiveForegroundArtifactId: freezed == androidAdaptiveForegroundArtifactId ? _self.androidAdaptiveForegroundArtifactId : androidAdaptiveForegroundArtifactId // ignore: cast_nullable_to_non_nullable
as String?,androidAdaptiveBackgroundArtifactId: freezed == androidAdaptiveBackgroundArtifactId ? _self.androidAdaptiveBackgroundArtifactId : androidAdaptiveBackgroundArtifactId // ignore: cast_nullable_to_non_nullable
as String?,iosArtifactId: freezed == iosArtifactId ? _self.iosArtifactId : iosArtifactId // ignore: cast_nullable_to_non_nullable
as String?,webArtifactId: freezed == webArtifactId ? _self.webArtifactId : webArtifactId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutputArtifactsDto].
extension OutputArtifactsDtoPatterns on OutputArtifactsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutputArtifactsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutputArtifactsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutputArtifactsDto value)  $default,){
final _that = this;
switch (_that) {
case _OutputArtifactsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutputArtifactsDto value)?  $default,){
final _that = this;
switch (_that) {
case _OutputArtifactsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? androidLegacyArtifactId,  String? androidAdaptiveForegroundArtifactId,  String? androidAdaptiveBackgroundArtifactId,  String? iosArtifactId,  String? webArtifactId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutputArtifactsDto() when $default != null:
return $default(_that.androidLegacyArtifactId,_that.androidAdaptiveForegroundArtifactId,_that.androidAdaptiveBackgroundArtifactId,_that.iosArtifactId,_that.webArtifactId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? androidLegacyArtifactId,  String? androidAdaptiveForegroundArtifactId,  String? androidAdaptiveBackgroundArtifactId,  String? iosArtifactId,  String? webArtifactId)  $default,) {final _that = this;
switch (_that) {
case _OutputArtifactsDto():
return $default(_that.androidLegacyArtifactId,_that.androidAdaptiveForegroundArtifactId,_that.androidAdaptiveBackgroundArtifactId,_that.iosArtifactId,_that.webArtifactId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? androidLegacyArtifactId,  String? androidAdaptiveForegroundArtifactId,  String? androidAdaptiveBackgroundArtifactId,  String? iosArtifactId,  String? webArtifactId)?  $default,) {final _that = this;
switch (_that) {
case _OutputArtifactsDto() when $default != null:
return $default(_that.androidLegacyArtifactId,_that.androidAdaptiveForegroundArtifactId,_that.androidAdaptiveBackgroundArtifactId,_that.iosArtifactId,_that.webArtifactId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutputArtifactsDto implements OutputArtifactsDto {
  const _OutputArtifactsDto({this.androidLegacyArtifactId, this.androidAdaptiveForegroundArtifactId, this.androidAdaptiveBackgroundArtifactId, this.iosArtifactId, this.webArtifactId});
  factory _OutputArtifactsDto.fromJson(Map<String, dynamic> json) => _$OutputArtifactsDtoFromJson(json);

@override final  String? androidLegacyArtifactId;
@override final  String? androidAdaptiveForegroundArtifactId;
@override final  String? androidAdaptiveBackgroundArtifactId;
@override final  String? iosArtifactId;
@override final  String? webArtifactId;

/// Create a copy of OutputArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutputArtifactsDtoCopyWith<_OutputArtifactsDto> get copyWith => __$OutputArtifactsDtoCopyWithImpl<_OutputArtifactsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutputArtifactsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutputArtifactsDto&&(identical(other.androidLegacyArtifactId, androidLegacyArtifactId) || other.androidLegacyArtifactId == androidLegacyArtifactId)&&(identical(other.androidAdaptiveForegroundArtifactId, androidAdaptiveForegroundArtifactId) || other.androidAdaptiveForegroundArtifactId == androidAdaptiveForegroundArtifactId)&&(identical(other.androidAdaptiveBackgroundArtifactId, androidAdaptiveBackgroundArtifactId) || other.androidAdaptiveBackgroundArtifactId == androidAdaptiveBackgroundArtifactId)&&(identical(other.iosArtifactId, iosArtifactId) || other.iosArtifactId == iosArtifactId)&&(identical(other.webArtifactId, webArtifactId) || other.webArtifactId == webArtifactId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacyArtifactId,androidAdaptiveForegroundArtifactId,androidAdaptiveBackgroundArtifactId,iosArtifactId,webArtifactId);

@override
String toString() {
  return 'OutputArtifactsDto(androidLegacyArtifactId: $androidLegacyArtifactId, androidAdaptiveForegroundArtifactId: $androidAdaptiveForegroundArtifactId, androidAdaptiveBackgroundArtifactId: $androidAdaptiveBackgroundArtifactId, iosArtifactId: $iosArtifactId, webArtifactId: $webArtifactId)';
}


}

/// @nodoc
abstract mixin class _$OutputArtifactsDtoCopyWith<$Res> implements $OutputArtifactsDtoCopyWith<$Res> {
  factory _$OutputArtifactsDtoCopyWith(_OutputArtifactsDto value, $Res Function(_OutputArtifactsDto) _then) = __$OutputArtifactsDtoCopyWithImpl;
@override @useResult
$Res call({
 String? androidLegacyArtifactId, String? androidAdaptiveForegroundArtifactId, String? androidAdaptiveBackgroundArtifactId, String? iosArtifactId, String? webArtifactId
});




}
/// @nodoc
class __$OutputArtifactsDtoCopyWithImpl<$Res>
    implements _$OutputArtifactsDtoCopyWith<$Res> {
  __$OutputArtifactsDtoCopyWithImpl(this._self, this._then);

  final _OutputArtifactsDto _self;
  final $Res Function(_OutputArtifactsDto) _then;

/// Create a copy of OutputArtifactsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacyArtifactId = freezed,Object? androidAdaptiveForegroundArtifactId = freezed,Object? androidAdaptiveBackgroundArtifactId = freezed,Object? iosArtifactId = freezed,Object? webArtifactId = freezed,}) {
  return _then(_OutputArtifactsDto(
androidLegacyArtifactId: freezed == androidLegacyArtifactId ? _self.androidLegacyArtifactId : androidLegacyArtifactId // ignore: cast_nullable_to_non_nullable
as String?,androidAdaptiveForegroundArtifactId: freezed == androidAdaptiveForegroundArtifactId ? _self.androidAdaptiveForegroundArtifactId : androidAdaptiveForegroundArtifactId // ignore: cast_nullable_to_non_nullable
as String?,androidAdaptiveBackgroundArtifactId: freezed == androidAdaptiveBackgroundArtifactId ? _self.androidAdaptiveBackgroundArtifactId : androidAdaptiveBackgroundArtifactId // ignore: cast_nullable_to_non_nullable
as String?,iosArtifactId: freezed == iosArtifactId ? _self.iosArtifactId : iosArtifactId // ignore: cast_nullable_to_non_nullable
as String?,webArtifactId: freezed == webArtifactId ? _self.webArtifactId : webArtifactId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LaunchAssetsDto {

 String get id; String get applicationId; String get themeId; String get createdAt; String get updatedAt; SourceConfigDto? get source; PlatformParamsDto? get params; OutputArtifactsDto? get outputsArtifacts;
/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchAssetsDtoCopyWith<LaunchAssetsDto> get copyWith => _$LaunchAssetsDtoCopyWithImpl<LaunchAssetsDto>(this as LaunchAssetsDto, _$identity);

  /// Serializes this LaunchAssetsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchAssetsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.outputsArtifacts, outputsArtifacts) || other.outputsArtifacts == outputsArtifacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,createdAt,updatedAt,source,params,outputsArtifacts);

@override
String toString() {
  return 'LaunchAssetsDto(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, outputsArtifacts: $outputsArtifacts)';
}


}

/// @nodoc
abstract mixin class $LaunchAssetsDtoCopyWith<$Res>  {
  factory $LaunchAssetsDtoCopyWith(LaunchAssetsDto value, $Res Function(LaunchAssetsDto) _then) = _$LaunchAssetsDtoCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String themeId, String createdAt, String updatedAt, SourceConfigDto? source, PlatformParamsDto? params, OutputArtifactsDto? outputsArtifacts
});


$SourceConfigDtoCopyWith<$Res>? get source;$PlatformParamsDtoCopyWith<$Res>? get params;$OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts;

}
/// @nodoc
class _$LaunchAssetsDtoCopyWithImpl<$Res>
    implements $LaunchAssetsDtoCopyWith<$Res> {
  _$LaunchAssetsDtoCopyWithImpl(this._self, this._then);

  final LaunchAssetsDto _self;
  final $Res Function(LaunchAssetsDto) _then;

/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? createdAt = null,Object? updatedAt = null,Object? source = freezed,Object? params = freezed,Object? outputsArtifacts = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceConfigDto?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as PlatformParamsDto?,outputsArtifacts: freezed == outputsArtifacts ? _self.outputsArtifacts : outputsArtifacts // ignore: cast_nullable_to_non_nullable
as OutputArtifactsDto?,
  ));
}
/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceConfigDtoCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceConfigDtoCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformParamsDtoCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $PlatformParamsDtoCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts {
    if (_self.outputsArtifacts == null) {
    return null;
  }

  return $OutputArtifactsDtoCopyWith<$Res>(_self.outputsArtifacts!, (value) {
    return _then(_self.copyWith(outputsArtifacts: value));
  });
}
}


/// Adds pattern-matching-related methods to [LaunchAssetsDto].
extension LaunchAssetsDtoPatterns on LaunchAssetsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchAssetsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchAssetsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchAssetsDto value)  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchAssetsDto value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String createdAt,  String updatedAt,  SourceConfigDto? source,  PlatformParamsDto? params,  OutputArtifactsDto? outputsArtifacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchAssetsDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.outputsArtifacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  String createdAt,  String updatedAt,  SourceConfigDto? source,  PlatformParamsDto? params,  OutputArtifactsDto? outputsArtifacts)  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsDto():
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.outputsArtifacts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String themeId,  String createdAt,  String updatedAt,  SourceConfigDto? source,  PlatformParamsDto? params,  OutputArtifactsDto? outputsArtifacts)?  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsDto() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.outputsArtifacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaunchAssetsDto implements LaunchAssetsDto {
  const _LaunchAssetsDto({required this.id, required this.applicationId, required this.themeId, required this.createdAt, required this.updatedAt, this.source, this.params, this.outputsArtifacts});
  factory _LaunchAssetsDto.fromJson(Map<String, dynamic> json) => _$LaunchAssetsDtoFromJson(json);

@override final  String id;
@override final  String applicationId;
@override final  String themeId;
@override final  String createdAt;
@override final  String updatedAt;
@override final  SourceConfigDto? source;
@override final  PlatformParamsDto? params;
@override final  OutputArtifactsDto? outputsArtifacts;

/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchAssetsDtoCopyWith<_LaunchAssetsDto> get copyWith => __$LaunchAssetsDtoCopyWithImpl<_LaunchAssetsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaunchAssetsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchAssetsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.outputsArtifacts, outputsArtifacts) || other.outputsArtifacts == outputsArtifacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,createdAt,updatedAt,source,params,outputsArtifacts);

@override
String toString() {
  return 'LaunchAssetsDto(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, outputsArtifacts: $outputsArtifacts)';
}


}

/// @nodoc
abstract mixin class _$LaunchAssetsDtoCopyWith<$Res> implements $LaunchAssetsDtoCopyWith<$Res> {
  factory _$LaunchAssetsDtoCopyWith(_LaunchAssetsDto value, $Res Function(_LaunchAssetsDto) _then) = __$LaunchAssetsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String themeId, String createdAt, String updatedAt, SourceConfigDto? source, PlatformParamsDto? params, OutputArtifactsDto? outputsArtifacts
});


@override $SourceConfigDtoCopyWith<$Res>? get source;@override $PlatformParamsDtoCopyWith<$Res>? get params;@override $OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts;

}
/// @nodoc
class __$LaunchAssetsDtoCopyWithImpl<$Res>
    implements _$LaunchAssetsDtoCopyWith<$Res> {
  __$LaunchAssetsDtoCopyWithImpl(this._self, this._then);

  final _LaunchAssetsDto _self;
  final $Res Function(_LaunchAssetsDto) _then;

/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? createdAt = null,Object? updatedAt = null,Object? source = freezed,Object? params = freezed,Object? outputsArtifacts = freezed,}) {
  return _then(_LaunchAssetsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceConfigDto?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as PlatformParamsDto?,outputsArtifacts: freezed == outputsArtifacts ? _self.outputsArtifacts : outputsArtifacts // ignore: cast_nullable_to_non_nullable
as OutputArtifactsDto?,
  ));
}

/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceConfigDtoCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceConfigDtoCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformParamsDtoCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $PlatformParamsDtoCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of LaunchAssetsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts {
    if (_self.outputsArtifacts == null) {
    return null;
  }

  return $OutputArtifactsDtoCopyWith<$Res>(_self.outputsArtifacts!, (value) {
    return _then(_self.copyWith(outputsArtifacts: value));
  });
}
}


/// @nodoc
mixin _$ValidationSliceDto {

 bool get compliant; double get deltaDp; String? get message;
/// Create a copy of ValidationSliceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<ValidationSliceDto> get copyWith => _$ValidationSliceDtoCopyWithImpl<ValidationSliceDto>(this as ValidationSliceDto, _$identity);

  /// Serializes this ValidationSliceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationSliceDto&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,deltaDp,message);

@override
String toString() {
  return 'ValidationSliceDto(compliant: $compliant, deltaDp: $deltaDp, message: $message)';
}


}

/// @nodoc
abstract mixin class $ValidationSliceDtoCopyWith<$Res>  {
  factory $ValidationSliceDtoCopyWith(ValidationSliceDto value, $Res Function(ValidationSliceDto) _then) = _$ValidationSliceDtoCopyWithImpl;
@useResult
$Res call({
 bool compliant, double deltaDp, String? message
});




}
/// @nodoc
class _$ValidationSliceDtoCopyWithImpl<$Res>
    implements $ValidationSliceDtoCopyWith<$Res> {
  _$ValidationSliceDtoCopyWithImpl(this._self, this._then);

  final ValidationSliceDto _self;
  final $Res Function(ValidationSliceDto) _then;

/// Create a copy of ValidationSliceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? compliant = null,Object? deltaDp = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,deltaDp: null == deltaDp ? _self.deltaDp : deltaDp // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationSliceDto].
extension ValidationSliceDtoPatterns on ValidationSliceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationSliceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationSliceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationSliceDto value)  $default,){
final _that = this;
switch (_that) {
case _ValidationSliceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationSliceDto value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationSliceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool compliant,  double deltaDp,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationSliceDto() when $default != null:
return $default(_that.compliant,_that.deltaDp,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool compliant,  double deltaDp,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ValidationSliceDto():
return $default(_that.compliant,_that.deltaDp,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool compliant,  double deltaDp,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ValidationSliceDto() when $default != null:
return $default(_that.compliant,_that.deltaDp,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationSliceDto implements ValidationSliceDto {
  const _ValidationSliceDto({required this.compliant, required this.deltaDp, this.message});
  factory _ValidationSliceDto.fromJson(Map<String, dynamic> json) => _$ValidationSliceDtoFromJson(json);

@override final  bool compliant;
@override final  double deltaDp;
@override final  String? message;

/// Create a copy of ValidationSliceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationSliceDtoCopyWith<_ValidationSliceDto> get copyWith => __$ValidationSliceDtoCopyWithImpl<_ValidationSliceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationSliceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationSliceDto&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,deltaDp,message);

@override
String toString() {
  return 'ValidationSliceDto(compliant: $compliant, deltaDp: $deltaDp, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationSliceDtoCopyWith<$Res> implements $ValidationSliceDtoCopyWith<$Res> {
  factory _$ValidationSliceDtoCopyWith(_ValidationSliceDto value, $Res Function(_ValidationSliceDto) _then) = __$ValidationSliceDtoCopyWithImpl;
@override @useResult
$Res call({
 bool compliant, double deltaDp, String? message
});




}
/// @nodoc
class __$ValidationSliceDtoCopyWithImpl<$Res>
    implements _$ValidationSliceDtoCopyWith<$Res> {
  __$ValidationSliceDtoCopyWithImpl(this._self, this._then);

  final _ValidationSliceDto _self;
  final $Res Function(_ValidationSliceDto) _then;

/// Create a copy of ValidationSliceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? compliant = null,Object? deltaDp = null,Object? message = freezed,}) {
  return _then(_ValidationSliceDto(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,deltaDp: null == deltaDp ? _self.deltaDp : deltaDp // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ValidationReportDto {

 ValidationSliceDto? get androidLegacy; ValidationSliceDto? get androidAdaptive; ValidationSliceDto? get ios; ValidationSliceDto? get web;
/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationReportDtoCopyWith<ValidationReportDto> get copyWith => _$ValidationReportDtoCopyWithImpl<ValidationReportDto>(this as ValidationReportDto, _$identity);

  /// Serializes this ValidationReportDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationReportDto&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ValidationReportDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class $ValidationReportDtoCopyWith<$Res>  {
  factory $ValidationReportDtoCopyWith(ValidationReportDto value, $Res Function(ValidationReportDto) _then) = _$ValidationReportDtoCopyWithImpl;
@useResult
$Res call({
 ValidationSliceDto? androidLegacy, ValidationSliceDto? androidAdaptive, ValidationSliceDto? ios, ValidationSliceDto? web
});


$ValidationSliceDtoCopyWith<$Res>? get androidLegacy;$ValidationSliceDtoCopyWith<$Res>? get androidAdaptive;$ValidationSliceDtoCopyWith<$Res>? get ios;$ValidationSliceDtoCopyWith<$Res>? get web;

}
/// @nodoc
class _$ValidationReportDtoCopyWithImpl<$Res>
    implements $ValidationReportDtoCopyWith<$Res> {
  _$ValidationReportDtoCopyWithImpl(this._self, this._then);

  final ValidationReportDto _self;
  final $Res Function(ValidationReportDto) _then;

/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_self.copyWith(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,
  ));
}
/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// Adds pattern-matching-related methods to [ValidationReportDto].
extension ValidationReportDtoPatterns on ValidationReportDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationReportDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationReportDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationReportDto value)  $default,){
final _that = this;
switch (_that) {
case _ValidationReportDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationReportDto value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationReportDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ValidationSliceDto? androidLegacy,  ValidationSliceDto? androidAdaptive,  ValidationSliceDto? ios,  ValidationSliceDto? web)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationReportDto() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ValidationSliceDto? androidLegacy,  ValidationSliceDto? androidAdaptive,  ValidationSliceDto? ios,  ValidationSliceDto? web)  $default,) {final _that = this;
switch (_that) {
case _ValidationReportDto():
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ValidationSliceDto? androidLegacy,  ValidationSliceDto? androidAdaptive,  ValidationSliceDto? ios,  ValidationSliceDto? web)?  $default,) {final _that = this;
switch (_that) {
case _ValidationReportDto() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationReportDto implements ValidationReportDto {
  const _ValidationReportDto({this.androidLegacy, this.androidAdaptive, this.ios, this.web});
  factory _ValidationReportDto.fromJson(Map<String, dynamic> json) => _$ValidationReportDtoFromJson(json);

@override final  ValidationSliceDto? androidLegacy;
@override final  ValidationSliceDto? androidAdaptive;
@override final  ValidationSliceDto? ios;
@override final  ValidationSliceDto? web;

/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationReportDtoCopyWith<_ValidationReportDto> get copyWith => __$ValidationReportDtoCopyWithImpl<_ValidationReportDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationReportDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationReportDto&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ValidationReportDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class _$ValidationReportDtoCopyWith<$Res> implements $ValidationReportDtoCopyWith<$Res> {
  factory _$ValidationReportDtoCopyWith(_ValidationReportDto value, $Res Function(_ValidationReportDto) _then) = __$ValidationReportDtoCopyWithImpl;
@override @useResult
$Res call({
 ValidationSliceDto? androidLegacy, ValidationSliceDto? androidAdaptive, ValidationSliceDto? ios, ValidationSliceDto? web
});


@override $ValidationSliceDtoCopyWith<$Res>? get androidLegacy;@override $ValidationSliceDtoCopyWith<$Res>? get androidAdaptive;@override $ValidationSliceDtoCopyWith<$Res>? get ios;@override $ValidationSliceDtoCopyWith<$Res>? get web;

}
/// @nodoc
class __$ValidationReportDtoCopyWithImpl<$Res>
    implements _$ValidationReportDtoCopyWith<$Res> {
  __$ValidationReportDtoCopyWithImpl(this._self, this._then);

  final _ValidationReportDto _self;
  final $Res Function(_ValidationReportDto) _then;

/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_ValidationReportDto(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as ValidationSliceDto?,
  ));
}

/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ValidationReportDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceDtoCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $ValidationSliceDtoCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// @nodoc
mixin _$LaunchAssetsEnvelopeDto {

 LaunchAssetsDto get entity; Map<String, String>? get urls; ValidationReportDto? get validation;
/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchAssetsEnvelopeDtoCopyWith<LaunchAssetsEnvelopeDto> get copyWith => _$LaunchAssetsEnvelopeDtoCopyWithImpl<LaunchAssetsEnvelopeDto>(this as LaunchAssetsEnvelopeDto, _$identity);

  /// Serializes this LaunchAssetsEnvelopeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchAssetsEnvelopeDto&&(identical(other.entity, entity) || other.entity == entity)&&const DeepCollectionEquality().equals(other.urls, urls)&&(identical(other.validation, validation) || other.validation == validation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entity,const DeepCollectionEquality().hash(urls),validation);

@override
String toString() {
  return 'LaunchAssetsEnvelopeDto(entity: $entity, urls: $urls, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $LaunchAssetsEnvelopeDtoCopyWith<$Res>  {
  factory $LaunchAssetsEnvelopeDtoCopyWith(LaunchAssetsEnvelopeDto value, $Res Function(LaunchAssetsEnvelopeDto) _then) = _$LaunchAssetsEnvelopeDtoCopyWithImpl;
@useResult
$Res call({
 LaunchAssetsDto entity, Map<String, String>? urls, ValidationReportDto? validation
});


$LaunchAssetsDtoCopyWith<$Res> get entity;$ValidationReportDtoCopyWith<$Res>? get validation;

}
/// @nodoc
class _$LaunchAssetsEnvelopeDtoCopyWithImpl<$Res>
    implements $LaunchAssetsEnvelopeDtoCopyWith<$Res> {
  _$LaunchAssetsEnvelopeDtoCopyWithImpl(this._self, this._then);

  final LaunchAssetsEnvelopeDto _self;
  final $Res Function(LaunchAssetsEnvelopeDto) _then;

/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entity = null,Object? urls = freezed,Object? validation = freezed,}) {
  return _then(_self.copyWith(
entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as LaunchAssetsDto,urls: freezed == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationReportDto?,
  ));
}
/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchAssetsDtoCopyWith<$Res> get entity {
  
  return $LaunchAssetsDtoCopyWith<$Res>(_self.entity, (value) {
    return _then(_self.copyWith(entity: value));
  });
}/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationReportDtoCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationReportDtoCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// Adds pattern-matching-related methods to [LaunchAssetsEnvelopeDto].
extension LaunchAssetsEnvelopeDtoPatterns on LaunchAssetsEnvelopeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchAssetsEnvelopeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchAssetsEnvelopeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchAssetsEnvelopeDto value)  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsEnvelopeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchAssetsEnvelopeDto value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsEnvelopeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LaunchAssetsDto entity,  Map<String, String>? urls,  ValidationReportDto? validation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchAssetsEnvelopeDto() when $default != null:
return $default(_that.entity,_that.urls,_that.validation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LaunchAssetsDto entity,  Map<String, String>? urls,  ValidationReportDto? validation)  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsEnvelopeDto():
return $default(_that.entity,_that.urls,_that.validation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LaunchAssetsDto entity,  Map<String, String>? urls,  ValidationReportDto? validation)?  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsEnvelopeDto() when $default != null:
return $default(_that.entity,_that.urls,_that.validation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaunchAssetsEnvelopeDto implements LaunchAssetsEnvelopeDto {
  const _LaunchAssetsEnvelopeDto({required this.entity, final  Map<String, String>? urls, this.validation}): _urls = urls;
  factory _LaunchAssetsEnvelopeDto.fromJson(Map<String, dynamic> json) => _$LaunchAssetsEnvelopeDtoFromJson(json);

@override final  LaunchAssetsDto entity;
 final  Map<String, String>? _urls;
@override Map<String, String>? get urls {
  final value = _urls;
  if (value == null) return null;
  if (_urls is EqualUnmodifiableMapView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  ValidationReportDto? validation;

/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchAssetsEnvelopeDtoCopyWith<_LaunchAssetsEnvelopeDto> get copyWith => __$LaunchAssetsEnvelopeDtoCopyWithImpl<_LaunchAssetsEnvelopeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaunchAssetsEnvelopeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchAssetsEnvelopeDto&&(identical(other.entity, entity) || other.entity == entity)&&const DeepCollectionEquality().equals(other._urls, _urls)&&(identical(other.validation, validation) || other.validation == validation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entity,const DeepCollectionEquality().hash(_urls),validation);

@override
String toString() {
  return 'LaunchAssetsEnvelopeDto(entity: $entity, urls: $urls, validation: $validation)';
}


}

/// @nodoc
abstract mixin class _$LaunchAssetsEnvelopeDtoCopyWith<$Res> implements $LaunchAssetsEnvelopeDtoCopyWith<$Res> {
  factory _$LaunchAssetsEnvelopeDtoCopyWith(_LaunchAssetsEnvelopeDto value, $Res Function(_LaunchAssetsEnvelopeDto) _then) = __$LaunchAssetsEnvelopeDtoCopyWithImpl;
@override @useResult
$Res call({
 LaunchAssetsDto entity, Map<String, String>? urls, ValidationReportDto? validation
});


@override $LaunchAssetsDtoCopyWith<$Res> get entity;@override $ValidationReportDtoCopyWith<$Res>? get validation;

}
/// @nodoc
class __$LaunchAssetsEnvelopeDtoCopyWithImpl<$Res>
    implements _$LaunchAssetsEnvelopeDtoCopyWith<$Res> {
  __$LaunchAssetsEnvelopeDtoCopyWithImpl(this._self, this._then);

  final _LaunchAssetsEnvelopeDto _self;
  final $Res Function(_LaunchAssetsEnvelopeDto) _then;

/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entity = null,Object? urls = freezed,Object? validation = freezed,}) {
  return _then(_LaunchAssetsEnvelopeDto(
entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as LaunchAssetsDto,urls: freezed == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationReportDto?,
  ));
}

/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchAssetsDtoCopyWith<$Res> get entity {
  
  return $LaunchAssetsDtoCopyWith<$Res>(_self.entity, (value) {
    return _then(_self.copyWith(entity: value));
  });
}/// Create a copy of LaunchAssetsEnvelopeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationReportDtoCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationReportDtoCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}

// dart format on
