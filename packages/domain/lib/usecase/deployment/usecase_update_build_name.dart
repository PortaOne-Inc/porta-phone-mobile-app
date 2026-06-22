import 'package:injectable/injectable.dart';

import 'package:domain/usecase/usecase.dart';

@Injectable(as: UpdateBuildNameUseCase)
class IncrementBuildNameUseCase implements UpdateBuildNameUseCase {
  IncrementBuildNameUseCase(this.updateApplicationUsecase);

  final UpdateApplicationUsecase updateApplicationUsecase;

  @override
  Future<BuildVersionModel?> execute({
    required ApplicationModel application,
    required BuildPlatform platform,
    required VersionPart part,
  }) async {
    final currentVersion = platform == BuildPlatform.android
        ? application.androidVersion
        : application.iosVersion;

    final newVersion = currentVersion == null
        ? const BuildVersionModel(buildName: '0.0.0', buildNumber: 0)
        : _incrementBuildName(currentVersion, part);

    final updatedApplication = await updateApplicationUsecase.execute(
      application.copyWith(
        androidVersion: platform == BuildPlatform.android
            ? newVersion
            : application.androidVersion,
        iosVersion: platform == BuildPlatform.ios
            ? newVersion
            : application.iosVersion,
      ),
    );

    return platform == BuildPlatform.android
        ? updatedApplication.androidVersion
        : updatedApplication.iosVersion;
  }

  BuildVersionModel? _incrementBuildName(
    BuildVersionModel buildVersion,
    VersionPart part,
  ) {
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

    // The build number is a standalone monotonic counter, not derived from the
    // version name: bumping the name still advances it by exactly one.
    final newBuildNumber = (buildVersion.buildNumber ?? 0) + 1;

    return BuildVersionModel(
      buildName: newBuildName,
      buildNumber: newBuildNumber,
    );
  }
}
