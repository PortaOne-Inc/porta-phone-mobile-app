import '../../entity/dto/dto.dart';

abstract class ThemeRepository {
  Future<ThemeDTO> createTheme(
    String userId,
    String applicationId,
    ThemeDTO theme,
  );

  Future<ThemeDTO> updateTheme(
    String userId,
    String applicationId,
    ThemeDTO? theme,
  );

  Future deleteTheme(
    String applicationId,
    String themeId,
  );

  Future<List<ThemeDTO>> getThemes(
    String userId,
    String applicationId,
  );

  Future<ThemeDTO> getTheme(
    String userId,
    String applicationId,
    String themeId,
  );

  Future<String> uploadThemeImage(
    ImageDTO imageDTO,
  );
}
