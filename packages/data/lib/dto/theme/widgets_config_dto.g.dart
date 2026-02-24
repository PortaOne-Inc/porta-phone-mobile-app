// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widgets_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WidgetsConfigDto _$WidgetsConfigDtoFromJson(Map<String, dynamic> json) =>
    _WidgetsConfigDto(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      variant: json['variant'] as String,
      config: json['config'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WidgetsConfigDtoToJson(_WidgetsConfigDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'variant': instance.variant,
      'config': instance.config,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
    };
