import 'package:freezed_annotation/freezed_annotation.dart';

import '../color/color_dto.dart';
import '../image/image_collection_dto.dart';
import 'theme_common_dto.dart';

part 'theme_dto.freezed.dart';

part 'theme_dto.g.dart';

toNull(_) => null;

@Freezed(makeCollectionsUnmodifiable: false)
class ThemeDTO with _$ThemeDTO {
  const factory ThemeDTO({
    String? id,
    String? name,
    String? fontFamily,
    ImageCollectionDTO? images,
    ColorDTO? colorScheme,
  }) = _ThemeDTO;

  factory ThemeDTO.fromJson(Map<String, Object?> json) => _$ThemeDTOFromJson(json);
}
