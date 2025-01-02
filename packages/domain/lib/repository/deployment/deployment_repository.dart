import 'package:domain/entity/models/models.dart';

abstract class DeploymentRepository {
  Future<void> deploy({
    required String applicationId,
    AndroidBuildPlatform? android,
    IOSBuildPlatform? ios,
    bool demo = false,
    ApplicationDependencyBranches branches = const ApplicationDependencyBranches(),
  });

  Future<List<PhoneBranch>> getPhoneBranched();
}
