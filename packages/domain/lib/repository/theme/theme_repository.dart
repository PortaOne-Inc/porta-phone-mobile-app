import 'package:data/dto/theme/theme_dto.dart';


abstract class ThemeRepository {
  Future<ThemeDTO> createTheme(
    String applicationId,
    ThemeDTO theme,
  );

  Future<ThemeDTO> updateTheme(
    String applicationId,
    ThemeDTO? theme,
  );

  Future<ThemeDTO> updateStaticTheme(
    ThemeDTO? theme,
  );

  Future deleteTheme(
    String applicationId,
    String themeId,
  );

  Future<List<ThemeDTO>> getThemes(
    String applicationId,
  );

  Future<ThemeDTO> getTheme(
    String applicationId,
    String themeId,
  );

  Future<ThemeDTO> getStaticTheme();
}
