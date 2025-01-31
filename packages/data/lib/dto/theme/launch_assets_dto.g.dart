// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_assets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LaunchAssetsDtoImpl _$$LaunchAssetsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LaunchAssetsDtoImpl(
      originalAssetId: (json['originalAssetId'] as num?)?.toInt(),
      notificationLogoUrl: json['notificationLogoUrl'] as String?,
      adaptiveIconForegroundUrl: json['adaptiveIconForegroundUrl'] as String?,
      androidLauncherIconUrl: json['androidLauncherIconUrl'] as String?,
      iosLauncherIconUrl: json['iosLauncherIconUrl'] as String?,
      webLauncherIconUrl: json['webLauncherIconUrl'] as String?,
      adaptiveIconBackgroundUrl: json['adaptiveIconBackgroundUrl'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
    );

Map<String, dynamic> _$$LaunchAssetsDtoImplToJson(
        _$LaunchAssetsDtoImpl instance) =>
    <String, dynamic>{
      'originalAssetId': instance.originalAssetId,
      'notificationLogoUrl': instance.notificationLogoUrl,
      'adaptiveIconForegroundUrl': instance.adaptiveIconForegroundUrl,
      'androidLauncherIconUrl': instance.androidLauncherIconUrl,
      'iosLauncherIconUrl': instance.iosLauncherIconUrl,
      'webLauncherIconUrl': instance.webLauncherIconUrl,
      'adaptiveIconBackgroundUrl': instance.adaptiveIconBackgroundUrl,
      'backgroundColor': instance.backgroundColor,
    };
