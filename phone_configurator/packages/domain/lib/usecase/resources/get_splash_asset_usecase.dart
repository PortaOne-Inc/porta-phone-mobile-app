import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class GetSplashAssetUsecase {
  FutureOr<SplashAssetModel> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: GetSplashAssetUsecase)
class GetSplashAssetUsecaseImpl extends GetSplashAssetUsecase {
  GetSplashAssetUsecaseImpl(this._repo);

  final SplashAssetRepository _repo;

  @override
  Future<SplashAssetModel> execute({
    required String applicationId,
    required String themeId,
  }) {
    return _repo.getByTheme(applicationId: applicationId, themeId: themeId);
  }
}
