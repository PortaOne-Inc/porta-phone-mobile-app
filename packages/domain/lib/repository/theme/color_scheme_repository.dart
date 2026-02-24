import 'package:domain/models/models.dart';

abstract class ColorSchemeRepository {
  Future<ColorSchemeModel> getByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  });

  Future<List<ColorSchemeModel>> listForTheme({
    required String applicationId,
    required String themeId,
  });

  Future<(ColorSchemeModel light, ColorSchemeModel dark)> ensurePair({
    required String applicationId,
    required String themeId,
  });

  Future<ColorSchemeModel> upsertByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  });
}
