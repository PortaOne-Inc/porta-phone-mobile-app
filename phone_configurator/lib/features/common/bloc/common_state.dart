part of 'common_bloc.dart';

@freezed
sealed class CommonState with _$CommonState {
  const factory CommonState.initial({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _Initial;

  const factory CommonState.logout({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = CommonStateLogout;

  const factory CommonState.themeMode({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = CommonStateThemeMode;
}
