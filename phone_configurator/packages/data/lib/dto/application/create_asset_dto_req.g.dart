// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_dto_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAssetDtoReq _$CreateAssetDtoReqFromJson(Map<String, dynamic> json) =>
    _CreateAssetDtoReq(
      applicationId: json['applicationId'] as String,
      storagePath: json['storagePath'] as String,
      mimeType: json['mimeType'] as String,
      size: (json['size'] as num).toInt(),
      checksum: json['checksum'] as String?,
    );

Map<String, dynamic> _$CreateAssetDtoReqToJson(_CreateAssetDtoReq instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'storagePath': instance.storagePath,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'checksum': instance.checksum,
    };
