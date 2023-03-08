import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/core/extension/extension.dart';
import 'package:webtrit_configurator/core/utility/utility.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../model/theme_name_input.dart';
import '../usecase/usecase.dart';

part 'themes_create_state.dart';

class ThemesCreateCubit extends Cubit<ThemesCreateState> {
  ThemesCreateCubit(
    this.applicationId,
    this._createThemeUseCase,
    this._getTemplateThemeUseCase,
  ) : super(const ThemesCreateState(themes: [], defaultTheme: null)) {
    _tryToGetThemeTemplate();
  }

  final String applicationId;

  final UsecaseThemeCreate _createThemeUseCase;
  final UsecaseThemeGetTemplate _getTemplateThemeUseCase;

  void _tryToGetThemeTemplate() async {
    try {
      await _getThemeTemplate();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } on Exception catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  void validateAndTryCreate() {
    if (state.nameField.valid) {
      tryCreateTheme();
    } else {
      emit(state.copyWith(nameField: state.nameField.toDirty()));
    }
  }

  void tryCreateTheme() async {
    try {
      await _tryCreateTheme();
    } on BaseException catch (e) {
      _showNotCaughtFailure(e.message);
    } on Exception catch (e) {
      _showNotCaughtFailure(e.toString());
    }
  }

  Future _tryCreateTheme() async {
    final color = state.defaultTheme!.colors.primary;
    final result = await _createThemeUseCase.execute(
        themeModel: state.defaultTheme!.copyWith(
            colors: state.defaultTheme?.colors.copyWith(primary: color),
            commonConfig: state.defaultTheme?.commonConfig.copyWith(
              appName: state.nameField.value,
            )),
        applicationId: applicationId);
    emit(NavigateToConfigurator(themes: state.themes, defaultTheme: result));
  }

  Future _getThemeTemplate() async {
    final defaultTheme = await _getTemplateThemeUseCase.execute();
    emit(ThemesCreateState(themes: const [], defaultTheme: defaultTheme));
  }

  void _showNotCaughtFailure(String message) {
    emit(ThemesCreateFailure(themes: state.themes, defaultTheme: state.defaultTheme, message: message));
  }

  void initPrimaryColor(Color color) {
    final newColors = state.defaultTheme!.colors.copyWith(primary: color.toHex());
    emit(state.copyWith(defaultTheme: state.defaultTheme!.copyWith(colors: newColors)));
  }

  void initThemesName(String name) {
    emit(state.copyWith(nameField: ThemeNameInput.dirty(name)));
  }

  void openTheme(ThemeModel themeModel) async {
    emit(NavigateToConfigurator(themes: state.themes, defaultTheme: themeModel));
  }
}
