import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_style_dto.freezed.dart';

part 'text_style_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TextStyleDTO with _$TextStyleDTO {
  const factory TextStyleDTO({
    double? height,
    double? letterSpacing,
    double? wordSpacing,
  }) = _TextStyleDTO;

  factory TextStyleDTO.fromJson(Map<String, Object?> json) => _$TextStyleDTOFromJson(json);
}
