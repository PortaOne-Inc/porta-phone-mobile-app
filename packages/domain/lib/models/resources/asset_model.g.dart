// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => _AssetModel(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  storagePath: json['storagePath'] as String,
  mimeType: json['mimeType'] as String,
  size: (json['size'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  checksum: json['checksum'] as String?,
  refCount: (json['refCount'] as num?)?.toInt() ?? 0,
  usedBy:
      (json['usedBy'] as List<dynamic>?)
          ?.map((e) => AssetLink.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AssetLink>[],
  downloadUrl: json['downloadUrl'] as String?,
);

Map<String, dynamic> _$AssetModelToJson(_AssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'storagePath': instance.storagePath,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'checksum': instance.checksum,
      'refCount': instance.refCount,
      'usedBy': instance.usedBy,
      'downloadUrl': instance.downloadUrl,
    };
