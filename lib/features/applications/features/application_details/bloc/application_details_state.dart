part of 'application_details_cubit.dart';

enum ApplicationDetailsStateStatus {
  initial,
  progress,
  error,
  deleted,
  success,
  deployConfirm,
  deploySuccess,
}

@freezed
class ApplicationDetailsState with _$ApplicationDetailsState {
  const factory ApplicationDetailsState({
    required ApplicationDetailsStateStatus status,
    required ApplicationDeploy applicationDeploy,
    @Default([]) List<ThemeModel> themes,
    @Default(ApplicationBuildVersionProgress(progressNameUpdating: [], progressNumberUpdating: []))
    ApplicationBuildVersionProgress buildVersionProgress,
    ThemeModel? deleteTheme,
    ApplicationModel? application,
    ApplicationModel? deleteApplication,
    Object? error,
  }) = ApplicationDetailsStateInitial;

  const ApplicationDetailsState._();

  ApplicationDetailsState copyWithVersions({
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

  ApplicationDetailsState copyWithAddingProgressName(BuildPlatform platform) {
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

  ApplicationDetailsState copyWithAddingProgressNumber(BuildPlatform platform) {
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

  ApplicationDetailsState copyWithRemovingProgressName(BuildPlatform platform) {
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

  ApplicationDetailsState copyWithRemovingProgressNumber(BuildPlatform platform) {
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

extension ThemeCollectionStateGetters on ApplicationDetailsState {
  bool get isProgress => status == ApplicationDetailsStateStatus.progress;

  bool get isGoogleServicesAvailable =>
      application?.googleServices?.iosUrl != null && application?.googleServices?.androidUrl != null;

  bool get isApplicationHasDefaultThem => application?.theme != null;
}
