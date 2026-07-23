// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deprecated_theme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$DeprecatedThemeDTOImplToJson(
  _$DeprecatedThemeDTOImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'applicationId': instance.applicationId,
  'name': instance.name,
  'colorSchemeConfig': instance.colorSchemeConfig,
  'themeWidgetConfig': instance.themeWidgetConfig,
  'themePageConfig': instance.themePageConfig,
  'appConfig': instance.appConfig,
  'launchAssets': instance.launchAssets,
  'splashAssets': instance.splashAssets,
  'assets': instance.assets,
};

_$DeprecatedThemeAssetDtoImpl _$$DeprecatedThemeAssetDtoImplFromJson(
  Map<String, dynamic> json,
) => _$DeprecatedThemeAssetDtoImpl(
  id: const IntToStringConverter().fromJson(json['id']),
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  url: json['url'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$$DeprecatedThemeAssetDtoImplToJson(
  _$DeprecatedThemeAssetDtoImpl instance,
) => <String, dynamic>{
  'id': const IntToStringConverter().toJson(instance.id),
  'name': instance.name,
  'description': instance.description,
  'url': instance.url,
  'type': instance.type,
};

_$SplashAssetsDtoImpl _$$SplashAssetsDtoImplFromJson(
  Map<String, dynamic> json,
) => _$SplashAssetsDtoImpl(
  originalAssetId: (json['originalAssetId'] as num?)?.toInt(),
  pictureUrl: json['pictureUrl'] as String?,
  color: json['color'] as String?,
  padding: (json['padding'] as num?)?.toDouble() ?? 0.0,
  fit: json['fit'] as String? ?? 'scaleDown',
);

Map<String, dynamic> _$$SplashAssetsDtoImplToJson(
  _$SplashAssetsDtoImpl instance,
) => <String, dynamic>{
  'originalAssetId': instance.originalAssetId,
  'pictureUrl': instance.pictureUrl,
  'color': instance.color,
  'padding': instance.padding,
  'fit': instance.fit,
};

_$DeprecatedLaunchAssetsDtoImpl _$$DeprecatedLaunchAssetsDtoImplFromJson(
  Map<String, dynamic> json,
) => _$DeprecatedLaunchAssetsDtoImpl(
  originalAssetId: (json['originalAssetId'] as num?)?.toInt(),
  notificationLogoUrl: json['notificationLogoUrl'] as String?,
  adaptiveIconForegroundUrl: json['adaptiveIconForegroundUrl'] as String?,
  androidLauncherIconUrl: json['androidLauncherIconUrl'] as String?,
  iosLauncherIconUrl: json['iosLauncherIconUrl'] as String?,
  webLauncherIconUrl: json['webLauncherIconUrl'] as String?,
  adaptiveIconBackgroundUrl: json['adaptiveIconBackgroundUrl'] as String?,
  backgroundColor: json['backgroundColor'] as String?,
);

Map<String, dynamic> _$$DeprecatedLaunchAssetsDtoImplToJson(
  _$DeprecatedLaunchAssetsDtoImpl instance,
) => <String, dynamic>{
  'originalAssetId': instance.originalAssetId,
  'notificationLogoUrl': instance.notificationLogoUrl,
  'adaptiveIconForegroundUrl': instance.adaptiveIconForegroundUrl,
  'androidLauncherIconUrl': instance.androidLauncherIconUrl,
  'iosLauncherIconUrl': instance.iosLauncherIconUrl,
  'webLauncherIconUrl': instance.webLauncherIconUrl,
  'adaptiveIconBackgroundUrl': instance.adaptiveIconBackgroundUrl,
  'backgroundColor': instance.backgroundColor,
};
