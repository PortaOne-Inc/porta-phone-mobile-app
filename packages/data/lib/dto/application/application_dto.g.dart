// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicationDTOImpl _$$ApplicationDTOImplFromJson(Map<String, dynamic> json) =>
    _$ApplicationDTOImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      iosPlatformId: json['iosPlatformId'] as String?,
      androidPlatformId: json['androidPlatformId'] as String?,
      termsConditionsUrl: json['termsConditionsUrl'] as String?,
      appVersion: json['appVersion'] == null
          ? null
          : BuildVersionDTO.fromJson(
              json['appVersion'] as Map<String, dynamic>),
      androidVersion: json['androidVersion'] == null
          ? null
          : BuildVersionDTO.fromJson(
              json['androidVersion'] as Map<String, dynamic>),
      iosVersion: json['iosVersion'] == null
          ? null
          : BuildVersionDTO.fromJson(
              json['iosVersion'] as Map<String, dynamic>),
      coreUrl: json['coreUrl'] as String?,
      contactInfo: json['contactInfo'] == null
          ? null
          : ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>),
      theme: json['theme'] as String?,
      demo: json['demo'] as bool? ?? false,
    );

Map<String, dynamic> _$$ApplicationDTOImplToJson(
        _$ApplicationDTOImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.iosPlatformId case final value?) 'iosPlatformId': value,
      if (instance.androidPlatformId case final value?)
        'androidPlatformId': value,
      if (instance.termsConditionsUrl case final value?)
        'termsConditionsUrl': value,
      if (instance.appVersion case final value?) 'appVersion': value,
      if (instance.androidVersion case final value?) 'androidVersion': value,
      if (instance.iosVersion case final value?) 'iosVersion': value,
      if (instance.coreUrl case final value?) 'coreUrl': value,
      if (instance.contactInfo case final value?) 'contactInfo': value,
      if (instance.theme case final value?) 'theme': value,
      'demo': instance.demo,
    };

_$ContactInfoImpl _$$ContactInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContactInfoImpl(
      appSalesEmail: json['appSalesEmail'] as String?,
    );

Map<String, dynamic> _$$ContactInfoImplToJson(_$ContactInfoImpl instance) =>
    <String, dynamic>{
      if (instance.appSalesEmail case final value?) 'appSalesEmail': value,
    };
