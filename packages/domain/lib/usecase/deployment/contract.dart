import 'package:domain/entity/models/models.dart';

export 'get_phone_branches_usecase.dart';

abstract class UsecaseDeployBuilds {
  Future<void> execute({
    required String applicationId,
    required ApplicationDeploy applicationDeploy,
  });
}

abstract class UpdateBuildNameUseCase {
  Future<BuildVersionModel?> execute({
    required ApplicationModel application,
    required BuildPlatform platform,
    required VersionPart part,
  });
}

abstract class UpdateBuildNumberUseCase {
  Future<BuildVersionModel?> execute({
    required ApplicationModel application,
    required BuildPlatform platform,
  });
}
