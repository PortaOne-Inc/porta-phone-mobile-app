part of 'application_collection_cubit.dart';

@freezed
class ApplicationCollectionState with _$ApplicationCollectionState {
  factory ApplicationCollectionState({
    @Default([]) List<ApplicationModel> applications,
  }) = _ApplicationCollectionState;

  factory ApplicationCollectionState.progress({
    @Default([]) List<ApplicationModel> applications,
  }) = ApplicationCollectionProgress;

  factory ApplicationCollectionState.success({
    @Default([]) List<ApplicationModel> applications,
  }) = ApplicationCollectionSuccess;

  factory ApplicationCollectionState.error({
    @Default([]) List<ApplicationModel> applications,
    BaseException? error,
  }) = ApplicationCollectionError;
}

extension ApplicationsGeters on ApplicationCollectionState {
  bool get isProgress => this is ApplicationCollectionProgress;
}

extension _StateCopyWith on ApplicationCollectionState {
  ApplicationCollectionState copyWithSuccess({
    List<ApplicationModel>? applications,
  }) {
    return ApplicationCollectionState.success(
      applications: applications ?? this.applications,
    );
  }

  ApplicationCollectionState copyWithProgress({
    List<ApplicationModel>? applications,
  }) {
    return ApplicationCollectionState.progress(
      applications: applications ?? this.applications,
    );
  }
}
