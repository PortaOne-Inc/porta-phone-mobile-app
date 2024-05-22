import 'package:freezed_annotation/freezed_annotation.dart';

import 'application_build_platform.dart';
import 'application_dependency_branches.dart';

part 'application_deploy.freezed.dart';

enum ApplicationFlow {
  demo,
  classic,
}

@freezed
class ApplicationDeploy with _$ApplicationDeploy {
  const factory ApplicationDeploy({
    required AndroidBuildPlatform android,
    required IOSBuildPlatform ios,
    required ApplicationDependencyBranches applicationDependencyBranches,
    required ApplicationFlow appFlow,
  }) = _ApplicationDeploy;

  const ApplicationDeploy._();

  factory ApplicationDeploy.init() {
    return const ApplicationDeploy(
      android: AndroidBuildPlatform(),
      ios: IOSBuildPlatform(),
      applicationDependencyBranches: ApplicationDependencyBranches(),
      appFlow: ApplicationFlow.classic,
    );
  }

  bool get anyDeployPlatformAvailable => android.deploy || ios.deploy;

  bool get isAndroidPlatformSelected => android.deploy == true;

  bool get isIOSPlatformSelected => ios.deploy == true;

  bool get isBuildDemoFlow => appFlow == ApplicationFlow.demo;

  // Custom copyWith methods
  ApplicationDeploy copyWithAndroid(AndroidBuildPlatform? android) {
    return copyWith(android: android ?? this.android);
  }

  ApplicationDeploy copyWithAndroidPlayStoreConfig(AndroidPlayStoreConfig config) {
    return copyWith(android: android.copyWithPlayStoreConfig(config));
  }

  ApplicationDeploy copyWithIos(IOSBuildPlatform? ios) {
    return copyWith(ios: ios ?? this.ios);
  }
}
