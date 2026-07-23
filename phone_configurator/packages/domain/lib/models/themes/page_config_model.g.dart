// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageConfigModel _$PageConfigModelFromJson(Map<String, dynamic> json) =>
    _PageConfigModel(
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      variant: $enumDecode(_$BrightnessVariantEnumMap, json['variant']),
      config: json['config'] as Map<String, dynamic>,
      id: json['id'] as String?,
      version: (json['version'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PageConfigModelToJson(_PageConfigModel instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'variant': _$BrightnessVariantEnumMap[instance.variant]!,
      'config': instance.config,
      'id': instance.id,
      'version': instance.version,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$BrightnessVariantEnumMap = {
  BrightnessVariant.light: 'light',
  BrightnessVariant.dark: 'dark',
};
