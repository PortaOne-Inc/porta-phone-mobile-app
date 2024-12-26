import 'dart:convert';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';

import 'package:injectable/injectable.dart';

import '../dto/dto.dart';

@Injectable(as: DeploymentRepository)
class DeploymentRepositoryImpl extends DeploymentRepository {
  DeploymentRepositoryImpl({
    required this.configuratorBackandDatasource,
  });

  final ConfiguratorBackandDatasource configuratorBackandDatasource;

  @override
  Future<void> deploy({
    required String applicationId,
    AndroidBuildPlatform? android,
    IOSBuildPlatform? ios,
    bool demo = false,
    ApplicationDependencyBranches branches = const ApplicationDependencyBranches(),
  }) {
    final deployPlatform = _getDeployPlatform(android, ios);
    final deployFlow = demo ? 'classic' : 'demo';

    final androidPlayStoreConfig = jsonEncode(_mapAndroidPlayStoreConfigToJson(android?.playStoreConfig));

    final deployApplication = DeployApplicationDto(
      applicationId: applicationId,
      platforms: deployPlatform,
      type: deployFlow,
      phoneSourceBranch: branches.phoneSourceBranch,
      phoneConfiguratorToolSourceBranch: branches.phoneConfiguratorToolSourceBranch,
      androidPlayStoreConfig: androidPlayStoreConfig,
      callkeepSourceBranch: branches.callkeepSourceBranch,
      commonDependencySourceBranch: branches.commonDependencySourceBranch,
    );

    return configuratorBackandDatasource.deployBuilds(deployApplication);
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
