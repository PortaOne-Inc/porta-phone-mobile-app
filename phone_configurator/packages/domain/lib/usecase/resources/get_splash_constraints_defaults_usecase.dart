import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/models/resources/splash_constraints_defaults_model.dart';

import '../../repository/resources/splash_asset_repository.dart';

abstract class GetSplashConstraintsDefaultsUsecase {
  FutureOr<SplashConstraintsDefaultsModel> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: GetSplashConstraintsDefaultsUsecase)
class GetSplashConstraintsDefaultsUsecaseImpl
    implements GetSplashConstraintsDefaultsUsecase {
  GetSplashConstraintsDefaultsUsecaseImpl(this._repo);

  final SplashAssetRepository _repo;

  @override
  Future<SplashConstraintsDefaultsModel> execute({
    required String applicationId,
    required String themeId,
  }) {
    return _repo.getConstraintsDefaults(
      applicationId: applicationId,
      themeId: themeId,
    );
  }
}
