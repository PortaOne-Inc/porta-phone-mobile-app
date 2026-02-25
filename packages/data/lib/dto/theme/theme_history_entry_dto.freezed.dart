// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_history_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeHistoryEntryDto {

 String get id; String get themeId; String get applicationId; int get snapshotVersion; String get action; String get createdAt; String? get changedBy; Map<String, dynamic>? get snapshot; int get schemaVersion; String get tag; String get description;
/// Create a copy of ThemeHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeHistoryEntryDtoCopyWith<ThemeHistoryEntryDto> get copyWith => _$ThemeHistoryEntryDtoCopyWithImpl<ThemeHistoryEntryDto>(this as ThemeHistoryEntryDto, _$identity);

  /// Serializes this ThemeHistoryEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeHistoryEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.snapshotVersion, snapshotVersion) || other.snapshotVersion == snapshotVersion)&&(identical(other.action, action) || other.action == action)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&const DeepCollectionEquality().equals(other.snapshot, snapshot)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,themeId,applicationId,snapshotVersion,action,createdAt,changedBy,const DeepCollectionEquality().hash(snapshot),schemaVersion,tag,description);

@override
String toString() {
  return 'ThemeHistoryEntryDto(id: $id, themeId: $themeId, applicationId: $applicationId, snapshotVersion: $snapshotVersion, action: $action, createdAt: $createdAt, changedBy: $changedBy, snapshot: $snapshot, schemaVersion: $schemaVersion, tag: $tag, description: $description)';
}


}

