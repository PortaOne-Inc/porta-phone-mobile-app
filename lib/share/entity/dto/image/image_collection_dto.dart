import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_dto.dart';

part 'image_collection_dto.freezed.dart';

part 'image_collection_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ImageCollectionDTO with _$ImageCollectionDTO {
  const factory ImageCollectionDTO({
    ImageDTO? onboarding,
    ImageDTO? logo,
  }) = _ImageCollectionDTO;

  factory ImageCollectionDTO.fromJson(Map<String, Object?> json) => _$ImageCollectionDTOFromJson(json);
}
