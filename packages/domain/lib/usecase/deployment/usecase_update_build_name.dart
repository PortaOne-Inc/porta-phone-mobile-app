import 'package:injectable/injectable.dart';

import 'package:domain/entity/models/models.dart';
import 'package:domain/usecase/usecase.dart';

@Injectable(as: UpdateBuildNameUseCase)
class IncrementBuildNameUseCase implements UpdateBuildNameUseCase {
  IncrementBuildNameUseCase(this.applicationEditUsecase);

  final UsecaseApplicationEdit applicationEditUsecase;

  @override
  Future<BuildVersionModel?> execute({
    required ApplicationModel application,
    required BuildPlatform platform,
    required VersionPart part,
  }) async {
    final currentVersion = platform == BuildPlatform.android ? application.androidVersion : application.iosVersion;

    final newVersion = currentVersion == null
        ? const BuildVersionModel(buildName: '0.0.0', buildNumber: 0000000)
        : _incrementBuildName(currentVersion, part);

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

  BuildVersionModel? _incrementBuildName(BuildVersionModel buildVersion, VersionPart part) {
    final currentBuildName = buildVersion.buildName ?? '1.0.0';
    final parts = currentBuildName.split('.').map(int.tryParse).toList();
    if (parts.length != 3 || parts.contains(null)) return null;

    switch (part) {
      case VersionPart.major:
        parts[0] = (parts[0] ?? 0) + 1;
        parts[1] = 0;
        parts[2] = 0;
      case VersionPart.minor:
        parts[1] = (parts[1] ?? 0) + 1;
        parts[2] = 0;
      case VersionPart.patch:
        parts[2] = (parts[2] ?? 0) + 1;
    }

    final newBuildName = parts.join('.');
    final newBuildNumber = int.tryParse('${parts.join()}00000');
    if (newBuildNumber == null) return null;

    return BuildVersionModel(
      buildName: newBuildName,
      buildNumber: newBuildNumber,
    );
  }
}
