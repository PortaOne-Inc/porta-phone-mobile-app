import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_dto.freezed.dart';

part 'asset_dto.g.dart';

@freezed
sealed class AssetLinkDto with _$AssetLinkDto {
  const factory AssetLinkDto({required String type, required String id}) =
      _AssetLinkDto;

  factory AssetLinkDto.fromJson(Map<String, dynamic> json) =>
      _$AssetLinkDtoFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false, toJson: true)
sealed class AssetDTO with _$AssetDTO {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory AssetDTO({
    required String id,
    required String ownerId,
    required String storagePath,
    required String mimeType,
    required int size,
    required String createdAt,
    required String updatedAt,
    String? checksum,
    @Default(0) int refCount,
    @Default(<AssetLinkDto>[]) List<AssetLinkDto> usedBy,
    String? downloadUrl,
  }) = _AssetDTO;

  const AssetDTO._();

  factory AssetDTO.fromJson(Map<String, Object?> json) =>
      _$AssetDTOFromJson(json);
}
