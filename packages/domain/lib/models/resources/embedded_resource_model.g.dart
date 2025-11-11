// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedded_resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmbeddedResource _$EmbeddedResourceFromJson(
  Map<String, dynamic> json,
) => _EmbeddedResource(
  uri: json['uri'] as String,
  applicationId: json['applicationId'] as String,
  id: json['id'] as String?,
  type:
      $enumDecodeNullable(_$EmbeddedResourceModelTypeEnumMap, json['type']) ??
      EmbeddedResourceModelType.unknown,
  attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
  metadata: json['metadata'] == null
      ? const MetadataModel()
      : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
  payload:
      (json['payload'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  enableConsoleLogCapture: json['enableConsoleLogCapture'] as bool? ?? false,
  reconnectStrategy: json['reconnectStrategy'] as String?,
);

Map<String, dynamic> _$EmbeddedResourceToJson(_EmbeddedResource instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'applicationId': instance.applicationId,
      'id': instance.id,
      'type': _$EmbeddedResourceModelTypeEnumMap[instance.type]!,
      'attributes': instance.attributes,
      'metadata': instance.metadata.toJson(),
      'payload': instance.payload,
      'enableConsoleLogCapture': instance.enableConsoleLogCapture,
      'reconnectStrategy': instance.reconnectStrategy,
    };

const _$EmbeddedResourceModelTypeEnumMap = {
  EmbeddedResourceModelType.terms: 'terms',
  EmbeddedResourceModelType.unknown: 'unknown',
};
