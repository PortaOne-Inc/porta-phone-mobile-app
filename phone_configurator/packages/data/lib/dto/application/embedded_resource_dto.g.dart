// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded_resource_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmbeddedResourceDto _$EmbeddedResourceDtoFromJson(
  Map<String, dynamic> json,
) => _EmbeddedResourceDto(
  applicationId: json['applicationId'] as String,
  uri: json['uri'] as String,
  id: json['id'] as String?,
  type: json['type'] as String? ?? 'unknown',
  attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
  metadata: json['metadata'] == null
      ? const MetadataDto()
      : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  payload:
      (json['payload'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  enableConsoleLogCapture: json['enableConsoleLogCapture'] as bool? ?? false,
  reconnectStrategy: json['reconnectStrategy'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$EmbeddedResourceDtoToJson(
  _EmbeddedResourceDto instance,
) => <String, dynamic>{
  'applicationId': instance.applicationId,
  'uri': instance.uri,
  'id': ?instance.id,
  'type': instance.type,
  'attributes': instance.attributes,
  'metadata': instance.metadata.toJson(),
  'payload': instance.payload,
  'enableConsoleLogCapture': instance.enableConsoleLogCapture,
  'reconnectStrategy': ?instance.reconnectStrategy,
  'createdAt': ?instance.createdAt,
  'updatedAt': ?instance.updatedAt,
};

_MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => _MetadataDto(
  attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$MetadataDtoToJson(_MetadataDto instance) =>
    <String, dynamic>{'attributes': instance.attributes};
