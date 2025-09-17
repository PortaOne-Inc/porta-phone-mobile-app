import 'package:domain/models/models.dart';

abstract class SplashAssetRepository {
  Future<SplashAssetModel> getByTheme({
    required String applicationId,
    required String themeId,
  });

  Future<SplashAssetModel> upsertWithFilesByTheme({
    required String applicationId,
    required String themeId,
    required List<ArtifactUpload> uploads,
    SplashMode? mode,
    SplashAssetParams? params,
    SplashSource? source,
  });

  Future<void> deleteByTheme({
    required String applicationId,
    required String themeId,
  });

  Future<SplashConstraintsDefaultsModel> getConstraintsDefaults({
    required String applicationId,
    required String themeId,
  });
}
