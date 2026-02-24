import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UpsertColorSchemeByThemeVariantUsecase {
  Future<ColorSchemeModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  });
}

@LazySingleton(as: UpsertColorSchemeByThemeVariantUsecase)
class UpsertColorSchemeByThemeVariantUsecaseImpl
    implements UpsertColorSchemeByThemeVariantUsecase {
  UpsertColorSchemeByThemeVariantUsecaseImpl(this._repo);

  final ColorSchemeRepository _repo;

  @override
  Future<ColorSchemeModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
    Map<String, dynamic>? config,
    int? expectedVersion,
  }) {
    return _repo.upsertByThemeVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant,
      config: config,
      expectedVersion: expectedVersion,
    );
  }
}
