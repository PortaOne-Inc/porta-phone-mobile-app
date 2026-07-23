// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_assets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LaunchAssetsState {

 String get applicationId; String get themeId; LaunchAssetsEnvelope? get envelope; List<AssetModel> get assets; ConstraintsModel? get constraints; String? get selectedBackgroundColorHex; AssetModel? get selectedForegroundAsset; AssetModel? get selectedBackgroundAsset; double get paddingAndroidLegacy; double get paddingAndroidAdaptive; double get paddingIOS; double get paddingWEB; LaunchAssetsStatus get status; bool get saving; String? get error;
/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchAssetsStateCopyWith<LaunchAssetsState> get copyWith => _$LaunchAssetsStateCopyWithImpl<LaunchAssetsState>(this as LaunchAssetsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchAssetsState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.envelope, envelope) || other.envelope == envelope)&&const DeepCollectionEquality().equals(other.assets, assets)&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.selectedBackgroundColorHex, selectedBackgroundColorHex) || other.selectedBackgroundColorHex == selectedBackgroundColorHex)&&(identical(other.selectedForegroundAsset, selectedForegroundAsset) || other.selectedForegroundAsset == selectedForegroundAsset)&&(identical(other.selectedBackgroundAsset, selectedBackgroundAsset) || other.selectedBackgroundAsset == selectedBackgroundAsset)&&(identical(other.paddingAndroidLegacy, paddingAndroidLegacy) || other.paddingAndroidLegacy == paddingAndroidLegacy)&&(identical(other.paddingAndroidAdaptive, paddingAndroidAdaptive) || other.paddingAndroidAdaptive == paddingAndroidAdaptive)&&(identical(other.paddingIOS, paddingIOS) || other.paddingIOS == paddingIOS)&&(identical(other.paddingWEB, paddingWEB) || other.paddingWEB == paddingWEB)&&(identical(other.status, status) || other.status == status)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,envelope,const DeepCollectionEquality().hash(assets),constraints,selectedBackgroundColorHex,selectedForegroundAsset,selectedBackgroundAsset,paddingAndroidLegacy,paddingAndroidAdaptive,paddingIOS,paddingWEB,status,saving,error);

@override
String toString() {
  return 'LaunchAssetsState(applicationId: $applicationId, themeId: $themeId, envelope: $envelope, assets: $assets, constraints: $constraints, selectedBackgroundColorHex: $selectedBackgroundColorHex, selectedForegroundAsset: $selectedForegroundAsset, selectedBackgroundAsset: $selectedBackgroundAsset, paddingAndroidLegacy: $paddingAndroidLegacy, paddingAndroidAdaptive: $paddingAndroidAdaptive, paddingIOS: $paddingIOS, paddingWEB: $paddingWEB, status: $status, saving: $saving, error: $error)';
}


}

