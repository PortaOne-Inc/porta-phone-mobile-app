import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_history_entry_dto.freezed.dart';

part 'theme_history_entry_dto.g.dart';

@freezed
sealed class ThemeHistoryEntryDto with _$ThemeHistoryEntryDto {
  const factory ThemeHistoryEntryDto({
    required String id,
    required String themeId,
    required String applicationId,
    required int snapshotVersion,
    required String action,
    required String createdAt,
    String? changedBy,
    Map<String, dynamic>? snapshot,
    @Default(0) int schemaVersion,
    @Default('') String tag,
    @Default('') String description,
    String? shareTokenId,
  }) = _ThemeHistoryEntryDto;

  factory ThemeHistoryEntryDto.fromJson(Map<String, dynamic> json) =>
      _$ThemeHistoryEntryDtoFromJson(json);
}
