import 'package:domain/domain.dart';

abstract class ThemeRepository {
  Future<ThemeModel> createTheme(
    String applicationId,
    ThemeModel theme,
  );

  Future<ThemeModel> updateTheme(
    String applicationId,
    ThemeModel? theme,
  );

  Future<ThemeModel> updateStaticTheme(
    ThemeModel? theme,
  );

  Future<void> deleteTheme(
    String applicationId,
    String themeId,
  );

  Future<List<ThemeModel>> getThemes(
    String applicationId,
  );

  Future<ThemeModel> getTheme(
    String applicationId,
    String themeId,
  );

  Future<void> downloadTheme(
    String applicationId,
    String themeId,
  );

  Future<ThemeModel> getStaticTheme();
}
