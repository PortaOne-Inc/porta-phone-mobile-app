// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AssetsState implements DiagnosticableTreeMixin {

 String get applicationId; AssetsStatus get status; List<AssetModel> get assets; String? get errorMessage;// create flow
 bool get creating; String? get createError;// delete flow
 bool get deleting; String? get deleteError; String? get deletingAssetId;// filters
 bool get lockFilters;
/// Create a copy of AssetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetsStateCopyWith<AssetsState> get copyWith => _$AssetsStateCopyWithImpl<AssetsState>(this as AssetsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssetsState'))
    ..add(DiagnosticsProperty('applicationId', applicationId))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('assets', assets))..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('creating', creating))..add(DiagnosticsProperty('createError', createError))..add(DiagnosticsProperty('deleting', deleting))..add(DiagnosticsProperty('deleteError', deleteError))..add(DiagnosticsProperty('deletingAssetId', deletingAssetId))..add(DiagnosticsProperty('lockFilters', lockFilters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetsState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.assets, assets)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&(identical(other.deleting, deleting) || other.deleting == deleting)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError)&&(identical(other.deletingAssetId, deletingAssetId) || other.deletingAssetId == deletingAssetId)&&(identical(other.lockFilters, lockFilters) || other.lockFilters == lockFilters));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,status,const DeepCollectionEquality().hash(assets),errorMessage,creating,createError,deleting,deleteError,deletingAssetId,lockFilters);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssetsState(applicationId: $applicationId, status: $status, assets: $assets, errorMessage: $errorMessage, creating: $creating, createError: $createError, deleting: $deleting, deleteError: $deleteError, deletingAssetId: $deletingAssetId, lockFilters: $lockFilters)';
}


}

