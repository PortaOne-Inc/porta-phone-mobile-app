import 'package:injectable/injectable.dart';

import '../../models/themes/theme_history_entry_model.dart';
import '../../models/themes/theme_history_page_model.dart';
import '../../repository/theme/theme_history_repository.dart';

abstract class GetThemeHistoryUsecase {
  Future<ThemeHistoryPageModel> execute({
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

@LazySingleton(as: GetThemeHistoryUsecase)
class GetThemeHistoryUsecaseImpl implements GetThemeHistoryUsecase {
  GetThemeHistoryUsecaseImpl({required this.repository});

  final ThemeHistoryRepository repository;

  @override
  Future<ThemeHistoryPageModel> execute({
    required String applicationId,
    required String themeId,
    int? limit,
    String? startAfter,
  }) {
    return repository.getHistory(
      applicationId: applicationId,
      themeId: themeId,
      limit: limit,
      startAfter: startAfter,
    );
  }

  @override
  Future<ThemeHistoryEntryModel> createSnapshot({
    required String applicationId,
    required String themeId,
    String? tag,
    String? description,
  }) {
    return repository.createSnapshot(
      applicationId: applicationId,
      themeId: themeId,
      tag: tag,
      description: description,
    );
  }

  @override
  Future<ThemeHistoryEntryModel> updateEntry({
    required String applicationId,
    required String themeId,
    required String historyId,
    String? tag,
    String? description,
  }) {
    return repository.updateEntry(
      applicationId: applicationId,
      themeId: themeId,
      historyId: historyId,
      tag: tag,
      description: description,
    );
  }
}
