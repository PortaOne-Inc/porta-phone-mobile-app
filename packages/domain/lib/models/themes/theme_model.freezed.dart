// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) {
  return _ThemeModel.fromJson(json);
}

/// @nodoc
mixin _$ThemeModel {
  String? get id => throw _privateConstructorUsedError;
  String? get applicationId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get previewAssetId => throw _privateConstructorUsedError;
  AssetModel? get previewAsset => throw _privateConstructorUsedError;
  ThemeStatus get status => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  int? get sortIndex => throw _privateConstructorUsedError;
  int? get assetsCount => throw _privateConstructorUsedError;
  int? get embedsCount => throw _privateConstructorUsedError;
  bool? get featureAccessExists => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get deletedAt => throw _privateConstructorUsedError;
  String? get parentThemeId => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this ThemeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeModelCopyWith<ThemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeModelCopyWith<$Res> {
  factory $ThemeModelCopyWith(
          ThemeModel value, $Res Function(ThemeModel) then) =
      _$ThemeModelCopyWithImpl<$Res, ThemeModel>;
  @useResult
  $Res call(
      {String? id,
      String? applicationId,
      String? title,
      String? slug,
      String? description,
      String? previewAssetId,
      AssetModel? previewAsset,
      ThemeStatus status,
      bool isDefault,
      int version,
      int? sortIndex,
      int? assetsCount,
      int? embedsCount,
      bool? featureAccessExists,
      String? createdBy,
      String? updatedBy,
      String? createdAt,
      String? updatedAt,
      String? deletedAt,
      String? parentThemeId,
      List<String> tags});

  $AssetModelCopyWith<$Res>? get previewAsset;
}

/// @nodoc
class _$ThemeModelCopyWithImpl<$Res, $Val extends ThemeModel>
    implements $ThemeModelCopyWith<$Res> {
  _$ThemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? previewAssetId = freezed,
    Object? previewAsset = freezed,
    Object? status = null,
    Object? isDefault = null,
    Object? version = null,
    Object? sortIndex = freezed,
    Object? assetsCount = freezed,
    Object? embedsCount = freezed,
    Object? featureAccessExists = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? parentThemeId = freezed,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      previewAssetId: freezed == previewAssetId
          ? _value.previewAssetId
          : previewAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      previewAsset: freezed == previewAsset
          ? _value.previewAsset
          : previewAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ThemeStatus,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      sortIndex: freezed == sortIndex
          ? _value.sortIndex
          : sortIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      assetsCount: freezed == assetsCount
          ? _value.assetsCount
          : assetsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      embedsCount: freezed == embedsCount
          ? _value.embedsCount
          : embedsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      featureAccessExists: freezed == featureAccessExists
          ? _value.featureAccessExists
          : featureAccessExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      parentThemeId: freezed == parentThemeId
          ? _value.parentThemeId
          : parentThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetModelCopyWith<$Res>? get previewAsset {
    if (_value.previewAsset == null) {
      return null;
    }

    return $AssetModelCopyWith<$Res>(_value.previewAsset!, (value) {
      return _then(_value.copyWith(previewAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThemeModelImplCopyWith<$Res>
    implements $ThemeModelCopyWith<$Res> {
  factory _$$ThemeModelImplCopyWith(
          _$ThemeModelImpl value, $Res Function(_$ThemeModelImpl) then) =
      __$$ThemeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? applicationId,
      String? title,
      String? slug,
      String? description,
      String? previewAssetId,
      AssetModel? previewAsset,
      ThemeStatus status,
      bool isDefault,
      int version,
      int? sortIndex,
      int? assetsCount,
      int? embedsCount,
      bool? featureAccessExists,
      String? createdBy,
      String? updatedBy,
      String? createdAt,
      String? updatedAt,
      String? deletedAt,
      String? parentThemeId,
      List<String> tags});

  @override
  $AssetModelCopyWith<$Res>? get previewAsset;
}

/// @nodoc
class __$$ThemeModelImplCopyWithImpl<$Res>
    extends _$ThemeModelCopyWithImpl<$Res, _$ThemeModelImpl>
    implements _$$ThemeModelImplCopyWith<$Res> {
  __$$ThemeModelImplCopyWithImpl(
      _$ThemeModelImpl _value, $Res Function(_$ThemeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? applicationId = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? previewAssetId = freezed,
    Object? previewAsset = freezed,
    Object? status = null,
    Object? isDefault = null,
    Object? version = null,
    Object? sortIndex = freezed,
    Object? assetsCount = freezed,
    Object? embedsCount = freezed,
    Object? featureAccessExists = freezed,
    Object? createdBy = freezed,
    Object? updatedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? parentThemeId = freezed,
    Object? tags = null,
  }) {
    return _then(_$ThemeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationId: freezed == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      previewAssetId: freezed == previewAssetId
          ? _value.previewAssetId
          : previewAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      previewAsset: freezed == previewAsset
          ? _value.previewAsset
          : previewAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ThemeStatus,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      sortIndex: freezed == sortIndex
          ? _value.sortIndex
          : sortIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      assetsCount: freezed == assetsCount
          ? _value.assetsCount
          : assetsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      embedsCount: freezed == embedsCount
          ? _value.embedsCount
          : embedsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      featureAccessExists: freezed == featureAccessExists
          ? _value.featureAccessExists
          : featureAccessExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      parentThemeId: freezed == parentThemeId
          ? _value.parentThemeId
          : parentThemeId // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeModelImpl extends _ThemeModel {
  const _$ThemeModelImpl(
      {this.id,
      this.applicationId,
      this.title,
      this.slug,
      this.description,
      this.previewAssetId,
      this.previewAsset,
      this.status = ThemeStatus.published,
      this.isDefault = false,
      this.version = 0,
      this.sortIndex,
      this.assetsCount,
      this.embedsCount,
      this.featureAccessExists,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.parentThemeId,
      final List<String> tags = const <String>[]})
      : _tags = tags,
        super._();

  factory _$ThemeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? applicationId;
  @override
  final String? title;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? previewAssetId;
  @override
  final AssetModel? previewAsset;
  @override
  @JsonKey()
  final ThemeStatus status;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final int version;
  @override
  final int? sortIndex;
  @override
  final int? assetsCount;
  @override
  final int? embedsCount;
  @override
  final bool? featureAccessExists;
  @override
  final String? createdBy;
  @override
  final String? updatedBy;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? deletedAt;
  @override
  final String? parentThemeId;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ThemeModel(id: $id, applicationId: $applicationId, title: $title, slug: $slug, description: $description, previewAssetId: $previewAssetId, previewAsset: $previewAsset, status: $status, isDefault: $isDefault, version: $version, sortIndex: $sortIndex, assetsCount: $assetsCount, embedsCount: $embedsCount, featureAccessExists: $featureAccessExists, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, parentThemeId: $parentThemeId, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.previewAssetId, previewAssetId) ||
                other.previewAssetId == previewAssetId) &&
            (identical(other.previewAsset, previewAsset) ||
                other.previewAsset == previewAsset) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.sortIndex, sortIndex) ||
                other.sortIndex == sortIndex) &&
            (identical(other.assetsCount, assetsCount) ||
                other.assetsCount == assetsCount) &&
            (identical(other.embedsCount, embedsCount) ||
                other.embedsCount == embedsCount) &&
            (identical(other.featureAccessExists, featureAccessExists) ||
                other.featureAccessExists == featureAccessExists) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.parentThemeId, parentThemeId) ||
                other.parentThemeId == parentThemeId) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        applicationId,
        title,
        slug,
        description,
        previewAssetId,
        previewAsset,
        status,
        isDefault,
        version,
        sortIndex,
        assetsCount,
        embedsCount,
        featureAccessExists,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        deletedAt,
        parentThemeId,
        const DeepCollectionEquality().hash(_tags)
      ]);

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      __$$ThemeModelImplCopyWithImpl<_$ThemeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeModelImplToJson(
      this,
    );
  }
}

