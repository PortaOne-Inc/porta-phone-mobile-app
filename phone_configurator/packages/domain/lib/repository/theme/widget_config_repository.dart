import 'package:domain/models/models.dart';

abstract class WidgetConfigRepository {
  Future<WidgetsConfig> getByThemeVariant(
    String applicationId,
    String themeId,
    BrightnessVariant variant,
  );

  Future<List<WidgetsConfig>> listForTheme(
    String applicationId,
    String themeId,
  );

  Future<WidgetsConfig> upsertByThemeVariant(
    String applicationId,
    String themeId,
    BrightnessVariant variant,
    Map<String, dynamic>? config, {
    int? expectedVersion,
  });

  Future<Map<String, WidgetsConfig>> ensurePair(
    String applicationId,
    String themeId,
  );
}
