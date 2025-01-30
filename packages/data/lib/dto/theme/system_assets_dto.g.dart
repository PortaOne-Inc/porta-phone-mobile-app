// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_assets_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LaunchAssetsDtoImpl _$$LaunchAssetsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LaunchAssetsDtoImpl(
      notificationLogo: json['notificationLogo'] == null
          ? null
          : LaunchAssetResourceDto.fromJson(
              json['notificationLogo'] as Map<String, dynamic>),
      adaptiveIconBackground: json['adaptiveIconBackground'] == null
          ? null
          : LaunchAssetResourceDto.fromJson(
              json['adaptiveIconBackground'] as Map<String, dynamic>),
      adaptiveIconForeground: json['adaptiveIconForeground'] == null
          ? null
          : LaunchAssetResourceDto.fromJson(
              json['adaptiveIconForeground'] as Map<String, dynamic>),
      androidLauncherIcon: json['androidLauncherIcon'] == null
          ? null
          : LaunchAssetResourceDto.fromJson(
              json['androidLauncherIcon'] as Map<String, dynamic>),
      iosLauncherIcon: json['iosLauncherIcon'] == null
          ? null
          : LaunchAssetResourceDto.fromJson(
              json['iosLauncherIcon'] as Map<String, dynamic>),
      webLauncherIcon: json['webLauncherIcon'] == null
          ? null
          : LaunchAssetResourceDto.fromJson(
              json['webLauncherIcon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LaunchAssetsDtoImplToJson(
        _$LaunchAssetsDtoImpl instance) =>
    <String, dynamic>{
      'notificationLogo': instance.notificationLogo?.toJson(),
      'adaptiveIconBackground': instance.adaptiveIconBackground?.toJson(),
      'adaptiveIconForeground': instance.adaptiveIconForeground?.toJson(),
      'androidLauncherIcon': instance.androidLauncherIcon?.toJson(),
      'iosLauncherIcon': instance.iosLauncherIcon?.toJson(),
      'webLauncherIcon': instance.webLauncherIcon?.toJson(),
    };

_$LaunchAssetResourceDtoImpl _$$LaunchAssetResourceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LaunchAssetResourceDtoImpl(
      url: json['url'] as String?,
      originalAssetId: json['originalAssetId'] as String?,
    );

Map<String, dynamic> _$$LaunchAssetResourceDtoImplToJson(
        _$LaunchAssetResourceDtoImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'originalAssetId': instance.originalAssetId,
    };
