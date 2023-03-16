part of 'theme_collection_cubit.dart';

@immutable
class ThemesState {
  const ThemesState({
    required this.themes,
  });

  final List<AppConfigurationModel> themes;
}

class ThemesInitial extends ThemesState {
  const ThemesInitial({
    required super.themes,
  });
}

class ThemesEmptyState extends ThemesState {
  const ThemesEmptyState({
    required super.themes,
  });
}

class ThemesSuccess extends ThemesState {
  const ThemesSuccess({
    required super.themes,
  });
}

class ThemesProgress extends ThemesState {
  const ThemesProgress({
    required super.themes,
  });
}

class ThemesFailure extends ThemesState {
  const ThemesFailure({
    required this.message,
    required super.themes,
  });

  final String message;
}

class NavigateToConfigurator extends ThemesState {
  const NavigateToConfigurator({required this.themeModel, required super.themes});

  final AppConfigurationModel themeModel;
}
