part of 'theme_create_cubit.dart';

enum ThemeCreateStateStatus {
  initial,
  progress,
  error,
  success;

  bool get isProgress => this == progress;
}

@freezed
sealed class ThemeCreateState with _$ThemeCreateState {
  const factory ThemeCreateState({
    required ThemeCreateStateStatus status,
    required AppConfig defaultFeatureAccess,
    required ThemeSettings defaultThemeConfig,
    ThemeModel? themeModel,
    ThemeNameInput? nameInput,
    String? description,
    bool? useAi,
    String? prompt,
    Object? error,
  }) = _ThemeCreateStateInitial;
}
