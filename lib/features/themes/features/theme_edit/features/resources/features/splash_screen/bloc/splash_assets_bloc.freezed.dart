// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_assets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashAssetsState {

 String get applicationId; String get themeId; String? get updatedAt; SplashAssetModel? get existing; List<AssetModel> get assets; SplashConstraintsDefaultsModel? get constraintsDefaults; String? get selectedAssetId; AssetModel? get selectedAsset; double get padding; double get android12Padding; String? get backgroundColorHex; SplashAssetsStatus get status; Object? get error;
/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashAssetsStateCopyWith<SplashAssetsState> get copyWith => _$SplashAssetsStateCopyWithImpl<SplashAssetsState>(this as SplashAssetsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashAssetsState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.existing, existing) || other.existing == existing)&&const DeepCollectionEquality().equals(other.assets, assets)&&(identical(other.constraintsDefaults, constraintsDefaults) || other.constraintsDefaults == constraintsDefaults)&&(identical(other.selectedAssetId, selectedAssetId) || other.selectedAssetId == selectedAssetId)&&(identical(other.selectedAsset, selectedAsset) || other.selectedAsset == selectedAsset)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.android12Padding, android12Padding) || other.android12Padding == android12Padding)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,updatedAt,existing,const DeepCollectionEquality().hash(assets),constraintsDefaults,selectedAssetId,selectedAsset,padding,android12Padding,backgroundColorHex,status,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SplashAssetsState(applicationId: $applicationId, themeId: $themeId, updatedAt: $updatedAt, existing: $existing, assets: $assets, constraintsDefaults: $constraintsDefaults, selectedAssetId: $selectedAssetId, selectedAsset: $selectedAsset, padding: $padding, android12Padding: $android12Padding, backgroundColorHex: $backgroundColorHex, status: $status, error: $error)';
}


}

