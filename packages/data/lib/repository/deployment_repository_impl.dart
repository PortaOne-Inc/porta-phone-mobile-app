import 'dart:convert';

import 'package:domain/domain.dart';

import 'package:data/data/data.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: DeploymentRepository)
class DeploymentRepositoryImpl extends DeploymentRepository {
  DeploymentRepositoryImpl({
    required this.githubDatasource,
  });

  final GithubDatasource githubDatasource;

  @override
  Future<void> deploy({
    required String applicationId,
    AndroidBuildPlatform? android,
    IOSBuildPlatform? ios,
    ApplicationFlow flow = ApplicationFlow.classic,
    ApplicationDependencyBranches branches = const ApplicationDependencyBranches(),
  }) {
    final deployPlatform = _getDeployPlatform(android, ios);
    final deployFlow = flow == ApplicationFlow.classic ? 'classic' : 'demo';

    final androidPlayStoreConfig = jsonEncode(_mapAndroidPlayStoreConfigToJson(android?.playStoreConfig));

    return githubDatasource.deployBuilds(
      applicationId: applicationId,
      platforms: deployPlatform,
      type: deployFlow,
      phoneSourceBranch: branches.phoneSourceBranch,
      phoneConfiguratorToolSourceBranch: branches.phoneConfiguratorToolSourceBranch,
      androidPlayStoreConfig: androidPlayStoreConfig,
      callkeepSourceBranch: branches.callkeepSourceBranch,
      commonDependencySourceBranch: branches.commonDependencySourceBranch,
    );
  }

  String _getDeployPlatform(AndroidBuildPlatform? android, IOSBuildPlatform? ios) {
    final isDeployAndroid = android?.deploy ?? false;
    final isDeployIOS = ios?.deploy ?? false;

    if (isDeployAndroid && isDeployIOS) return 'all';
    if (isDeployAndroid) return 'android';
    if (isDeployIOS) return 'ios';
    return 'any';
  }

  Map<String, dynamic> _mapAndroidPlayStoreConfigToJson(AndroidPlayStoreConfig? config) {
    return {
      if (config?.track != null) 'track': config?.track,
      if (config?.status != null) 'status': config?.status,
      if (config?.updatePriority != null) 'updatePriority': config?.updatePriority,
      if (config?.userFraction != null) 'userFraction': config?.userFraction,
    };
  }
}
