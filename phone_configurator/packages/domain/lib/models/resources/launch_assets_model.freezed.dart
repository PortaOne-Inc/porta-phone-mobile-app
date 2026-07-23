// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_assets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FitPaddingModel {

 FitModel? get fit; double? get paddingDp;
/// Create a copy of FitPaddingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<FitPaddingModel> get copyWith => _$FitPaddingModelCopyWithImpl<FitPaddingModel>(this as FitPaddingModel, _$identity);

  /// Serializes this FitPaddingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitPaddingModel&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.paddingDp, paddingDp) || other.paddingDp == paddingDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,paddingDp);

@override
String toString() {
  return 'FitPaddingModel(fit: $fit, paddingDp: $paddingDp)';
}


}

/// @nodoc
abstract mixin class $FitPaddingModelCopyWith<$Res>  {
  factory $FitPaddingModelCopyWith(FitPaddingModel value, $Res Function(FitPaddingModel) _then) = _$FitPaddingModelCopyWithImpl;
@useResult
$Res call({
 FitModel? fit, double? paddingDp
});




}
/// @nodoc
class _$FitPaddingModelCopyWithImpl<$Res>
    implements $FitPaddingModelCopyWith<$Res> {
  _$FitPaddingModelCopyWithImpl(this._self, this._then);

  final FitPaddingModel _self;
  final $Res Function(FitPaddingModel) _then;

/// Create a copy of FitPaddingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fit = freezed,Object? paddingDp = freezed,}) {
  return _then(_self.copyWith(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitModel?,paddingDp: freezed == paddingDp ? _self.paddingDp : paddingDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FitPaddingModel].
extension FitPaddingModelPatterns on FitPaddingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FitPaddingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FitPaddingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FitPaddingModel value)  $default,){
final _that = this;
switch (_that) {
case _FitPaddingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FitPaddingModel value)?  $default,){
final _that = this;
switch (_that) {
case _FitPaddingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FitModel? fit,  double? paddingDp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FitPaddingModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FitModel? fit,  double? paddingDp)  $default,) {final _that = this;
switch (_that) {
case _FitPaddingModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FitModel? fit,  double? paddingDp)?  $default,) {final _that = this;
switch (_that) {
case _FitPaddingModel() when $default != null:
return $default(_that.fit,_that.paddingDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FitPaddingModel implements FitPaddingModel {
  const _FitPaddingModel({this.fit, this.paddingDp});
  factory _FitPaddingModel.fromJson(Map<String, dynamic> json) => _$FitPaddingModelFromJson(json);

@override final  FitModel? fit;
@override final  double? paddingDp;

/// Create a copy of FitPaddingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FitPaddingModelCopyWith<_FitPaddingModel> get copyWith => __$FitPaddingModelCopyWithImpl<_FitPaddingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FitPaddingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FitPaddingModel&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.paddingDp, paddingDp) || other.paddingDp == paddingDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fit,paddingDp);

@override
String toString() {
  return 'FitPaddingModel(fit: $fit, paddingDp: $paddingDp)';
}


}

/// @nodoc
abstract mixin class _$FitPaddingModelCopyWith<$Res> implements $FitPaddingModelCopyWith<$Res> {
  factory _$FitPaddingModelCopyWith(_FitPaddingModel value, $Res Function(_FitPaddingModel) _then) = __$FitPaddingModelCopyWithImpl;
@override @useResult
$Res call({
 FitModel? fit, double? paddingDp
});




}
/// @nodoc
class __$FitPaddingModelCopyWithImpl<$Res>
    implements _$FitPaddingModelCopyWith<$Res> {
  __$FitPaddingModelCopyWithImpl(this._self, this._then);

  final _FitPaddingModel _self;
  final $Res Function(_FitPaddingModel) _then;

/// Create a copy of FitPaddingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fit = freezed,Object? paddingDp = freezed,}) {
  return _then(_FitPaddingModel(
fit: freezed == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as FitModel?,paddingDp: freezed == paddingDp ? _self.paddingDp : paddingDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$PlatformParamsModel {

 FitPaddingModel? get androidLegacy; FitPaddingModel? get androidAdaptive; FitPaddingModel? get ios; FitPaddingModel? get web;
/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformParamsModelCopyWith<PlatformParamsModel> get copyWith => _$PlatformParamsModelCopyWithImpl<PlatformParamsModel>(this as PlatformParamsModel, _$identity);

  /// Serializes this PlatformParamsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformParamsModel&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'PlatformParamsModel(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class $PlatformParamsModelCopyWith<$Res>  {
  factory $PlatformParamsModelCopyWith(PlatformParamsModel value, $Res Function(PlatformParamsModel) _then) = _$PlatformParamsModelCopyWithImpl;
@useResult
$Res call({
 FitPaddingModel? androidLegacy, FitPaddingModel? androidAdaptive, FitPaddingModel? ios, FitPaddingModel? web
});


$FitPaddingModelCopyWith<$Res>? get androidLegacy;$FitPaddingModelCopyWith<$Res>? get androidAdaptive;$FitPaddingModelCopyWith<$Res>? get ios;$FitPaddingModelCopyWith<$Res>? get web;

}
/// @nodoc
class _$PlatformParamsModelCopyWithImpl<$Res>
    implements $PlatformParamsModelCopyWith<$Res> {
  _$PlatformParamsModelCopyWithImpl(this._self, this._then);

  final PlatformParamsModel _self;
  final $Res Function(PlatformParamsModel) _then;

/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_self.copyWith(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,
  ));
}
/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlatformParamsModel].
extension PlatformParamsModelPatterns on PlatformParamsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformParamsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformParamsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformParamsModel value)  $default,){
final _that = this;
switch (_that) {
case _PlatformParamsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformParamsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformParamsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FitPaddingModel? androidLegacy,  FitPaddingModel? androidAdaptive,  FitPaddingModel? ios,  FitPaddingModel? web)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformParamsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FitPaddingModel? androidLegacy,  FitPaddingModel? androidAdaptive,  FitPaddingModel? ios,  FitPaddingModel? web)  $default,) {final _that = this;
switch (_that) {
case _PlatformParamsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FitPaddingModel? androidLegacy,  FitPaddingModel? androidAdaptive,  FitPaddingModel? ios,  FitPaddingModel? web)?  $default,) {final _that = this;
switch (_that) {
case _PlatformParamsModel() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformParamsModel implements PlatformParamsModel {
  const _PlatformParamsModel({this.androidLegacy, this.androidAdaptive, this.ios, this.web});
  factory _PlatformParamsModel.fromJson(Map<String, dynamic> json) => _$PlatformParamsModelFromJson(json);

@override final  FitPaddingModel? androidLegacy;
@override final  FitPaddingModel? androidAdaptive;
@override final  FitPaddingModel? ios;
@override final  FitPaddingModel? web;

/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformParamsModelCopyWith<_PlatformParamsModel> get copyWith => __$PlatformParamsModelCopyWithImpl<_PlatformParamsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformParamsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformParamsModel&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'PlatformParamsModel(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class _$PlatformParamsModelCopyWith<$Res> implements $PlatformParamsModelCopyWith<$Res> {
  factory _$PlatformParamsModelCopyWith(_PlatformParamsModel value, $Res Function(_PlatformParamsModel) _then) = __$PlatformParamsModelCopyWithImpl;
@override @useResult
$Res call({
 FitPaddingModel? androidLegacy, FitPaddingModel? androidAdaptive, FitPaddingModel? ios, FitPaddingModel? web
});


@override $FitPaddingModelCopyWith<$Res>? get androidLegacy;@override $FitPaddingModelCopyWith<$Res>? get androidAdaptive;@override $FitPaddingModelCopyWith<$Res>? get ios;@override $FitPaddingModelCopyWith<$Res>? get web;

}
/// @nodoc
class __$PlatformParamsModelCopyWithImpl<$Res>
    implements _$PlatformParamsModelCopyWith<$Res> {
  __$PlatformParamsModelCopyWithImpl(this._self, this._then);

  final _PlatformParamsModel _self;
  final $Res Function(_PlatformParamsModel) _then;

/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_PlatformParamsModel(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as FitPaddingModel?,
  ));
}

/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of PlatformParamsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FitPaddingModelCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $FitPaddingModelCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// @nodoc
mixin _$SourceConfigModel {

 String? get foregroundAssetId; String? get backgroundAssetId; String? get backgroundColorHex;
/// Create a copy of SourceConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceConfigModelCopyWith<SourceConfigModel> get copyWith => _$SourceConfigModelCopyWithImpl<SourceConfigModel>(this as SourceConfigModel, _$identity);

  /// Serializes this SourceConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceConfigModel&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SourceConfigModel(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class $SourceConfigModelCopyWith<$Res>  {
  factory $SourceConfigModelCopyWith(SourceConfigModel value, $Res Function(SourceConfigModel) _then) = _$SourceConfigModelCopyWithImpl;
@useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class _$SourceConfigModelCopyWithImpl<$Res>
    implements $SourceConfigModelCopyWith<$Res> {
  _$SourceConfigModelCopyWithImpl(this._self, this._then);

  final SourceConfigModel _self;
  final $Res Function(SourceConfigModel) _then;

/// Create a copy of SourceConfigModel
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


/// Adds pattern-matching-related methods to [SourceConfigModel].
extension SourceConfigModelPatterns on SourceConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _SourceConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _SourceConfigModel() when $default != null:
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
case _SourceConfigModel() when $default != null:
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
case _SourceConfigModel():
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
case _SourceConfigModel() when $default != null:
return $default(_that.foregroundAssetId,_that.backgroundAssetId,_that.backgroundColorHex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceConfigModel implements SourceConfigModel {
  const _SourceConfigModel({this.foregroundAssetId, this.backgroundAssetId, this.backgroundColorHex});
  factory _SourceConfigModel.fromJson(Map<String, dynamic> json) => _$SourceConfigModelFromJson(json);

@override final  String? foregroundAssetId;
@override final  String? backgroundAssetId;
@override final  String? backgroundColorHex;

/// Create a copy of SourceConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceConfigModelCopyWith<_SourceConfigModel> get copyWith => __$SourceConfigModelCopyWithImpl<_SourceConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceConfigModel&&(identical(other.foregroundAssetId, foregroundAssetId) || other.foregroundAssetId == foregroundAssetId)&&(identical(other.backgroundAssetId, backgroundAssetId) || other.backgroundAssetId == backgroundAssetId)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foregroundAssetId,backgroundAssetId,backgroundColorHex);

@override
String toString() {
  return 'SourceConfigModel(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
}


}

/// @nodoc
abstract mixin class _$SourceConfigModelCopyWith<$Res> implements $SourceConfigModelCopyWith<$Res> {
  factory _$SourceConfigModelCopyWith(_SourceConfigModel value, $Res Function(_SourceConfigModel) _then) = __$SourceConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String? foregroundAssetId, String? backgroundAssetId, String? backgroundColorHex
});




}
/// @nodoc
class __$SourceConfigModelCopyWithImpl<$Res>
    implements _$SourceConfigModelCopyWith<$Res> {
  __$SourceConfigModelCopyWithImpl(this._self, this._then);

  final _SourceConfigModel _self;
  final $Res Function(_SourceConfigModel) _then;

/// Create a copy of SourceConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foregroundAssetId = freezed,Object? backgroundAssetId = freezed,Object? backgroundColorHex = freezed,}) {
  return _then(_SourceConfigModel(
foregroundAssetId: freezed == foregroundAssetId ? _self.foregroundAssetId : foregroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundAssetId: freezed == backgroundAssetId ? _self.backgroundAssetId : backgroundAssetId // ignore: cast_nullable_to_non_nullable
as String?,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OutputArtifactsModel {

 String? get androidLegacyArtifactId; String? get androidAdaptiveForegroundArtifactId; String? get androidAdaptiveBackgroundArtifactId; String? get iosArtifactId; String? get webArtifactId;
/// Create a copy of OutputArtifactsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputArtifactsModelCopyWith<OutputArtifactsModel> get copyWith => _$OutputArtifactsModelCopyWithImpl<OutputArtifactsModel>(this as OutputArtifactsModel, _$identity);

  /// Serializes this OutputArtifactsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputArtifactsModel&&(identical(other.androidLegacyArtifactId, androidLegacyArtifactId) || other.androidLegacyArtifactId == androidLegacyArtifactId)&&(identical(other.androidAdaptiveForegroundArtifactId, androidAdaptiveForegroundArtifactId) || other.androidAdaptiveForegroundArtifactId == androidAdaptiveForegroundArtifactId)&&(identical(other.androidAdaptiveBackgroundArtifactId, androidAdaptiveBackgroundArtifactId) || other.androidAdaptiveBackgroundArtifactId == androidAdaptiveBackgroundArtifactId)&&(identical(other.iosArtifactId, iosArtifactId) || other.iosArtifactId == iosArtifactId)&&(identical(other.webArtifactId, webArtifactId) || other.webArtifactId == webArtifactId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacyArtifactId,androidAdaptiveForegroundArtifactId,androidAdaptiveBackgroundArtifactId,iosArtifactId,webArtifactId);

@override
String toString() {
  return 'OutputArtifactsModel(androidLegacyArtifactId: $androidLegacyArtifactId, androidAdaptiveForegroundArtifactId: $androidAdaptiveForegroundArtifactId, androidAdaptiveBackgroundArtifactId: $androidAdaptiveBackgroundArtifactId, iosArtifactId: $iosArtifactId, webArtifactId: $webArtifactId)';
}


}

/// @nodoc
abstract mixin class $OutputArtifactsModelCopyWith<$Res>  {
  factory $OutputArtifactsModelCopyWith(OutputArtifactsModel value, $Res Function(OutputArtifactsModel) _then) = _$OutputArtifactsModelCopyWithImpl;
@useResult
$Res call({
 String? androidLegacyArtifactId, String? androidAdaptiveForegroundArtifactId, String? androidAdaptiveBackgroundArtifactId, String? iosArtifactId, String? webArtifactId
});




}
/// @nodoc
class _$OutputArtifactsModelCopyWithImpl<$Res>
    implements $OutputArtifactsModelCopyWith<$Res> {
  _$OutputArtifactsModelCopyWithImpl(this._self, this._then);

  final OutputArtifactsModel _self;
  final $Res Function(OutputArtifactsModel) _then;

/// Create a copy of OutputArtifactsModel
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


/// Adds pattern-matching-related methods to [OutputArtifactsModel].
extension OutputArtifactsModelPatterns on OutputArtifactsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutputArtifactsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutputArtifactsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutputArtifactsModel value)  $default,){
final _that = this;
switch (_that) {
case _OutputArtifactsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutputArtifactsModel value)?  $default,){
final _that = this;
switch (_that) {
case _OutputArtifactsModel() when $default != null:
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
case _OutputArtifactsModel() when $default != null:
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
case _OutputArtifactsModel():
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
case _OutputArtifactsModel() when $default != null:
return $default(_that.androidLegacyArtifactId,_that.androidAdaptiveForegroundArtifactId,_that.androidAdaptiveBackgroundArtifactId,_that.iosArtifactId,_that.webArtifactId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutputArtifactsModel implements OutputArtifactsModel {
  const _OutputArtifactsModel({this.androidLegacyArtifactId, this.androidAdaptiveForegroundArtifactId, this.androidAdaptiveBackgroundArtifactId, this.iosArtifactId, this.webArtifactId});
  factory _OutputArtifactsModel.fromJson(Map<String, dynamic> json) => _$OutputArtifactsModelFromJson(json);

@override final  String? androidLegacyArtifactId;
@override final  String? androidAdaptiveForegroundArtifactId;
@override final  String? androidAdaptiveBackgroundArtifactId;
@override final  String? iosArtifactId;
@override final  String? webArtifactId;

/// Create a copy of OutputArtifactsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutputArtifactsModelCopyWith<_OutputArtifactsModel> get copyWith => __$OutputArtifactsModelCopyWithImpl<_OutputArtifactsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutputArtifactsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutputArtifactsModel&&(identical(other.androidLegacyArtifactId, androidLegacyArtifactId) || other.androidLegacyArtifactId == androidLegacyArtifactId)&&(identical(other.androidAdaptiveForegroundArtifactId, androidAdaptiveForegroundArtifactId) || other.androidAdaptiveForegroundArtifactId == androidAdaptiveForegroundArtifactId)&&(identical(other.androidAdaptiveBackgroundArtifactId, androidAdaptiveBackgroundArtifactId) || other.androidAdaptiveBackgroundArtifactId == androidAdaptiveBackgroundArtifactId)&&(identical(other.iosArtifactId, iosArtifactId) || other.iosArtifactId == iosArtifactId)&&(identical(other.webArtifactId, webArtifactId) || other.webArtifactId == webArtifactId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacyArtifactId,androidAdaptiveForegroundArtifactId,androidAdaptiveBackgroundArtifactId,iosArtifactId,webArtifactId);

@override
String toString() {
  return 'OutputArtifactsModel(androidLegacyArtifactId: $androidLegacyArtifactId, androidAdaptiveForegroundArtifactId: $androidAdaptiveForegroundArtifactId, androidAdaptiveBackgroundArtifactId: $androidAdaptiveBackgroundArtifactId, iosArtifactId: $iosArtifactId, webArtifactId: $webArtifactId)';
}


}

/// @nodoc
abstract mixin class _$OutputArtifactsModelCopyWith<$Res> implements $OutputArtifactsModelCopyWith<$Res> {
  factory _$OutputArtifactsModelCopyWith(_OutputArtifactsModel value, $Res Function(_OutputArtifactsModel) _then) = __$OutputArtifactsModelCopyWithImpl;
@override @useResult
$Res call({
 String? androidLegacyArtifactId, String? androidAdaptiveForegroundArtifactId, String? androidAdaptiveBackgroundArtifactId, String? iosArtifactId, String? webArtifactId
});




}
/// @nodoc
class __$OutputArtifactsModelCopyWithImpl<$Res>
    implements _$OutputArtifactsModelCopyWith<$Res> {
  __$OutputArtifactsModelCopyWithImpl(this._self, this._then);

  final _OutputArtifactsModel _self;
  final $Res Function(_OutputArtifactsModel) _then;

/// Create a copy of OutputArtifactsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacyArtifactId = freezed,Object? androidAdaptiveForegroundArtifactId = freezed,Object? androidAdaptiveBackgroundArtifactId = freezed,Object? iosArtifactId = freezed,Object? webArtifactId = freezed,}) {
  return _then(_OutputArtifactsModel(
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
mixin _$LaunchAssetsModel {

 String get id; String get applicationId; String get themeId; DateTime get createdAt; DateTime get updatedAt; SourceConfigModel? get source; PlatformParamsModel? get params; OutputArtifactsModel? get outputsArtifacts;
/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchAssetsModelCopyWith<LaunchAssetsModel> get copyWith => _$LaunchAssetsModelCopyWithImpl<LaunchAssetsModel>(this as LaunchAssetsModel, _$identity);

  /// Serializes this LaunchAssetsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchAssetsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.outputsArtifacts, outputsArtifacts) || other.outputsArtifacts == outputsArtifacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,createdAt,updatedAt,source,params,outputsArtifacts);

@override
String toString() {
  return 'LaunchAssetsModel(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, outputsArtifacts: $outputsArtifacts)';
}


}

/// @nodoc
abstract mixin class $LaunchAssetsModelCopyWith<$Res>  {
  factory $LaunchAssetsModelCopyWith(LaunchAssetsModel value, $Res Function(LaunchAssetsModel) _then) = _$LaunchAssetsModelCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String themeId, DateTime createdAt, DateTime updatedAt, SourceConfigModel? source, PlatformParamsModel? params, OutputArtifactsModel? outputsArtifacts
});


$SourceConfigModelCopyWith<$Res>? get source;$PlatformParamsModelCopyWith<$Res>? get params;$OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts;

}
/// @nodoc
class _$LaunchAssetsModelCopyWithImpl<$Res>
    implements $LaunchAssetsModelCopyWith<$Res> {
  _$LaunchAssetsModelCopyWithImpl(this._self, this._then);

  final LaunchAssetsModel _self;
  final $Res Function(LaunchAssetsModel) _then;

/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? createdAt = null,Object? updatedAt = null,Object? source = freezed,Object? params = freezed,Object? outputsArtifacts = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceConfigModel?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as PlatformParamsModel?,outputsArtifacts: freezed == outputsArtifacts ? _self.outputsArtifacts : outputsArtifacts // ignore: cast_nullable_to_non_nullable
as OutputArtifactsModel?,
  ));
}
/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceConfigModelCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceConfigModelCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformParamsModelCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $PlatformParamsModelCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts {
    if (_self.outputsArtifacts == null) {
    return null;
  }

  return $OutputArtifactsModelCopyWith<$Res>(_self.outputsArtifacts!, (value) {
    return _then(_self.copyWith(outputsArtifacts: value));
  });
}
}


/// Adds pattern-matching-related methods to [LaunchAssetsModel].
extension LaunchAssetsModelPatterns on LaunchAssetsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchAssetsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchAssetsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchAssetsModel value)  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchAssetsModel value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  DateTime createdAt,  DateTime updatedAt,  SourceConfigModel? source,  PlatformParamsModel? params,  OutputArtifactsModel? outputsArtifacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchAssetsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String themeId,  DateTime createdAt,  DateTime updatedAt,  SourceConfigModel? source,  PlatformParamsModel? params,  OutputArtifactsModel? outputsArtifacts)  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String themeId,  DateTime createdAt,  DateTime updatedAt,  SourceConfigModel? source,  PlatformParamsModel? params,  OutputArtifactsModel? outputsArtifacts)?  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.themeId,_that.createdAt,_that.updatedAt,_that.source,_that.params,_that.outputsArtifacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaunchAssetsModel implements LaunchAssetsModel {
  const _LaunchAssetsModel({required this.id, required this.applicationId, required this.themeId, required this.createdAt, required this.updatedAt, this.source, this.params, this.outputsArtifacts});
  factory _LaunchAssetsModel.fromJson(Map<String, dynamic> json) => _$LaunchAssetsModelFromJson(json);

@override final  String id;
@override final  String applicationId;
@override final  String themeId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  SourceConfigModel? source;
@override final  PlatformParamsModel? params;
@override final  OutputArtifactsModel? outputsArtifacts;

/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchAssetsModelCopyWith<_LaunchAssetsModel> get copyWith => __$LaunchAssetsModelCopyWithImpl<_LaunchAssetsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaunchAssetsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchAssetsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.source, source) || other.source == source)&&(identical(other.params, params) || other.params == params)&&(identical(other.outputsArtifacts, outputsArtifacts) || other.outputsArtifacts == outputsArtifacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,themeId,createdAt,updatedAt,source,params,outputsArtifacts);

@override
String toString() {
  return 'LaunchAssetsModel(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, outputsArtifacts: $outputsArtifacts)';
}


}

/// @nodoc
abstract mixin class _$LaunchAssetsModelCopyWith<$Res> implements $LaunchAssetsModelCopyWith<$Res> {
  factory _$LaunchAssetsModelCopyWith(_LaunchAssetsModel value, $Res Function(_LaunchAssetsModel) _then) = __$LaunchAssetsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String themeId, DateTime createdAt, DateTime updatedAt, SourceConfigModel? source, PlatformParamsModel? params, OutputArtifactsModel? outputsArtifacts
});


