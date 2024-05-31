import 'package:domain/entity/models/models.dart';

abstract class DeploymentRepository {
  Future<void> deploy({
    required String applicationId,
    AndroidBuildPlatform? android,
    IOSBuildPlatform? ios,
    ApplicationFlow flow = ApplicationFlow.classic,
    ApplicationDependencyBranches branches = const ApplicationDependencyBranches(),
  });
}
