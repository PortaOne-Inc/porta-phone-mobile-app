import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../usecase/usecase.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesState> {
  ThemesCubit(
    this._getThemesUseCase,
    this._makeThemeAsDefaultUseCase,
    this._deleteThemeUseCase,
    this.applicationId,
  ) : super(const ThemesInitial([])) {
    _tyGetThemes();
  }

  final String applicationId;
  final UsecaseThemeGetAll _getThemesUseCase;
  final SetThemeForApplicationUseCase _makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate _deleteThemeUseCase;

  void tryDeleteTheme(ThemeModel themeModel) async {
    try {
      await _deleteTheme(themeModel);
    } on BaseException catch (e) {
      _showLoginFailure(e.message);
    } on Exception catch (e) {
      _showLoginFailure(e.toString());
    }
  }

  void tryMakeThemeAsDefault(ThemeModel themeModel) async {
    await _makeThemeAsDefaultUseCase.execute(applicationID: applicationId, themeModel: themeModel);
  }

  void _tyGetThemes() async {
    try {
      await _getThemes();
    } on BaseException catch (e) {
      _showLoginFailure(e.message);
    } on Exception catch (e) {
      _showLoginFailure(e.toString());
    }
  }

  Future _getThemes() async {
    emit(ThemesProgress(state.themes));
    final themes = await _getThemesUseCase.execute(applicationId: applicationId);
    if (themes.isEmpty) {
      emit(ThemesEmptyState(themes));
    } else {
      emit(ThemesInitial(themes));
    }
  }

  Future _deleteTheme(ThemeModel themeModel) async {
    emit(ThemesProgress(state.themes));
    await _deleteThemeUseCase.execute(themeModel: themeModel, applicationId: applicationId);
    _getThemes();
  }

  void _showLoginFailure(String message) {
    emit(ThemesFailure(message, state.themes));
  }
}
