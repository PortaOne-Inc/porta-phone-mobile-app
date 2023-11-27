part of 'theme_create_cubit.dart';

enum ThemeCreateStateStatus {
  initial,
  progress,
  error,
  success,
}

@freezed
class ThemeCreateState with _$ThemeCreateState {
  const factory ThemeCreateState({
    required ThemeCreateStateStatus status,
    ThemeModel? themeModel,
    ThemeNameInput? nameInput,
    Color? seedColor,
    BaseException? error,
  }) = _ThemeCreateStateInitial;
}
