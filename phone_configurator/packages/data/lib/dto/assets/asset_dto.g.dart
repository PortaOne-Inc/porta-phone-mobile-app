// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetLinkDto _$AssetLinkDtoFromJson(Map<String, dynamic> json) =>
    _AssetLinkDto(type: json['type'] as String, id: json['id'] as String);

Map<String, dynamic> _$AssetLinkDtoToJson(_AssetLinkDto instance) =>
    <String, dynamic>{'type': instance.type, 'id': instance.id};

_AssetDTO _$AssetDTOFromJson(Map<String, dynamic> json) => _AssetDTO(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  storagePath: json['storagePath'] as String,
  mimeType: json['mimeType'] as String,
  size: (json['size'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  checksum: json['checksum'] as String?,
  refCount: (json['refCount'] as num?)?.toInt() ?? 0,
  usedBy:
      (json['usedBy'] as List<dynamic>?)
          ?.map((e) => AssetLinkDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AssetLinkDto>[],
  downloadUrl: json['downloadUrl'] as String?,
);

Map<String, dynamic> _$AssetDTOToJson(_AssetDTO instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'storagePath': instance.storagePath,
  'mimeType': instance.mimeType,
  'size': instance.size,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'checksum': ?instance.checksum,
  'refCount': instance.refCount,
  'usedBy': instance.usedBy,
  'downloadUrl': ?instance.downloadUrl,
};
