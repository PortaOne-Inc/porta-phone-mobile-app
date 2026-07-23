import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class DeleteApplicationAssetUsecase {
  FutureOr<void> execute({
    required String applicationId,
    required String assetId,
  });
}

@Injectable(as: DeleteApplicationAssetUsecase)
class DeleteApplicationAssetUsecaseImpl extends DeleteApplicationAssetUsecase {
  DeleteApplicationAssetUsecaseImpl(this.assetRepository);

  final AssetRepository assetRepository;

  @override
  Future<void> execute({
    required String applicationId,
    required String assetId,
  }) {
    return assetRepository.deleteAsset(applicationId, assetId);
  }
}
