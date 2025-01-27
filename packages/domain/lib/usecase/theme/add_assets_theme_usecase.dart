import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class AddAssetsThemeUsecase {
  Future<List<ThemeAssetModel>> execute({
    required String applicationId,
    required String themeId,
    required ThemeAssetModel asset,
  });
}

@Injectable(as: AddAssetsThemeUsecase)
class AddAssetsThemeUsecaseImpl implements AddAssetsThemeUsecase {
  AddAssetsThemeUsecaseImpl(
    this._themeRepository,
  );

  final ThemeRepository _themeRepository;

  @override
  Future<List<ThemeAssetModel>> execute({
    required String applicationId,
    required String themeId,
    required ThemeAssetModel asset,
  }) {
    return _themeRepository.addThemeAssets(applicationId, themeId, [asset]);
  }
}
