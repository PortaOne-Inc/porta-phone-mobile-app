import 'package:domain/domain.dart';

abstract class ThemeHistoryRepository {
  Future<ThemeHistoryPageModel> getHistory({
    required String applicationId,
    required String themeId,
    int? limit,
    String? startAfter,
  });
}
