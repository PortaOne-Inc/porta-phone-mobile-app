import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_common_dto.freezed.dart';

part 'theme_common_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ThemeCommonDTO with _$ThemeCommonDTO {
  const factory ThemeCommonDTO({
    String? appName,
  }) = _ThemeCommonDTO;

  factory ThemeCommonDTO.fromJson(Map<String, Object?> json) => _$ThemeCommonDTOFromJson(json);
}
