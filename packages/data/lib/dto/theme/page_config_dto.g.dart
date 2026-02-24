// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageConfigDto _$PageConfigDtoFromJson(Map<String, dynamic> json) =>
    _PageConfigDto(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      variant: json['variant'] as String,
      config: json['config'] as Map<String, dynamic>,
      version: (json['version'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PageConfigDtoToJson(_PageConfigDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'variant': instance.variant,
      'config': instance.config,
      'version': instance.version,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