/// @nodoc
abstract mixin class $SplashAssetsStateCopyWith<$Res>  {
  factory $SplashAssetsStateCopyWith(SplashAssetsState value, $Res Function(SplashAssetsState) _then) = _$SplashAssetsStateCopyWithImpl;
@useResult
$Res call({
 String applicationId, String themeId, String? updatedAt, SplashAssetModel? existing, List<AssetModel> assets, SplashConstraintsDefaultsModel? constraintsDefaults, String? selectedAssetId, AssetModel? selectedAsset, double padding, double android12Padding, String? backgroundColorHex, SplashAssetsStatus status, Object? error
});


$SplashAssetModelCopyWith<$Res>? get existing;$SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults;$AssetModelCopyWith<$Res>? get selectedAsset;

}
/// @nodoc
class _$SplashAssetsStateCopyWithImpl<$Res>
    implements $SplashAssetsStateCopyWith<$Res> {
  _$SplashAssetsStateCopyWithImpl(this._self, this._then);

  final SplashAssetsState _self;
  final $Res Function(SplashAssetsState) _then;

/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? themeId = null,Object? updatedAt = freezed,Object? existing = freezed,Object? assets = null,Object? constraintsDefaults = freezed,Object? selectedAssetId = freezed,Object? selectedAsset = freezed,Object? padding = null,Object? android12Padding = null,Object? backgroundColorHex = freezed,Object? status = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,existing: freezed == existing ? _self.existing : existing // ignore: cast_nullable_to_non_nullable
as SplashAssetModel?,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,constraintsDefaults: freezed == constraintsDefaults ? _self.constraintsDefaults : constraintsDefaults // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsModel?,selectedAssetId: freezed == selectedAssetId ? _self.selectedAssetId : selectedAssetId // ignore: cast_nullable_to_non_nullable
as String?,selectedAsset: freezed == selectedAsset ? _self.selectedAsset : selectedAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double,android12Padding: null == android12Padding ? _self.android12Padding : android12Padding // ignore: cast_nullable_to_non_nullable
as double,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SplashAssetsStatus,error: freezed == error ? _self.error : error ,
  ));
}
/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashAssetModelCopyWith<$Res>? get existing {
    if (_self.existing == null) {
    return null;
  }

  return $SplashAssetModelCopyWith<$Res>(_self.existing!, (value) {
    return _then(_self.copyWith(existing: value));
  });
}/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults {
    if (_self.constraintsDefaults == null) {
    return null;
  }

  return $SplashConstraintsDefaultsModelCopyWith<$Res>(_self.constraintsDefaults!, (value) {
    return _then(_self.copyWith(constraintsDefaults: value));
  });
}/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get selectedAsset {
    if (_self.selectedAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.selectedAsset!, (value) {
    return _then(_self.copyWith(selectedAsset: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplashAssetsState].
extension SplashAssetsStatePatterns on SplashAssetsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplashAssetsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplashAssetsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplashAssetsState value)  $default,){
final _that = this;
switch (_that) {
case _SplashAssetsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplashAssetsState value)?  $default,){
final _that = this;
switch (_that) {
case _SplashAssetsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  String? updatedAt,  SplashAssetModel? existing,  List<AssetModel> assets,  SplashConstraintsDefaultsModel? constraintsDefaults,  String? selectedAssetId,  AssetModel? selectedAsset,  double padding,  double android12Padding,  String? backgroundColorHex,  SplashAssetsStatus status,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplashAssetsState() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.updatedAt,_that.existing,_that.assets,_that.constraintsDefaults,_that.selectedAssetId,_that.selectedAsset,_that.padding,_that.android12Padding,_that.backgroundColorHex,_that.status,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  String? updatedAt,  SplashAssetModel? existing,  List<AssetModel> assets,  SplashConstraintsDefaultsModel? constraintsDefaults,  String? selectedAssetId,  AssetModel? selectedAsset,  double padding,  double android12Padding,  String? backgroundColorHex,  SplashAssetsStatus status,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _SplashAssetsState():
return $default(_that.applicationId,_that.themeId,_that.updatedAt,_that.existing,_that.assets,_that.constraintsDefaults,_that.selectedAssetId,_that.selectedAsset,_that.padding,_that.android12Padding,_that.backgroundColorHex,_that.status,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String themeId,  String? updatedAt,  SplashAssetModel? existing,  List<AssetModel> assets,  SplashConstraintsDefaultsModel? constraintsDefaults,  String? selectedAssetId,  AssetModel? selectedAsset,  double padding,  double android12Padding,  String? backgroundColorHex,  SplashAssetsStatus status,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _SplashAssetsState() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.updatedAt,_that.existing,_that.assets,_that.constraintsDefaults,_that.selectedAssetId,_that.selectedAsset,_that.padding,_that.android12Padding,_that.backgroundColorHex,_that.status,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SplashAssetsState extends SplashAssetsState {
   _SplashAssetsState({required this.applicationId, required this.themeId, this.updatedAt, this.existing, final  List<AssetModel> assets = const <AssetModel>[], this.constraintsDefaults, this.selectedAssetId, this.selectedAsset, this.padding = 0, this.android12Padding = 0, this.backgroundColorHex, this.status = SplashAssetsStatus.initial, this.error}): _assets = assets,super._();
  

@override final  String applicationId;
@override final  String themeId;
@override final  String? updatedAt;
@override final  SplashAssetModel? existing;
 final  List<AssetModel> _assets;
@override@JsonKey() List<AssetModel> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

@override final  SplashConstraintsDefaultsModel? constraintsDefaults;
@override final  String? selectedAssetId;
@override final  AssetModel? selectedAsset;
@override@JsonKey() final  double padding;
@override@JsonKey() final  double android12Padding;
@override final  String? backgroundColorHex;
@override@JsonKey() final  SplashAssetsStatus status;
@override final  Object? error;

/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplashAssetsStateCopyWith<_SplashAssetsState> get copyWith => __$SplashAssetsStateCopyWithImpl<_SplashAssetsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplashAssetsState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.existing, existing) || other.existing == existing)&&const DeepCollectionEquality().equals(other._assets, _assets)&&(identical(other.constraintsDefaults, constraintsDefaults) || other.constraintsDefaults == constraintsDefaults)&&(identical(other.selectedAssetId, selectedAssetId) || other.selectedAssetId == selectedAssetId)&&(identical(other.selectedAsset, selectedAsset) || other.selectedAsset == selectedAsset)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.android12Padding, android12Padding) || other.android12Padding == android12Padding)&&(identical(other.backgroundColorHex, backgroundColorHex) || other.backgroundColorHex == backgroundColorHex)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,updatedAt,existing,const DeepCollectionEquality().hash(_assets),constraintsDefaults,selectedAssetId,selectedAsset,padding,android12Padding,backgroundColorHex,status,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'SplashAssetsState(applicationId: $applicationId, themeId: $themeId, updatedAt: $updatedAt, existing: $existing, assets: $assets, constraintsDefaults: $constraintsDefaults, selectedAssetId: $selectedAssetId, selectedAsset: $selectedAsset, padding: $padding, android12Padding: $android12Padding, backgroundColorHex: $backgroundColorHex, status: $status, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SplashAssetsStateCopyWith<$Res> implements $SplashAssetsStateCopyWith<$Res> {
  factory _$SplashAssetsStateCopyWith(_SplashAssetsState value, $Res Function(_SplashAssetsState) _then) = __$SplashAssetsStateCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String themeId, String? updatedAt, SplashAssetModel? existing, List<AssetModel> assets, SplashConstraintsDefaultsModel? constraintsDefaults, String? selectedAssetId, AssetModel? selectedAsset, double padding, double android12Padding, String? backgroundColorHex, SplashAssetsStatus status, Object? error
});


