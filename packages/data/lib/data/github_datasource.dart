// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GithubDatasource {
  const GithubDatasource(
    @Named('github_client') this.dio,
    @Named('deployPlatformBuildsURL') this.deployPlatformBuildsURL,
  );

  final Dio dio;
  final String deployPlatformBuildsURL;

  Future<void> deployBuilds({
    required String applicationId,
    required String platforms,
    required String type,
    required String phoneSourceBranch,
    required String phoneConfiguratorToolSourceBranch,
    required String callkeepSourceBranch,
    required String commonDependencySourceBranch,
    required String androidPlayStoreConfig,
  }) async {
    final inputs = {
      'applicationId': applicationId,
      'platforms': platforms,
      'type': type,
      'phoneSourceBranch': phoneSourceBranch,
      'phoneConfiguratorToolSourceBranch': phoneConfiguratorToolSourceBranch,
      'androidPlayStoreConfig': androidPlayStoreConfig,
    };

    final data = {
      'ref': 'main',
      'inputs': inputs,
    };

    await dio.post<Map<String, dynamic>>(
      deployPlatformBuildsURL,
      data: jsonEncode(data),
    );
  }
}
