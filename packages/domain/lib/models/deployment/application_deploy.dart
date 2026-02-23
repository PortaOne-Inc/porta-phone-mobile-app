import 'package:freezed_annotation/freezed_annotation.dart';

import 'application_build_platform.dart';
import 'application_dependency_branches.dart';

part 'application_deploy.freezed.dart';

@freezed
sealed class ApplicationDeploy with _$ApplicationDeploy {
  const factory ApplicationDeploy({
    @Default(AndroidBuildPlatform()) AndroidBuildPlatform android,
    @Default(IOSBuildPlatform()) IOSBuildPlatform ios,
    @Default(ApplicationDependencyBranches())
    ApplicationDependencyBranches applicationDependencyBranches,
  }) = _ApplicationDeploy;

  const ApplicationDeploy._();

  bool get anyDeployPlatformAvailable => android.deploy || ios.deploy;

  bool get isAndroidPlatformSelected => android.deploy == true;

  bool get isIOSPlatformSelected => ios.deploy == true;
}
