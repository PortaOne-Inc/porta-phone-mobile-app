// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeHistoryState {

 ThemeHistoryStatus get status; List<ThemeHistoryEntryModel> get items; String? get nextCursor; bool get isLoadingMore; String? get errorMessage;
/// Create a copy of ThemeHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeHistoryStateCopyWith<ThemeHistoryState> get copyWith => _$ThemeHistoryStateCopyWithImpl<ThemeHistoryState>(this as ThemeHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),nextCursor,isLoadingMore,errorMessage);

@override
String toString() {
  return 'ThemeHistoryState(status: $status, items: $items, nextCursor: $nextCursor, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ThemeHistoryStateCopyWith<$Res>  {
  factory $ThemeHistoryStateCopyWith(ThemeHistoryState value, $Res Function(ThemeHistoryState) _then) = _$ThemeHistoryStateCopyWithImpl;
@useResult
$Res call({
 ThemeHistoryStatus status, List<ThemeHistoryEntryModel> items, String? nextCursor, bool isLoadingMore, String? errorMessage
});




}
/// @nodoc
class _$ThemeHistoryStateCopyWithImpl<$Res>
    implements $ThemeHistoryStateCopyWith<$Res> {
  _$ThemeHistoryStateCopyWithImpl(this._self, this._then);

  final ThemeHistoryState _self;
  final $Res Function(ThemeHistoryState) _then;

/// Create a copy of ThemeHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? nextCursor = freezed,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeHistoryStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ThemeHistoryEntryModel>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeHistoryState].
extension ThemeHistoryStatePatterns on ThemeHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _ThemeHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeHistoryStatus status,  List<ThemeHistoryEntryModel> items,  String? nextCursor,  bool isLoadingMore,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeHistoryState() when $default != null:
return $default(_that.status,_that.items,_that.nextCursor,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeHistoryStatus status,  List<ThemeHistoryEntryModel> items,  String? nextCursor,  bool isLoadingMore,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ThemeHistoryState():
return $default(_that.status,_that.items,_that.nextCursor,_that.isLoadingMore,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeHistoryStatus status,  List<ThemeHistoryEntryModel> items,  String? nextCursor,  bool isLoadingMore,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ThemeHistoryState() when $default != null:
return $default(_that.status,_that.items,_that.nextCursor,_that.isLoadingMore,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeHistoryState implements ThemeHistoryState {
  const _ThemeHistoryState({required this.status, final  List<ThemeHistoryEntryModel> items = const [], this.nextCursor, this.isLoadingMore = false, this.errorMessage}): _items = items;
  

@override final  ThemeHistoryStatus status;
 final  List<ThemeHistoryEntryModel> _items;
@override@JsonKey() List<ThemeHistoryEntryModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? nextCursor;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? errorMessage;

/// Create a copy of ThemeHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeHistoryStateCopyWith<_ThemeHistoryState> get copyWith => __$ThemeHistoryStateCopyWithImpl<_ThemeHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),nextCursor,isLoadingMore,errorMessage);

@override
String toString() {
  return 'ThemeHistoryState(status: $status, items: $items, nextCursor: $nextCursor, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ThemeHistoryStateCopyWith<$Res> implements $ThemeHistoryStateCopyWith<$Res> {
  factory _$ThemeHistoryStateCopyWith(_ThemeHistoryState value, $Res Function(_ThemeHistoryState) _then) = __$ThemeHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeHistoryStatus status, List<ThemeHistoryEntryModel> items, String? nextCursor, bool isLoadingMore, String? errorMessage
});




}
/// @nodoc
class __$ThemeHistoryStateCopyWithImpl<$Res>
    implements _$ThemeHistoryStateCopyWith<$Res> {
  __$ThemeHistoryStateCopyWithImpl(this._self, this._then);

  final _ThemeHistoryState _self;
  final $Res Function(_ThemeHistoryState) _then;

/// Create a copy of ThemeHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? nextCursor = freezed,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_ThemeHistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeHistoryStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ThemeHistoryEntryModel>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
