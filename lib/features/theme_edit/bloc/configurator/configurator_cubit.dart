import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
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

  void updateThemeNote(String note) {
    emit(state.copyWith(
      descriptionField: ThemeDescriptionInput.dirty(note),
      theme: state.theme?.copyWith(
        commonConfig: state.theme?.commonConfig.copyWith(
          note: note,
        ),
      ),
    ));
  }

  void setDisplayLargeStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          displayLarge: state.theme?.textStyles.displayLarge.merge(style),
        ),
      ),
    ));
  }

  void setDisplayMediumStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          displayMedium: state.theme?.textStyles.displayMedium.merge(style),
        ),
      ),
    ));
  }

  void setDisplaySmallStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          displaySmall: state.theme?.textStyles.displaySmall.merge(style),
        ),
      ),
    ));
  }

  void setHeadlineLargeStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          headlineLarge: state.theme?.textStyles.headlineLarge.merge(style),
        ),
      ),
    ));
  }

  void setHeadlineMediumStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          headlineMedium: state.theme?.textStyles.headlineMedium.merge(style),
        ),
      ),
    ));
  }

  void setHeadlineSmallStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          headlineSmall: state.theme?.textStyles.headlineSmall.merge(style),
        ),
      ),
    ));
  }

  void setTitleLargeStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          titleLarge: state.theme?.textStyles.titleLarge.merge(style),
        ),
      ),
    ));
  }

  void setTitleMediumStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          titleMedium: state.theme?.textStyles.titleMedium.merge(style),
        ),
      ),
    ));
  }

  void setTitleSmallStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          titleSmall: state.theme?.textStyles.titleSmall.merge(style),
        ),
      ),
    ));
  }

  void setBodyLargeStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          bodyLarge: state.theme?.textStyles.bodyLarge.merge(style),
        ),
      ),
    ));
  }

  void setBodyMediumStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          bodyMedium: state.theme?.textStyles.bodyMedium.merge(style),
        ),
      ),
    ));
  }

  void setBodySmallStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          bodySmall: state.theme?.textStyles.bodySmall.merge(style),
        ),
      ),
    ));
  }

  void setLabelLargeStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          labelLarge: state.theme?.textStyles.labelLarge.merge(style),
        ),
      ),
    ));
  }

  void setLabelMediumStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          labelMedium: state.theme?.textStyles.labelMedium.merge(style),
        ),
      ),
    ));
  }

  void setLabelSmallStyle({required TextStyleModel style}) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          labelSmall: state.theme?.textStyles.labelSmall.merge(style),
        ),
      ),
    ));
  }

  void updateCommonFont(String font) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(
        textStyles: state.theme?.textStyles.copyWith(
          generalFontName: font,
        ),
      ),
    ));
  }

  void updatePrimaryColor(Color color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(primary: color.value)),
    ));
  }

  void setTheme(ThemeModel? theme) {
    emit(
      state.copyWith(
          theme: theme,
          nameField: ThemeNameInput.pure(theme?.commonConfig.appName ?? ''),
          descriptionField: ThemeDescriptionInput.pure(theme?.commonConfig.note ?? '')),
    );
  }

  void updateImageOnboarding(ImageModel? path) {
    emit(
      state.copyWith(
        theme: state.theme?.copyWith(
            images: state.theme?.images.copyWith(
          onboarding: path,
        )),
      ),
    );
  }

  void updateImageLogo(ImageModel path) {
    if (path.isRaster) {
      emit(
        ConfiguratorFailure("You can't use raster images", theme: state.theme),
      );
    } else {
      emit(
        state.copyWith(
          theme: state.theme?.copyWith(
              images: state.theme?.images.copyWith(
            logo: path,
          )),
        ),
      );
    }
  }

  void removeImageLogo() {
    emit(
      state.copyWith(
        theme: state.theme?.copyWith(
          images: state.theme?.images.copyWith(
            logo: ImageModel(),
          ),
        ),
      ),
    );
  }

  void removeImageOnboarding() {
    emit(
      state.copyWith(
        theme: state.theme?.copyWith(
          images: state.theme?.images.copyWith(
            onboarding: ImageModel(),
          ),
        ),
      ),
    );
  }

  void updateColorPrimary(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(primary: color!.value)),
    ));
  }

  void updateColorOnPrimary(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(onPrimary: color!.value)),
    ));
  }

  void updateColorSecondary(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(secondary: color!.value)),
    ));
  }

  void updateColorSecondaryContainer(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(secondaryContainer: color!.value)),
    ));
  }

  void updateColorOnSecondaryContainer(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(onSecondaryContainer: color!.value)),
    ));
  }

  void updateColorTertiary(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(tertiary: color!.value)),
    ));
  }

  void updateColorError(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(error: color!.value)),
    ));
  }

  void updateColorOutline(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(outline: color!.value)),
    ));
  }

  void updateColorBackground(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(background: color!.value)),
    ));
  }

  void updateColorOnBackground(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(onBackground: color!.value)),
    ));
  }

  void updateColorSurface(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(surface: color!.value)),
    ));
  }

  void updateColorOnSurface(Color? color) {
    emit(state.copyWith(
      theme: state.theme?.copyWith(colors: state.theme?.colors.copyWith(onSurface: color!.value)),
    ));
  }

  void updateGradientTab(List<Color> colors) {
    emit(state.copyWith(
        theme: state.theme?.copyWith(
      colors: state.theme?.colors.copyWith(gradientTabColor: colors.map((e) => e.value).toList()),
    )));
  }
}
