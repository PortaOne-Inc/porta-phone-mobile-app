// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_access_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeatureAccessDto _$FeatureAccessDtoFromJson(Map<String, dynamic> json) =>
    _FeatureAccessDto(
      applicationId: json['applicationId'] as String,
      status: json['status'] as String,
      config: json['config'] as Map<String, dynamic>,
      themeId: json['themeId'] as String?,
      version: (json['version'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$FeatureAccessDtoToJson(_FeatureAccessDto instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'status': instance.status,
      'config': instance.config,
      'themeId': instance.themeId,
      'version': instance.version,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
