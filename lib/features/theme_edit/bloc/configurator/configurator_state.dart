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

  factory ThemePropertyState.success({
    ThemeModel? theme,
    ThemeNameInput? nameField,
  }) = _ThemePropertSuccessState;

  factory ThemePropertyState.focus({
    ThemeModel? theme,
    ThemeNameInput? nameField,
    int? position,
  }) = ThemePropertFocusState;

  factory ThemePropertyState.error({
    ThemeModel? theme,
    ThemeNameInput? nameField,
    BaseException? error,
  }) = ThemePropertyErrorState;
}

extension _StateCopyWith on ThemePropertyState {
  ThemePropertyState focus(int position) {
    return ThemePropertyState.focus(
      nameField: nameField,
      theme: theme,
      position: position,
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

  ColorSchemeModel? get colors => theme?.colors;
}
