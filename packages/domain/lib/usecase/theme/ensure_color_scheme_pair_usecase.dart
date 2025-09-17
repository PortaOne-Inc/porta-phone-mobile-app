// domain/lib/usecase/color_schemes/ensure_color_scheme_pair_usecase.dart
import 'package:injectable/injectable.dart';

import '../../models/themes/color_scheme_model.dart';
import '../../repository/theme/color_scheme_repository.dart';

abstract class EnsureColorSchemePairUsecase {
  Future<(ColorSchemeModel light, ColorSchemeModel dark)> execute({
    required String applicationId,
    required String themeId,
  });
}

@LazySingleton(as: EnsureColorSchemePairUsecase)
class EnsureColorSchemePairUsecaseImpl implements EnsureColorSchemePairUsecase {
  EnsureColorSchemePairUsecaseImpl(this._repo);

  final ColorSchemeRepository _repo;

  @override
  Future<(ColorSchemeModel light, ColorSchemeModel dark)> execute({
    required String applicationId,
    required String themeId,
  }) {
    return _repo.ensurePair(applicationId: applicationId, themeId: themeId);
  }
}
