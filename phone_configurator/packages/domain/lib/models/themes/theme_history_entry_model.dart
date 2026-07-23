import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_history_entry_model.freezed.dart';

part 'theme_history_entry_model.g.dart';

@freezed
sealed class ThemeHistoryEntryModel with _$ThemeHistoryEntryModel {
  const factory ThemeHistoryEntryModel({
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
  }) = _ThemeHistoryEntryModel;

  factory ThemeHistoryEntryModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeHistoryEntryModelFromJson(json);
}
