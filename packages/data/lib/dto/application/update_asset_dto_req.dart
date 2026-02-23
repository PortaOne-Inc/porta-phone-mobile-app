import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_asset_dto_req.freezed.dart';

part 'update_asset_dto_req.g.dart';

@freezed
sealed class UpdateAssetDtoReq with _$UpdateAssetDtoReq {
  const factory UpdateAssetDtoReq({String? checksum}) = _UpdateAssetDtoReq;

  factory UpdateAssetDtoReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssetDtoReqFromJson(json);
}
