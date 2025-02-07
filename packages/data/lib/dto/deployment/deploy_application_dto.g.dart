// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deploy_application_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeployApplicationDtoImpl _$$DeployApplicationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DeployApplicationDtoImpl(
      applicationId: json['applicationId'] as String,
      platforms: json['platforms'] as String,
      type: json['type'] as String,
      phoneSourceBranch: json['phoneSourceBranch'] as String,
      phoneConfiguratorToolSourceBranch:
          json['phoneConfiguratorToolSourceBranch'] as String,
      callkeepSourceBranch: json['callkeepSourceBranch'] as String,
      configuratorSourceBranch: json['configuratorSourceBranch'] as String,
      keystoreSourceBranch: json['keystoreSourceBranch'] as String,
      androidPlayStoreConfig: json['androidPlayStoreConfig'] as String,
    );

Map<String, dynamic> _$$DeployApplicationDtoImplToJson(
        _$DeployApplicationDtoImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'platforms': instance.platforms,
      'type': instance.type,
      'phoneSourceBranch': instance.phoneSourceBranch,
      'phoneConfiguratorToolSourceBranch':
          instance.phoneConfiguratorToolSourceBranch,
      'callkeepSourceBranch': instance.callkeepSourceBranch,
      'configuratorSourceBranch': instance.configuratorSourceBranch,
      'keystoreSourceBranch': instance.keystoreSourceBranch,
      'androidPlayStoreConfig': instance.androidPlayStoreConfig,
    };