/// @nodoc
abstract mixin class $LaunchAssetsStateCopyWith<$Res>  {
  factory $LaunchAssetsStateCopyWith(LaunchAssetsState value, $Res Function(LaunchAssetsState) _then) = _$LaunchAssetsStateCopyWithImpl;
@useResult
$Res call({
 String applicationId, String themeId, LaunchAssetsEnvelope? envelope, List<AssetModel> assets, ConstraintsModel? constraints, String? selectedBackgroundColorHex, AssetModel? selectedForegroundAsset, AssetModel? selectedBackgroundAsset, double paddingAndroidLegacy, double paddingAndroidAdaptive, double paddingIOS, double paddingWEB, LaunchAssetsStatus status, bool saving, String? error
});


$LaunchAssetsEnvelopeCopyWith<$Res>? get envelope;$ConstraintsModelCopyWith<$Res>? get constraints;$AssetModelCopyWith<$Res>? get selectedForegroundAsset;$AssetModelCopyWith<$Res>? get selectedBackgroundAsset;

}
/// @nodoc
class _$LaunchAssetsStateCopyWithImpl<$Res>
    implements $LaunchAssetsStateCopyWith<$Res> {
  _$LaunchAssetsStateCopyWithImpl(this._self, this._then);

  final LaunchAssetsState _self;
  final $Res Function(LaunchAssetsState) _then;

/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? themeId = null,Object? envelope = freezed,Object? assets = null,Object? constraints = freezed,Object? selectedBackgroundColorHex = freezed,Object? selectedForegroundAsset = freezed,Object? selectedBackgroundAsset = freezed,Object? paddingAndroidLegacy = null,Object? paddingAndroidAdaptive = null,Object? paddingIOS = null,Object? paddingWEB = null,Object? status = null,Object? saving = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,envelope: freezed == envelope ? _self.envelope : envelope // ignore: cast_nullable_to_non_nullable
as LaunchAssetsEnvelope?,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as ConstraintsModel?,selectedBackgroundColorHex: freezed == selectedBackgroundColorHex ? _self.selectedBackgroundColorHex : selectedBackgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,selectedForegroundAsset: freezed == selectedForegroundAsset ? _self.selectedForegroundAsset : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,selectedBackgroundAsset: freezed == selectedBackgroundAsset ? _self.selectedBackgroundAsset : selectedBackgroundAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,paddingAndroidLegacy: null == paddingAndroidLegacy ? _self.paddingAndroidLegacy : paddingAndroidLegacy // ignore: cast_nullable_to_non_nullable
as double,paddingAndroidAdaptive: null == paddingAndroidAdaptive ? _self.paddingAndroidAdaptive : paddingAndroidAdaptive // ignore: cast_nullable_to_non_nullable
as double,paddingIOS: null == paddingIOS ? _self.paddingIOS : paddingIOS // ignore: cast_nullable_to_non_nullable
as double,paddingWEB: null == paddingWEB ? _self.paddingWEB : paddingWEB // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LaunchAssetsStatus,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchAssetsEnvelopeCopyWith<$Res>? get envelope {
    if (_self.envelope == null) {
    return null;
  }

  return $LaunchAssetsEnvelopeCopyWith<$Res>(_self.envelope!, (value) {
    return _then(_self.copyWith(envelope: value));
  });
}/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstraintsModelCopyWith<$Res>? get constraints {
    if (_self.constraints == null) {
    return null;
  }

  return $ConstraintsModelCopyWith<$Res>(_self.constraints!, (value) {
    return _then(_self.copyWith(constraints: value));
  });
}/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get selectedForegroundAsset {
    if (_self.selectedForegroundAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.selectedForegroundAsset!, (value) {
    return _then(_self.copyWith(selectedForegroundAsset: value));
  });
}/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get selectedBackgroundAsset {
    if (_self.selectedBackgroundAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.selectedBackgroundAsset!, (value) {
    return _then(_self.copyWith(selectedBackgroundAsset: value));
  });
}
}


