// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication_resource_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicationResourceModel {

 String get id; String get applicationId; String get createdAt; String get updatedAt; String? get title; String? get url; String? get note; String? get text;
/// Create a copy of PublicationResourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicationResourceModelCopyWith<PublicationResourceModel> get copyWith => _$PublicationResourceModelCopyWithImpl<PublicationResourceModel>(this as PublicationResourceModel, _$identity);

  /// Serializes this PublicationResourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicationResourceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.note, note) || other.note == note)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,createdAt,updatedAt,title,url,note,text);

@override
String toString() {
  return 'PublicationResourceModel(id: $id, applicationId: $applicationId, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, url: $url, note: $note, text: $text)';
}


}

/// @nodoc
abstract mixin class $PublicationResourceModelCopyWith<$Res>  {
  factory $PublicationResourceModelCopyWith(PublicationResourceModel value, $Res Function(PublicationResourceModel) _then) = _$PublicationResourceModelCopyWithImpl;
@useResult
$Res call({
 String id, String applicationId, String createdAt, String updatedAt, String? title, String? url, String? note, String? text
});




}
/// @nodoc
class _$PublicationResourceModelCopyWithImpl<$Res>
    implements $PublicationResourceModelCopyWith<$Res> {
  _$PublicationResourceModelCopyWithImpl(this._self, this._then);

  final PublicationResourceModel _self;
  final $Res Function(PublicationResourceModel) _then;

/// Create a copy of PublicationResourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? applicationId = null,Object? createdAt = null,Object? updatedAt = null,Object? title = freezed,Object? url = freezed,Object? note = freezed,Object? text = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicationResourceModel].
extension PublicationResourceModelPatterns on PublicationResourceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicationResourceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicationResourceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicationResourceModel value)  $default,){
final _that = this;
switch (_that) {
case _PublicationResourceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicationResourceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PublicationResourceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String applicationId,  String createdAt,  String updatedAt,  String? title,  String? url,  String? note,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicationResourceModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.createdAt,_that.updatedAt,_that.title,_that.url,_that.note,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String applicationId,  String createdAt,  String updatedAt,  String? title,  String? url,  String? note,  String? text)  $default,) {final _that = this;
switch (_that) {
case _PublicationResourceModel():
return $default(_that.id,_that.applicationId,_that.createdAt,_that.updatedAt,_that.title,_that.url,_that.note,_that.text);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String applicationId,  String createdAt,  String updatedAt,  String? title,  String? url,  String? note,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _PublicationResourceModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.createdAt,_that.updatedAt,_that.title,_that.url,_that.note,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicationResourceModel implements PublicationResourceModel {
  const _PublicationResourceModel({required this.id, required this.applicationId, required this.createdAt, required this.updatedAt, this.title, this.url, this.note, this.text});
  factory _PublicationResourceModel.fromJson(Map<String, dynamic> json) => _$PublicationResourceModelFromJson(json);

@override final  String id;
@override final  String applicationId;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? title;
@override final  String? url;
@override final  String? note;
@override final  String? text;

/// Create a copy of PublicationResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicationResourceModelCopyWith<_PublicationResourceModel> get copyWith => __$PublicationResourceModelCopyWithImpl<_PublicationResourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicationResourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicationResourceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.note, note) || other.note == note)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicationId,createdAt,updatedAt,title,url,note,text);

@override
String toString() {
  return 'PublicationResourceModel(id: $id, applicationId: $applicationId, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, url: $url, note: $note, text: $text)';
}


}

/// @nodoc
abstract mixin class _$PublicationResourceModelCopyWith<$Res> implements $PublicationResourceModelCopyWith<$Res> {
  factory _$PublicationResourceModelCopyWith(_PublicationResourceModel value, $Res Function(_PublicationResourceModel) _then) = __$PublicationResourceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String applicationId, String createdAt, String updatedAt, String? title, String? url, String? note, String? text
});




}
/// @nodoc
class __$PublicationResourceModelCopyWithImpl<$Res>
    implements _$PublicationResourceModelCopyWith<$Res> {
  __$PublicationResourceModelCopyWithImpl(this._self, this._then);

  final _PublicationResourceModel _self;
  final $Res Function(_PublicationResourceModel) _then;

/// Create a copy of PublicationResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? applicationId = null,Object? createdAt = null,Object? updatedAt = null,Object? title = freezed,Object? url = freezed,Object? note = freezed,Object? text = freezed,}) {
  return _then(_PublicationResourceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
