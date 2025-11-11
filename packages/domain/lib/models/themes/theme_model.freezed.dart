// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeModel {

 String? get id; String? get applicationId; String? get title; String? get slug; String? get description; String? get previewAssetId; AssetModel? get previewAsset; ThemeStatus get status; bool get isDefault; int get version; int? get sortIndex; int? get assetsCount; int? get embedsCount; bool? get featureAccessExists; String? get createdBy; String? get updatedBy; String? get createdAt; String? get updatedAt; String? get deletedAt; String? get parentThemeId; List<String> get tags;
/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<ThemeModel> get copyWith => _$ThemeModelCopyWithImpl<ThemeModel>(this as ThemeModel, _$identity);

  /// Serializes this ThemeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.previewAssetId, previewAssetId) || other.previewAssetId == previewAssetId)&&(identical(other.previewAsset, previewAsset) || other.previewAsset == previewAsset)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.assetsCount, assetsCount) || other.assetsCount == assetsCount)&&(identical(other.embedsCount, embedsCount) || other.embedsCount == embedsCount)&&(identical(other.featureAccessExists, featureAccessExists) || other.featureAccessExists == featureAccessExists)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.parentThemeId, parentThemeId) || other.parentThemeId == parentThemeId)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,applicationId,title,slug,description,previewAssetId,previewAsset,status,isDefault,version,sortIndex,assetsCount,embedsCount,featureAccessExists,createdBy,updatedBy,createdAt,updatedAt,deletedAt,parentThemeId,const DeepCollectionEquality().hash(tags)]);

@override
String toString() {
  return 'ThemeModel(id: $id, applicationId: $applicationId, title: $title, slug: $slug, description: $description, previewAssetId: $previewAssetId, previewAsset: $previewAsset, status: $status, isDefault: $isDefault, version: $version, sortIndex: $sortIndex, assetsCount: $assetsCount, embedsCount: $embedsCount, featureAccessExists: $featureAccessExists, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, parentThemeId: $parentThemeId, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ThemeModelCopyWith<$Res>  {
  factory $ThemeModelCopyWith(ThemeModel value, $Res Function(ThemeModel) _then) = _$ThemeModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? applicationId, String? title, String? slug, String? description, String? previewAssetId, AssetModel? previewAsset, ThemeStatus status, bool isDefault, int version, int? sortIndex, int? assetsCount, int? embedsCount, bool? featureAccessExists, String? createdBy, String? updatedBy, String? createdAt, String? updatedAt, String? deletedAt, String? parentThemeId, List<String> tags
});


$AssetModelCopyWith<$Res>? get previewAsset;

}
/// @nodoc
class _$ThemeModelCopyWithImpl<$Res>
    implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._self, this._then);

  final ThemeModel _self;
  final $Res Function(ThemeModel) _then;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? applicationId = freezed,Object? title = freezed,Object? slug = freezed,Object? description = freezed,Object? previewAssetId = freezed,Object? previewAsset = freezed,Object? status = null,Object? isDefault = null,Object? version = null,Object? sortIndex = freezed,Object? assetsCount = freezed,Object? embedsCount = freezed,Object? featureAccessExists = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? parentThemeId = freezed,Object? tags = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,previewAssetId: freezed == previewAssetId ? _self.previewAssetId : previewAssetId // ignore: cast_nullable_to_non_nullable
