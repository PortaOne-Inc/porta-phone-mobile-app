// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeDTOImpl _$$ThemeDTOImplFromJson(Map<String, dynamic> json) =>
    _$ThemeDTOImpl(
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

Map<String, dynamic> _$$ThemeDTOImplToJson(_$ThemeDTOImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.applicationId case final value?) 'applicationId': value,
      if (instance.title case final value?) 'title': value,
      if (instance.previewAssetId case final value?) 'previewAssetId': value,
      if (instance.status case final value?) 'status': value,
      if (instance.isDefault case final value?) 'isDefault': value,
      if (instance.version case final value?) 'version': value,
      if (instance.sortIndex case final value?) 'sortIndex': value,
      if (instance.assetsCount case final value?) 'assetsCount': value,
      if (instance.embedsCount case final value?) 'embedsCount': value,
      if (instance.featureAccessExists case final value?)
        'featureAccessExists': value,
      if (instance.createdBy case final value?) 'createdBy': value,
      if (instance.updatedBy case final value?) 'updatedBy': value,
      if (instance.createdAt case final value?) 'createdAt': value,
      if (instance.updatedAt case final value?) 'updatedAt': value,
      if (instance.deletedAt case final value?) 'deletedAt': value,
      if (instance.slug case final value?) 'slug': value,
      if (instance.description case final value?) 'description': value,
      if (instance.parentThemeId case final value?) 'parentThemeId': value,
      'tags': instance.tags,
    };

_$CreateThemeDTOImpl _$$CreateThemeDTOImplFromJson(Map<String, dynamic> json) =>
    _$CreateThemeDTOImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      label: json['label'] as String? ?? 'dev',
    );

Map<String, dynamic> _$$CreateThemeDTOImplToJson(
        _$CreateThemeDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      'label': instance.label,
    };
