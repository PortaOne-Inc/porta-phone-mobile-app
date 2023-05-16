part of 'synchronize_cubit.dart';

@immutable
class SynchronizeState {
  const SynchronizeState();
}

class SyncInitial extends SynchronizeState {
  const SyncInitial() : super();
}

class SyncStateProgress extends SynchronizeState {
  const SyncStateProgress();
}

class ThemeIsNotValidState extends SynchronizeState {
  const ThemeIsNotValidState();
}

class ThemeReadyState extends SynchronizeState {
  final ThemeModel themeModel;

  const ThemeReadyState(this.themeModel);
}

class ShowThemeCredentials extends SynchronizeState {
  const ShowThemeCredentials({
    required this.userId,
    required this.themeId,
    required this.applicationId,
  });

  final String userId;
  final String themeId;
  final String applicationId;
}

class ThemeEditSyncFailure extends SynchronizeState {
  final String message;

  const ThemeEditSyncFailure(this.message);
}
