import 'package:injectable/injectable.dart';

import '../../models/themes/theme_history_page_model.dart';
import '../../repository/theme/theme_history_repository.dart';

abstract class GetThemeHistoryUsecase {
  Future<ThemeHistoryPageModel> execute({
    required String applicationId,
    required String themeId,
    int? limit,
    String? startAfter,
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
}
