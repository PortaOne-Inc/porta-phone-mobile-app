import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/core/extension/extension_hex_color.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../usecase/usecase.dart';

part 'theme_collection_state.dart';

class ThemeCollectionCubit extends Cubit<ThemesState> {
  ThemeCollectionCubit({
    required this.getThemesUseCase,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.createThemeUseCase,
    required this.getTemplateThemeUseCase,
    required this.applicationId,
  }) : super(const ThemesInitial(themes: [])) {
    _tyGetThemes();
  }

  final String applicationId;
  final UsecaseThemeGetAll getThemesUseCase;
  final SetThemeForApplicationUseCase makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseThemeCreate createThemeUseCase;
  final UsecaseThemeGetTemplate getTemplateThemeUseCase;

  void tryDeleteTheme(ThemeModel themeModel) async {
    try {
      await _deleteTheme(themeModel);
    } on BaseException catch (e) {
      _showFailure(e.message);
    } on Exception catch (e) {
      _showFailure(e.toString());
    }
  }

  void tryMakeThemeAsDefault(ThemeModel themeModel) async {
    await makeThemeAsDefaultUseCase.execute(applicationID: applicationId, themeModel: themeModel);
  }

  void _tyGetThemes() async {
    try {
      await _getThemes();
    } on BaseException catch (e) {
      _showFailure(e.message);
    } on Exception catch (e) {
      _showFailure(e.toString());
    }
  }

  Future _getThemes() async {
    emit(ThemesProgress(themes: state.themes));
    final themes = await getThemesUseCase.execute(applicationId: applicationId);
    if (themes.isEmpty) {
      emit(ThemesEmptyState(themes: themes));
    } else {
      emit(ThemesInitial(themes: themes));
    }
  }

  Future _deleteTheme(ThemeModel themeModel) async {
    emit(ThemesProgress(themes: state.themes));
    await deleteThemeUseCase.execute(themeModel: themeModel, applicationId: applicationId);
    _getThemes();
  }

  void _showFailure(String message) {
    emit(ThemesFailure(message: message, themes: state.themes));
  }

  Future _tryCreateTheme(String name, Color color) async {
    final defaultTheme = await getTemplateThemeUseCase.execute();
    final result = await createThemeUseCase.execute(
      themeModel: defaultTheme.copyWith(
        commonConfig: defaultTheme.commonConfig.copyWith(appName: name),
        colors: defaultTheme.colors.copyWith(primary: color.toHex()),
      ),
      applicationId: applicationId,
    );
    emit(NavigateToConfigurator(themes: state.themes, themeModel: result));
  }

  void tryCreateTheme(String name, Color color) async {
    try {
      await _tryCreateTheme(name, color);
    } on BaseException catch (e) {
      _showFailure(e.toString());
    } on Exception catch (e) {
      _showFailure(e.toString());
    }
  }
}