@override $SourceConfigModelCopyWith<$Res>? get source;@override $PlatformParamsModelCopyWith<$Res>? get params;@override $OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts;

}
/// @nodoc
class __$LaunchAssetsModelCopyWithImpl<$Res>
    implements _$LaunchAssetsModelCopyWith<$Res> {
  __$LaunchAssetsModelCopyWithImpl(this._self, this._then);

  final _LaunchAssetsModel _self;
  final $Res Function(_LaunchAssetsModel) _then;

/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? themeId = null,Object? createdAt = null,Object? updatedAt = null,Object? source = freezed,Object? params = freezed,Object? outputsArtifacts = freezed,}) {
  return _then(_LaunchAssetsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceConfigModel?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as PlatformParamsModel?,outputsArtifacts: freezed == outputsArtifacts ? _self.outputsArtifacts : outputsArtifacts // ignore: cast_nullable_to_non_nullable
as OutputArtifactsModel?,
  ));
}

/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceConfigModelCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceConfigModelCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformParamsModelCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $PlatformParamsModelCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of LaunchAssetsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts {
    if (_self.outputsArtifacts == null) {
    return null;
  }

  return $OutputArtifactsModelCopyWith<$Res>(_self.outputsArtifacts!, (value) {
    return _then(_self.copyWith(outputsArtifacts: value));
  });
}
}


