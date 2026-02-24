// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeatureAccessModel _$FeatureAccessModelFromJson(Map<String, dynamic> json) =>
    _FeatureAccessModel(
      applicationId: json['applicationId'] as String,
      config: json['config'] as Map<String, dynamic>,
      themeId: json['themeId'] as String?,
      version: (json['version'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'draft',
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$FeatureAccessModelToJson(_FeatureAccessModel instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'config': instance.config,
      'themeId': instance.themeId,
      'version': instance.version,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
