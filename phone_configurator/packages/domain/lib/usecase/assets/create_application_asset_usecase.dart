import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class CreateApplicationAssetUsecase {
  FutureOr<AssetModel> execute({
    required String applicationId,
    required String filename,
    required List<int> bytes,
    required String mimeType,
  });
}

@Injectable(as: CreateApplicationAssetUsecase)
class CreateApplicationAssetUsecaseImpl extends CreateApplicationAssetUsecase {
  CreateApplicationAssetUsecaseImpl({required this.assetRepository});

  final AssetRepository assetRepository;

  @override
  Future<AssetModel> execute({
    required String applicationId,
    required String filename,
    required List<int> bytes,
    required String mimeType,
  }) {
    return assetRepository.createAssetFromFile(
      applicationId: applicationId,
      filename: filename,
      bytes: bytes,
      mimeType: mimeType,
    );
  }
}
