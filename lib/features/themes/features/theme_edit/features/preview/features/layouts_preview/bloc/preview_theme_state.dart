part of 'preview_theme_cubit.dart';

@freezed
sealed class PreviewThemeState with _$PreviewThemeState {
  const factory PreviewThemeState({required bool frameVisible}) =
      _PreviewThemeState;
}
