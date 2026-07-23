import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class GetLaunchAssetsUsecase {
  FutureOr<LaunchAssetsEnvelope> execute(
    String applicationId,
    String themeId, {
    bool includeUrl = false,
    int? urlTtlSec,
    bool withValidation = false,
  });
}

@Injectable(as: GetLaunchAssetsUsecase)
class GetLaunchAssetsUsecaseImpl extends GetLaunchAssetsUsecase {
  GetLaunchAssetsUsecaseImpl(this.repo);

  final LaunchAssetsRepository repo;

  @override
  Future<LaunchAssetsEnvelope> execute(
    String applicationId,
    String themeId, {
    bool includeUrl = true,
    int? urlTtlSec,
    bool withValidation = false,
  }) {
    return repo.getByTheme(
      applicationId: applicationId,
      themeId: themeId,
      includeUrl: includeUrl,
      urlTtlSec: urlTtlSec,
      withValidation: withValidation,
    );
  }
}
