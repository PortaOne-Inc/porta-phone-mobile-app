// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_scheme_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorSchemeDtoImpl _$$ColorSchemeDtoImplFromJson(Map<String, dynamic> json) =>
    _$ColorSchemeDtoImpl(
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      variant: json['variant'] as String,
      config: json['config'] as Map<String, dynamic>,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ColorSchemeDtoImplToJson(
        _$ColorSchemeDtoImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'variant': instance.variant,
      'config': instance.config,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
