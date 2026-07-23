// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_scheme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ColorSchemeDto _$ColorSchemeDtoFromJson(Map<String, dynamic> json) =>
    _ColorSchemeDto(
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      variant: json['variant'] as String,
      config: json['config'] as Map<String, dynamic>,
      id: json['id'] as String?,
      version: (json['version'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ColorSchemeDtoToJson(_ColorSchemeDto instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'variant': instance.variant,
      'config': instance.config,
      'id': instance.id,
      'version': instance.version,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
