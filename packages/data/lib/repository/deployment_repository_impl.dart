import 'dart:convert';

import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';

import 'package:injectable/injectable.dart';

import '../common/api_exception_mapper.dart';
import '../dto/dto.dart';

@Injectable(as: DeploymentRepository)
class DeploymentRepositoryImpl extends DeploymentRepository {
  DeploymentRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.phoneBranchMapper,
    required this.appVersionMapper,
    required this.authPrefDataSource,
  });

  final AuthPrefDatasource authPrefDataSource;
  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<PhoneBranch, PhoneBranchDto> phoneBranchMapper;
  final CommonMapper<AppVersion, BuildVersionModel> appVersionMapper;

  @override
  Future<void> deploy({
    required String applicationId,
    AndroidBuildPlatform? android,
    IOSBuildPlatform? ios,
    ApplicationDependencyBranches branches = const ApplicationDependencyBranches(),
  }) {
    final deployPlatform = _getDeployPlatform(android, ios);

    final androidPlayStoreConfig = jsonEncode(_mapAndroidPlayStoreConfigToJson(android?.playStoreConfig));

    final deployApplication = DeployApplicationDto(
      applicationId: applicationId,
      token: authPrefDataSource.getAuthToken()!,
      platforms: deployPlatform,
      phoneSourceBranch: branches.phoneSourceBranch,
      phoneConfiguratorToolSourceBranch: branches.phoneConfiguratorToolSourceBranch,
      androidPlayStoreConfig: androidPlayStoreConfig,
      keystoreSourceBranch: branches.keystoreSourceBranch,
      configuratorSourceBranch: branches.configuratorSourceBranch,
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

  @override
  Future<List<PhoneBranch>> getPhoneBranched() => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.getPhoneBranches();
    return phoneBranchMapper.convertListFrom(dto);
  });

  @override
  Future<BuildVersionModel> getAppVersionByPhoneBranch(String branch) => guardApiCall(() async {
    final dto = await configuratorBackandDatasource.getAppVersionByBranch(branch);
    return appVersionMapper.convertTo(dto);
  });
}
