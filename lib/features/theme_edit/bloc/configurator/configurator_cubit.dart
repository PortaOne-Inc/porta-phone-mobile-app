import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:webtrit_configurator/core/extension/extension.dart';
import 'package:webtrit_configurator/core/utility/utility.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../../model/models.dart';

part 'configurator_state.dart';

class ThemePropertyCubit extends Cubit<ThemePropertyState> {
  ThemePropertyCubit() : super(const ThemePropertyState());

  void updateAppName(String name) {
    emit(state.copyWith(
      nameField: ThemeNameInput.dirty(name),
      theme: state.theme?.copyWith(
        commonConfig: state.theme?.commonConfig.copyWith(
          appName: name,
        ),
      ),
    ));
  }

  void updateTextStyle(TextTheme? textTheme) {
    emit(
      state.copyWith(
        theme: state.theme?.copyWith(
          fontModel: state.theme?.fontModel.copyWith(
            textTheme: textTheme,
          ),
        ),
      ),
    );
  }

  void updateCommonFont(String font) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        fontModel: state.theme?.fontModel.copyWith(
          fontFamily: font,
        ),
      ),
    ));
  }

  void updatePrimaryColor(Color color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(primary: color.toHex())),
    ));
  }

  void setTheme(AppConfigurationModel? theme) {
    emit(
      state.copyWith(
        theme: theme,
        nameField: ThemeNameInput.pure(theme?.commonConfig.appName ?? ''),
      ),
    );
  }

  void updateImageResources(ConfiguratorImagesSetting? image) {
    emit(
      state.copyWith(
        theme: state.theme?.copyWith(images: image),
      ),
    );
  }

  void updateColor(ColorsModel? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: color),
    ));
  }

  void updateGradientTab(List<Color> colors) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        colors: state.theme?.colors.copyWith(
          gradientTabColor: colors.map((e) => e.toHex()).toList(),
        ),
      ),
    ));
  }
}
