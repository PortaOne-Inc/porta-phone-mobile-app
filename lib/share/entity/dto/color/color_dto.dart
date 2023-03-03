import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_dto.freezed.dart';

part 'color_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ColorDTO with _$ColorDTO {
  const factory ColorDTO({
    int? primary,
    int? onPrimary,
    int? secondary,
    int? secondaryContainer,
    int? onSecondaryContainer,
    int? tertiary,
    int? error,
    int? outline,
    int? background,
    int? onBackground,
    int? surface,
    int? onSurface,
    List<int>? gradientTabColor,
  }) = _ColorDTO;

  factory ColorDTO.fromJson(Map<String, Object?> json) => _$ColorDTOFromJson(json);
}