/// @nodoc
abstract mixin class $AssetsStateCopyWith<$Res>  {
  factory $AssetsStateCopyWith(AssetsState value, $Res Function(AssetsState) _then) = _$AssetsStateCopyWithImpl;
@useResult
$Res call({
 String applicationId, AssetsStatus status, List<AssetModel> assets, String? errorMessage, bool creating, String? createError, bool deleting, String? deleteError, String? deletingAssetId, bool lockFilters
});




}
/// @nodoc
class _$AssetsStateCopyWithImpl<$Res>
    implements $AssetsStateCopyWith<$Res> {
  _$AssetsStateCopyWithImpl(this._self, this._then);

  final AssetsState _self;
  final $Res Function(AssetsState) _then;

/// Create a copy of AssetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? status = null,Object? assets = null,Object? errorMessage = freezed,Object? creating = null,Object? createError = freezed,Object? deleting = null,Object? deleteError = freezed,Object? deletingAssetId = freezed,Object? lockFilters = null,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AssetsStatus,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,deleting: null == deleting ? _self.deleting : deleting // ignore: cast_nullable_to_non_nullable
as bool,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,deletingAssetId: freezed == deletingAssetId ? _self.deletingAssetId : deletingAssetId // ignore: cast_nullable_to_non_nullable
as String?,lockFilters: null == lockFilters ? _self.lockFilters : lockFilters // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetsState].
extension AssetsStatePatterns on AssetsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetsState value)  $default,){
final _that = this;
switch (_that) {
case _AssetsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetsState value)?  $default,){
final _that = this;
switch (_that) {
case _AssetsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  AssetsStatus status,  List<AssetModel> assets,  String? errorMessage,  bool creating,  String? createError,  bool deleting,  String? deleteError,  String? deletingAssetId,  bool lockFilters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetsState() when $default != null:
return $default(_that.applicationId,_that.status,_that.assets,_that.errorMessage,_that.creating,_that.createError,_that.deleting,_that.deleteError,_that.deletingAssetId,_that.lockFilters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  AssetsStatus status,  List<AssetModel> assets,  String? errorMessage,  bool creating,  String? createError,  bool deleting,  String? deleteError,  String? deletingAssetId,  bool lockFilters)  $default,) {final _that = this;
switch (_that) {
case _AssetsState():
return $default(_that.applicationId,_that.status,_that.assets,_that.errorMessage,_that.creating,_that.createError,_that.deleting,_that.deleteError,_that.deletingAssetId,_that.lockFilters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  AssetsStatus status,  List<AssetModel> assets,  String? errorMessage,  bool creating,  String? createError,  bool deleting,  String? deleteError,  String? deletingAssetId,  bool lockFilters)?  $default,) {final _that = this;
switch (_that) {
case _AssetsState() when $default != null:
return $default(_that.applicationId,_that.status,_that.assets,_that.errorMessage,_that.creating,_that.createError,_that.deleting,_that.deleteError,_that.deletingAssetId,_that.lockFilters);case _:
  return null;

}
}

}

/// @nodoc


class _AssetsState with DiagnosticableTreeMixin implements AssetsState {
  const _AssetsState({required this.applicationId, this.status = AssetsStatus.initial, final  List<AssetModel> assets = const <AssetModel>[], this.errorMessage, this.creating = false, this.createError, this.deleting = false, this.deleteError, this.deletingAssetId, this.lockFilters = false}): _assets = assets;
  

@override final  String applicationId;
@override@JsonKey() final  AssetsStatus status;
 final  List<AssetModel> _assets;
@override@JsonKey() List<AssetModel> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

@override final  String? errorMessage;
// create flow
@override@JsonKey() final  bool creating;
@override final  String? createError;
// delete flow
@override@JsonKey() final  bool deleting;
@override final  String? deleteError;
@override final  String? deletingAssetId;
// filters
@override@JsonKey() final  bool lockFilters;

/// Create a copy of AssetsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetsStateCopyWith<_AssetsState> get copyWith => __$AssetsStateCopyWithImpl<_AssetsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AssetsState'))
    ..add(DiagnosticsProperty('applicationId', applicationId))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('assets', assets))..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('creating', creating))..add(DiagnosticsProperty('createError', createError))..add(DiagnosticsProperty('deleting', deleting))..add(DiagnosticsProperty('deleteError', deleteError))..add(DiagnosticsProperty('deletingAssetId', deletingAssetId))..add(DiagnosticsProperty('lockFilters', lockFilters));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetsState&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._assets, _assets)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&(identical(other.deleting, deleting) || other.deleting == deleting)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError)&&(identical(other.deletingAssetId, deletingAssetId) || other.deletingAssetId == deletingAssetId)&&(identical(other.lockFilters, lockFilters) || other.lockFilters == lockFilters));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,status,const DeepCollectionEquality().hash(_assets),errorMessage,creating,createError,deleting,deleteError,deletingAssetId,lockFilters);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AssetsState(applicationId: $applicationId, status: $status, assets: $assets, errorMessage: $errorMessage, creating: $creating, createError: $createError, deleting: $deleting, deleteError: $deleteError, deletingAssetId: $deletingAssetId, lockFilters: $lockFilters)';
}


}

/// @nodoc
abstract mixin class _$AssetsStateCopyWith<$Res> implements $AssetsStateCopyWith<$Res> {
  factory _$AssetsStateCopyWith(_AssetsState value, $Res Function(_AssetsState) _then) = __$AssetsStateCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, AssetsStatus status, List<AssetModel> assets, String? errorMessage, bool creating, String? createError, bool deleting, String? deleteError, String? deletingAssetId, bool lockFilters
});




}
/// @nodoc
class __$AssetsStateCopyWithImpl<$Res>
    implements _$AssetsStateCopyWith<$Res> {
  __$AssetsStateCopyWithImpl(this._self, this._then);

  final _AssetsState _self;
  final $Res Function(_AssetsState) _then;

/// Create a copy of AssetsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? status = null,Object? assets = null,Object? errorMessage = freezed,Object? creating = null,Object? createError = freezed,Object? deleting = null,Object? deleteError = freezed,Object? deletingAssetId = freezed,Object? lockFilters = null,}) {
  return _then(_AssetsState(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AssetsStatus,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,deleting: null == deleting ? _self.deleting : deleting // ignore: cast_nullable_to_non_nullable
as bool,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,deletingAssetId: freezed == deletingAssetId ? _self.deletingAssetId : deletingAssetId // ignore: cast_nullable_to_non_nullable
as String?,lockFilters: null == lockFilters ? _self.lockFilters : lockFilters // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
