import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/models/models.dart';

import '../model/models.dart';

part 'configurator_state.dart';

part 'configurator_event.dart';

part 'configurator_cubit.freezed.dart';

class ThemePropertyCubit extends Bloc<ConfiguratorEvent, ThemePropertyState> {
  ThemePropertyCubit({
    required this.updateThemeUseCase,
    required this.getThemeUseCase,
    required this.getApplicationUseCase,
    required this.colorSchemeCreate,
    this.applicationId,
    this.themeId,
  }) : super(ThemePropertyState(status: ThemePropertyStatus.progress)) {
    on<GenerateColorSchemeByColorSeedEvent>(
      _generateColorSchemeBySeed,
    );

    on<FocusScreenEvent>(
      _focusScreen,
    );
    on<UpdatePreviewScreen>(
      _updateThemePreviewScreen,
    );
    on<UpdatePropertyStateScreen>(
      _updatePropertyStateScreen,
    );
    on<UpdateThemeSchemeEvent>(
      _onChangeSchemeEvent,
    );
    on<UpdateColorSchemeEvent>(
      _onChangeColorEvent,
    );
    on<ThemeDraftSchemeEvent>(
      _onDraftEvent,
    );
    on<ReplaceColorSchemeEvent>(
      _onReplaceColorEvent,
    );
    on<GetThemeEvent>(
      _tryGetTheme,
    );
    on<GetApplicationEvent>(
      _tryGetApplication,
    );
    on<DownloadThemeEvent>(
      _tryDownloadTheme,
    );
    on<UpdateThemeEvent>(
      _validateAndTryUpdateTheme,
    );
    add(const GetThemeEvent());
    add(const GetApplicationEvent());
  }

  final String? applicationId;
  final String? themeId;

  final UsecaseThemeUpdate updateThemeUseCase;
  final UsecaseThemeGet getThemeUseCase;
  final UsecaseApplicationGet getApplicationUseCase;
  final UsecaseColorSchemeCreate colorSchemeCreate;

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

  Future<void> _onDraftEvent(ThemeDraftSchemeEvent event, Emitter<ThemePropertyState> emit) {
    return event.map(enableDraftTheme: (_UpdateThemeMoveDraftThemToCurrentEvent value) async {
      emit(state.copyWith(isDraft: true));
    }, disableDraftTheme: (_UpdateThememoveDraftThemToCurrentEnt value) async {
      emit(state.copyWith(isDraft: false));
    });
  }

  Future<void> _onChangeColorEvent(UpdateColorSchemeEvent event, Emitter<ThemePropertyState> emit) {
    return event.map(
      primary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(primary: color), emit)),
      onPrimary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onPrimary: color), emit)),
      secondary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(secondary: color), emit)),
      tertiary: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(tertiary: color), emit)),
      error: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(error: color), emit)),
      outline: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(outline: color), emit)),
      background: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(background: color), emit)),
      onBackground: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onBackground: color), emit)),
      surface: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(surface: color), emit)),
      onSurface: (value) async =>
          _animateColor(value.color, (color) => _updateColor(state.colors?.copyWith(onSurface: color), emit)),
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
        if (state.theme?.colors?.areAllFieldsFilled ?? false) {
          try {
            emit(state.copyWith(
              status: ThemePropertyStatus.progress,
            ));
            await updateThemeUseCase.execute(themeModel: event.model!);
            emit(state.copyWith(
              status: ThemePropertyStatus.success,
            ));
          } on Exception catch (e) {
            emit(state.copyWith(
              status: ThemePropertyStatus.error,
              error: e,
            ));
          }
        } else {
          emit(state.copyWith(
            status: ThemePropertyStatus.error,
            error: ThemeIsNotValidException(),
          ));
        }
      } else {
        emit(state.copyWith(
          status: ThemePropertyStatus.error,
          error: ThemeIsNotValidException(),
        ));
      }
    }
  }

  Future<void> _tryGetTheme(GetThemeEvent event, Emitter<ThemePropertyState> emit) async {
    try {
      emit(state.copyWith(status: ThemePropertyStatus.progress));

      final theme = await getThemeUseCase.execute();

      emit(state.initTheme(theme: theme));
      emit(state.copyWith(status: ThemePropertyStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePropertyStatus.error,
        error: e,
      ));
    }
  }

  Future<void> _tryGetApplication(GetApplicationEvent event, Emitter<ThemePropertyState> emit) async {
    try {
      emit(state.copyWith(status: ThemePropertyStatus.progress));
      final application = await getApplicationUseCase.execute(id: applicationId!);

      emit(state.copyWith(status: ThemePropertyStatus.success, applicationModel: application));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePropertyStatus.error,
        error: e,
      ));
    }
  }

  Future<void> _tryDownloadTheme(DownloadThemeEvent event, Emitter<ThemePropertyState> emit) async {
    //TODO(ThemePropertyCubit): Not implemented
  }

  void _updateFont(String font, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(theme: state.theme?.copyWith(fontFamily: font)));
  }

  void _updateTexts(TextsModel? textsModel, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(theme: state.theme?.copyWith(texts: textsModel)));
  }

  void _updatePropertyStateScreen(UpdatePropertyStateScreen event, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(themePropertyScreens: event.propertyStateScreen));
  }

  void _updateThemePreviewScreen(UpdatePreviewScreen event, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(themePreviewScreen: event.themePreviewScreen));
  }

  void _generateColorSchemeBySeed(GenerateColorSchemeByColorSeedEvent event, Emitter<ThemePropertyState> emit) async {
    final colorScheme = await colorSchemeCreate.execute(colorsScheme: event.color);
    emit(state.copyTheme(theme: state.theme?.copyWith(colors: colorScheme)));
  }

  void _focusScreen(FocusScreenEvent event, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyWith(
      status: ThemePropertyStatus.focus,
      position: event.position,
    ));
  }

  void _updateImageResources(ImageSchemeModel? image, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(theme: state.theme?.copyWith(images: image ?? const ImageSchemeModel())));
  }

  void _updateSystemAssetImageResources(SystemAssetsModel? image, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(theme: state.theme?.copyWith(systemAssets: image ?? const SystemAssetsModel())));
  }

  void _updateColor(ColorSchemeModel? color, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(theme: state.theme?.copyWith(colors: color)));
  }

  void _updateLaunchColor(Emitter<ThemePropertyState> emit, {Color? adaptiveIconBackground, Color? splashBackground}) {
    final colors = state.colors;
    final launchColors = colors?.launch;

    final newAdaptiveIconBackground = adaptiveIconBackground ?? launchColors?.adaptiveIconBackground;
    final newSplashBackground = splashBackground ?? launchColors?.splashBackground;

    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(
      theme: state.theme?.copyWith(
        colors: colors?.copyWith(
          launch: launchColors?.copyWith(
            adaptiveIconBackground: newAdaptiveIconBackground,
            splashBackground: newSplashBackground,
          ),
        ),
      ),
    ));
  }

  void _animateColor(Color? color, Function onUpdate) async {
    List<Color> colors = [Colors.red, Colors.green, if (color != null) color];

    for (int i = 0; i < colors.length; i++) {
      await Future.delayed(Duration(milliseconds: i * 100));
      onUpdate(colors[i]);
    }
  }

  void _updateGradientTab(List<Color> colors, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(
      theme: state.theme?.copyWith(
        colors: state.theme?.colors?.copyWith(
          gradientTabColor: colors.map((color) => color).toList(),
        ),
      ),
    ));
  }
}