as String?,previewAsset: freezed == previewAsset ? _self.previewAsset : previewAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeStatus,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,assetsCount: freezed == assetsCount ? _self.assetsCount : assetsCount // ignore: cast_nullable_to_non_nullable
as int?,embedsCount: freezed == embedsCount ? _self.embedsCount : embedsCount // ignore: cast_nullable_to_non_nullable
as int?,featureAccessExists: freezed == featureAccessExists ? _self.featureAccessExists : featureAccessExists // ignore: cast_nullable_to_non_nullable
as bool?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,parentThemeId: freezed == parentThemeId ? _self.parentThemeId : parentThemeId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get previewAsset {
    if (_self.previewAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.previewAsset!, (value) {
    return _then(_self.copyWith(previewAsset: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThemeModel].
extension ThemeModelPatterns on ThemeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _ThemeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? applicationId,  String? title,  String? slug,  String? description,  String? previewAssetId,  AssetModel? previewAsset,  ThemeStatus status,  bool isDefault,  int version,  int? sortIndex,  int? assetsCount,  int? embedsCount,  bool? featureAccessExists,  String? createdBy,  String? updatedBy,  String? createdAt,  String? updatedAt,  String? deletedAt,  String? parentThemeId,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.title,_that.slug,_that.description,_that.previewAssetId,_that.previewAsset,_that.status,_that.isDefault,_that.version,_that.sortIndex,_that.assetsCount,_that.embedsCount,_that.featureAccessExists,_that.createdBy,_that.updatedBy,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.parentThemeId,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? applicationId,  String? title,  String? slug,  String? description,  String? previewAssetId,  AssetModel? previewAsset,  ThemeStatus status,  bool isDefault,  int version,  int? sortIndex,  int? assetsCount,  int? embedsCount,  bool? featureAccessExists,  String? createdBy,  String? updatedBy,  String? createdAt,  String? updatedAt,  String? deletedAt,  String? parentThemeId,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _ThemeModel():
return $default(_that.id,_that.applicationId,_that.title,_that.slug,_that.description,_that.previewAssetId,_that.previewAsset,_that.status,_that.isDefault,_that.version,_that.sortIndex,_that.assetsCount,_that.embedsCount,_that.featureAccessExists,_that.createdBy,_that.updatedBy,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.parentThemeId,_that.tags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? applicationId,  String? title,  String? slug,  String? description,  String? previewAssetId,  AssetModel? previewAsset,  ThemeStatus status,  bool isDefault,  int version,  int? sortIndex,  int? assetsCount,  int? embedsCount,  bool? featureAccessExists,  String? createdBy,  String? updatedBy,  String? createdAt,  String? updatedAt,  String? deletedAt,  String? parentThemeId,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _ThemeModel() when $default != null:
return $default(_that.id,_that.applicationId,_that.title,_that.slug,_that.description,_that.previewAssetId,_that.previewAsset,_that.status,_that.isDefault,_that.version,_that.sortIndex,_that.assetsCount,_that.embedsCount,_that.featureAccessExists,_that.createdBy,_that.updatedBy,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.parentThemeId,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThemeModel extends ThemeModel {
  const _ThemeModel({this.id, this.applicationId, this.title, this.slug, this.description, this.previewAssetId, this.previewAsset, this.status = ThemeStatus.published, this.isDefault = false, this.version = 0, this.sortIndex, this.assetsCount, this.embedsCount, this.featureAccessExists, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt, this.parentThemeId, final  List<String> tags = const <String>[]}): _tags = tags,super._();
  factory _ThemeModel.fromJson(Map<String, dynamic> json) => _$ThemeModelFromJson(json);

@override final  String? id;
@override final  String? applicationId;
@override final  String? title;
@override final  String? slug;
@override final  String? description;
@override final  String? previewAssetId;
@override final  AssetModel? previewAsset;
@override@JsonKey() final  ThemeStatus status;
@override@JsonKey() final  bool isDefault;
@override@JsonKey() final  int version;
@override final  int? sortIndex;
@override final  int? assetsCount;
@override final  int? embedsCount;
@override final  bool? featureAccessExists;
@override final  String? createdBy;
@override final  String? updatedBy;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  String? parentThemeId;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModelCopyWith<_ThemeModel> get copyWith => __$ThemeModelCopyWithImpl<_ThemeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThemeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.previewAssetId, previewAssetId) || other.previewAssetId == previewAssetId)&&(identical(other.previewAsset, previewAsset) || other.previewAsset == previewAsset)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.version, version) || other.version == version)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.assetsCount, assetsCount) || other.assetsCount == assetsCount)&&(identical(other.embedsCount, embedsCount) || other.embedsCount == embedsCount)&&(identical(other.featureAccessExists, featureAccessExists) || other.featureAccessExists == featureAccessExists)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.parentThemeId, parentThemeId) || other.parentThemeId == parentThemeId)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,applicationId,title,slug,description,previewAssetId,previewAsset,status,isDefault,version,sortIndex,assetsCount,embedsCount,featureAccessExists,createdBy,updatedBy,createdAt,updatedAt,deletedAt,parentThemeId,const DeepCollectionEquality().hash(_tags)]);

@override
String toString() {
  return 'ThemeModel(id: $id, applicationId: $applicationId, title: $title, slug: $slug, description: $description, previewAssetId: $previewAssetId, previewAsset: $previewAsset, status: $status, isDefault: $isDefault, version: $version, sortIndex: $sortIndex, assetsCount: $assetsCount, embedsCount: $embedsCount, featureAccessExists: $featureAccessExists, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, parentThemeId: $parentThemeId, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ThemeModelCopyWith<$Res> implements $ThemeModelCopyWith<$Res> {
  factory _$ThemeModelCopyWith(_ThemeModel value, $Res Function(_ThemeModel) _then) = __$ThemeModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? applicationId, String? title, String? slug, String? description, String? previewAssetId, AssetModel? previewAsset, ThemeStatus status, bool isDefault, int version, int? sortIndex, int? assetsCount, int? embedsCount, bool? featureAccessExists, String? createdBy, String? updatedBy, String? createdAt, String? updatedAt, String? deletedAt, String? parentThemeId, List<String> tags
});


@override $AssetModelCopyWith<$Res>? get previewAsset;

}
/// @nodoc
class __$ThemeModelCopyWithImpl<$Res>
    implements _$ThemeModelCopyWith<$Res> {
  __$ThemeModelCopyWithImpl(this._self, this._then);

  final _ThemeModel _self;
  final $Res Function(_ThemeModel) _then;

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? applicationId = freezed,Object? title = freezed,Object? slug = freezed,Object? description = freezed,Object? previewAssetId = freezed,Object? previewAsset = freezed,Object? status = null,Object? isDefault = null,Object? version = null,Object? sortIndex = freezed,Object? assetsCount = freezed,Object? embedsCount = freezed,Object? featureAccessExists = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? parentThemeId = freezed,Object? tags = null,}) {
  return _then(_ThemeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,previewAssetId: freezed == previewAssetId ? _self.previewAssetId : previewAssetId // ignore: cast_nullable_to_non_nullable
as String?,previewAsset: freezed == previewAsset ? _self.previewAsset : previewAsset // ignore: cast_nullable_to_non_nullable
as AssetModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeStatus,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,assetsCount: freezed == assetsCount ? _self.assetsCount : assetsCount // ignore: cast_nullable_to_non_nullable
as int?,embedsCount: freezed == embedsCount ? _self.embedsCount : embedsCount // ignore: cast_nullable_to_non_nullable
as int?,featureAccessExists: freezed == featureAccessExists ? _self.featureAccessExists : featureAccessExists // ignore: cast_nullable_to_non_nullable
as bool?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,parentThemeId: freezed == parentThemeId ? _self.parentThemeId : parentThemeId // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ThemeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get previewAsset {
    if (_self.previewAsset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.previewAsset!, (value) {
    return _then(_self.copyWith(previewAsset: value));
  });
}
}

// dart format on
