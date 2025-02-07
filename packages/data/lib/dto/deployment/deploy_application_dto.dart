import 'package:freezed_annotation/freezed_annotation.dart';

part 'deploy_application_dto.freezed.dart';

part 'deploy_application_dto.g.dart';

@unfreezed
class DeployApplicationDto with _$DeployApplicationDto {
  factory DeployApplicationDto({
    required String applicationId,
    required String platforms,
    required String type,
    required String phoneSourceBranch,
    required String phoneConfiguratorToolSourceBranch,
    required String callkeepSourceBranch,
    required String commonDependencySourceBranch,
    required String keystoreSourceBranch,
    required String androidPlayStoreConfig,
  }) = _DeployApplicationDto;

  factory DeployApplicationDto.fromJson(Map<String, dynamic> json) => _$DeployApplicationDtoFromJson(json);
}