@override $SplashAssetModelCopyWith<$Res>? get existing;@override $SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults;@override $AssetModelCopyWith<$Res>? get selectedAsset;

}
/// @nodoc
class __$SplashAssetsStateCopyWithImpl<$Res>
    implements _$SplashAssetsStateCopyWith<$Res> {
  __$SplashAssetsStateCopyWithImpl(this._self, this._then);

  final _SplashAssetsState _self;
  final $Res Function(_SplashAssetsState) _then;

/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? themeId = null,Object? updatedAt = freezed,Object? existing = freezed,Object? assets = null,Object? constraintsDefaults = freezed,Object? selectedAssetId = freezed,Object? selectedAsset = freezed,Object? padding = null,Object? android12Padding = null,Object? backgroundColorHex = freezed,Object? status = null,Object? error = freezed,}) {
  return _then(_SplashAssetsState(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,existing: freezed == existing ? _self.existing : existing // ignore: cast_nullable_to_non_nullable
as SplashAssetModel?,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,constraintsDefaults: freezed == constraintsDefaults ? _self.constraintsDefaults : constraintsDefaults // ignore: cast_nullable_to_non_nullable
as SplashConstraintsDefaultsModel?,selectedAssetId: freezed == selectedAssetId ? _self.selectedAssetId : selectedAssetId // ignore: cast_nullable_to_non_nullable
as String?,selectedAsset: freezed == selectedAsset ? _self.selectedAsset : selectedAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,padding: null == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as double,android12Padding: null == android12Padding ? _self.android12Padding : android12Padding // ignore: cast_nullable_to_non_nullable
as double,backgroundColorHex: freezed == backgroundColorHex ? _self.backgroundColorHex : backgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SplashAssetsStatus,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashAssetModelCopyWith<$Res>? get existing {
    if (_self.existing == null) {
    return null;
  }

  return $SplashAssetModelCopyWith<$Res>(_self.existing!, (value) {
    return _then(_self.copyWith(existing: value));
  });
}/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults {
    if (_self.constraintsDefaults == null) {
    return null;
  }

  return $SplashConstraintsDefaultsModelCopyWith<$Res>(_self.constraintsDefaults!, (value) {
    return _then(_self.copyWith(constraintsDefaults: value));
  });
}/// Create a copy of SplashAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get selectedAsset {
    if (_self.selectedAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.selectedAsset!, (value) {
    return _then(_self.copyWith(selectedAsset: value));
  });
}
}

// dart format on
