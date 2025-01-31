import 'package:domain/entity/models/theme/splash_asset_model.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class UpdateSplashAssetsThemeUsecase {
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    required SplashAssetModel splashAsset,
  });
}

@Injectable(as: UpdateSplashAssetsThemeUsecase)
class UpdateSplashAssetsThemeUsecaseImpl implements UpdateSplashAssetsThemeUsecase {
  UpdateSplashAssetsThemeUsecaseImpl(
    this._themeRepository,
  );

  final ThemeRepository _themeRepository;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    required SplashAssetModel splashAsset,
  }) {
    return _themeRepository.updateSplashAsset(applicationId, themeId, splashAsset);
  }
}
