// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication_resources_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PublicationResourcesState {

 PubResStatus get status; List<PublicationResourceModel> get items; String? get error;// create
 bool get creating; String? get createError;// update
 Set<String> get updatingIds; String? get updateError;// delete
 Set<String> get deletingIds; String? get deleteError;
/// Create a copy of PublicationResourcesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicationResourcesStateCopyWith<PublicationResourcesState> get copyWith => _$PublicationResourcesStateCopyWithImpl<PublicationResourcesState>(this as PublicationResourcesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicationResourcesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.error, error) || other.error == error)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&const DeepCollectionEquality().equals(other.updatingIds, updatingIds)&&(identical(other.updateError, updateError) || other.updateError == updateError)&&const DeepCollectionEquality().equals(other.deletingIds, deletingIds)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),error,creating,createError,const DeepCollectionEquality().hash(updatingIds),updateError,const DeepCollectionEquality().hash(deletingIds),deleteError);

@override
String toString() {
  return 'PublicationResourcesState(status: $status, items: $items, error: $error, creating: $creating, createError: $createError, updatingIds: $updatingIds, updateError: $updateError, deletingIds: $deletingIds, deleteError: $deleteError)';
}


}

/// @nodoc
abstract mixin class $PublicationResourcesStateCopyWith<$Res>  {
  factory $PublicationResourcesStateCopyWith(PublicationResourcesState value, $Res Function(PublicationResourcesState) _then) = _$PublicationResourcesStateCopyWithImpl;
@useResult
$Res call({
 PubResStatus status, List<PublicationResourceModel> items, String? error, bool creating, String? createError, Set<String> updatingIds, String? updateError, Set<String> deletingIds, String? deleteError
});




}
/// @nodoc
class _$PublicationResourcesStateCopyWithImpl<$Res>
    implements $PublicationResourcesStateCopyWith<$Res> {
  _$PublicationResourcesStateCopyWithImpl(this._self, this._then);

  final PublicationResourcesState _self;
  final $Res Function(PublicationResourcesState) _then;

/// Create a copy of PublicationResourcesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? error = freezed,Object? creating = null,Object? createError = freezed,Object? updatingIds = null,Object? updateError = freezed,Object? deletingIds = null,Object? deleteError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PubResStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PublicationResourceModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,updatingIds: null == updatingIds ? _self.updatingIds : updatingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,deletingIds: null == deletingIds ? _self.deletingIds : deletingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicationResourcesState].
extension PublicationResourcesStatePatterns on PublicationResourcesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicationResourcesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicationResourcesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicationResourcesState value)  $default,){
final _that = this;
switch (_that) {
case _PublicationResourcesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicationResourcesState value)?  $default,){
final _that = this;
switch (_that) {
case _PublicationResourcesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PubResStatus status,  List<PublicationResourceModel> items,  String? error,  bool creating,  String? createError,  Set<String> updatingIds,  String? updateError,  Set<String> deletingIds,  String? deleteError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicationResourcesState() when $default != null:
return $default(_that.status,_that.items,_that.error,_that.creating,_that.createError,_that.updatingIds,_that.updateError,_that.deletingIds,_that.deleteError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PubResStatus status,  List<PublicationResourceModel> items,  String? error,  bool creating,  String? createError,  Set<String> updatingIds,  String? updateError,  Set<String> deletingIds,  String? deleteError)  $default,) {final _that = this;
switch (_that) {
case _PublicationResourcesState():
return $default(_that.status,_that.items,_that.error,_that.creating,_that.createError,_that.updatingIds,_that.updateError,_that.deletingIds,_that.deleteError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PubResStatus status,  List<PublicationResourceModel> items,  String? error,  bool creating,  String? createError,  Set<String> updatingIds,  String? updateError,  Set<String> deletingIds,  String? deleteError)?  $default,) {final _that = this;
switch (_that) {
case _PublicationResourcesState() when $default != null:
return $default(_that.status,_that.items,_that.error,_that.creating,_that.createError,_that.updatingIds,_that.updateError,_that.deletingIds,_that.deleteError);case _:
  return null;

}
}

}

/// @nodoc


class _PublicationResourcesState implements PublicationResourcesState {
  const _PublicationResourcesState({this.status = PubResStatus.initial, final  List<PublicationResourceModel> items = const <PublicationResourceModel>[], this.error, this.creating = false, this.createError, final  Set<String> updatingIds = const <String>{}, this.updateError, final  Set<String> deletingIds = const <String>{}, this.deleteError}): _items = items,_updatingIds = updatingIds,_deletingIds = deletingIds;
  

@override@JsonKey() final  PubResStatus status;
 final  List<PublicationResourceModel> _items;
@override@JsonKey() List<PublicationResourceModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? error;
// create
@override@JsonKey() final  bool creating;
@override final  String? createError;
// update
 final  Set<String> _updatingIds;
// update
@override@JsonKey() Set<String> get updatingIds {
  if (_updatingIds is EqualUnmodifiableSetView) return _updatingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_updatingIds);
}

@override final  String? updateError;
// delete
 final  Set<String> _deletingIds;
// delete
@override@JsonKey() Set<String> get deletingIds {
  if (_deletingIds is EqualUnmodifiableSetView) return _deletingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_deletingIds);
}

@override final  String? deleteError;

/// Create a copy of PublicationResourcesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicationResourcesStateCopyWith<_PublicationResourcesState> get copyWith => __$PublicationResourcesStateCopyWithImpl<_PublicationResourcesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicationResourcesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.error, error) || other.error == error)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&const DeepCollectionEquality().equals(other._updatingIds, _updatingIds)&&(identical(other.updateError, updateError) || other.updateError == updateError)&&const DeepCollectionEquality().equals(other._deletingIds, _deletingIds)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),error,creating,createError,const DeepCollectionEquality().hash(_updatingIds),updateError,const DeepCollectionEquality().hash(_deletingIds),deleteError);

@override
String toString() {
  return 'PublicationResourcesState(status: $status, items: $items, error: $error, creating: $creating, createError: $createError, updatingIds: $updatingIds, updateError: $updateError, deletingIds: $deletingIds, deleteError: $deleteError)';
}


}

/// @nodoc
abstract mixin class _$PublicationResourcesStateCopyWith<$Res> implements $PublicationResourcesStateCopyWith<$Res> {
  factory _$PublicationResourcesStateCopyWith(_PublicationResourcesState value, $Res Function(_PublicationResourcesState) _then) = __$PublicationResourcesStateCopyWithImpl;
@override @useResult
$Res call({
 PubResStatus status, List<PublicationResourceModel> items, String? error, bool creating, String? createError, Set<String> updatingIds, String? updateError, Set<String> deletingIds, String? deleteError
});




}
/// @nodoc
class __$PublicationResourcesStateCopyWithImpl<$Res>
    implements _$PublicationResourcesStateCopyWith<$Res> {
  __$PublicationResourcesStateCopyWithImpl(this._self, this._then);

  final _PublicationResourcesState _self;
  final $Res Function(_PublicationResourcesState) _then;

/// Create a copy of PublicationResourcesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? error = freezed,Object? creating = null,Object? createError = freezed,Object? updatingIds = null,Object? updateError = freezed,Object? deletingIds = null,Object? deleteError = freezed,}) {
  return _then(_PublicationResourcesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PubResStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PublicationResourceModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,updatingIds: null == updatingIds ? _self._updatingIds : updatingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,deletingIds: null == deletingIds ? _self._deletingIds : deletingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
