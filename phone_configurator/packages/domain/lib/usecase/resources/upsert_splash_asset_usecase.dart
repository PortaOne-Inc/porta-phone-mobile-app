import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class UpsertSplashAssetUsecase {
  FutureOr<SplashAssetModel> execute({
    required String applicationId,
    required String themeId,
    required List<ArtifactUpload> uploads,
    String? assetId,
    SplashMode? mode,
    SplashAssetParams? params,
    SplashSource? source,
  });
}

@Injectable(as: UpsertSplashAssetUsecase)
class UpsertSplashAssetUsecaseImpl implements UpsertSplashAssetUsecase {
  UpsertSplashAssetUsecaseImpl(this.repo);

  final SplashAssetRepository repo;

  @override
  Future<SplashAssetModel> execute({
    required String applicationId,
    required String themeId,
    required List<ArtifactUpload> uploads,
    String? assetId,
    SplashMode? mode,
    SplashAssetParams? params,
    SplashSource? source,
  }) {
    return repo.upsertWithFilesByTheme(
      applicationId: applicationId,
      themeId: themeId,
      mode: mode,
      params: params,
      source: source,
      uploads: uploads,
    );
  }
}
