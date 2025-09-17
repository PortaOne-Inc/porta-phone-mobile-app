import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class DeleteLaunchAssetsUsecase {
  FutureOr<void> execute(String applicationId, String themeId);
}

@Injectable(as: DeleteLaunchAssetsUsecase)
class DeleteLaunchAssetsUsecaseImpl extends DeleteLaunchAssetsUsecase {
  DeleteLaunchAssetsUsecaseImpl(this.repo);

  final LaunchAssetsRepository repo;

  @override
  Future<void> execute(String applicationId, String themeId) {
    return repo.deleteByTheme(applicationId: applicationId, themeId: themeId);
  }
}
