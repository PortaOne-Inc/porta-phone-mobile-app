import 'package:domain/domain.dart';

import '../../entity/models/theme/splash_asset_model.dart';

abstract class ThemeRepository {
  Future<ThemeModel> createTheme(
    String applicationId,
    ThemeModel theme,
  );

  Future<ThemeModel> updateTheme(
    String applicationId,
    ThemeModel? theme,
  );

  Future<void> deleteTheme(
    String applicationId,
    String themeId,
  );

  Future<List<ThemeModel>> getThemes(
    String applicationId,
  );

  Future<ThemeModel> getTheme(
    String applicationId,
    String themeId,
  );

  Future<void> downloadTheme(
    String applicationId,
    String themeId,
  );

// Assets

  Future<List<ThemeAssetModel>> addThemeAssets(
    String applicationId,
    String themeId,
    List<ThemeAssetModel> assets,
  );

  Future<ThemeModel> updateLaunchAssets(
    String applicationId,
    String themeId,
    LaunchAssetsModel launchAssets,
  );

  Future<void> deleteLaunchAssets(
    String applicationId,
    String themeId,
  );

  Future<ThemeModel> updateSplashAsset(
    String applicationId,
    String themeId,
    SplashAssetModel splashAsset,
  );
}
