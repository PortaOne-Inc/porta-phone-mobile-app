import 'package:freezed_annotation/freezed_annotation.dart';

import 'text_style_dto.dart';

part 'text_style_collection_dto.freezed.dart';

part 'text_style_collection_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TextStyleCollectionDTO with _$TextStyleCollectionDTO {
  factory TextStyleCollectionDTO({
    String? fontFamily,
    TextStyleDTO? displayLarge,
    TextStyleDTO? displayMedium,
    TextStyleDTO? displaySmall,
    TextStyleDTO? headlineLarge,
    TextStyleDTO? headlineMedium,
    TextStyleDTO? headlineSmall,
    TextStyleDTO? titleLarge,
    TextStyleDTO? titleMedium,
    TextStyleDTO? titleSmall,
    TextStyleDTO? bodyLarge,
    TextStyleDTO? bodyMedium,
    TextStyleDTO? bodySmall,
    TextStyleDTO? labelLarge,
    TextStyleDTO? labelMedium,
    TextStyleDTO? labelSmall,
  }) = _TextStyleCollectionDTO;

  factory TextStyleCollectionDTO.fromJson(Map<String, Object?> json) => _$TextStyleCollectionDTOFromJson(json);
}
