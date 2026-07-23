// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constraints_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConstraintsModel {

 PlatformConstraintsModel? get androidLegacy; PlatformConstraintsModel? get androidAdaptive; PlatformConstraintsModel? get ios; PlatformConstraintsModel? get web;
/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstraintsModelCopyWith<ConstraintsModel> get copyWith => _$ConstraintsModelCopyWithImpl<ConstraintsModel>(this as ConstraintsModel, _$identity);

  /// Serializes this ConstraintsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstraintsModel&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ConstraintsModel(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class $ConstraintsModelCopyWith<$Res>  {
  factory $ConstraintsModelCopyWith(ConstraintsModel value, $Res Function(ConstraintsModel) _then) = _$ConstraintsModelCopyWithImpl;
@useResult
$Res call({
 PlatformConstraintsModel? androidLegacy, PlatformConstraintsModel? androidAdaptive, PlatformConstraintsModel? ios, PlatformConstraintsModel? web
});


$PlatformConstraintsModelCopyWith<$Res>? get androidLegacy;$PlatformConstraintsModelCopyWith<$Res>? get androidAdaptive;$PlatformConstraintsModelCopyWith<$Res>? get ios;$PlatformConstraintsModelCopyWith<$Res>? get web;

}
/// @nodoc
class _$ConstraintsModelCopyWithImpl<$Res>
    implements $ConstraintsModelCopyWith<$Res> {
  _$ConstraintsModelCopyWithImpl(this._self, this._then);

  final ConstraintsModel _self;
  final $Res Function(ConstraintsModel) _then;

/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_self.copyWith(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,
  ));
}
/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConstraintsModel].
extension ConstraintsModelPatterns on ConstraintsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConstraintsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConstraintsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConstraintsModel value)  $default,){
final _that = this;
switch (_that) {
case _ConstraintsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConstraintsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConstraintsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlatformConstraintsModel? androidLegacy,  PlatformConstraintsModel? androidAdaptive,  PlatformConstraintsModel? ios,  PlatformConstraintsModel? web)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConstraintsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlatformConstraintsModel? androidLegacy,  PlatformConstraintsModel? androidAdaptive,  PlatformConstraintsModel? ios,  PlatformConstraintsModel? web)  $default,) {final _that = this;
switch (_that) {
case _ConstraintsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlatformConstraintsModel? androidLegacy,  PlatformConstraintsModel? androidAdaptive,  PlatformConstraintsModel? ios,  PlatformConstraintsModel? web)?  $default,) {final _that = this;
switch (_that) {
case _ConstraintsModel() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConstraintsModel implements ConstraintsModel {
  const _ConstraintsModel({this.androidLegacy, this.androidAdaptive, this.ios, this.web});
  factory _ConstraintsModel.fromJson(Map<String, dynamic> json) => _$ConstraintsModelFromJson(json);

@override final  PlatformConstraintsModel? androidLegacy;
@override final  PlatformConstraintsModel? androidAdaptive;
@override final  PlatformConstraintsModel? ios;
@override final  PlatformConstraintsModel? web;

/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConstraintsModelCopyWith<_ConstraintsModel> get copyWith => __$ConstraintsModelCopyWithImpl<_ConstraintsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConstraintsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConstraintsModel&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ConstraintsModel(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class _$ConstraintsModelCopyWith<$Res> implements $ConstraintsModelCopyWith<$Res> {
  factory _$ConstraintsModelCopyWith(_ConstraintsModel value, $Res Function(_ConstraintsModel) _then) = __$ConstraintsModelCopyWithImpl;
@override @useResult
$Res call({
 PlatformConstraintsModel? androidLegacy, PlatformConstraintsModel? androidAdaptive, PlatformConstraintsModel? ios, PlatformConstraintsModel? web
});


@override $PlatformConstraintsModelCopyWith<$Res>? get androidLegacy;@override $PlatformConstraintsModelCopyWith<$Res>? get androidAdaptive;@override $PlatformConstraintsModelCopyWith<$Res>? get ios;@override $PlatformConstraintsModelCopyWith<$Res>? get web;

}
/// @nodoc
class __$ConstraintsModelCopyWithImpl<$Res>
    implements _$ConstraintsModelCopyWith<$Res> {
  __$ConstraintsModelCopyWithImpl(this._self, this._then);

  final _ConstraintsModel _self;
  final $Res Function(_ConstraintsModel) _then;

/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_ConstraintsModel(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsModel?,
  ));
}

/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $PlatformConstraintsModelCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// @nodoc
mixin _$PlatformConstraintsModel {

 double? get sizeDp; double? get safeZoneDp; double? get toleranceDp;
/// Create a copy of PlatformConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformConstraintsModelCopyWith<PlatformConstraintsModel> get copyWith => _$PlatformConstraintsModelCopyWithImpl<PlatformConstraintsModel>(this as PlatformConstraintsModel, _$identity);

  /// Serializes this PlatformConstraintsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformConstraintsModel&&(identical(other.sizeDp, sizeDp) || other.sizeDp == sizeDp)&&(identical(other.safeZoneDp, safeZoneDp) || other.safeZoneDp == safeZoneDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sizeDp,safeZoneDp,toleranceDp);

@override
String toString() {
  return 'PlatformConstraintsModel(sizeDp: $sizeDp, safeZoneDp: $safeZoneDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class $PlatformConstraintsModelCopyWith<$Res>  {
  factory $PlatformConstraintsModelCopyWith(PlatformConstraintsModel value, $Res Function(PlatformConstraintsModel) _then) = _$PlatformConstraintsModelCopyWithImpl;
@useResult
$Res call({
 double? sizeDp, double? safeZoneDp, double? toleranceDp
});




}
/// @nodoc
class _$PlatformConstraintsModelCopyWithImpl<$Res>
    implements $PlatformConstraintsModelCopyWith<$Res> {
  _$PlatformConstraintsModelCopyWithImpl(this._self, this._then);

  final PlatformConstraintsModel _self;
  final $Res Function(PlatformConstraintsModel) _then;

/// Create a copy of PlatformConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sizeDp = freezed,Object? safeZoneDp = freezed,Object? toleranceDp = freezed,}) {
  return _then(_self.copyWith(
sizeDp: freezed == sizeDp ? _self.sizeDp : sizeDp // ignore: cast_nullable_to_non_nullable
as double?,safeZoneDp: freezed == safeZoneDp ? _self.safeZoneDp : safeZoneDp // ignore: cast_nullable_to_non_nullable
as double?,toleranceDp: freezed == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlatformConstraintsModel].
extension PlatformConstraintsModelPatterns on PlatformConstraintsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformConstraintsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformConstraintsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformConstraintsModel value)  $default,){
final _that = this;
switch (_that) {
case _PlatformConstraintsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformConstraintsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformConstraintsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? sizeDp,  double? safeZoneDp,  double? toleranceDp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformConstraintsModel() when $default != null:
return $default(_that.sizeDp,_that.safeZoneDp,_that.toleranceDp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? sizeDp,  double? safeZoneDp,  double? toleranceDp)  $default,) {final _that = this;
switch (_that) {
case _PlatformConstraintsModel():
return $default(_that.sizeDp,_that.safeZoneDp,_that.toleranceDp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? sizeDp,  double? safeZoneDp,  double? toleranceDp)?  $default,) {final _that = this;
switch (_that) {
case _PlatformConstraintsModel() when $default != null:
return $default(_that.sizeDp,_that.safeZoneDp,_that.toleranceDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformConstraintsModel implements PlatformConstraintsModel {
  const _PlatformConstraintsModel({this.sizeDp, this.safeZoneDp, this.toleranceDp});
  factory _PlatformConstraintsModel.fromJson(Map<String, dynamic> json) => _$PlatformConstraintsModelFromJson(json);

@override final  double? sizeDp;
@override final  double? safeZoneDp;
@override final  double? toleranceDp;

/// Create a copy of PlatformConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformConstraintsModelCopyWith<_PlatformConstraintsModel> get copyWith => __$PlatformConstraintsModelCopyWithImpl<_PlatformConstraintsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformConstraintsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformConstraintsModel&&(identical(other.sizeDp, sizeDp) || other.sizeDp == sizeDp)&&(identical(other.safeZoneDp, safeZoneDp) || other.safeZoneDp == safeZoneDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sizeDp,safeZoneDp,toleranceDp);

@override
String toString() {
  return 'PlatformConstraintsModel(sizeDp: $sizeDp, safeZoneDp: $safeZoneDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class _$PlatformConstraintsModelCopyWith<$Res> implements $PlatformConstraintsModelCopyWith<$Res> {
  factory _$PlatformConstraintsModelCopyWith(_PlatformConstraintsModel value, $Res Function(_PlatformConstraintsModel) _then) = __$PlatformConstraintsModelCopyWithImpl;
@override @useResult
$Res call({
 double? sizeDp, double? safeZoneDp, double? toleranceDp
});




}
/// @nodoc
class __$PlatformConstraintsModelCopyWithImpl<$Res>
    implements _$PlatformConstraintsModelCopyWith<$Res> {
  __$PlatformConstraintsModelCopyWithImpl(this._self, this._then);

  final _PlatformConstraintsModel _self;
  final $Res Function(_PlatformConstraintsModel) _then;

/// Create a copy of PlatformConstraintsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sizeDp = freezed,Object? safeZoneDp = freezed,Object? toleranceDp = freezed,}) {
  return _then(_PlatformConstraintsModel(
sizeDp: freezed == sizeDp ? _self.sizeDp : sizeDp // ignore: cast_nullable_to_non_nullable
as double?,safeZoneDp: freezed == safeZoneDp ? _self.safeZoneDp : safeZoneDp // ignore: cast_nullable_to_non_nullable
as double?,toleranceDp: freezed == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
