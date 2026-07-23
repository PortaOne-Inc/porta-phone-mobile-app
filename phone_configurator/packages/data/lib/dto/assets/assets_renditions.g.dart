// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_renditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetsRendition _$AssetsRenditionFromJson(Map<String, dynamic> json) =>
    _AssetsRendition(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      applicationId: json['applicationId'] as String,
      themeId: json['themeId'] as String,
      kind: json['kind'] as String,
      sources: (json['sources'] as List<dynamic>)
          .map((e) => AssetsRenditionSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      storagePath: json['storagePath'] as String,
      mimeType: json['mimeType'] as String,
      size: (json['size'] as num).toInt(),
      checksum: json['checksum'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      refCount: (json['refCount'] as num).toInt(),
      usedBy: json['usedBy'] as List<dynamic>,
      downloadUrl: json['downloadUrl'] as String,
    );

Map<String, dynamic> _$AssetsRenditionToJson(_AssetsRendition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'applicationId': instance.applicationId,
      'themeId': instance.themeId,
      'kind': instance.kind,
      'sources': instance.sources,
      'storagePath': instance.storagePath,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'checksum': instance.checksum,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'refCount': instance.refCount,
      'usedBy': instance.usedBy,
      'downloadUrl': instance.downloadUrl,
    };

_AssetsRenditionSource _$AssetsRenditionSourceFromJson(
  Map<String, dynamic> json,
) => _AssetsRenditionSource(
  type: json['type'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$AssetsRenditionSourceToJson(
  _AssetsRenditionSource instance,
) => <String, dynamic>{'type': instance.type, 'id': instance.id};
