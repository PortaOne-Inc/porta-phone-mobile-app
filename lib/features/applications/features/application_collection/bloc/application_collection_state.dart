part of 'application_collection_cubit.dart';

typedef Application = (
  ApplicationModel applicationModel,
  Iterable<ApplicationValidateError> errors,
);

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
    @Default([]) List<Application> applications,
    ApplicationModel? deleteApplication,
    Exception? error,
  }) = ApplicationCollectionStateInitial;

  const ApplicationCollectionState._();

  bool get isProgress => status == ApplicationsStateStatus.progress;
}
