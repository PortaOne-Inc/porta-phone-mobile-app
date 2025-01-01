import 'dart:async';

import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/app/theme/custom_color.dart';
import 'package:webtrit_configurator/core/extension/extension.dart';

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
    this.applicationId,
    this.themeId,
  }) : super(ThemePropertyState(status: ThemePropertyStatus.progress)) {
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
      chane: (_UpdateColorEventChange value) async {
        // Create a mutable copy of the original map
        final originalColorScheme = Map<String, String?>.from(state.theme?.colors?.colors ?? {});
        final mappedColorScheme = Map<String, String?>.from(
          originalColorScheme.map(MapEntry.new),
        );
        // Modify the mutable map
        mappedColorScheme[value.key] = value.color?.toHex();

        // Perform the update with the modified map
        return _updateColor(state.colors?.copyWith(colors: mappedColorScheme), emit);
      },
      gradientTab: (_UpdateColorEventGradientTab value) async => _updateGradientTab(value.colors, emit),
      launchAdaptiveIconColor: (value) async => _updateLaunchColor(emit, adaptiveIconBackground: value.color),
      launchSplashBackgroundColor: (value) async => _updateLaunchColor(emit, splashBackground: value.color),
    );
  }

  Future<void> _validateAndTryUpdateTheme(UpdateThemeEvent event, Emitter<ThemePropertyState> emit) async {
    if (event.model != null) {
      if ((event.model?.name ?? '').isNotEmpty) {
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
    // TODO(ThemePropertyCubit): Not implemented.
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
    emit(state.copyWith(status: ThemePropertyStatus.progress));
    emit(state.copyTheme(theme: state.theme?.copyWith(colors: color)));
    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  void _updateLaunchColor(Emitter<ThemePropertyState> emit, {Color? adaptiveIconBackground, Color? splashBackground}) {
    final colors = state.colors;
    final launchColors = colors?.launch;

    final newAdaptiveIconBackground = adaptiveIconBackground?.toHex() ?? launchColors?.adaptiveIconBackground;
    final newSplashBackground = splashBackground?.toHex() ?? launchColors?.splashBackground;

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

  void _updateGradientTab(List<Color> colors, Emitter<ThemePropertyState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyTheme(
      theme: state.theme?.copyWith(
        colors: state.theme?.colors?.copyWith(
          gradientTabColor: colors.map((color) => color.toHex()).nonNulls.toList(),
        ),
      ),
    ));
  }
}
