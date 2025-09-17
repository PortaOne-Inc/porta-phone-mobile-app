// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded_resource_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmbeddedResourceDtoImpl _$$EmbeddedResourceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbeddedResourceDtoImpl(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      uri: json['uri'] as String,
      type: json['type'] as String? ?? 'unknown',
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
      metadata: json['metadata'] == null
          ? const MetadataDto()
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      payload: (json['payload'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      enableConsoleLogCapture:
          json['enableConsoleLogCapture'] as bool? ?? false,
      reconnectStrategy: json['reconnectStrategy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$EmbeddedResourceDtoImplToJson(
        _$EmbeddedResourceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'uri': instance.uri,
      'type': instance.type,
      'attributes': instance.attributes,
      'metadata': instance.metadata.toJson(),
      'payload': instance.payload,
      'enableConsoleLogCapture': instance.enableConsoleLogCapture,
      if (instance.reconnectStrategy case final value?)
        'reconnectStrategy': value,
      if (instance.createdAt case final value?) 'createdAt': value,
      if (instance.updatedAt case final value?) 'updatedAt': value,
    };

_$MetadataDtoImpl _$$MetadataDtoImplFromJson(Map<String, dynamic> json) =>
    _$MetadataDtoImpl(
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$MetadataDtoImplToJson(_$MetadataDtoImpl instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
    };
