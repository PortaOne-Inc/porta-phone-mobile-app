import 'package:freezed_annotation/freezed_annotation.dart';

import 'theme_history_entry_model.dart';

part 'theme_history_page_model.freezed.dart';

part 'theme_history_page_model.g.dart';

@freezed
sealed class ThemeHistoryPageModel with _$ThemeHistoryPageModel {
  const factory ThemeHistoryPageModel({
    required List<ThemeHistoryEntryModel> items,
    String? nextCursor,
  }) = _ThemeHistoryPageModel;

  factory ThemeHistoryPageModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeHistoryPageModelFromJson(json);
}
