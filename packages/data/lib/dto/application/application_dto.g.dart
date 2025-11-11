// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicationDTO _$ApplicationDTOFromJson(
  Map<String, dynamic> json,
) => _ApplicationDTO(
  id: json['id'] as String?,
  name: json['name'] as String?,
  environment: json['environment'] as Map<String, dynamic>?,
  iosPlatformId: json['iosPlatformId'] as String?,
  androidPlatformId: json['androidPlatformId'] as String?,
  termsConditionsUrl: json['termsConditionsUrl'] as String?,
  appVersion: json['appVersion'] == null
      ? null
      : BuildVersionDTO.fromJson(json['appVersion'] as Map<String, dynamic>),
  androidVersion: json['androidVersion'] == null
      ? null
      : BuildVersionDTO.fromJson(
          json['androidVersion'] as Map<String, dynamic>,
        ),
  iosVersion: json['iosVersion'] == null
      ? null
      : BuildVersionDTO.fromJson(json['iosVersion'] as Map<String, dynamic>),
  coreUrl: json['coreUrl'] as String?,
  contactInfo: json['contactInfo'] == null
      ? null
      : ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
  theme: json['theme'] as String?,
  demo: json['demo'] as bool? ?? false,
);

Map<String, dynamic> _$ApplicationDTOToJson(_ApplicationDTO instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'environment': ?instance.environment,
      'iosPlatformId': ?instance.iosPlatformId,
      'androidPlatformId': ?instance.androidPlatformId,
      'termsConditionsUrl': ?instance.termsConditionsUrl,
      'appVersion': ?instance.appVersion,
      'androidVersion': ?instance.androidVersion,
      'iosVersion': ?instance.iosVersion,
      'coreUrl': ?instance.coreUrl,
      'contactInfo': ?instance.contactInfo,
      'theme': ?instance.theme,
      'demo': instance.demo,
    };

_ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) =>
    _ContactInfo(appSalesEmail: json['appSalesEmail'] as String?);

Map<String, dynamic> _$ContactInfoToJson(_ContactInfo instance) =>
    <String, dynamic>{'appSalesEmail': ?instance.appSalesEmail};
