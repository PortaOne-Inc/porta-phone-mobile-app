import 'package:injectable/injectable.dart';

import 'package:domain/entity/models/models.dart';
import 'package:domain/usecase/usecase.dart';

@Injectable(as: UpdateBuildNumberUseCase)
class UpdateBuildNumberUseCaseImpl implements UpdateBuildNumberUseCase {
  UpdateBuildNumberUseCaseImpl(this.applicationEditUsecase);

  final UsecaseApplicationEdit applicationEditUsecase;

  @override
  Future<BuildVersionModel?> execute({
    required ApplicationModel application,
    required BuildPlatform platform,
  }) async {
    final currentVersion = platform == BuildPlatform.android ? application.androidVersion : application.iosVersion;

    final newVersion = currentVersion == null
        ? const BuildVersionModel(buildName: '0.0.0', buildNumber: 0000000)
        : _incrementBuildNumber(currentVersion);

    final updatedApplication = await applicationEditUsecase.execute(
      id: application.id!,
      name: application.name!,
      platformIdentifier: application.platformIdentifier!,
      androidPlatformId: application.androidPlatformId,
      iosPlatformId: application.iosPlatformId,
      androidVersion: platform == BuildPlatform.android ? newVersion : application.androidVersion,
      iosVersion: platform == BuildPlatform.ios ? newVersion : application.iosVersion,
      coreUrl: application.coreUrl,
      termConditionsUrl: application.termsConditionsUrl,
      applicationAndroidGoogleServicesUrl: application.googleServices?.androidUrl,
      applicationIosGoogleServicesUrl: application.googleServices?.iosUrl,
    );

    return platform == BuildPlatform.android ? updatedApplication.androidVersion : updatedApplication.iosVersion;
  }

  BuildVersionModel _incrementBuildNumber(BuildVersionModel buildVersion) {
    final currentBuildNumber = buildVersion.buildNumber ?? 1;
    final newBuildNumber = currentBuildNumber + 1;

    return BuildVersionModel(
      buildName: buildVersion.buildName,
      buildNumber: newBuildNumber,
    );
  }
}
