import 'package:domain/models/models.dart';

abstract class PageConfigRepository {
  Future<List<PageConfigModel>> listForTheme({
    required String applicationId,
    required String themeId,
  });

  Future<({PageConfigModel light, PageConfigModel dark})> ensurePair({
    required String applicationId,
    required String themeId,
  });

  Future<PageConfigModel> getByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  });

  Future<PageConfigModel> upsertByThemeVariant({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  });
}
