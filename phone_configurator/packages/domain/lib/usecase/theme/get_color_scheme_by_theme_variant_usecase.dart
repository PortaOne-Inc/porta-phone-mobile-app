import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class GetColorSchemeByThemeVariantUsecase {
  Future<ColorSchemeModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  });
}

@LazySingleton(as: GetColorSchemeByThemeVariantUsecase)
class GetColorSchemeByThemeVariantUsecaseImpl
    implements GetColorSchemeByThemeVariantUsecase {
  GetColorSchemeByThemeVariantUsecaseImpl(this._repo);

  final ColorSchemeRepository _repo;

  @override
  Future<ColorSchemeModel> execute({
    required String applicationId,
    required String themeId,
    required BrightnessVariant variant,
  }) {
    return _repo.getByThemeVariant(
      applicationId: applicationId,
      themeId: themeId,
      variant: variant,
    );
  }
}
