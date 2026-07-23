import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class WatchApplicationAssetsUsecase {
  Stream<List<AssetModel>> execute(
    String applicationId, {
    bool includeUrl = true,
    int? urlTtlSec,
  });
}

@Injectable(as: WatchApplicationAssetsUsecase)
class WatchApplicationAssetsUsecaseImpl extends WatchApplicationAssetsUsecase {
  WatchApplicationAssetsUsecaseImpl(this._repo);

  final AssetRepository _repo;

  @override
  Stream<List<AssetModel>> execute(
    String applicationId, {
    bool includeUrl = true,
    int? urlTtlSec,
  }) {
    unawaited(_repo.getApplicationAssets(applicationId));
    return _repo.watchApplicationAssets(
      applicationId,
      includeUrl: includeUrl,
      urlTtlSec: urlTtlSec,
    );
  }
}
