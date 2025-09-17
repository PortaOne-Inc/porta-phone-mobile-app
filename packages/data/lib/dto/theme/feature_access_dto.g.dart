// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_access_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureAccessDtoImpl _$$FeatureAccessDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureAccessDtoImpl(
      applicationId: json['applicationId'] as String,
      status: json['status'] as String,
      config: json['config'] as Map<String, dynamic>,
      themeId: json['themeId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$FeatureAccessDtoImplToJson(
        _$FeatureAccessDtoImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'status': instance.status,
      'config': instance.config,
      'themeId': instance.themeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
