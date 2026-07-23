// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constraints_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlatformConstraintsDto {

 double? get sizeDp; double? get safeZoneDp; double? get toleranceDp;
/// Create a copy of PlatformConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<PlatformConstraintsDto> get copyWith => _$PlatformConstraintsDtoCopyWithImpl<PlatformConstraintsDto>(this as PlatformConstraintsDto, _$identity);

  /// Serializes this PlatformConstraintsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformConstraintsDto&&(identical(other.sizeDp, sizeDp) || other.sizeDp == sizeDp)&&(identical(other.safeZoneDp, safeZoneDp) || other.safeZoneDp == safeZoneDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sizeDp,safeZoneDp,toleranceDp);

@override
String toString() {
  return 'PlatformConstraintsDto(sizeDp: $sizeDp, safeZoneDp: $safeZoneDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class $PlatformConstraintsDtoCopyWith<$Res>  {
  factory $PlatformConstraintsDtoCopyWith(PlatformConstraintsDto value, $Res Function(PlatformConstraintsDto) _then) = _$PlatformConstraintsDtoCopyWithImpl;
@useResult
$Res call({
 double? sizeDp, double? safeZoneDp, double? toleranceDp
});




}
/// @nodoc
class _$PlatformConstraintsDtoCopyWithImpl<$Res>
    implements $PlatformConstraintsDtoCopyWith<$Res> {
  _$PlatformConstraintsDtoCopyWithImpl(this._self, this._then);

  final PlatformConstraintsDto _self;
  final $Res Function(PlatformConstraintsDto) _then;

/// Create a copy of PlatformConstraintsDto
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


/// Adds pattern-matching-related methods to [PlatformConstraintsDto].
extension PlatformConstraintsDtoPatterns on PlatformConstraintsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformConstraintsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformConstraintsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformConstraintsDto value)  $default,){
final _that = this;
switch (_that) {
case _PlatformConstraintsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformConstraintsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformConstraintsDto() when $default != null:
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
case _PlatformConstraintsDto() when $default != null:
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
case _PlatformConstraintsDto():
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
case _PlatformConstraintsDto() when $default != null:
return $default(_that.sizeDp,_that.safeZoneDp,_that.toleranceDp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformConstraintsDto implements PlatformConstraintsDto {
  const _PlatformConstraintsDto({this.sizeDp, this.safeZoneDp, this.toleranceDp});
  factory _PlatformConstraintsDto.fromJson(Map<String, dynamic> json) => _$PlatformConstraintsDtoFromJson(json);

@override final  double? sizeDp;
@override final  double? safeZoneDp;
@override final  double? toleranceDp;

/// Create a copy of PlatformConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformConstraintsDtoCopyWith<_PlatformConstraintsDto> get copyWith => __$PlatformConstraintsDtoCopyWithImpl<_PlatformConstraintsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformConstraintsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformConstraintsDto&&(identical(other.sizeDp, sizeDp) || other.sizeDp == sizeDp)&&(identical(other.safeZoneDp, safeZoneDp) || other.safeZoneDp == safeZoneDp)&&(identical(other.toleranceDp, toleranceDp) || other.toleranceDp == toleranceDp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sizeDp,safeZoneDp,toleranceDp);

@override
String toString() {
  return 'PlatformConstraintsDto(sizeDp: $sizeDp, safeZoneDp: $safeZoneDp, toleranceDp: $toleranceDp)';
}


}

/// @nodoc
abstract mixin class _$PlatformConstraintsDtoCopyWith<$Res> implements $PlatformConstraintsDtoCopyWith<$Res> {
  factory _$PlatformConstraintsDtoCopyWith(_PlatformConstraintsDto value, $Res Function(_PlatformConstraintsDto) _then) = __$PlatformConstraintsDtoCopyWithImpl;
@override @useResult
$Res call({
 double? sizeDp, double? safeZoneDp, double? toleranceDp
});




}
/// @nodoc
class __$PlatformConstraintsDtoCopyWithImpl<$Res>
    implements _$PlatformConstraintsDtoCopyWith<$Res> {
  __$PlatformConstraintsDtoCopyWithImpl(this._self, this._then);

  final _PlatformConstraintsDto _self;
  final $Res Function(_PlatformConstraintsDto) _then;

/// Create a copy of PlatformConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sizeDp = freezed,Object? safeZoneDp = freezed,Object? toleranceDp = freezed,}) {
  return _then(_PlatformConstraintsDto(
sizeDp: freezed == sizeDp ? _self.sizeDp : sizeDp // ignore: cast_nullable_to_non_nullable
as double?,safeZoneDp: freezed == safeZoneDp ? _self.safeZoneDp : safeZoneDp // ignore: cast_nullable_to_non_nullable
as double?,toleranceDp: freezed == toleranceDp ? _self.toleranceDp : toleranceDp // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ConstraintsDto {

 PlatformConstraintsDto? get androidLegacy; PlatformConstraintsDto? get androidAdaptive; PlatformConstraintsDto? get ios; PlatformConstraintsDto? get web;
/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstraintsDtoCopyWith<ConstraintsDto> get copyWith => _$ConstraintsDtoCopyWithImpl<ConstraintsDto>(this as ConstraintsDto, _$identity);

  /// Serializes this ConstraintsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConstraintsDto&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ConstraintsDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class $ConstraintsDtoCopyWith<$Res>  {
  factory $ConstraintsDtoCopyWith(ConstraintsDto value, $Res Function(ConstraintsDto) _then) = _$ConstraintsDtoCopyWithImpl;
@useResult
$Res call({
 PlatformConstraintsDto? androidLegacy, PlatformConstraintsDto? androidAdaptive, PlatformConstraintsDto? ios, PlatformConstraintsDto? web
});


$PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy;$PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive;$PlatformConstraintsDtoCopyWith<$Res>? get ios;$PlatformConstraintsDtoCopyWith<$Res>? get web;

}
/// @nodoc
class _$ConstraintsDtoCopyWithImpl<$Res>
    implements $ConstraintsDtoCopyWith<$Res> {
  _$ConstraintsDtoCopyWithImpl(this._self, this._then);

  final ConstraintsDto _self;
  final $Res Function(ConstraintsDto) _then;

/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_self.copyWith(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,
  ));
}
/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConstraintsDto].
extension ConstraintsDtoPatterns on ConstraintsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConstraintsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConstraintsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConstraintsDto value)  $default,){
final _that = this;
switch (_that) {
case _ConstraintsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConstraintsDto value)?  $default,){
final _that = this;
switch (_that) {
case _ConstraintsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlatformConstraintsDto? androidLegacy,  PlatformConstraintsDto? androidAdaptive,  PlatformConstraintsDto? ios,  PlatformConstraintsDto? web)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConstraintsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlatformConstraintsDto? androidLegacy,  PlatformConstraintsDto? androidAdaptive,  PlatformConstraintsDto? ios,  PlatformConstraintsDto? web)  $default,) {final _that = this;
switch (_that) {
case _ConstraintsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlatformConstraintsDto? androidLegacy,  PlatformConstraintsDto? androidAdaptive,  PlatformConstraintsDto? ios,  PlatformConstraintsDto? web)?  $default,) {final _that = this;
switch (_that) {
case _ConstraintsDto() when $default != null:
return $default(_that.androidLegacy,_that.androidAdaptive,_that.ios,_that.web);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConstraintsDto implements ConstraintsDto {
  const _ConstraintsDto({this.androidLegacy, this.androidAdaptive, this.ios, this.web});
  factory _ConstraintsDto.fromJson(Map<String, dynamic> json) => _$ConstraintsDtoFromJson(json);

@override final  PlatformConstraintsDto? androidLegacy;
@override final  PlatformConstraintsDto? androidAdaptive;
@override final  PlatformConstraintsDto? ios;
@override final  PlatformConstraintsDto? web;

/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConstraintsDtoCopyWith<_ConstraintsDto> get copyWith => __$ConstraintsDtoCopyWithImpl<_ConstraintsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConstraintsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConstraintsDto&&(identical(other.androidLegacy, androidLegacy) || other.androidLegacy == androidLegacy)&&(identical(other.androidAdaptive, androidAdaptive) || other.androidAdaptive == androidAdaptive)&&(identical(other.ios, ios) || other.ios == ios)&&(identical(other.web, web) || other.web == web));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidLegacy,androidAdaptive,ios,web);

@override
String toString() {
  return 'ConstraintsDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
}


}

