part of 'themes_cubit.dart';

@immutable
class ThemesState {
  const ThemesState(this.themes);

  final List<ThemeModel> themes;
}

class ThemesInitial extends ThemesState {
  const ThemesInitial(super.themes);
}

class ThemesEmptyState extends ThemesState {
  const ThemesEmptyState(super.themes);
}

class ThemesSuccess extends ThemesState {
  const ThemesSuccess(super.themes);
}

class ThemesProgress extends ThemesState {
  const ThemesProgress(super.themes);
}

class ThemesFailure extends ThemesState {
  const ThemesFailure(this.message, List<ThemeModel> themes) : super(themes);

  final String message;
}
