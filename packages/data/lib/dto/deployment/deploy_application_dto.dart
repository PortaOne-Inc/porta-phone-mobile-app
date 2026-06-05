import 'package:freezed_annotation/freezed_annotation.dart';

part 'deploy_application_dto.freezed.dart';

part 'deploy_application_dto.g.dart';

@unfreezed
sealed class DeployApplicationDto with _$DeployApplicationDto {
  factory DeployApplicationDto({
    required String applicationId,
    required String token,
    required String platforms,
    required String phoneSourceBranch,
    required String phoneConfiguratorToolSourceBranch,
    required String configuratorSourceBranch,
    required String keystoreSourceBranch,
    required String androidPlayStoreConfig,
  }) = _DeployApplicationDto;

  factory DeployApplicationDto.fromJson(Map<String, dynamic> json) =>
      _$DeployApplicationDtoFromJson(json);
}
