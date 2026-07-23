import 'package:domain/models/models.dart';

abstract class DeploymentRepository {
  Future<void> deploy({
    required String applicationId,
    AndroidBuildPlatform? android,
    IOSBuildPlatform? ios,
    ApplicationDependencyBranches branches =
        const ApplicationDependencyBranches(),
  });

  Future<List<PhoneBranch>> getPhoneBranched();

  Future<BuildVersionModel> getAppVersionByPhoneBranch(String branch);
}
