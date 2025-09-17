import 'package:domain/models/models.dart';

export 'get_phone_branches_usecase.dart';
export 'usecase_deploy_builds.dart';

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
