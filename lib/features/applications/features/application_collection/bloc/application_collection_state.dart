part of 'application_collection_cubit.dart';

enum ApplicationsStateStatus {
  initial,
  progress,
  error,
  deleted,
  success,
}

@freezed
class ApplicationCollectionState with _$ApplicationCollectionState {
  const factory ApplicationCollectionState({
    required ApplicationsStateStatus status,
    @Default([]) List<ApplicationModel> applications,
    ApplicationModel? deleteApplication,
    Exception? error,
  }) = ApplicationCollectionStateInitial;
}

extension ApplicationsStateGetters on ApplicationCollectionState {
  bool get isProgress => status == ApplicationsStateStatus.progress;
}
