import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/share/usecase/usecase.dart';
import 'package:webtrit_configurator/share/exception/exception.dart';
import 'package:webtrit_configurator/share/entity/entity.dart';

//TODO: move to share
import 'package:webtrit_configurator/features/theme_collection/theme_collection.dart';

import '../../model/models.dart';

part 'configurator_state.dart';

part 'configurator_cubit.freezed.dart';

class ThemePropertyCubit extends Cubit<ThemePropertyState> {
  final UsecaseThemeUpdate updateThemeUseCase;
  final UsecaseThemeGet getThemeUseCase;
  final UsecaseUserGet getUserUsecase;

  ThemePropertyCubit({
    required this.updateThemeUseCase,
    required this.getThemeUseCase,
    required this.getUserUsecase,
    this.applicationId,
    this.themeId,
  }) : super(ThemePropertyState(theme: ThemeModel()));

  final String? applicationId;
  final String? themeId;

  void validateAndTryUpdateTheme(ThemeModel? themeModel) async {
    if (themeModel != null) {
      if ((themeModel.name ?? '').isNotEmpty) {
        _tryUpdateTheme(themeModel);
      } else {
        emit(state.showError(ThemeIsNotValidException()));
      }
    }
  }

  Future<void> tryGetTheme() async {
    try {
      await _getTheme();
    } on NoContentException catch (e) {
      state.showError(e);
    } on BaseException catch (e) {
      state.showError(e);
    } on Exception catch (e) {
      state.showError(BaseException(message: e.toString()));
    }
  }

  Future<void> _tryUpdateTheme(ThemeModel themeModel) async {
    try {
      await _updateTheme(themeModel);
    } on BaseException catch (e) {
      state.showError(e);
    } on Exception catch (e) {
      state.showError(BaseException(message: e.toString()));
    }
  }

  Future _getTheme() async {
    emit(state.showProgress());

    final model = await getThemeUseCase.execute();

    emit(state.updateTheme(
      theme: model,
    ));
  }

  Future _updateTheme(ThemeModel themeModel) async {
    emit(state.showProgress());
    await updateThemeUseCase.execute(applicationId: applicationId, themeModel: themeModel);
    emit(state.updateTheme());
  }

  void updateAppName(String name) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(name: name),
    ));
  }

  void updateFont(String font) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(fontFamily: font),
    ));
  }

  void setTheme(ThemeModel? theme) {
    emit(state.updateTheme(
      theme: theme,
      nameField: ThemeNameInput.pure(theme?.name ?? ''),
    ));
  }

  void updateImageResources(ConfiguratorImagesSetting? image) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(images: image),
    ));
  }

  void updateColor(ColorModel? color) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(colors: color),
    ));
  }

  void updateGradientTab(List<Color> colors) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(
        colors: state.theme?.colors?.copyWith(
          gradientTabColor: colors.map((color) => color).toList(),
        ),
      ),
    ));
  }
}
