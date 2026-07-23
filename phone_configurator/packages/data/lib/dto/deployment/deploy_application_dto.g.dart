// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deploy_application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeployApplicationDto _$DeployApplicationDtoFromJson(
  Map<String, dynamic> json,
) => _DeployApplicationDto(
  applicationId: json['applicationId'] as String,
  token: json['token'] as String,
  platforms: json['platforms'] as String,
  phoneSourceBranch: json['phoneSourceBranch'] as String,
  phoneConfiguratorToolSourceBranch:
      json['phoneConfiguratorToolSourceBranch'] as String,
  configuratorSourceBranch: json['configuratorSourceBranch'] as String,
  keystoreSourceBranch: json['keystoreSourceBranch'] as String,
  androidPlayStoreConfig: json['androidPlayStoreConfig'] as String,
);

Map<String, dynamic> _$DeployApplicationDtoToJson(
  _DeployApplicationDto instance,
) => <String, dynamic>{
  'applicationId': instance.applicationId,
  'token': instance.token,
  'platforms': instance.platforms,
  'phoneSourceBranch': instance.phoneSourceBranch,
  'phoneConfiguratorToolSourceBranch':
      instance.phoneConfiguratorToolSourceBranch,
  'configuratorSourceBranch': instance.configuratorSourceBranch,
  'keystoreSourceBranch': instance.keystoreSourceBranch,
  'androidPlayStoreConfig': instance.androidPlayStoreConfig,
};