abstract class _ThemeModel extends ThemeModel {
  const factory _ThemeModel(
      {final String? id,
      final String? applicationId,
      final String? title,
      final String? slug,
      final String? description,
      final String? previewAssetId,
      final AssetModel? previewAsset,
      final ThemeStatus status,
      final bool isDefault,
      final int version,
      final int? sortIndex,
      final int? assetsCount,
      final int? embedsCount,
      final bool? featureAccessExists,
      final String? createdBy,
      final String? updatedBy,
      final String? createdAt,
      final String? updatedAt,
      final String? deletedAt,
      final String? parentThemeId,
      final List<String> tags}) = _$ThemeModelImpl;
  const _ThemeModel._() : super._();

  factory _ThemeModel.fromJson(Map<String, dynamic> json) =
      _$ThemeModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get applicationId;
  @override
  String? get title;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  String? get previewAssetId;
  @override
  AssetModel? get previewAsset;
  @override
  ThemeStatus get status;
  @override
  bool get isDefault;
  @override
  int get version;
  @override
  int? get sortIndex;
  @override
  int? get assetsCount;
  @override
  int? get embedsCount;
  @override
  bool? get featureAccessExists;
  @override
  String? get createdBy;
  @override
  String? get updatedBy;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get deletedAt;
  @override
  String? get parentThemeId;
  @override
  List<String> get tags;

  /// Create a copy of ThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeModelImplCopyWith<_$ThemeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
