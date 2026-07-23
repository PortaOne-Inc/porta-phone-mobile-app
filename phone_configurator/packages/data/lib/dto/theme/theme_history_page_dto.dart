import 'package:freezed_annotation/freezed_annotation.dart';

import 'theme_history_entry_dto.dart';

part 'theme_history_page_dto.freezed.dart';

part 'theme_history_page_dto.g.dart';

@freezed
sealed class ThemeHistoryPageDto with _$ThemeHistoryPageDto {
  const factory ThemeHistoryPageDto({
    required List<ThemeHistoryEntryDto> items,
    String? nextCursor,
  }) = _ThemeHistoryPageDto;

  factory ThemeHistoryPageDto.fromJson(Map<String, dynamic> json) =>
      _$ThemeHistoryPageDtoFromJson(json);
}
