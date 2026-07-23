part of 'application_collection_cubit.dart';

enum ApplicationsStateStatus { initial, progress, error, deleted, success }

@freezed
sealed class ApplicationCollectionState with _$ApplicationCollectionState {
  const factory ApplicationCollectionState({
    required ApplicationsStateStatus status,
    UserMetadata? user,
    @Default([]) List<ApplicationModel> applications,
    ApplicationModel? deleteApplication,
    Exception? error,
  }) = ApplicationCollectionStateInitial;

  const ApplicationCollectionState._();

  bool get isProgress => status == ApplicationsStateStatus.progress;
}
