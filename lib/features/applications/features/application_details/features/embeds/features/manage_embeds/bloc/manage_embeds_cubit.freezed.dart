// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_embeds_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManageEmbedsState {

 ManageEmbedsStatus get status; List<EmbeddedResourceModel> get items; String? get error;// create
 bool get creating; String? get createError;// delete
 Set<String> get deletingIds; String? get deleteError; String? get routeEmbedId;
/// Create a copy of ManageEmbedsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageEmbedsStateCopyWith<ManageEmbedsState> get copyWith => _$ManageEmbedsStateCopyWithImpl<ManageEmbedsState>(this as ManageEmbedsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageEmbedsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.error, error) || other.error == error)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&const DeepCollectionEquality().equals(other.deletingIds, deletingIds)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError)&&(identical(other.routeEmbedId, routeEmbedId) || other.routeEmbedId == routeEmbedId));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),error,creating,createError,const DeepCollectionEquality().hash(deletingIds),deleteError,routeEmbedId);

@override
String toString() {
  return 'ManageEmbedsState(status: $status, items: $items, error: $error, creating: $creating, createError: $createError, deletingIds: $deletingIds, deleteError: $deleteError, routeEmbedId: $routeEmbedId)';
}


}

/// @nodoc
abstract mixin class $ManageEmbedsStateCopyWith<$Res>  {
  factory $ManageEmbedsStateCopyWith(ManageEmbedsState value, $Res Function(ManageEmbedsState) _then) = _$ManageEmbedsStateCopyWithImpl;
@useResult
$Res call({
 ManageEmbedsStatus status, List<EmbeddedResourceModel> items, String? error, bool creating, String? createError, Set<String> deletingIds, String? deleteError, String? routeEmbedId
});




}
/// @nodoc
class _$ManageEmbedsStateCopyWithImpl<$Res>
    implements $ManageEmbedsStateCopyWith<$Res> {
  _$ManageEmbedsStateCopyWithImpl(this._self, this._then);

  final ManageEmbedsState _self;
  final $Res Function(ManageEmbedsState) _then;

/// Create a copy of ManageEmbedsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? error = freezed,Object? creating = null,Object? createError = freezed,Object? deletingIds = null,Object? deleteError = freezed,Object? routeEmbedId = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ManageEmbedsStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,deletingIds: null == deletingIds ? _self.deletingIds : deletingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,routeEmbedId: freezed == routeEmbedId ? _self.routeEmbedId : routeEmbedId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageEmbedsState].
extension ManageEmbedsStatePatterns on ManageEmbedsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageEmbedsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageEmbedsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageEmbedsState value)  $default,){
final _that = this;
switch (_that) {
case _ManageEmbedsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageEmbedsState value)?  $default,){
final _that = this;
switch (_that) {
case _ManageEmbedsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ManageEmbedsStatus status,  List<EmbeddedResourceModel> items,  String? error,  bool creating,  String? createError,  Set<String> deletingIds,  String? deleteError,  String? routeEmbedId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageEmbedsState() when $default != null:
return $default(_that.status,_that.items,_that.error,_that.creating,_that.createError,_that.deletingIds,_that.deleteError,_that.routeEmbedId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ManageEmbedsStatus status,  List<EmbeddedResourceModel> items,  String? error,  bool creating,  String? createError,  Set<String> deletingIds,  String? deleteError,  String? routeEmbedId)  $default,) {final _that = this;
switch (_that) {
case _ManageEmbedsState():
return $default(_that.status,_that.items,_that.error,_that.creating,_that.createError,_that.deletingIds,_that.deleteError,_that.routeEmbedId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ManageEmbedsStatus status,  List<EmbeddedResourceModel> items,  String? error,  bool creating,  String? createError,  Set<String> deletingIds,  String? deleteError,  String? routeEmbedId)?  $default,) {final _that = this;
switch (_that) {
case _ManageEmbedsState() when $default != null:
return $default(_that.status,_that.items,_that.error,_that.creating,_that.createError,_that.deletingIds,_that.deleteError,_that.routeEmbedId);case _:
  return null;

}
}

}

/// @nodoc


class _ManageEmbedsState implements ManageEmbedsState {
  const _ManageEmbedsState({this.status = ManageEmbedsStatus.initial, final  List<EmbeddedResourceModel> items = const <EmbeddedResourceModel>[], this.error, this.creating = false, this.createError, final  Set<String> deletingIds = const <String>{}, this.deleteError, this.routeEmbedId}): _items = items,_deletingIds = deletingIds;
  

@override@JsonKey() final  ManageEmbedsStatus status;
 final  List<EmbeddedResourceModel> _items;
@override@JsonKey() List<EmbeddedResourceModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? error;
// create
@override@JsonKey() final  bool creating;
@override final  String? createError;
// delete
 final  Set<String> _deletingIds;
// delete
@override@JsonKey() Set<String> get deletingIds {
  if (_deletingIds is EqualUnmodifiableSetView) return _deletingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_deletingIds);
}

@override final  String? deleteError;
@override final  String? routeEmbedId;

/// Create a copy of ManageEmbedsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageEmbedsStateCopyWith<_ManageEmbedsState> get copyWith => __$ManageEmbedsStateCopyWithImpl<_ManageEmbedsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageEmbedsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.error, error) || other.error == error)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&const DeepCollectionEquality().equals(other._deletingIds, _deletingIds)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError)&&(identical(other.routeEmbedId, routeEmbedId) || other.routeEmbedId == routeEmbedId));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),error,creating,createError,const DeepCollectionEquality().hash(_deletingIds),deleteError,routeEmbedId);

@override
String toString() {
  return 'ManageEmbedsState(status: $status, items: $items, error: $error, creating: $creating, createError: $createError, deletingIds: $deletingIds, deleteError: $deleteError, routeEmbedId: $routeEmbedId)';
}


}

/// @nodoc
abstract mixin class _$ManageEmbedsStateCopyWith<$Res> implements $ManageEmbedsStateCopyWith<$Res> {
  factory _$ManageEmbedsStateCopyWith(_ManageEmbedsState value, $Res Function(_ManageEmbedsState) _then) = __$ManageEmbedsStateCopyWithImpl;
@override @useResult
$Res call({
 ManageEmbedsStatus status, List<EmbeddedResourceModel> items, String? error, bool creating, String? createError, Set<String> deletingIds, String? deleteError, String? routeEmbedId
});




}
/// @nodoc
class __$ManageEmbedsStateCopyWithImpl<$Res>
    implements _$ManageEmbedsStateCopyWith<$Res> {
  __$ManageEmbedsStateCopyWithImpl(this._self, this._then);

  final _ManageEmbedsState _self;
  final $Res Function(_ManageEmbedsState) _then;

/// Create a copy of ManageEmbedsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? error = freezed,Object? creating = null,Object? createError = freezed,Object? deletingIds = null,Object? deleteError = freezed,Object? routeEmbedId = freezed,}) {
  return _then(_ManageEmbedsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ManageEmbedsStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,deletingIds: null == deletingIds ? _self._deletingIds : deletingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,routeEmbedId: freezed == routeEmbedId ? _self.routeEmbedId : routeEmbedId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
