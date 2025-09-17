import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class DeleteSplashAssetUsecase {
  FutureOr<void> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: DeleteSplashAssetUsecase)
class DeleteSplashAssetUsecaseImpl implements DeleteSplashAssetUsecase {
  DeleteSplashAssetUsecaseImpl(this._repo);
  final SplashAssetRepository _repo;

  @override
  Future<void> execute({
    required String applicationId,
    required String themeId,
  }) {
    return _repo.deleteByTheme(applicationId: applicationId, themeId: themeId);
  }
}