/// Adds pattern-matching-related methods to [LaunchAssetsState].
extension LaunchAssetsStatePatterns on LaunchAssetsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchAssetsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchAssetsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchAssetsState value)  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchAssetsState value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchAssetsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  LaunchAssetsEnvelope? envelope,  List<AssetModel> assets,  ConstraintsModel? constraints,  String? selectedBackgroundColorHex,  AssetModel? selectedForegroundAsset,  AssetModel? selectedBackgroundAsset,  double paddingAndroidLegacy,  double paddingAndroidAdaptive,  double paddingIOS,  double paddingWEB,  LaunchAssetsStatus status,  bool saving,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchAssetsState() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.envelope,_that.assets,_that.constraints,_that.selectedBackgroundColorHex,_that.selectedForegroundAsset,_that.selectedBackgroundAsset,_that.paddingAndroidLegacy,_that.paddingAndroidAdaptive,_that.paddingIOS,_that.paddingWEB,_that.status,_that.saving,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String themeId,  LaunchAssetsEnvelope? envelope,  List<AssetModel> assets,  ConstraintsModel? constraints,  String? selectedBackgroundColorHex,  AssetModel? selectedForegroundAsset,  AssetModel? selectedBackgroundAsset,  double paddingAndroidLegacy,  double paddingAndroidAdaptive,  double paddingIOS,  double paddingWEB,  LaunchAssetsStatus status,  bool saving,  String? error)  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsState():
return $default(_that.applicationId,_that.themeId,_that.envelope,_that.assets,_that.constraints,_that.selectedBackgroundColorHex,_that.selectedForegroundAsset,_that.selectedBackgroundAsset,_that.paddingAndroidLegacy,_that.paddingAndroidAdaptive,_that.paddingIOS,_that.paddingWEB,_that.status,_that.saving,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String themeId,  LaunchAssetsEnvelope? envelope,  List<AssetModel> assets,  ConstraintsModel? constraints,  String? selectedBackgroundColorHex,  AssetModel? selectedForegroundAsset,  AssetModel? selectedBackgroundAsset,  double paddingAndroidLegacy,  double paddingAndroidAdaptive,  double paddingIOS,  double paddingWEB,  LaunchAssetsStatus status,  bool saving,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _LaunchAssetsState() when $default != null:
return $default(_that.applicationId,_that.themeId,_that.envelope,_that.assets,_that.constraints,_that.selectedBackgroundColorHex,_that.selectedForegroundAsset,_that.selectedBackgroundAsset,_that.paddingAndroidLegacy,_that.paddingAndroidAdaptive,_that.paddingIOS,_that.paddingWEB,_that.status,_that.saving,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _LaunchAssetsState extends LaunchAssetsState {
   _LaunchAssetsState({required this.applicationId, required this.themeId, this.envelope, final  List<AssetModel> assets = const <AssetModel>[], this.constraints, this.selectedBackgroundColorHex, this.selectedForegroundAsset, this.selectedBackgroundAsset, this.paddingAndroidLegacy = 0.0, this.paddingAndroidAdaptive = 0.0, this.paddingIOS = 0.0, this.paddingWEB = 0.0, this.status = LaunchAssetsStatus.initial, this.saving = false, this.error}): _assets = assets,super._();
  

@override final  String applicationId;
@override final  String themeId;
@override final  LaunchAssetsEnvelope? envelope;
 final  List<AssetModel> _assets;
@override@JsonKey() List<AssetModel> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

@override final  ConstraintsModel? constraints;
@override final  String? selectedBackgroundColorHex;
@override final  AssetModel? selectedForegroundAsset;
@override final  AssetModel? selectedBackgroundAsset;
@override@JsonKey() final  double paddingAndroidLegacy;
@override@JsonKey() final  double paddingAndroidAdaptive;
@override@JsonKey() final  double paddingIOS;
@override@JsonKey() final  double paddingWEB;
@override@JsonKey() final  LaunchAssetsStatus status;
@override@JsonKey() final  bool saving;
@override final  String? error;

/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchAssetsStateCopyWith<_LaunchAssetsState> get copyWith => __$LaunchAssetsStateCopyWithImpl<_LaunchAssetsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchAssetsState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.envelope, envelope) || other.envelope == envelope)&&const DeepCollectionEquality().equals(other._assets, _assets)&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.selectedBackgroundColorHex, selectedBackgroundColorHex) || other.selectedBackgroundColorHex == selectedBackgroundColorHex)&&(identical(other.selectedForegroundAsset, selectedForegroundAsset) || other.selectedForegroundAsset == selectedForegroundAsset)&&(identical(other.selectedBackgroundAsset, selectedBackgroundAsset) || other.selectedBackgroundAsset == selectedBackgroundAsset)&&(identical(other.paddingAndroidLegacy, paddingAndroidLegacy) || other.paddingAndroidLegacy == paddingAndroidLegacy)&&(identical(other.paddingAndroidAdaptive, paddingAndroidAdaptive) || other.paddingAndroidAdaptive == paddingAndroidAdaptive)&&(identical(other.paddingIOS, paddingIOS) || other.paddingIOS == paddingIOS)&&(identical(other.paddingWEB, paddingWEB) || other.paddingWEB == paddingWEB)&&(identical(other.status, status) || other.status == status)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,themeId,envelope,const DeepCollectionEquality().hash(_assets),constraints,selectedBackgroundColorHex,selectedForegroundAsset,selectedBackgroundAsset,paddingAndroidLegacy,paddingAndroidAdaptive,paddingIOS,paddingWEB,status,saving,error);

