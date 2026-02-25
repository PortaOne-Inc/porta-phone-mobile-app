import 'package:domain/domain.dart';

abstract class ThemeHistoryRepository {
  Future<ThemeHistoryPageModel> getHistory({
    required String applicationId,
    required String themeId,
    int? limit,
    String? startAfter,
  });

  Future<ThemeHistoryEntryModel> createSnapshot({
    required String applicationId,
    required String themeId,
    String? tag,
    String? description,
  });

  Future<ThemeHistoryEntryModel> updateEntry({
    required String applicationId,
    required String themeId,
    required String historyId,
    String? tag,
    String? description,
  });
}
