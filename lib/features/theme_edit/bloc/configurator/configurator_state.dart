part of 'configurator_cubit.dart';

@freezed
class ThemePropertyState with _$ThemePropertyState {
  factory ThemePropertyState({
    ThemeModel? theme,
    ThemeNameInput? nameField,
  }) = _ThemePropertyState;

  factory ThemePropertyState.progress({
    ThemeModel? theme,
    ThemeNameInput? nameField,
  }) = ThemePropertyProgressState;

  factory ThemePropertyState.validation({
    ThemeModel? theme,
    ThemeNameInput? nameField,
  }) = _ThemePropertyValidationState;

  factory ThemePropertyState.credentials({
    ThemeModel? theme,
    ThemeNameInput? nameField,
    String? userId,
    String? themeId,
    String? applicationId,
  }) = ThemePropertCredentialsState;

  factory ThemePropertyState.success({
    ThemeModel? theme,
    ThemeNameInput? nameField,
  }) = _ThemePropertSuccessState;

  factory ThemePropertyState.error({
    ThemeModel? theme,
    ThemeNameInput? nameField,
    BaseException? error,
  }) = ThemePropertyErrorState;
}

extension _StateCopyWith on ThemePropertyState {
  ThemePropertyState showCredentials({
    required final String userId,
    required final String themeId,
    required final String applicationId,
  }) {
    return ThemePropertyState.credentials(
      theme: theme,
      nameField: nameField,
    );
  }

  ThemePropertyState showError(BaseException exception) {
    return ThemePropertyState.error(
      nameField: nameField,
      theme: theme,
      error: exception,
    );
  }

  ThemePropertyState showProgress() {
    return ThemePropertyState.progress(
      nameField: nameField,
      theme: theme,
    );
  }

  ThemePropertyState updateTheme({
    ThemeNameInput? nameField,
    ThemeModel? theme,
  }) {
    return ThemePropertyState.success(
      nameField: nameField ?? this.nameField,
      theme: theme ?? this.theme,
    );
  }
}
