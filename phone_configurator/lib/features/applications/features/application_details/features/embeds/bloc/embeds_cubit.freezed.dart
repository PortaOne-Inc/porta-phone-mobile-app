// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'embeds_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmbedsState {

 EmbedsStatus get status; List<EmbeddedResourceModel> get items; String? get errorMessage;// delete
 Set<String> get deletingIds; String? get deleteError;// create
 bool get creating; String? get createError;// update
 Set<String> get updatingIds; String? get updateError;
/// Create a copy of EmbedsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbedsStateCopyWith<EmbedsState> get copyWith => _$EmbedsStateCopyWithImpl<EmbedsState>(this as EmbedsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbedsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.deletingIds, deletingIds)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&const DeepCollectionEquality().equals(other.updatingIds, updatingIds)&&(identical(other.updateError, updateError) || other.updateError == updateError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),errorMessage,const DeepCollectionEquality().hash(deletingIds),deleteError,creating,createError,const DeepCollectionEquality().hash(updatingIds),updateError);

@override
String toString() {
  return 'EmbedsState(status: $status, items: $items, errorMessage: $errorMessage, deletingIds: $deletingIds, deleteError: $deleteError, creating: $creating, createError: $createError, updatingIds: $updatingIds, updateError: $updateError)';
}


}

/// @nodoc
abstract mixin class $EmbedsStateCopyWith<$Res>  {
  factory $EmbedsStateCopyWith(EmbedsState value, $Res Function(EmbedsState) _then) = _$EmbedsStateCopyWithImpl;
@useResult
$Res call({
 EmbedsStatus status, List<EmbeddedResourceModel> items, String? errorMessage, Set<String> deletingIds, String? deleteError, bool creating, String? createError, Set<String> updatingIds, String? updateError
});




}
/// @nodoc
class _$EmbedsStateCopyWithImpl<$Res>
    implements $EmbedsStateCopyWith<$Res> {
  _$EmbedsStateCopyWithImpl(this._self, this._then);

  final EmbedsState _self;
  final $Res Function(EmbedsState) _then;

/// Create a copy of EmbedsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? errorMessage = freezed,Object? deletingIds = null,Object? deleteError = freezed,Object? creating = null,Object? createError = freezed,Object? updatingIds = null,Object? updateError = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EmbedsStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,deletingIds: null == deletingIds ? _self.deletingIds : deletingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,updatingIds: null == updatingIds ? _self.updatingIds : updatingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmbedsState].
extension EmbedsStatePatterns on EmbedsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmbedsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmbedsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmbedsState value)  $default,){
final _that = this;
switch (_that) {
case _EmbedsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmbedsState value)?  $default,){
final _that = this;
switch (_that) {
case _EmbedsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmbedsStatus status,  List<EmbeddedResourceModel> items,  String? errorMessage,  Set<String> deletingIds,  String? deleteError,  bool creating,  String? createError,  Set<String> updatingIds,  String? updateError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmbedsState() when $default != null:
return $default(_that.status,_that.items,_that.errorMessage,_that.deletingIds,_that.deleteError,_that.creating,_that.createError,_that.updatingIds,_that.updateError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmbedsStatus status,  List<EmbeddedResourceModel> items,  String? errorMessage,  Set<String> deletingIds,  String? deleteError,  bool creating,  String? createError,  Set<String> updatingIds,  String? updateError)  $default,) {final _that = this;
switch (_that) {
case _EmbedsState():
return $default(_that.status,_that.items,_that.errorMessage,_that.deletingIds,_that.deleteError,_that.creating,_that.createError,_that.updatingIds,_that.updateError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmbedsStatus status,  List<EmbeddedResourceModel> items,  String? errorMessage,  Set<String> deletingIds,  String? deleteError,  bool creating,  String? createError,  Set<String> updatingIds,  String? updateError)?  $default,) {final _that = this;
switch (_that) {
case _EmbedsState() when $default != null:
return $default(_that.status,_that.items,_that.errorMessage,_that.deletingIds,_that.deleteError,_that.creating,_that.createError,_that.updatingIds,_that.updateError);case _:
  return null;

}
}

}

/// @nodoc


class _EmbedsState implements EmbedsState {
  const _EmbedsState({this.status = EmbedsStatus.initial, final  List<EmbeddedResourceModel> items = const <EmbeddedResourceModel>[], this.errorMessage, final  Set<String> deletingIds = const <String>{}, this.deleteError, this.creating = false, this.createError, final  Set<String> updatingIds = const <String>{}, this.updateError}): _items = items,_deletingIds = deletingIds,_updatingIds = updatingIds;
  

@override@JsonKey() final  EmbedsStatus status;
 final  List<EmbeddedResourceModel> _items;
@override@JsonKey() List<EmbeddedResourceModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? errorMessage;
// delete
 final  Set<String> _deletingIds;
// delete
@override@JsonKey() Set<String> get deletingIds {
  if (_deletingIds is EqualUnmodifiableSetView) return _deletingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_deletingIds);
}

@override final  String? deleteError;
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

/// Create a copy of EmbedsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbedsStateCopyWith<_EmbedsState> get copyWith => __$EmbedsStateCopyWithImpl<_EmbedsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbedsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._deletingIds, _deletingIds)&&(identical(other.deleteError, deleteError) || other.deleteError == deleteError)&&(identical(other.creating, creating) || other.creating == creating)&&(identical(other.createError, createError) || other.createError == createError)&&const DeepCollectionEquality().equals(other._updatingIds, _updatingIds)&&(identical(other.updateError, updateError) || other.updateError == updateError));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),errorMessage,const DeepCollectionEquality().hash(_deletingIds),deleteError,creating,createError,const DeepCollectionEquality().hash(_updatingIds),updateError);

@override
String toString() {
  return 'EmbedsState(status: $status, items: $items, errorMessage: $errorMessage, deletingIds: $deletingIds, deleteError: $deleteError, creating: $creating, createError: $createError, updatingIds: $updatingIds, updateError: $updateError)';
}


}