@override
String toString() {
  return 'LaunchAssetsState(applicationId: $applicationId, themeId: $themeId, envelope: $envelope, assets: $assets, constraints: $constraints, selectedBackgroundColorHex: $selectedBackgroundColorHex, selectedForegroundAsset: $selectedForegroundAsset, selectedBackgroundAsset: $selectedBackgroundAsset, paddingAndroidLegacy: $paddingAndroidLegacy, paddingAndroidAdaptive: $paddingAndroidAdaptive, paddingIOS: $paddingIOS, paddingWEB: $paddingWEB, status: $status, saving: $saving, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LaunchAssetsStateCopyWith<$Res> implements $LaunchAssetsStateCopyWith<$Res> {
  factory _$LaunchAssetsStateCopyWith(_LaunchAssetsState value, $Res Function(_LaunchAssetsState) _then) = __$LaunchAssetsStateCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String themeId, LaunchAssetsEnvelope? envelope, List<AssetModel> assets, ConstraintsModel? constraints, String? selectedBackgroundColorHex, AssetModel? selectedForegroundAsset, AssetModel? selectedBackgroundAsset, double paddingAndroidLegacy, double paddingAndroidAdaptive, double paddingIOS, double paddingWEB, LaunchAssetsStatus status, bool saving, String? error
});


@override $LaunchAssetsEnvelopeCopyWith<$Res>? get envelope;@override $ConstraintsModelCopyWith<$Res>? get constraints;@override $AssetModelCopyWith<$Res>? get selectedForegroundAsset;@override $AssetModelCopyWith<$Res>? get selectedBackgroundAsset;

}
/// @nodoc
class __$LaunchAssetsStateCopyWithImpl<$Res>
    implements _$LaunchAssetsStateCopyWith<$Res> {
  __$LaunchAssetsStateCopyWithImpl(this._self, this._then);

  final _LaunchAssetsState _self;
  final $Res Function(_LaunchAssetsState) _then;

/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? themeId = null,Object? envelope = freezed,Object? assets = null,Object? constraints = freezed,Object? selectedBackgroundColorHex = freezed,Object? selectedForegroundAsset = freezed,Object? selectedBackgroundAsset = freezed,Object? paddingAndroidLegacy = null,Object? paddingAndroidAdaptive = null,Object? paddingIOS = null,Object? paddingWEB = null,Object? status = null,Object? saving = null,Object? error = freezed,}) {
  return _then(_LaunchAssetsState(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,envelope: freezed == envelope ? _self.envelope : envelope // ignore: cast_nullable_to_non_nullable
as LaunchAssetsEnvelope?,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as ConstraintsModel?,selectedBackgroundColorHex: freezed == selectedBackgroundColorHex ? _self.selectedBackgroundColorHex : selectedBackgroundColorHex // ignore: cast_nullable_to_non_nullable
as String?,selectedForegroundAsset: freezed == selectedForegroundAsset ? _self.selectedForegroundAsset : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,selectedBackgroundAsset: freezed == selectedBackgroundAsset ? _self.selectedBackgroundAsset : selectedBackgroundAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,paddingAndroidLegacy: null == paddingAndroidLegacy ? _self.paddingAndroidLegacy : paddingAndroidLegacy // ignore: cast_nullable_to_non_nullable
as double,paddingAndroidAdaptive: null == paddingAndroidAdaptive ? _self.paddingAndroidAdaptive : paddingAndroidAdaptive // ignore: cast_nullable_to_non_nullable
as double,paddingIOS: null == paddingIOS ? _self.paddingIOS : paddingIOS // ignore: cast_nullable_to_non_nullable
as double,paddingWEB: null == paddingWEB ? _self.paddingWEB : paddingWEB // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LaunchAssetsStatus,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchAssetsEnvelopeCopyWith<$Res>? get envelope {
    if (_self.envelope == null) {
    return null;
  }

  return $LaunchAssetsEnvelopeCopyWith<$Res>(_self.envelope!, (value) {
    return _then(_self.copyWith(envelope: value));
  });
}/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstraintsModelCopyWith<$Res>? get constraints {
    if (_self.constraints == null) {
    return null;
  }

  return $ConstraintsModelCopyWith<$Res>(_self.constraints!, (value) {
    return _then(_self.copyWith(constraints: value));
  });
}/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get selectedForegroundAsset {
    if (_self.selectedForegroundAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.selectedForegroundAsset!, (value) {
    return _then(_self.copyWith(selectedForegroundAsset: value));
  });
}/// Create a copy of LaunchAssetsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get selectedBackgroundAsset {
    if (_self.selectedBackgroundAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.selectedBackgroundAsset!, (value) {
    return _then(_self.copyWith(selectedBackgroundAsset: value));
  });
}
}

// dart format on
