import 'dart:async';
import 'package:injectable/injectable.dart';

import '../../repository/application/asset_repository.dart';

/// Contract
abstract class GetAssetDownloadUrlUsecase {
  FutureOr<String> execute({
    required String applicationId,
    required String assetId,
  });
}

/// Impl
@Injectable(as: GetAssetDownloadUrlUsecase)
class GetAssetDownloadUrlUsecaseImpl extends GetAssetDownloadUrlUsecase {
  GetAssetDownloadUrlUsecaseImpl(this._repository);

  final AssetRepository _repository;

  @override
  Future<String> execute({
    required String applicationId,
    required String assetId,
  }) {
    return _repository.getDownloadUrl(applicationId, assetId);
  }
}
