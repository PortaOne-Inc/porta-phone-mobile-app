import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../usecase/usecase.dart';

part 'theme_collection_state.dart';

part 'theme_collection_cubit.freezed.dart';

class ThemeCollectionCubit extends Cubit<ThemeCollectionState> {
  ThemeCollectionCubit({
    required this.getThemesUseCase,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.createThemeUseCase,
    required this.getTemplateThemeUseCase,
    required this.applicationId,
  }) : super(ThemeCollectionState.progress()) {
    _tyGetThemes();
  }

  final String applicationId;
  final UsecaseThemeGetAll getThemesUseCase;
  final SetThemeForApplicationUseCase makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseThemeCreate createThemeUseCase;
  final UsecaseThemeGetTemplate getTemplateThemeUseCase;

  void tryDeleteTheme(AppConfigurationModel themeModel) async {
    try {
      await _deleteTheme(themeModel);
    } on BaseException catch (e) {
      emit(state.copyWithError(error: e));
    }
  }

  void tryMakeThemeAsDefault(AppConfigurationModel themeModel) async {
    await makeThemeAsDefaultUseCase.execute(applicationID: applicationId, themeModel: themeModel);
  }

  void _tyGetThemes() async {
    try {
      await _getThemes();
    } on BaseException catch (e) {
      emit(state.copyWithError(error: e));
    }
  }

  Future _getThemes() async {
    emit(state.copyWithProgress());
    final themes = await getThemesUseCase.execute(applicationId: applicationId);
    emit(state.copyWithSuccess(themes: themes));
  }

  Future _deleteTheme(AppConfigurationModel themeModel) async {
    emit(state.copyWithProgress());
    await deleteThemeUseCase.execute(themeModel: themeModel, applicationId: applicationId);
    _getThemes();
  }

  Future _tryCreateTheme(String name, Color color) async {
    final defaultTheme = await getTemplateThemeUseCase.execute();
    final result = await createThemeUseCase.execute(
      themeModel: defaultTheme.copyWith(
        name: name,
        colors: defaultTheme.colors?.copyWith(primary: color),
      ),
      applicationId: applicationId,
    );
    emit(state.copyWithNavigateToEditTheme(theme: result));
  }

  void tryCreateTheme(String name, Color color) async {
    try {
      await _tryCreateTheme(name, color);
    } on BaseException catch (e) {
      emit(state.copyWithError(error: e));
    }
  }
}