/// @nodoc
abstract mixin class $ThemeHistoryEntryDtoCopyWith<$Res>  {
  factory $ThemeHistoryEntryDtoCopyWith(ThemeHistoryEntryDto value, $Res Function(ThemeHistoryEntryDto) _then) = _$ThemeHistoryEntryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String themeId, String applicationId, int snapshotVersion, String action, String createdAt, String? changedBy, Map<String, dynamic>? snapshot, int schemaVersion, String tag, String description
});




}
/// @nodoc
class _$ThemeHistoryEntryDtoCopyWithImpl<$Res>
    implements $ThemeHistoryEntryDtoCopyWith<$Res> {
  _$ThemeHistoryEntryDtoCopyWithImpl(this._self, this._then);

  final ThemeHistoryEntryDto _self;
  final $Res Function(ThemeHistoryEntryDto) _then;

/// Create a copy of ThemeHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? themeId = null,Object? applicationId = null,Object? snapshotVersion = null,Object? action = null,Object? createdAt = null,Object? changedBy = freezed,Object? snapshot = freezed,Object? schemaVersion = null,Object? tag = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,snapshotVersion: null == snapshotVersion ? _self.snapshotVersion : snapshotVersion // ignore: cast_nullable_to_non_nullable
as int,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,changedBy: freezed == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String?,snapshot: freezed == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeHistoryEntryDto].
extension ThemeHistoryEntryDtoPatterns on ThemeHistoryEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeHistoryEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeHistoryEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeHistoryEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _ThemeHistoryEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeHistoryEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeHistoryEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String themeId,  String applicationId,  int snapshotVersion,  String action,  String createdAt,  String? changedBy,  Map<String, dynamic>? snapshot,  int schemaVersion,  String tag,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeHistoryEntryDto() when $default != null:
return $default(_that.id,_that.themeId,_that.applicationId,_that.snapshotVersion,_that.action,_that.createdAt,_that.changedBy,_that.snapshot,_that.schemaVersion,_that.tag,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String themeId,  String applicationId,  int snapshotVersion,  String action,  String createdAt,  String? changedBy,  Map<String, dynamic>? snapshot,  int schemaVersion,  String tag,  String description)  $default,) {final _that = this;
switch (_that) {
case _ThemeHistoryEntryDto():
return $default(_that.id,_that.themeId,_that.applicationId,_that.snapshotVersion,_that.action,_that.createdAt,_that.changedBy,_that.snapshot,_that.schemaVersion,_that.tag,_that.description);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String themeId,  String applicationId,  int snapshotVersion,  String action,  String createdAt,  String? changedBy,  Map<String, dynamic>? snapshot,  int schemaVersion,  String tag,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ThemeHistoryEntryDto() when $default != null:
return $default(_that.id,_that.themeId,_that.applicationId,_that.snapshotVersion,_that.action,_that.createdAt,_that.changedBy,_that.snapshot,_that.schemaVersion,_that.tag,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemeHistoryEntryDto implements ThemeHistoryEntryDto {
  const _ThemeHistoryEntryDto({required this.id, required this.themeId, required this.applicationId, required this.snapshotVersion, required this.action, required this.createdAt, this.changedBy, final  Map<String, dynamic>? snapshot, this.schemaVersion = 0, this.tag = '', this.description = ''}): _snapshot = snapshot;
  factory _ThemeHistoryEntryDto.fromJson(Map<String, dynamic> json) => _$ThemeHistoryEntryDtoFromJson(json);

@override final  String id;
@override final  String themeId;
@override final  String applicationId;
@override final  int snapshotVersion;
@override final  String action;
@override final  String createdAt;
@override final  String? changedBy;
 final  Map<String, dynamic>? _snapshot;
@override Map<String, dynamic>? get snapshot {
  final value = _snapshot;
  if (value == null) return null;
  if (_snapshot is EqualUnmodifiableMapView) return _snapshot;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  int schemaVersion;
@override@JsonKey() final  String tag;
@override@JsonKey() final  String description;

/// Create a copy of ThemeHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeHistoryEntryDtoCopyWith<_ThemeHistoryEntryDto> get copyWith => __$ThemeHistoryEntryDtoCopyWithImpl<_ThemeHistoryEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeHistoryEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeHistoryEntryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.themeId, themeId) || other.themeId == themeId)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.snapshotVersion, snapshotVersion) || other.snapshotVersion == snapshotVersion)&&(identical(other.action, action) || other.action == action)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&const DeepCollectionEquality().equals(other._snapshot, _snapshot)&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,themeId,applicationId,snapshotVersion,action,createdAt,changedBy,const DeepCollectionEquality().hash(_snapshot),schemaVersion,tag,description);

@override
String toString() {
  return 'ThemeHistoryEntryDto(id: $id, themeId: $themeId, applicationId: $applicationId, snapshotVersion: $snapshotVersion, action: $action, createdAt: $createdAt, changedBy: $changedBy, snapshot: $snapshot, schemaVersion: $schemaVersion, tag: $tag, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ThemeHistoryEntryDtoCopyWith<$Res> implements $ThemeHistoryEntryDtoCopyWith<$Res> {
  factory _$ThemeHistoryEntryDtoCopyWith(_ThemeHistoryEntryDto value, $Res Function(_ThemeHistoryEntryDto) _then) = __$ThemeHistoryEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String themeId, String applicationId, int snapshotVersion, String action, String createdAt, String? changedBy, Map<String, dynamic>? snapshot, int schemaVersion, String tag, String description
});




}
/// @nodoc
class __$ThemeHistoryEntryDtoCopyWithImpl<$Res>
    implements _$ThemeHistoryEntryDtoCopyWith<$Res> {
  __$ThemeHistoryEntryDtoCopyWithImpl(this._self, this._then);

  final _ThemeHistoryEntryDto _self;
  final $Res Function(_ThemeHistoryEntryDto) _then;

/// Create a copy of ThemeHistoryEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? themeId = null,Object? applicationId = null,Object? snapshotVersion = null,Object? action = null,Object? createdAt = null,Object? changedBy = freezed,Object? snapshot = freezed,Object? schemaVersion = null,Object? tag = null,Object? description = null,}) {
  return _then(_ThemeHistoryEntryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,themeId: null == themeId ? _self.themeId : themeId // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,snapshotVersion: null == snapshotVersion ? _self.snapshotVersion : snapshotVersion // ignore: cast_nullable_to_non_nullable
as int,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,changedBy: freezed == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String?,snapshot: freezed == snapshot ? _self._snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
