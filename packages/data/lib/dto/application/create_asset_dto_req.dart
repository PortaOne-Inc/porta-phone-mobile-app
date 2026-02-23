import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_asset_dto_req.freezed.dart';

part 'create_asset_dto_req.g.dart';

@freezed
sealed class CreateAssetDtoReq with _$CreateAssetDtoReq {
  const factory CreateAssetDtoReq({
    required String applicationId,
    required String storagePath,
    required String mimeType,
    required int size,
    String? checksum,
  }) = _CreateAssetDtoReq;

  factory CreateAssetDtoReq.fromJson(Map<String, dynamic> json) =>
      _$CreateAssetDtoReqFromJson(json);
}
