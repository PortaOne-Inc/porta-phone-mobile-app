// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_theme_preview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SharedThemePreviewDto _$SharedThemePreviewDtoFromJson(
  Map<String, dynamic> json,
) => _SharedThemePreviewDto(
  theme: json['theme'] as Map<String, dynamic>,
  colorSchemes: (json['colorSchemes'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  widgetConfigs: (json['widgetConfigs'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  pageConfigs: (json['pageConfigs'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  splashAsset: json['splashAsset'] as Map<String, dynamic>?,
  launchAsset: json['launchAsset'] as Map<String, dynamic>?,
  featureAccess: json['featureAccess'] as Map<String, dynamic>?,
  embeds:
      (json['embeds'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$SharedThemePreviewDtoToJson(
  _SharedThemePreviewDto instance,
) => <String, dynamic>{
  'theme': instance.theme,
  'colorSchemes': instance.colorSchemes,
  'widgetConfigs': instance.widgetConfigs,
  'pageConfigs': instance.pageConfigs,
  'splashAsset': instance.splashAsset,
  'launchAsset': instance.launchAsset,
  'featureAccess': instance.featureAccess,
  'embeds': instance.embeds,
};
