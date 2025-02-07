part of 'deployment_cubit.dart';

enum DeploymentDetailsStatus {
  initial,
  progress,
  error,
  success,
  deployConfirm,
  deploySuccess,
}

@freezed
class DeploymentState with _$DeploymentState {
  const factory DeploymentState({
    @Default(DeploymentDetailsStatus.initial) DeploymentDetailsStatus status,
    @Default(ApplicationDeploy()) ApplicationDeploy applicationDeploy,
    @Default([]) List<ApplicationValidateError> applicationValidateErrors,
    @Default(ApplicationBuildVersionProgress(progressNameUpdating: [], progressNumberUpdating: []))
    ApplicationBuildVersionProgress buildVersionProgress,
    ApplicationModel? application,
    Object? error,
  }) = DeploymentStateInitial;

  const DeploymentState._();

  bool get isProgress => status == DeploymentDetailsStatus.progress;

  bool get isApplicationHasDefaultThem => application?.theme != null;

  DeploymentState copyWithVersions({
    BuildVersionModel? android,
    BuildVersionModel? ios,
  }) {
    return copyWith(
      application: application?.copyWith(
        androidVersion: android ?? application?.androidVersion,
        iosVersion: ios ?? application?.iosVersion,
      ),
    );
  }

  DeploymentState copyWithAddingProgressName(BuildPlatform platform) {
    return copyWith(
      buildVersionProgress: buildVersionProgress.copyWith(
        progressNameUpdating: _updateProgressStatuses(
          platform,
          buildVersionProgress.progressNameUpdating,
          true,
        ),
      ),
    );
  }

  DeploymentState copyWithAddingProgressNumber(BuildPlatform platform) {
    return copyWith(
      buildVersionProgress: buildVersionProgress.copyWith(
        progressNumberUpdating: _updateProgressStatuses(
          platform,
          buildVersionProgress.progressNumberUpdating,
          true,
        ),
      ),
    );
  }

  DeploymentState copyWithRemovingProgressName(BuildPlatform platform) {
    return copyWith(
      buildVersionProgress: buildVersionProgress.copyWith(
        progressNameUpdating: _updateProgressStatuses(
          platform,
          buildVersionProgress.progressNameUpdating,
          false,
        ),
      ),
    );
  }

  DeploymentState copyWithRemovingProgressNumber(BuildPlatform platform) {
    return copyWith(
      buildVersionProgress: buildVersionProgress.copyWith(
        progressNumberUpdating: _updateProgressStatuses(
          platform,
          buildVersionProgress.progressNumberUpdating,
          false,
        ),
      ),
    );
  }

  List<BuildPlatform> _updateProgressStatuses(
    BuildPlatform platform,
    List<BuildPlatform> statuses,
    bool addProgress,
  ) {
    final progressUpdating = List<BuildPlatform>.from(statuses);

    if (addProgress) {
      progressUpdating.add(platform);
    } else {
      progressUpdating.remove(platform);
    }

    return progressUpdating;
  }
}
