// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_dto_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateAssetDtoReqImpl _$$CreateAssetDtoReqImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAssetDtoReqImpl(
      applicationId: json['applicationId'] as String,
      storagePath: json['storagePath'] as String,
      mimeType: json['mimeType'] as String,
      size: (json['size'] as num).toInt(),
      checksum: json['checksum'] as String?,
    );

Map<String, dynamic> _$$CreateAssetDtoReqImplToJson(
        _$CreateAssetDtoReqImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'storagePath': instance.storagePath,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'checksum': instance.checksum,
    };
