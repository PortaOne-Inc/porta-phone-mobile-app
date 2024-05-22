import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'contract.dart';

@Injectable(as: UsecaseDeployBuilds)
class UsecaseDeployBuildsImpl extends UsecaseDeployBuilds {
  UsecaseDeployBuildsImpl({
    required this.deploymentRepository,
  });

  final DeploymentRepository deploymentRepository;

  @override
  Future<void> execute({
    required String applicationId,
    required ApplicationDeploy applicationDeploy,
  }) {
    return deploymentRepository.deploy(
      applicationId: applicationId,
      android: applicationDeploy.android.normalize(),
      ios: applicationDeploy.ios,
      branches: applicationDeploy.applicationDependencyBranches,
      flow: applicationDeploy.appFlow,
    );
  }
}
