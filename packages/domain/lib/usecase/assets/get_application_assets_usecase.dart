import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class GetApplicationAssetsUsecase {
  FutureOr<List<AssetModel>> execute({
    required String applicationId,
    bool includeUrl = true,
    int? urlTtlSec,
  });
}

@Injectable(as: GetApplicationAssetsUsecase)
class GetApplicationAssetsUsecaseImpl extends GetApplicationAssetsUsecase {
  GetApplicationAssetsUsecaseImpl({
    required this.assetRepository,
    @factoryParam this.defaultIncludeUrl = true,
    @factoryParam this.defaultUrlTtlSec = 3600,
  });

  final AssetRepository assetRepository;

  final bool defaultIncludeUrl;
  final int defaultUrlTtlSec;

  @override
  Future<List<AssetModel>> execute({
    required String applicationId,
    bool? includeUrl,
    int? urlTtlSec,
  }) {
    final withUrl = includeUrl ?? defaultIncludeUrl;
    final ttl = urlTtlSec ?? defaultUrlTtlSec;
    return assetRepository.getApplicationAssets(
      applicationId,
      includeUrl: withUrl,
      urlTtlSec: withUrl ? ttl : null,
    );
  }
}
