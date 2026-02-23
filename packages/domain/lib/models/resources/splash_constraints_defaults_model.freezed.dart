// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_constraints_defaults_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashConstraintsDefaultsSliceModel {

 double get fullSizeDp; double get maskDiameterDp; double get toleranceDp;
/// Create a copy of SplashConstraintsDefaultsSliceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<SplashConstraintsDefaultsSliceModel> get copyWith => _$SplashConstraintsDefaultsSliceModelCopyWithImpl<SplashConstraintsDefaultsSliceModel>(this as SplashConstraintsDefaultsSliceModel, _$identity);

  /// Serializes this SplashConstraintsDefaultsSliceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashConstraintsDefaultsSliceModel&&(identical(other.fullSizeDp, fullSizeDp) || other.fullSizeDp == fullSizeDp)&&(identical(other.maskDiameterDp, maskDiameterDp) || other.maskDiameterDp == maskDiameterDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeDp,maskDiameterDp,toleranceDp);

@override
String toString() {
  return 'SplashConstraintsDefaultsSliceModel(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class $SplashConstraintsDefaultsSliceModelCopyWith<$Res>  {
  factory $SplashConstraintsDefaultsSliceModelCopyWith(SplashConstraintsDefaultsSliceModel value, $Res Function(SplashConstraintsDefaultsSliceModel) _then) = _$SplashConstraintsDefaultsSliceModelCopyWithImpl;
@useResult
$Res call({
 double fullSizeDp, double maskDiameterDp, double toleranceDp
});




}
/// @nodoc
class _$SplashConstraintsDefaultsSliceModelCopyWithImpl<$Res>
    implements $SplashConstraintsDefaultsSliceModelCopyWith<$Res> {
  _$SplashConstraintsDefaultsSliceModelCopyWithImpl(this._self, this._then);

  final SplashConstraintsDefaultsSliceModel _self;
  final $Res Function(SplashConstraintsDefaultsSliceModel) _then;

/// Create a copy of SplashConstraintsDefaultsSliceModel
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


/// Adds pattern-matching-related methods to [SplashConstraintsDefaultsSliceModel].
extension SplashConstraintsDefaultsSliceModelPatterns on SplashConstraintsDefaultsSliceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsSliceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsSliceModel value)  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashConstraintsDefaultsSliceModel value)?  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsSliceModel() when $default != null:
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
case _SplashConstraintsDefaultsSliceModel() when $default != null:
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
case _SplashConstraintsDefaultsSliceModel():
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
case _SplashConstraintsDefaultsSliceModel() when $default != null:
return $default(_that.fullSizeDp,_that.maskDiameterDp,_that.toleranceDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashConstraintsDefaultsSliceModel implements SplashConstraintsDefaultsSliceModel {
  const _SplashConstraintsDefaultsSliceModel({required this.fullSizeDp, required this.maskDiameterDp, required this.toleranceDp});
  factory _SplashConstraintsDefaultsSliceModel.fromJson(Map<String, dynamic> json) => _$SplashConstraintsDefaultsSliceModelFromJson(json);

@override final  double fullSizeDp;
@override final  double maskDiameterDp;
@override final  double toleranceDp;

/// Create a copy of SplashConstraintsDefaultsSliceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashConstraintsDefaultsSliceModelCopyWith<_SplashConstraintsDefaultsSliceModel> get copyWith => __$SplashConstraintsDefaultsSliceModelCopyWithImpl<_SplashConstraintsDefaultsSliceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashConstraintsDefaultsSliceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashConstraintsDefaultsSliceModel&&(identical(other.fullSizeDp, fullSizeDp) || other.fullSizeDp == fullSizeDp)&&(identical(other.maskDiameterDp, maskDiameterDp) || other.maskDiameterDp == maskDiameterDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullSizeDp,maskDiameterDp,toleranceDp);

@override
String toString() {
  return 'SplashConstraintsDefaultsSliceModel(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class _$SplashConstraintsDefaultsSliceModelCopyWith<$Res> implements $SplashConstraintsDefaultsSliceModelCopyWith<$Res> {
  factory _$SplashConstraintsDefaultsSliceModelCopyWith(_SplashConstraintsDefaultsSliceModel value, $Res Function(_SplashConstraintsDefaultsSliceModel) _then) = __$SplashConstraintsDefaultsSliceModelCopyWithImpl;
@override @useResult
$Res call({
 double fullSizeDp, double maskDiameterDp, double toleranceDp
});




}
/// @nodoc
class __$SplashConstraintsDefaultsSliceModelCopyWithImpl<$Res>
    implements _$SplashConstraintsDefaultsSliceModelCopyWith<$Res> {
  __$SplashConstraintsDefaultsSliceModelCopyWithImpl(this._self, this._then);

  final _SplashConstraintsDefaultsSliceModel _self;
  final $Res Function(_SplashConstraintsDefaultsSliceModel) _then;

/// Create a copy of SplashConstraintsDefaultsSliceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullSizeDp = null,Object? maskDiameterDp = null,Object? toleranceDp = null,}) {
  return _then(_SplashConstraintsDefaultsSliceModel(
fullSizeDp: null == fullSizeDp ? _self.fullSizeDp : fullSizeDp // ignore: cast_nullable_to_non_nullable
as double,maskDiameterDp: null == maskDiameterDp ? _self.maskDiameterDp : maskDiameterDp // ignore: cast_nullable_to_non_nullable
as double,toleranceDp: null == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SplashConstraintsDefaultsModel {

 SplashConstraintsDefaultsSliceModel get withBackground; SplashConstraintsDefaultsSliceModel get withoutBackground; SplashConstraintsDefaultsSliceModel? get android12;
/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsModelCopyWith<SplashConstraintsDefaultsModel> get copyWith => _$SplashConstraintsDefaultsModelCopyWithImpl<SplashConstraintsDefaultsModel>(this as SplashConstraintsDefaultsModel, _$identity);

  /// Serializes this SplashConstraintsDefaultsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashConstraintsDefaultsModel&&(identical(other.withBackground, withBackground) || other.withBackground == withBackground)&&(identical(other.withoutBackground, withoutBackground) || other.withoutBackground == withoutBackground)&&(identical(other.android12, android12) || other.android12 == android12));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,withBackground,withoutBackground,android12);

@override
String toString() {
  return 'SplashConstraintsDefaultsModel(withBackground: $withBackground, withoutBackground: $withoutBackground, android12: $android12)';
}


}

/// @nodoc
abstract mixin class $SplashConstraintsDefaultsModelCopyWith<$Res>  {
  factory $SplashConstraintsDefaultsModelCopyWith(SplashConstraintsDefaultsModel value, $Res Function(SplashConstraintsDefaultsModel) _then) = _$SplashConstraintsDefaultsModelCopyWithImpl;
@useResult
$Res call({
 SplashConstraintsDefaultsSliceModel withBackground, SplashConstraintsDefaultsSliceModel withoutBackground, SplashConstraintsDefaultsSliceModel? android12
});


$SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withBackground;$SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withoutBackground;$SplashConstraintsDefaultsSliceModelCopyWith<$Res>? get android12;

}
/// @nodoc
class _$SplashConstraintsDefaultsModelCopyWithImpl<$Res>
    implements $SplashConstraintsDefaultsModelCopyWith<$Res> {
  _$SplashConstraintsDefaultsModelCopyWithImpl(this._self, this._then);

  final SplashConstraintsDefaultsModel _self;
  final $Res Function(SplashConstraintsDefaultsModel) _then;

/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? withBackground = null,Object? withoutBackground = null,Object? android12 = freezed,}) {
  return _then(_self.copyWith(
withBackground: null == withBackground ? _self.withBackground : withBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceModel,withoutBackground: null == withoutBackground ? _self.withoutBackground : withoutBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceModel,android12: freezed == android12 ? _self.android12 : android12 // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceModel?,
  ));
}
/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withBackground {
  
  return $SplashConstraintsDefaultsSliceModelCopyWith<$Res>(_self.withBackground, (value) {
    return _then(_self.copyWith(withBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withoutBackground {
  
  return $SplashConstraintsDefaultsSliceModelCopyWith<$Res>(_self.withoutBackground, (value) {
    return _then(_self.copyWith(withoutBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<$Res>? get android12 {
    if (_self.android12 == null) {
    return null;
  }

  return $SplashConstraintsDefaultsSliceModelCopyWith<$Res>(_self.android12!, (value) {
    return _then(_self.copyWith(android12: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashConstraintsDefaultsModel].
extension SplashConstraintsDefaultsModelPatterns on SplashConstraintsDefaultsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashConstraintsDefaultsModel value)  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashConstraintsDefaultsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SplashConstraintsDefaultsSliceModel withBackground,  SplashConstraintsDefaultsSliceModel withoutBackground,  SplashConstraintsDefaultsSliceModel? android12)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SplashConstraintsDefaultsSliceModel withBackground,  SplashConstraintsDefaultsSliceModel withoutBackground,  SplashConstraintsDefaultsSliceModel? android12)  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SplashConstraintsDefaultsSliceModel withBackground,  SplashConstraintsDefaultsSliceModel withoutBackground,  SplashConstraintsDefaultsSliceModel? android12)?  $default,) {final _that = this;
switch (_that) {
case _SplashConstraintsDefaultsModel() when $default != null:
return $default(_that.withBackground,_that.withoutBackground,_that.android12);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplashConstraintsDefaultsModel implements SplashConstraintsDefaultsModel {
  const _SplashConstraintsDefaultsModel({required this.withBackground, required this.withoutBackground, this.android12});
  factory _SplashConstraintsDefaultsModel.fromJson(Map<String, dynamic> json) => _$SplashConstraintsDefaultsModelFromJson(json);

@override final  SplashConstraintsDefaultsSliceModel withBackground;
@override final  SplashConstraintsDefaultsSliceModel withoutBackground;
@override final  SplashConstraintsDefaultsSliceModel? android12;

/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashConstraintsDefaultsModelCopyWith<_SplashConstraintsDefaultsModel> get copyWith => __$SplashConstraintsDefaultsModelCopyWithImpl<_SplashConstraintsDefaultsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplashConstraintsDefaultsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashConstraintsDefaultsModel&&(identical(other.withBackground, withBackground) || other.withBackground == withBackground)&&(identical(other.withoutBackground, withoutBackground) || other.withoutBackground == withoutBackground)&&(identical(other.android12, android12) || other.android12 == android12));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,withBackground,withoutBackground,android12);

@override
String toString() {
  return 'SplashConstraintsDefaultsModel(withBackground: $withBackground, withoutBackground: $withoutBackground, android12: $android12)';
}


}

/// @nodoc
abstract mixin class _$SplashConstraintsDefaultsModelCopyWith<$Res> implements $SplashConstraintsDefaultsModelCopyWith<$Res> {
  factory _$SplashConstraintsDefaultsModelCopyWith(_SplashConstraintsDefaultsModel value, $Res Function(_SplashConstraintsDefaultsModel) _then) = __$SplashConstraintsDefaultsModelCopyWithImpl;
@override @useResult
$Res call({
 SplashConstraintsDefaultsSliceModel withBackground, SplashConstraintsDefaultsSliceModel withoutBackground, SplashConstraintsDefaultsSliceModel? android12
});


@override $SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withBackground;@override $SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withoutBackground;@override $SplashConstraintsDefaultsSliceModelCopyWith<$Res>? get android12;

}
/// @nodoc
class __$SplashConstraintsDefaultsModelCopyWithImpl<$Res>
    implements _$SplashConstraintsDefaultsModelCopyWith<$Res> {
  __$SplashConstraintsDefaultsModelCopyWithImpl(this._self, this._then);

  final _SplashConstraintsDefaultsModel _self;
  final $Res Function(_SplashConstraintsDefaultsModel) _then;

/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? withBackground = null,Object? withoutBackground = null,Object? android12 = freezed,}) {
  return _then(_SplashConstraintsDefaultsModel(
withBackground: null == withBackground ? _self.withBackground : withBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceModel,withoutBackground: null == withoutBackground ? _self.withoutBackground : withoutBackground // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceModel,android12: freezed == android12 ? _self.android12 : android12 // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsSliceModel?,
  ));
}

/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withBackground {
  
  return $SplashConstraintsDefaultsSliceModelCopyWith<$Res>(_self.withBackground, (value) {
    return _then(_self.copyWith(withBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<$Res> get withoutBackground {
  
  return $SplashConstraintsDefaultsSliceModelCopyWith<$Res>(_self.withoutBackground, (value) {
    return _then(_self.copyWith(withoutBackground: value));
  });
}/// Create a copy of SplashConstraintsDefaultsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsSliceModelCopyWith<$Res>? get android12 {
    if (_self.android12 == null) {
    return null;
  }

  return $SplashConstraintsDefaultsSliceModelCopyWith<$Res>(_self.android12!, (value) {
    return _then(_self.copyWith(android12: value));
  });
}
}

// dart format on