/// @nodoc
abstract mixin class _$ConstraintsDtoCopyWith<$Res> implements $ConstraintsDtoCopyWith<$Res> {
  factory _$ConstraintsDtoCopyWith(_ConstraintsDto value, $Res Function(_ConstraintsDto) _then) = __$ConstraintsDtoCopyWithImpl;
@override @useResult
$Res call({
 PlatformConstraintsDto? androidLegacy, PlatformConstraintsDto? androidAdaptive, PlatformConstraintsDto? ios, PlatformConstraintsDto? web
});


@override $PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy;@override $PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive;@override $PlatformConstraintsDtoCopyWith<$Res>? get ios;@override $PlatformConstraintsDtoCopyWith<$Res>? get web;

}
/// @nodoc
class __$ConstraintsDtoCopyWithImpl<$Res>
    implements _$ConstraintsDtoCopyWith<$Res> {
  __$ConstraintsDtoCopyWithImpl(this._self, this._then);

  final _ConstraintsDto _self;
  final $Res Function(_ConstraintsDto) _then;

/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidLegacy = freezed,Object? androidAdaptive = freezed,Object? ios = freezed,Object? web = freezed,}) {
  return _then(_ConstraintsDto(
androidLegacy: freezed == androidLegacy ? _self.androidLegacy : androidLegacy // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,androidAdaptive: freezed == androidAdaptive ? _self.androidAdaptive : androidAdaptive // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,ios: freezed == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,web: freezed == web ? _self.web : web // ignore: cast_nullable_to_non_nullable
as PlatformConstraintsDto?,
  ));
}

/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy {
    if (_self.androidLegacy == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.androidLegacy!, (value) {
    return _then(_self.copyWith(androidLegacy: value));
  });
}/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive {
    if (_self.androidAdaptive == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.androidAdaptive!, (value) {
    return _then(_self.copyWith(androidAdaptive: value));
  });
}/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get ios {
    if (_self.ios == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.ios!, (value) {
    return _then(_self.copyWith(ios: value));
  });
}/// Create a copy of ConstraintsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformConstraintsDtoCopyWith<$Res>? get web {
    if (_self.web == null) {
    return null;
  }

  return $PlatformConstraintsDtoCopyWith<$Res>(_self.web!, (value) {
    return _then(_self.copyWith(web: value));
  });
}
}

// dart format on
