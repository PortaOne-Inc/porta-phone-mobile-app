// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) => _ThemeModel(
  id: json['id'] as String?,
  applicationId: json['applicationId'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  previewAssetId: json['previewAssetId'] as String?,
  previewAsset: json['previewAsset'] == null
      ? null
      : AssetModel.fromJson(json['previewAsset'] as Map<String, dynamic>),
  status:
      $enumDecodeNullable(_$ThemeStatusEnumMap, json['status']) ??
      ThemeStatus.published,
  isDefault: json['isDefault'] as bool? ?? false,
  version: (json['version'] as num?)?.toInt() ?? 0,
  sortIndex: (json['sortIndex'] as num?)?.toInt(),
  assetsCount: (json['assetsCount'] as num?)?.toInt(),
  embedsCount: (json['embedsCount'] as num?)?.toInt(),
  featureAccessExists: json['featureAccessExists'] as bool?,
  createdBy: json['createdBy'] as String?,
  updatedBy: json['updatedBy'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  parentThemeId: json['parentThemeId'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$ThemeModelToJson(_ThemeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'previewAssetId': instance.previewAssetId,
      'previewAsset': instance.previewAsset,
      'status': _$ThemeStatusEnumMap[instance.status]!,
      'isDefault': instance.isDefault,
      'version': instance.version,
      'sortIndex': instance.sortIndex,
      'assetsCount': instance.assetsCount,
      'embedsCount': instance.embedsCount,
      'featureAccessExists': instance.featureAccessExists,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'parentThemeId': instance.parentThemeId,
      'tags': instance.tags,
    };

const _$ThemeStatusEnumMap = {
  ThemeStatus.draft: 'draft',
  ThemeStatus.published: 'published',
  ThemeStatus.archived: 'archived',
};
