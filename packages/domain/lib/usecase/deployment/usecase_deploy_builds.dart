import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

@Injectable(as: UsecaseDeployBuilds)
class UsecaseDeployBuildsImpl extends UsecaseDeployBuilds {
  UsecaseDeployBuildsImpl({
    required this.deploymentRepository,
    required this.applicationRepository,
  });

  final DeploymentRepository deploymentRepository;
  final ApplicationRepository applicationRepository;

  @override
  Future<void> execute({
    required String applicationId,
    required ApplicationDeploy applicationDeploy,
  }) async {
    await deploymentRepository.deploy(
      applicationId: applicationId,
      android: applicationDeploy.android.normalize(),
      ios: applicationDeploy.ios,
      branches: applicationDeploy.applicationDependencyBranches,
      demo: applicationDeploy.demo,
    );

    final appVersion = await deploymentRepository
        .getAppVersionByPhoneBranch(applicationDeploy.applicationDependencyBranches.phoneSourceBranch);

    await applicationRepository.updateApplication(applicationId, ApplicationModel(appVersion: appVersion));
  }
}