/// @nodoc
abstract mixin class _$EmbedsStateCopyWith<$Res> implements $EmbedsStateCopyWith<$Res> {
  factory _$EmbedsStateCopyWith(_EmbedsState value, $Res Function(_EmbedsState) _then) = __$EmbedsStateCopyWithImpl;
@override @useResult
$Res call({
 EmbedsStatus status, List<EmbeddedResourceModel> items, String? errorMessage, Set<String> deletingIds, String? deleteError, bool creating, String? createError, Set<String> updatingIds, String? updateError
});




}
/// @nodoc
class __$EmbedsStateCopyWithImpl<$Res>
    implements _$EmbedsStateCopyWith<$Res> {
  __$EmbedsStateCopyWithImpl(this._self, this._then);

  final _EmbedsState _self;
  final $Res Function(_EmbedsState) _then;

/// Create a copy of EmbedsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? errorMessage = freezed,Object? deletingIds = null,Object? deleteError = freezed,Object? creating = null,Object? createError = freezed,Object? updatingIds = null,Object? updateError = freezed,}) {
  return _then(_EmbedsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EmbedsStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,deletingIds: null == deletingIds ? _self._deletingIds : deletingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,deleteError: freezed == deleteError ? _self.deleteError : deleteError // ignore: cast_nullable_to_non_nullable
as String?,creating: null == creating ? _self.creating : creating // ignore: cast_nullable_to_non_nullable
as bool,createError: freezed == createError ? _self.createError : createError // ignore: cast_nullable_to_non_nullable
as String?,updatingIds: null == updatingIds ? _self._updatingIds : updatingIds // ignore: cast_nullable_to_non_nullable
as Set<String>,updateError: freezed == updateError ? _self.updateError : updateError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
