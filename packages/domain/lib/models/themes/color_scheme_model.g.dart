// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_scheme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorSchemeModelImpl _$$ColorSchemeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ColorSchemeModelImpl(
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      variant: $enumDecode(_$BrightnessVariantEnumMap, json['variant']),
      config: json['config'] as Map<String, dynamic>,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ColorSchemeModelImplToJson(
        _$ColorSchemeModelImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'variant': _$BrightnessVariantEnumMap[instance.variant]!,
      'config': instance.config,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$BrightnessVariantEnumMap = {
  BrightnessVariant.light: 'light',
  BrightnessVariant.dark: 'dark',
};
