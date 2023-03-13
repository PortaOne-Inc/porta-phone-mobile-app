// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_collection_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageCollectionDTO _$$_ImageCollectionDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ImageCollectionDTO(
      onboarding: json['onboarding'] == null
          ? null
          : ImageDTO.fromJson(json['onboarding'] as Map<String, dynamic>),
      applicationLogo: json['applicationLogo'] == null
          ? null
          : ImageDTO.fromJson(json['applicationLogo'] as Map<String, dynamic>),
      notificationLogo: json['notificationLogo'] == null
          ? null
          : ImageDTO.fromJson(json['notificationLogo'] as Map<String, dynamic>),
      adaptiveIconBackground: json['adaptiveIconBackground'] == null
          ? null
          : ImageDTO.fromJson(
              json['adaptiveIconBackground'] as Map<String, dynamic>),
      adaptiveIconForeground: json['adaptiveIconForeground'] == null
          ? null
          : ImageDTO.fromJson(
              json['adaptiveIconForeground'] as Map<String, dynamic>),
      androidLauncherIcon: json['androidLauncherIcon'] == null
          ? null
          : ImageDTO.fromJson(
              json['androidLauncherIcon'] as Map<String, dynamic>),
      iosLauncherIcon: json['iosLauncherIcon'] == null
          ? null
          : ImageDTO.fromJson(json['iosLauncherIcon'] as Map<String, dynamic>),
      webLauncherIcon: json['webLauncherIcon'] == null
          ? null
          : ImageDTO.fromJson(json['webLauncherIcon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImageCollectionDTOToJson(
        _$_ImageCollectionDTO instance) =>
    <String, dynamic>{
      'onboarding': instance.onboarding,
      'applicationLogo': instance.applicationLogo,
      'notificationLogo': instance.notificationLogo,
      'adaptiveIconBackground': instance.adaptiveIconBackground,
      'adaptiveIconForeground': instance.adaptiveIconForeground,
      'androidLauncherIcon': instance.androidLauncherIcon,
      'iosLauncherIcon': instance.iosLauncherIcon,
      'webLauncherIcon': instance.webLauncherIcon,
    };
