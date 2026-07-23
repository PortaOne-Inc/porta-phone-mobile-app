import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class UpsertLaunchAssetsUsecase {
  FutureOr<LaunchAssetsModel> execute({
    required String applicationId,
    required String themeId,
    required List<LaunchArtifactUpload> uploads,
    SourceConfigModel? source,
    PlatformParamsModel? params,
  });
}

@Injectable(as: UpsertLaunchAssetsUsecase)
class UpsertLaunchAssetsUsecaseImpl extends UpsertLaunchAssetsUsecase {
  UpsertLaunchAssetsUsecaseImpl(this.repo);

  final LaunchAssetsRepository repo;

  @override
  Future<LaunchAssetsModel> execute({
    required String applicationId,
    required String themeId,
    required List<LaunchArtifactUpload> uploads,
    SourceConfigModel? source,
    PlatformParamsModel? params,
  }) {
    return repo.upsertWithFilesByTheme(
      applicationId: applicationId,
      themeId: themeId,
      source: source,
      params: params,
      uploads: uploads,
    );
  }
}
