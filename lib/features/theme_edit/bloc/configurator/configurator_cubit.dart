import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:webtrit_configurator/share/share.dart';

import '../../model/models.dart';

part 'configurator_state.dart';

class ThemePropertyCubit extends Cubit<ThemePropertyState> {
  ThemePropertyCubit() : super(ThemePropertyState(theme: ThemeModel()));

  void updateAppName(String name) {
    emit(state.copyWith(
      nameField: ThemeNameInput.dirty(name),
      theme: state.theme.copyWith(
        name: name,
      ),
    ));
  }

  void updateCommonFont(String font) {
    emit(state.copyWith(
      theme: state.theme.copyWith(
        fontFamily: font,
      ),
    ));
  }

  void updatePrimaryColor(Color color) {
    emit(state.copyWith(
      theme: state.theme.copyWith(colors: state.theme.colors?.copyWith(primary: color)),
    ));
  }

  void setTheme(ThemeModel? theme) {
    emit(
      state.copyWith(
        theme: theme,
        nameField: ThemeNameInput.pure(theme?.name ?? ''),
      ),
    );
  }

  void updateImageResources(ConfiguratorImagesSetting? image) {
    emit(
      state.copyWith(
        theme: state.theme.copyWith(images: image),
      ),
    );
  }

  void updateColor(ColorModel? color) {
    emit(state.copyWith(
      theme: state.theme.copyWith(colors: color),
    ));
  }

  void updateGradientTab(List<Color> colors) {
    emit(state.copyWith(
      theme: state.theme.copyWith(
        colors: state.theme.colors?.copyWith(
          gradientTabColor: colors.map((color) => color).toList(),
        ),
      ),
    ));
  }
}
