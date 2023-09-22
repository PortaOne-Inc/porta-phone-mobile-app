import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import '../../model/models.dart';

part 'configurator_state.dart';

part 'configurator_event.dart';

part 'configurator_cubit.freezed.dart';

class ThemePropertyCubit extends Bloc<ConfiguratorEvent, ThemePropertyState> {
  ThemePropertyCubit({
    required this.updateThemeUseCase,
    required this.getThemeUseCase,
    this.applicationId,
    this.themeId,
  }) : super(ThemePropertyState.progress()) {
    on<FocusScreenEvent>(
      _focusScreen,
    );
    on<UpdateThemeSchemeEvent>(
      _onChangeSchemeEvent,
    );
    on<UpdateColorSchemeEvent>(
      _onChangeColorEvent,
    );

    on<ReplaceColorSchemeEvent>(
      _onReplaceColorEvent,
    );

    on<GetThemeEvent>(
      _tryGetTheme,
    );

    on<UpdateThemeEvent>(
      _validateAndTryUpdateTheme,
    );
    add(const GetThemeEvent());
  }

  final String? applicationId;
  final String? themeId;

  final UsecaseThemeUpdate updateThemeUseCase;
  final UsecaseThemeGet getThemeUseCase;

  Future<void> _onReplaceColorEvent(ReplaceColorSchemeEvent event, Emitter<ThemePropertyState> emit) async {
    _updateColor(event.colorScheme, emit);
  }

  Future<void> _onChangeSchemeEvent(UpdateThemeSchemeEvent event, Emitter<ThemePropertyState> emit) {
    return event.map(
        updateFont: (_UpdateThemeSchemeFontEvent value) async => _updateFont(value.font, emit),
        updateTexts: (_UpdateThemeSchemeTextsvent value) async => _updateTexts(value.textsModel, emit),
        updateInAppImages: (_UpdateThemeSchemeImagesEvent value) async => _updateImageResources(value.image, emit),
        updateSystemAssetsImages: (_UpdateSystemAssetsImagesEvent value) async =>
            _updateSystemAssetImageResources(value.image, emit));
  }

  Future<void> _onChangeColorEvent(UpdateColorSchemeEvent event, Emitter<ThemePropertyState> emit) {
    return event.map(
      primary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(primary: color), emit)),
      onPrimary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onPrimary: color), emit)),
      primaryContainer: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(primaryContainer: color), emit)),
      onPrimaryContainer: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onPrimaryContainer: color), emit)),
      secondary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(secondary: color), emit)),
      onSecondary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onSecondary: color), emit)),
      tertiary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(tertiary: color), emit)),
      onTertiary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onTertiary: color), emit)),
      tertiaryContainer: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(tertiaryContainer: color), emit)),
      error: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(error: color), emit)),
      onError: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onError: color), emit)),
      errorContainer: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(errorContainer: color), emit)),
      onErrorContainer: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onErrorContainer: color), emit)),
      outline: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(outline: color), emit)),
      outlineVariant: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(outlineVariant: color), emit)),
      background: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(background: color), emit)),
      onBackground: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onBackground: color), emit)),
      surface: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(surface: color), emit)),
      onSurface: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onSurface: color), emit)),
      surfaceVariant: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(surfaceVariant: color), emit)),
      onSurfaceVariant: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onSurfaceVariant: color), emit)),
      inverseSurface: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(inverseSurface: color), emit)),
      shadow: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(shadow: color), emit)),
      scrim: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(scrim: color), emit)),
      surfaceTint: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(surfaceTint: color), emit)),
      secondaryContainer: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(secondaryContainer: color), emit)),
      onSecondaryContainer: (value) async => _animateColor(
          value.color, (color) => _updateColor(state.colors?.copyWith(onSecondaryContainer: color), emit)),
      gradientTab: (_UpdateColorEventGradientTab value) async => _updateGradientTab(value.colors, emit),
      launchAdaptiveIconColor: (value) async => _updateLaunchColor(emit, adaptiveIconBackground: value.color),
      launchSplashBackgroundColor: (value) async => _updateLaunchColor(emit, splashBackground: value.color),
    );
  }

  void _validateAndTryUpdateTheme(UpdateThemeEvent event, Emitter<ThemePropertyState> emit) async {
    if (event.model != null) {
      if ((event.model?.name ?? '').isNotEmpty) {
        try {
          emit(state.showProgress());
          await updateThemeUseCase.execute(themeModel: event.model!);
          emit(state.updateTheme());
        } on BaseException catch (e) {
          state.showError(e);
        } on Exception catch (e) {
          state.showError(BaseException(message: e.toString()));
        }
      } else {
        emit(state.showError(ThemeIsNotValidException()));
      }
    }
  }

  Future<void> _tryGetTheme(GetThemeEvent event, Emitter<ThemePropertyState> emit) async {
    try {
      emit(state.showProgress());

      final model = await getThemeUseCase.execute();

      emit(state.updateTheme(
        theme: model,
      ));
    } on NoContentException catch (e) {
      state.showError(e);
    } on BaseException catch (e) {
      state.showError(e);
    } on Exception catch (e) {
      state.showError(BaseException(message: e.toString()));
    }
  }

  void _updateFont(String font, Emitter<ThemePropertyState> emit) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(fontFamily: font),
    ));
  }

  void _updateTexts(TextsModel? textsModel, Emitter<ThemePropertyState> emit) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(
        texts: textsModel,
      ),
    ));
  }

  void _focusScreen(FocusScreenEvent event, Emitter<ThemePropertyState> emit) {
    emit(state.focus(event.position));
  }

  void _updateImageResources(ImageSchemeModel? image, Emitter<ThemePropertyState> emit) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(images: image ?? const ImageSchemeModel()),
    ));
  }

  void _updateSystemAssetImageResources(SystemAssetsModel? image, Emitter<ThemePropertyState> emit) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(systemAssets: image ?? const SystemAssetsModel()),
    ));
  }

  void _updateColor(ColorSchemeModel? color, Emitter<ThemePropertyState> emit) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(colors: color),
    ));
  }

  void _updateLaunchColor(Emitter<ThemePropertyState> emit, {Color? adaptiveIconBackground, Color? splashBackground}) {
    final theme = state.theme;
    final colors = theme?.colors;
    final launchColors = colors?.launch;

    final newAdaptiveIconBackground = adaptiveIconBackground ?? launchColors?.adaptiveIconBackground;
    final newSplashBackground = splashBackground ?? launchColors?.splashBackground;

    emit(
      state.updateTheme(
        theme: theme?.copyWith(
          colors: colors?.copyWith(
            launch: launchColors?.copyWith(
              adaptiveIconBackground: newAdaptiveIconBackground,
              splashBackground: newSplashBackground,
            ),
          ),
        ),
      ),
    );
  }

  void _animateColor(Color? color, Function onUpdate) async {
    List<Color> colors = [Colors.red, Colors.green, if (color != null) color];

    for (int i = 0; i < colors.length; i++) {
      await Future.delayed(Duration(milliseconds: i * 100));
      onUpdate(colors[i]);
    }
  }

  void _updateGradientTab(List<Color> colors, Emitter<ThemePropertyState> emit) {
    emit(state.updateTheme(
      theme: state.theme?.copyWith(
        colors: state.theme?.colors?.copyWith(
          gradientTabColor: colors.map((color) => color).toList(),
        ),
      ),
    ));
  }
}
