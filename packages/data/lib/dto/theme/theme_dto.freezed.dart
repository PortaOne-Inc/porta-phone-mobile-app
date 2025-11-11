// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeDTO {

 String? get id; String? get applicationId; String? get title; String? get previewAssetId; String? get status; bool? get isDefault; int? get version; int? get sortIndex; int? get assetsCount; int? get embedsCount; bool? get featureAccessExists; String? get createdBy; String? get updatedBy; String? get createdAt; String? get updatedAt; String? get deletedAt; String? get slug; String? get description; String? get parentThemeId; List<String> get tags;
/// Create a copy of ThemeDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeDTOCopyWith<ThemeDTO> get copyWith => _$ThemeDTOCopyWithImpl<ThemeDTO>(this as ThemeDTO, _$identity);

  /// Serializes this ThemeDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.title, title) || other.title == title)&&(identical(other.previewAssetId, previewAssetId) || other.previewAssetId == previewAssetId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.assetsCount, assetsCount) || other.assetsCount == assetsCount)&&(identical(other.embedsCount, embedsCount) || other.embedsCount == embedsCount)&&(identical(other.featureAccessExists, featureAccessExists) || other.featureAccessExists == featureAccessExists)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.parentThemeId, parentThemeId) || other.parentThemeId == parentThemeId)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,applicationId,title,previewAssetId,status,isDefault,version,sortIndex,assetsCount,embedsCount,featureAccessExists,createdBy,updatedBy,createdAt,updatedAt,deletedAt,slug,description,parentThemeId,const DeepCollectionEquality().hash(tags)]);

