import 'package:injectable/injectable.dart';

import 'package:domain/usecase/usecase.dart';

@Injectable(as: UpdateBuildNumberUseCase)
class UpdateBuildNumberUseCaseImpl implements UpdateBuildNumberUseCase {
  UpdateBuildNumberUseCaseImpl(this.updateApplicationUsecase);

  final UpdateApplicationUsecase updateApplicationUsecase;

  @override
  Future<BuildVersionModel?> execute({required ApplicationModel application, required BuildPlatform platform}) async {
    final currentVersion = platform == BuildPlatform.android ? application.androidVersion : application.iosVersion;

    final newVersion = currentVersion == null
        ? const BuildVersionModel(buildName: '0.0.0', buildNumber: 0)
        : _incrementBuildNumber(currentVersion);

    final updatedApplication = await updateApplicationUsecase.execute(
      application.copyWith(
        androidVersion: platform == BuildPlatform.android ? newVersion : application.androidVersion,
        iosVersion: platform == BuildPlatform.ios ? newVersion : application.iosVersion,
      ),
    );

    return platform == BuildPlatform.android ? updatedApplication.androidVersion : updatedApplication.iosVersion;
  }

  BuildVersionModel _incrementBuildNumber(BuildVersionModel buildVersion) {
    final currentBuildNumber = buildVersion.buildNumber ?? 1;
    final newBuildNumber = currentBuildNumber + 1;

    return BuildVersionModel(buildName: buildVersion.buildName, buildNumber: newBuildNumber);
  }
}
