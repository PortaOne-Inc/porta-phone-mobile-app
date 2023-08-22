import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/applications/applications.dart';

import '../usecase/usecase.dart';

part 'theme_collection_state.dart';

part 'theme_collection_cubit.freezed.dart';

class ThemeCollectionCubit extends Cubit<ThemeCollectionState> {
  ThemeCollectionCubit({
    @factoryParam ApplicationModel? applicationModel,
    required this.getThemesUseCase,
    required this.getApplicationGet,
    required this.makeThemeAsDefaultUseCase,
    required this.deleteThemeUseCase,
    required this.createThemeUseCase,
    required this.getTemplateThemeUseCase,
    required this.applicationId,
  }) : super(ThemeCollectionState(
          status: ThemeCollectionStateStatus.progress,
          application: applicationModel,
        )) {
    getThemes();
    _getApplication();
  }

  final String applicationId;

  final UsecaseApplicationGet getApplicationGet;

  final UsecaseThemeGetAll getThemesUseCase;
  final UseCaseSetThemeDefault makeThemeAsDefaultUseCase;
  final UsecaseThemeDeleteCreate deleteThemeUseCase;
  final UsecaseThemeCreate createThemeUseCase;
  final UsecaseThemeGetTemplate getTemplateThemeUseCase;

  void tryDeleteTheme(ThemeModel themeModel) async {
    try {
      await _deleteTheme(themeModel);
    } on BaseException catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void tryMakeThemeAsDefault(ThemeModel themeModel) async {
    try {
      await makeThemeAsDefaultUseCase.execute(applicationId: applicationId, themeId: themeModel.id!);
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ThemeCollectionStateStatus.error));
    }
  }

  Future getThemes() async {
    try {
      emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
      final themes = await getThemesUseCase.execute(applicationId: applicationId);
      emit(state.copyWith(themes: themes, status: ThemeCollectionStateStatus.success));
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ThemeCollectionStateStatus.error));
    }
  }

  Future _getApplication() async {
    if (state.application == null) {
      try {
        emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
        final application = await getApplicationGet.execute(id: applicationId);
        emit(state.copyWith(application: application, status: ThemeCollectionStateStatus.success));
      } on BaseException catch (e) {
        emit(state.copyWith(error: e, status: ThemeCollectionStateStatus.error));
      }
    }
  }

  Future _deleteTheme(ThemeModel themeModel) async {
    emit(state.copyWith(status: ThemeCollectionStateStatus.progress));
    await deleteThemeUseCase.execute(themeId: themeModel.id!, applicationId: applicationId);
    getThemes();
  }

  Future _tryCreateTheme(String name, Color color) async {
    final defaultTheme = await getTemplateThemeUseCase.execute();
    await createThemeUseCase.execute(
      themeModel: defaultTheme.copyWith(
        name: name,
        colors: defaultTheme.colors?.copyWith(primary: color),
      ),
      applicationId: applicationId,
    );
  }

  void tryCreateTheme(String name, Color color) async {
    try {
      await _tryCreateTheme(name, color);
      getThemes();
    } on BaseException catch (e) {
      emit(state.copyWith(error: e, status: ThemeCollectionStateStatus.error));
    }
  }
}
