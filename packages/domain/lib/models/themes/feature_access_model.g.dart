// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureAccessModelImpl _$$FeatureAccessModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureAccessModelImpl(
      applicationId: json['applicationId'] as String,
      config: json['config'] as Map<String, dynamic>,
      themeId: json['themeId'] as String?,
      status:
          $enumDecodeNullable(_$FeatureAccessStatusEnumMap, json['status']) ??
              FeatureAccessStatus.draft,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$FeatureAccessModelImplToJson(
        _$FeatureAccessModelImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'config': instance.config,
      'themeId': instance.themeId,
      'status': _$FeatureAccessStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

const _$FeatureAccessStatusEnumMap = {
  FeatureAccessStatus.draft: 'draft',
  FeatureAccessStatus.published: 'published',
};
