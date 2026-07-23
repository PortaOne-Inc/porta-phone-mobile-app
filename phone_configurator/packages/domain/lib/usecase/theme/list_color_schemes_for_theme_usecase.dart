import 'package:injectable/injectable.dart';

import '../../models/themes/color_scheme_model.dart';
import '../../repository/theme/color_scheme_repository.dart';

abstract class ListColorSchemesForThemeUsecase {
  Future<List<ColorSchemeModel>> execute({
    required String applicationId,
    required String themeId,
  });
}

@LazySingleton(as: ListColorSchemesForThemeUsecase)
class ListColorSchemesForThemeUsecaseImpl
    implements ListColorSchemesForThemeUsecase {
  ListColorSchemesForThemeUsecaseImpl(this._repo);

  final ColorSchemeRepository _repo;

  @override
  Future<List<ColorSchemeModel>> execute({
    required String applicationId,
    required String themeId,
  }) {
    return _repo.listForTheme(applicationId: applicationId, themeId: themeId);
  }
}