@override
String toString() {
  return 'ThemeDTO(id: $id, applicationId: $applicationId, title: $title, previewAssetId: $previewAssetId, status: $status, isDefault: $isDefault, version: $version, sortIndex: $sortIndex, assetsCount: $assetsCount, embedsCount: $embedsCount, featureAccessExists: $featureAccessExists, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, slug: $slug, description: $description, parentThemeId: $parentThemeId, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ThemeDTOCopyWith<$Res>  {
  factory $ThemeDTOCopyWith(ThemeDTO value, $Res Function(ThemeDTO) _then) = _$ThemeDTOCopyWithImpl;
@useResult
$Res call({
 String? id, String? applicationId, String? title, String? previewAssetId, String? status, bool? isDefault, int? version, int? sortIndex, int? assetsCount, int? embedsCount, bool? featureAccessExists, String? createdBy, String? updatedBy, String? createdAt, String? updatedAt, String? deletedAt, String? slug, String? description, String? parentThemeId, List<String> tags
});




}
/// @nodoc
class _$ThemeDTOCopyWithImpl<$Res>
    implements $ThemeDTOCopyWith<$Res> {
  _$ThemeDTOCopyWithImpl(this._self, this._then);

  final ThemeDTO _self;
  final $Res Function(ThemeDTO) _then;

/// Create a copy of ThemeDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? applicationId = freezed,Object? title = freezed,Object? previewAssetId = freezed,Object? status = freezed,Object? isDefault = freezed,Object? version = freezed,Object? sortIndex = freezed,Object? assetsCount = freezed,Object? embedsCount = freezed,Object? featureAccessExists = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? slug = freezed,Object? description = freezed,Object? parentThemeId = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,previewAssetId: freezed == previewAssetId ? _self.previewAssetId : previewAssetId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,assetsCount: freezed == assetsCount ? _self.assetsCount : assetsCount // ignore: cast_nullable_to_non_nullable
as int?,embedsCount: freezed == embedsCount ? _self.embedsCount : embedsCount // ignore: cast_nullable_to_non_nullable
as int?,featureAccessExists: freezed == featureAccessExists ? _self.featureAccessExists : featureAccessExists // ignore: cast_nullable_to_non_nullable
as bool?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parentThemeId: freezed == parentThemeId ? _self.parentThemeId : parentThemeId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeDTO].
extension ThemeDTOPatterns on ThemeDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeDTO value)  $default,){
final _that = this;
switch (_that) {
case _ThemeDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? applicationId,  String? title,  String? previewAssetId,  String? status,  bool? isDefault,  int? version,  int? sortIndex,  int? assetsCount,  int? embedsCount,  bool? featureAccessExists,  String? createdBy,  String? updatedBy,  String? createdAt,  String? updatedAt,  String? deletedAt,  String? slug,  String? description,  String? parentThemeId,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeDTO() when $default != null:
return $default(_that.id,_that.applicationId,_that.title,_that.previewAssetId,_that.status,_that.isDefault,_that.version,_that.sortIndex,_that.assetsCount,_that.embedsCount,_that.featureAccessExists,_that.createdBy,_that.updatedBy,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.slug,_that.description,_that.parentThemeId,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? applicationId,  String? title,  String? previewAssetId,  String? status,  bool? isDefault,  int? version,  int? sortIndex,  int? assetsCount,  int? embedsCount,  bool? featureAccessExists,  String? createdBy,  String? updatedBy,  String? createdAt,  String? updatedAt,  String? deletedAt,  String? slug,  String? description,  String? parentThemeId,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _ThemeDTO():
return $default(_that.id,_that.applicationId,_that.title,_that.previewAssetId,_that.status,_that.isDefault,_that.version,_that.sortIndex,_that.assetsCount,_that.embedsCount,_that.featureAccessExists,_that.createdBy,_that.updatedBy,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.slug,_that.description,_that.parentThemeId,_that.tags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? applicationId,  String? title,  String? previewAssetId,  String? status,  bool? isDefault,  int? version,  int? sortIndex,  int? assetsCount,  int? embedsCount,  bool? featureAccessExists,  String? createdBy,  String? updatedBy,  String? createdAt,  String? updatedAt,  String? deletedAt,  String? slug,  String? description,  String? parentThemeId,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _ThemeDTO() when $default != null:
return $default(_that.id,_that.applicationId,_that.title,_that.previewAssetId,_that.status,_that.isDefault,_that.version,_that.sortIndex,_that.assetsCount,_that.embedsCount,_that.featureAccessExists,_that.createdBy,_that.updatedBy,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.slug,_that.description,_that.parentThemeId,_that.tags);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ThemeDTO extends ThemeDTO {
  const _ThemeDTO({this.id, this.applicationId, this.title, this.previewAssetId, this.status, this.isDefault, this.version, this.sortIndex, this.assetsCount, this.embedsCount, this.featureAccessExists, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt, this.slug, this.description, this.parentThemeId, this.tags = const <String>[]}): super._();
  factory _ThemeDTO.fromJson(Map<String, dynamic> json) => _$ThemeDTOFromJson(json);

@override final  String? id;
@override final  String? applicationId;
@override final  String? title;
@override final  String? previewAssetId;
@override final  String? status;
@override final  bool? isDefault;
@override final  int? version;
@override final  int? sortIndex;
@override final  int? assetsCount;
@override final  int? embedsCount;
@override final  bool? featureAccessExists;
@override final  String? createdBy;
@override final  String? updatedBy;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  String? slug;
@override final  String? description;
@override final  String? parentThemeId;
@override@JsonKey() final  List<String> tags;

/// Create a copy of ThemeDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeDTOCopyWith<_ThemeDTO> get copyWith => __$ThemeDTOCopyWithImpl<_ThemeDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.title, title) || other.title == title)&&(identical(other.previewAssetId, previewAssetId) || other.previewAssetId == previewAssetId)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.assetsCount, assetsCount) || other.assetsCount == assetsCount)&&(identical(other.embedsCount, embedsCount) || other.embedsCount == embedsCount)&&(identical(other.featureAccessExists, featureAccessExists) || other.featureAccessExists == featureAccessExists)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.parentThemeId, parentThemeId) || other.parentThemeId == parentThemeId)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,applicationId,title,previewAssetId,status,isDefault,version,sortIndex,assetsCount,embedsCount,featureAccessExists,createdBy,updatedBy,createdAt,updatedAt,deletedAt,slug,description,parentThemeId,const DeepCollectionEquality().hash(tags)]);

@override
String toString() {
  return 'ThemeDTO(id: $id, applicationId: $applicationId, title: $title, previewAssetId: $previewAssetId, status: $status, isDefault: $isDefault, version: $version, sortIndex: $sortIndex, assetsCount: $assetsCount, embedsCount: $embedsCount, featureAccessExists: $featureAccessExists, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, slug: $slug, description: $description, parentThemeId: $parentThemeId, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ThemeDTOCopyWith<$Res> implements $ThemeDTOCopyWith<$Res> {
  factory _$ThemeDTOCopyWith(_ThemeDTO value, $Res Function(_ThemeDTO) _then) = __$ThemeDTOCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? applicationId, String? title, String? previewAssetId, String? status, bool? isDefault, int? version, int? sortIndex, int? assetsCount, int? embedsCount, bool? featureAccessExists, String? createdBy, String? updatedBy, String? createdAt, String? updatedAt, String? deletedAt, String? slug, String? description, String? parentThemeId, List<String> tags
});




}
/// @nodoc
class __$ThemeDTOCopyWithImpl<$Res>
    implements _$ThemeDTOCopyWith<$Res> {
  __$ThemeDTOCopyWithImpl(this._self, this._then);

  final _ThemeDTO _self;
  final $Res Function(_ThemeDTO) _then;

/// Create a copy of ThemeDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? applicationId = freezed,Object? title = freezed,Object? previewAssetId = freezed,Object? status = freezed,Object? isDefault = freezed,Object? version = freezed,Object? sortIndex = freezed,Object? assetsCount = freezed,Object? embedsCount = freezed,Object? featureAccessExists = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? slug = freezed,Object? description = freezed,Object? parentThemeId = freezed,Object? tags = null,}) {
  return _then(_ThemeDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,previewAssetId: freezed == previewAssetId ? _self.previewAssetId : previewAssetId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isDefault: freezed == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,assetsCount: freezed == assetsCount ? _self.assetsCount : assetsCount // ignore: cast_nullable_to_non_nullable
as int?,embedsCount: freezed == embedsCount ? _self.embedsCount : embedsCount // ignore: cast_nullable_to_non_nullable
as int?,featureAccessExists: freezed == featureAccessExists ? _self.featureAccessExists : featureAccessExists // ignore: cast_nullable_to_non_nullable
as bool?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,parentThemeId: freezed == parentThemeId ? _self.parentThemeId : parentThemeId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$CreateThemeDTO {

/// Title of the theme (required, max 120 chars).
 String get title;/// Optional description (max 2000 chars).
 String? get description;/// Label for environment separation.
/// Defaults to "dev" if not provided.
 String get label;
/// Create a copy of CreateThemeDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateThemeDTOCopyWith<CreateThemeDTO> get copyWith => _$CreateThemeDTOCopyWithImpl<CreateThemeDTO>(this as CreateThemeDTO, _$identity);

  /// Serializes this CreateThemeDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateThemeDTO&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,label);

@override
String toString() {
  return 'CreateThemeDTO(title: $title, description: $description, label: $label)';
}


}

/// @nodoc
abstract mixin class $CreateThemeDTOCopyWith<$Res>  {
  factory $CreateThemeDTOCopyWith(CreateThemeDTO value, $Res Function(CreateThemeDTO) _then) = _$CreateThemeDTOCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String label
});




}
/// @nodoc
class _$CreateThemeDTOCopyWithImpl<$Res>
    implements $CreateThemeDTOCopyWith<$Res> {
  _$CreateThemeDTOCopyWithImpl(this._self, this._then);

  final CreateThemeDTO _self;
  final $Res Function(CreateThemeDTO) _then;

/// Create a copy of CreateThemeDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? label = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateThemeDTO].
extension CreateThemeDTOPatterns on CreateThemeDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateThemeDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateThemeDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateThemeDTO value)  $default,){
final _that = this;
switch (_that) {
case _CreateThemeDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateThemeDTO value)?  $default,){
final _that = this;
switch (_that) {
case _CreateThemeDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateThemeDTO() when $default != null:
return $default(_that.title,_that.description,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String label)  $default,) {final _that = this;
switch (_that) {
case _CreateThemeDTO():
return $default(_that.title,_that.description,_that.label);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String label)?  $default,) {final _that = this;
switch (_that) {
case _CreateThemeDTO() when $default != null:
return $default(_that.title,_that.description,_that.label);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _CreateThemeDTO implements CreateThemeDTO {
  const _CreateThemeDTO({required this.title, this.description, this.label = 'dev'});
  factory _CreateThemeDTO.fromJson(Map<String, dynamic> json) => _$CreateThemeDTOFromJson(json);

/// Title of the theme (required, max 120 chars).
@override final  String title;
/// Optional description (max 2000 chars).
@override final  String? description;
/// Label for environment separation.
/// Defaults to "dev" if not provided.
@override@JsonKey() final  String label;

/// Create a copy of CreateThemeDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateThemeDTOCopyWith<_CreateThemeDTO> get copyWith => __$CreateThemeDTOCopyWithImpl<_CreateThemeDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateThemeDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateThemeDTO&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,label);

@override
String toString() {
  return 'CreateThemeDTO(title: $title, description: $description, label: $label)';
}


}

/// @nodoc
abstract mixin class _$CreateThemeDTOCopyWith<$Res> implements $CreateThemeDTOCopyWith<$Res> {
  factory _$CreateThemeDTOCopyWith(_CreateThemeDTO value, $Res Function(_CreateThemeDTO) _then) = __$CreateThemeDTOCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String label
});




}
/// @nodoc
class __$CreateThemeDTOCopyWithImpl<$Res>
    implements _$CreateThemeDTOCopyWith<$Res> {
  __$CreateThemeDTOCopyWithImpl(this._self, this._then);

  final _CreateThemeDTO _self;
  final $Res Function(_CreateThemeDTO) _then;

/// Create a copy of CreateThemeDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? label = null,}) {
  return _then(_CreateThemeDTO(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