/// @nodoc
mixin _$ValidationSlice {

 bool get compliant; double get deltaDp; String? get message;
/// Create a copy of ValidationSlice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<ValidationSlice> get copyWith => _$ValidationSliceCopyWithImpl<ValidationSlice>(this as ValidationSlice, _$identity);

  /// Serializes this ValidationSlice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationSlice&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,deltaDp,message);

@override
String toString() {
  return 'ValidationSlice(compliant: $compliant, deltaDp: $deltaDp, message: $message)';
}


}

/// @nodoc
abstract mixin class $ValidationSliceCopyWith<$Res>  {
  factory $ValidationSliceCopyWith(ValidationSlice value, $Res Function(ValidationSlice) _then) = _$ValidationSliceCopyWithImpl;
@useResult
$Res call({
 bool compliant, double deltaDp, String? message
});




}
/// @nodoc
class _$ValidationSliceCopyWithImpl<$Res>
    implements $ValidationSliceCopyWith<$Res> {
  _$ValidationSliceCopyWithImpl(this._self, this._then);

  final ValidationSlice _self;
  final $Res Function(ValidationSlice) _then;

/// Create a copy of ValidationSlice
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


/// Adds pattern-matching-related methods to [ValidationSlice].
extension ValidationSlicePatterns on ValidationSlice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationSlice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationSlice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationSlice value)  $default,){
final _that = this;
switch (_that) {
case _ValidationSlice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationSlice value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationSlice() when $default != null:
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
case _ValidationSlice() when $default != null:
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
case _ValidationSlice():
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
case _ValidationSlice() when $default != null:
return $default(_that.compliant,_that.deltaDp,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationSlice implements ValidationSlice {
  const _ValidationSlice({required this.compliant, required this.deltaDp, this.message});
  factory _ValidationSlice.fromJson(Map<String, dynamic> json) => _$ValidationSliceFromJson(json);

@override final  bool compliant;
@override final  double deltaDp;
@override final  String? message;

/// Create a copy of ValidationSlice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationSliceCopyWith<_ValidationSlice> get copyWith => __$ValidationSliceCopyWithImpl<_ValidationSlice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationSliceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationSlice&&(identical(other.compliant, compliant) || other.compliant == compliant)&&(identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,compliant,deltaDp,message);

@override
String toString() {
  return 'ValidationSlice(compliant: $compliant, deltaDp: $deltaDp, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ValidationSliceCopyWith<$Res> implements $ValidationSliceCopyWith<$Res> {
  factory _$ValidationSliceCopyWith(_ValidationSlice value, $Res Function(_ValidationSlice) _then) = __$ValidationSliceCopyWithImpl;
@override @useResult
$Res call({
 bool compliant, double deltaDp, String? message
});




}
/// @nodoc
class __$ValidationSliceCopyWithImpl<$Res>
    implements _$ValidationSliceCopyWith<$Res> {
  __$ValidationSliceCopyWithImpl(this._self, this._then);

  final _ValidationSlice _self;
  final $Res Function(_ValidationSlice) _then;

/// Create a copy of ValidationSlice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? compliant = null,Object? deltaDp = null,Object? message = freezed,}) {
  return _then(_ValidationSlice(
compliant: null == compliant ? _self.compliant : compliant // ignore: cast_nullable_to_non_nullable
as bool,deltaDp: null == deltaDp ? _self.deltaDp : deltaDp // ignore: cast_nullable_to_non_nullable
as double,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ValidationReport {

 ValidationSlice? get androidLegacy; ValidationSlice? get androidAdaptive; ValidationSlice? get ios; ValidationSlice? get web;
/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationReportCopyWith<ValidationReport> get copyWith => _$ValidationReportCopyWithImpl<ValidationReport>(this as ValidationReport, _$identity);

  /// Serializes this ValidationReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationReport&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ValidationReport(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class $ValidationReportCopyWith<$Res>  {
  factory $ValidationReportCopyWith(ValidationReport value, $Res Function(ValidationReport) _then) = _$ValidationReportCopyWithImpl;
@useResult
$Res call({
 ValidationSlice? androidLegacy, ValidationSlice? androidAdaptive, ValidationSlice? ios, ValidationSlice? web
});


$ValidationSliceCopyWith<$Res>? get androidLegacy;$ValidationSliceCopyWith<$Res>? get androidAdaptive;$ValidationSliceCopyWith<$Res>? get ios;$ValidationSliceCopyWith<$Res>? get web;

}
/// @nodoc
class _$ValidationReportCopyWithImpl<$Res>
    implements $ValidationReportCopyWith<$Res> {
  _$ValidationReportCopyWithImpl(this._self, this._then);

  final ValidationReport _self;
  final $Res Function(ValidationReport) _then;

/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_self.copyWith(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,
  ));
}
/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// Adds pattern-matching-related methods to [ValidationReport].
extension ValidationReportPatterns on ValidationReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationReport value)  $default,){
final _that = this;
switch (_that) {
case _ValidationReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationReport value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ValidationSlice? androidLegacy,  ValidationSlice? androidAdaptive,  ValidationSlice? ios,  ValidationSlice? web)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationReport() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ValidationSlice? androidLegacy,  ValidationSlice? androidAdaptive,  ValidationSlice? ios,  ValidationSlice? web)  $default,) {final _that = this;
switch (_that) {
case _ValidationReport():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ValidationSlice? androidLegacy,  ValidationSlice? androidAdaptive,  ValidationSlice? ios,  ValidationSlice? web)?  $default,) {final _that = this;
switch (_that) {
case _ValidationReport() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationReport implements ValidationReport {
  const _ValidationReport({this.androidLegacy, this.androidAdaptive, this.ios, this.web});
  factory _ValidationReport.fromJson(Map<String, dynamic> json) => _$ValidationReportFromJson(json);

@override final  ValidationSlice? androidLegacy;
@override final  ValidationSlice? androidAdaptive;
@override final  ValidationSlice? ios;
@override final  ValidationSlice? web;

/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationReportCopyWith<_ValidationReport> get copyWith => __$ValidationReportCopyWithImpl<_ValidationReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationReport&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ValidationReport(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class _$ValidationReportCopyWith<$Res> implements $ValidationReportCopyWith<$Res> {
  factory _$ValidationReportCopyWith(_ValidationReport value, $Res Function(_ValidationReport) _then) = __$ValidationReportCopyWithImpl;
@override @useResult
$Res call({
 ValidationSlice? androidLegacy, ValidationSlice? androidAdaptive, ValidationSlice? ios, ValidationSlice? web
});


@override $ValidationSliceCopyWith<$Res>? get androidLegacy;@override $ValidationSliceCopyWith<$Res>? get androidAdaptive;@override $ValidationSliceCopyWith<$Res>? get ios;@override $ValidationSliceCopyWith<$Res>? get web;

}
/// @nodoc
class __$ValidationReportCopyWithImpl<$Res>
    implements _$ValidationReportCopyWith<$Res> {
  __$ValidationReportCopyWithImpl(this._self, this._then);

  final _ValidationReport _self;
  final $Res Function(_ValidationReport) _then;

/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_ValidationReport(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as ValidationSlice?,
  ));
}

/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ValidationReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationSliceCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $ValidationSliceCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// @nodoc
mixin _$LaunchAssetsEnvelope {

 LaunchAssetsModel get entity; Map<String, String>? get urls; ValidationReport? get validation;
/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchAssetsEnvelopeCopyWith<LaunchAssetsEnvelope> get copyWith => _$LaunchAssetsEnvelopeCopyWithImpl<LaunchAssetsEnvelope>(this as LaunchAssetsEnvelope, _$identity);

  /// Serializes this LaunchAssetsEnvelope to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchAssetsEnvelope&&(identical(other.entity, entity) || other.entity == entity)&&const DeepCollectionEquality().equals(other.urls, urls)&&(identical(other.validation, validation) || other.validation == validation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entity,const DeepCollectionEquality().hash(urls),validation);

@override
String toString() {
  return 'LaunchAssetsEnvelope(entity: $entity, urls: $urls, validation: $validation)';
}


}

/// @nodoc
abstract mixin class $LaunchAssetsEnvelopeCopyWith<$Res>  {
  factory $LaunchAssetsEnvelopeCopyWith(LaunchAssetsEnvelope value, $Res Function(LaunchAssetsEnvelope) _then) = _$LaunchAssetsEnvelopeCopyWithImpl;
@useResult
$Res call({
 LaunchAssetsModel entity, Map<String, String>? urls, ValidationReport? validation
});


$LaunchAssetsModelCopyWith<$Res> get entity;$ValidationReportCopyWith<$Res>? get validation;

}
/// @nodoc
class _$LaunchAssetsEnvelopeCopyWithImpl<$Res>
    implements $LaunchAssetsEnvelopeCopyWith<$Res> {
  _$LaunchAssetsEnvelopeCopyWithImpl(this._self, this._then);

  final LaunchAssetsEnvelope _self;
  final $Res Function(LaunchAssetsEnvelope) _then;

/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entity = null,Object? urls = freezed,Object? validation = freezed,}) {
  return _then(_self.copyWith(
entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as LaunchAssetsModel,urls: freezed == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationReport?,
  ));
}
/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchAssetsModelCopyWith<$Res> get entity {
  
  return $LaunchAssetsModelCopyWith<$Res>(_self.entity, (value) {
    return _then(_self.copyWith(entity: value));
  });
}/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationReportCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationReportCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}


/// Adds pattern-matching-related methods to [LaunchAssetsEnvelope].
extension LaunchAssetsEnvelopePatterns on LaunchAssetsEnvelope {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchAssetsEnvelope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchAssetsEnvelope() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchAssetsEnvelope value)  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsEnvelope():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchAssetsEnvelope value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsEnvelope() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LaunchAssetsModel entity,  Map<String, String>? urls,  ValidationReport? validation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchAssetsEnvelope() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LaunchAssetsModel entity,  Map<String, String>? urls,  ValidationReport? validation)  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsEnvelope():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LaunchAssetsModel entity,  Map<String, String>? urls,  ValidationReport? validation)?  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsEnvelope() when $default != null:
return $default(_that.entity,_that.urls,_that.validation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaunchAssetsEnvelope implements LaunchAssetsEnvelope {
  const _LaunchAssetsEnvelope({required this.entity, final  Map<String, String>? urls, this.validation}): _urls = urls;
  factory _LaunchAssetsEnvelope.fromJson(Map<String, dynamic> json) => _$LaunchAssetsEnvelopeFromJson(json);

@override final  LaunchAssetsModel entity;
 final  Map<String, String>? _urls;
@override Map<String, String>? get urls {
  final value = _urls;
  if (value == null) return null;
  if (_urls is EqualUnmodifiableMapView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  ValidationReport? validation;

/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchAssetsEnvelopeCopyWith<_LaunchAssetsEnvelope> get copyWith => __$LaunchAssetsEnvelopeCopyWithImpl<_LaunchAssetsEnvelope>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaunchAssetsEnvelopeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchAssetsEnvelope&&(identical(other.entity, entity) || other.entity == entity)&&const DeepCollectionEquality().equals(other._urls, _urls)&&(identical(other.validation, validation) || other.validation == validation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entity,const DeepCollectionEquality().hash(_urls),validation);

@override
String toString() {
  return 'LaunchAssetsEnvelope(entity: $entity, urls: $urls, validation: $validation)';
}


}

/// @nodoc
abstract mixin class _$LaunchAssetsEnvelopeCopyWith<$Res> implements $LaunchAssetsEnvelopeCopyWith<$Res> {
  factory _$LaunchAssetsEnvelopeCopyWith(_LaunchAssetsEnvelope value, $Res Function(_LaunchAssetsEnvelope) _then) = __$LaunchAssetsEnvelopeCopyWithImpl;
@override @useResult
$Res call({
 LaunchAssetsModel entity, Map<String, String>? urls, ValidationReport? validation
});


@override $LaunchAssetsModelCopyWith<$Res> get entity;@override $ValidationReportCopyWith<$Res>? get validation;

}
/// @nodoc
class __$LaunchAssetsEnvelopeCopyWithImpl<$Res>
    implements _$LaunchAssetsEnvelopeCopyWith<$Res> {
  __$LaunchAssetsEnvelopeCopyWithImpl(this._self, this._then);

  final _LaunchAssetsEnvelope _self;
  final $Res Function(_LaunchAssetsEnvelope) _then;

/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entity = null,Object? urls = freezed,Object? validation = freezed,}) {
  return _then(_LaunchAssetsEnvelope(
entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as LaunchAssetsModel,urls: freezed == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationReport?,
  ));
}

/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchAssetsModelCopyWith<$Res> get entity {
  
  return $LaunchAssetsModelCopyWith<$Res>(_self.entity, (value) {
    return _then(_self.copyWith(entity: value));
  });
}/// Create a copy of LaunchAssetsEnvelope
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationReportCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationReportCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}

// dart format on
