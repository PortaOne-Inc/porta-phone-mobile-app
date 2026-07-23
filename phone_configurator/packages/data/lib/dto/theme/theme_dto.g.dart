// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeDTO _$ThemeDTOFromJson(Map<String, dynamic> json) => _ThemeDTO(
  id: json['id'] as String?,
  applicationId: json['applicationId'] as String?,
  title: json['title'] as String?,
  previewAssetId: json['previewAssetId'] as String?,
  status: json['status'] as String?,
  isDefault: json['isDefault'] as bool?,
  version: (json['version'] as num?)?.toInt(),
  sortIndex: (json['sortIndex'] as num?)?.toInt(),
  assetsCount: (json['assetsCount'] as num?)?.toInt(),
  embedsCount: (json['embedsCount'] as num?)?.toInt(),
  featureAccessExists: json['featureAccessExists'] as bool?,
  createdBy: json['createdBy'] as String?,
  updatedBy: json['updatedBy'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  parentThemeId: json['parentThemeId'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$ThemeDTOToJson(_ThemeDTO instance) => <String, dynamic>{
  'id': ?instance.id,
  'applicationId': ?instance.applicationId,
  'title': ?instance.title,
  'previewAssetId': ?instance.previewAssetId,
  'status': ?instance.status,
  'isDefault': ?instance.isDefault,
  'version': ?instance.version,
  'sortIndex': ?instance.sortIndex,
  'assetsCount': ?instance.assetsCount,
  'embedsCount': ?instance.embedsCount,
  'featureAccessExists': ?instance.featureAccessExists,
  'createdBy': ?instance.createdBy,
  'updatedBy': ?instance.updatedBy,
  'createdAt': ?instance.createdAt,
  'updatedAt': ?instance.updatedAt,
  'deletedAt': ?instance.deletedAt,
  'slug': ?instance.slug,
  'description': ?instance.description,
  'parentThemeId': ?instance.parentThemeId,
  'tags': instance.tags,
};

_CreateThemeDTO _$CreateThemeDTOFromJson(Map<String, dynamic> json) =>
    _CreateThemeDTO(
      title: json['title'] as String,
      description: json['description'] as String?,
      label: json['label'] as String? ?? 'dev',
    );

Map<String, dynamic> _$CreateThemeDTOToJson(_CreateThemeDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': ?instance.description,
      'label': instance.label,
    };
