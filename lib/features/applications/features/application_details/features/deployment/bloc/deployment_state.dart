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
sealed class DeploymentState with _$DeploymentState {
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
}
