import 'dart:async';

import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:domain/domain.dart';
import 'package:logging/logging.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/extension/theme_page_config_ext.dart';
import 'package:webtrit_configurator/features/themes/models/models.dart';
import 'package:webtrit_configurator/features/themes/themes.dart';

part 'update_theme_state.dart';

part 'update_theme_event.dart';

part 'update_theme_cubit.freezed.dart';

final _logger = Logger('UpdateThemeCubit');

class UpdateThemCubit extends Bloc<ConfiguratorEvent, UpdateThemeState> {
  UpdateThemCubit({
    required String applicationId,
    required String themeId,
    required AppConfig appConfig,
    required this.updateThemeUseCase,
    required this.getThemeUseCase,
    required this.getApplicationUseCase,
    required this.defaultThemeSettings,
  }) : super(
          UpdateThemeState(
            applicationId: applicationId,
            themeId: themeId,
            status: ThemePropertyStatus.progress,
            appConfig: appConfig,
            themeWidgetConfig: defaultThemeSettings.themeWidgetLightConfig,
            themePageConfig: defaultThemeSettings.themePageDarkConfig,
            colorSchemeConfig: defaultThemeSettings.lightColorSchemeConfig,
            assets: [],
          ),
        ) {
    //NEW
    on<UpdateSchemeEvent>(
      _onUpdateSchemeEvent,
    );
    // OLD
    on<UpdatePropertyStateScreen>(
      _updatePropertyStateScreen,
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
    on<GetApplicationEvent>(
      _tryGetApplication,
    );
    on<UpdateThemeEvent>(
      _validateAndTryUpdateTheme,
    );
    add(const GetThemeEvent());
    add(const GetApplicationEvent());
  }

  final ThemeSettings defaultThemeSettings;

  final UsecaseThemeUpdate updateThemeUseCase;
  final UsecaseThemeGet getThemeUseCase;
  final UsecaseApplicationGet getApplicationUseCase;

  // NEW
  Future<void> _onUpdateSchemeEvent(UpdateSchemeEvent event, Emitter<UpdateThemeState> emit) {
    return event.map(
      colors: (_UpdateColorsEventChange value) async => _onUpdateSchemeColors(value, emit),
      components: (_UpdateComponentsEventChange value) async => _onUpdateSchemeComponents(value, emit),
      pages: (_UpdatePagesEventChange value) async => _onUpdateSchemePages(value, emit),
      featureAccess: (_UpdateAppConfigEventChange value) async => _onUpdateAppConfigPages(value, emit),
      assets: (_UpdateAssetsEventChange value) async => _onUpdateAssets(value, emit),
      launchAsset: (_UpdateImageModelEventChange value) async => _onUpdateLaunchAsset(value, emit),
    );
  }

  void _onUpdateLaunchAsset(_UpdateImageModelEventChange event, Emitter<UpdateThemeState> emit) {
    // emit(
    //   state.copyWith(
    //     theme: state.theme?.copyWith(
    //       systemAssets: state?.theme?.systemAssets.copyWith(webLauncherIcon: event.image!),
    //     ),
    //   ),
    // );
  }

  void _onUpdateSchemeColors(_UpdateColorsEventChange event, Emitter<UpdateThemeState> emit) {}

  void _onUpdateSchemeComponents(_UpdateComponentsEventChange event, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(themeWidgetConfig: event.scheme, status: ThemePropertyStatus.progress));
    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  void _onUpdateAppConfigPages(_UpdateAppConfigEventChange event, Emitter<UpdateThemeState> emit) {
    _logger
      ..info('Update App Config main: ${event.scheme.mainConfig.bottomMenu.toJson()}')
      ..info('Update App Config login: ${event.scheme.loginConfig.toJson()}');
    emit(state.copyWith(status: ThemePropertyStatus.progress));

    emit(state.copyWith(appConfig: event.scheme));
    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  void _onUpdateAssets(_UpdateAssetsEventChange event, Emitter<UpdateThemeState> emit) {
    _logger.info('Update Assets: ${event.scheme}');
    emit(state.copyWith(assets: event.scheme, status: ThemePropertyStatus.progress));
    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  void _onUpdateSchemePages(_UpdatePagesEventChange event, Emitter<UpdateThemeState> emit) {
    _logger.info('Update Pages: ${event.scheme.toJson()}');
    emit(state.copyWith(themePageConfig: event.scheme, status: ThemePropertyStatus.progress));
    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  // OLD

  Future<void> _onReplaceColorEvent(ReplaceColorSchemeEvent event, Emitter<UpdateThemeState> emit) async {
    _updateColor(event.colorScheme, emit);
  }

  Future<void> _onChangeSchemeEvent(UpdateThemeSchemeEvent event, Emitter<UpdateThemeState> emit) {
    return event.map(
        updateFont: (_UpdateThemeSchemeFontEvent value) async => _updateFont(value.font, emit),
        updateTexts: (_UpdateThemeSchemeTextsvent value) async => _updateTexts(value.textsModel, emit),
        // updateInAppImages: (_UpdateThemeSchemeImagesEvent value) async => _updateImageResources(value.image, emit),
        // updateInAppImages: (_UpdateThemeSchemeImagesEvent value) async => {},
        updateSystemAssetsImages: (_UpdateSystemAssetsImagesEvent value) async =>
            _updateSystemAssetImageResources(value.image, emit));
  }

  Future<void> _onChangeColorEvent(UpdateColorSchemeEvent event, Emitter<UpdateThemeState> emit) {
    return event.map(
      chane: (_UpdateColorEventChange value) async {
        final originalColorScheme = state.colorSchemeConfig.colorSchemeOverride.toJson();

        // Update the color scheme
        final updatedColorScheme = {
          ...originalColorScheme,
          value.key: value.color?.toHex(),
        };

        final newColorSchemeConfig = state.colorSchemeConfig.copyWith(
          colorSchemeOverride: ColorSchemeOverride.fromJson(updatedColorScheme),
        );

        // Emit state changes
        emit(state.copyWith(
          status: ThemePropertyStatus.progress,
          colorSchemeConfig: newColorSchemeConfig,
        ));

        emit(state.copyWith(status: ThemePropertyStatus.success));
      },
      gradientTab: (_UpdateColorEventGradientTab value) async => _updateGradientTab(value.colors, emit),
      launchAdaptiveIconColor: (value) async => _updateLaunchColor(emit, adaptiveIconBackground: value.color),
      launchSplashBackgroundColor: (value) async => _updateLaunchColor(emit, splashBackground: value.color),
    );
  }

  Future<void> _validateAndTryUpdateTheme(UpdateThemeEvent event, Emitter<UpdateThemeState> emit) async {
    if (event.model != null) {
      if ((event.model?.name ?? '').isNotEmpty) {
        try {
          emit(state.copyWith(status: ThemePropertyStatus.progress));

          final colorScheme = state.colorSchemeConfig.toJson();
          final themeWidgetConfig = state.themeWidgetConfig.toJson();
          final themePageConfig = state.themePageConfig.toJson();
          final appConfig = state.appConfig.toJson();

          await updateThemeUseCase.execute(
            themeModel: event.model!.copyWith(
              colorSchemeConfig: colorScheme,
              themeWidgetConfig: themeWidgetConfig,
              themePageConfig: themePageConfig,
              appConfig: appConfig,
              assets: state.assets,
            ),
          );
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

  Future<void> _tryGetTheme(GetThemeEvent event, Emitter<UpdateThemeState> emit) async {
    try {
      emit(state.copyWith(status: ThemePropertyStatus.progress));

      final theme = await getThemeUseCase.execute();
      final widgets = ThemeWidgetConfig.fromJson(theme.themeWidgetConfig);
      final pages = ThemePageConfig.fromJson(theme.themePageConfig);
      final colorsScheme = ColorSchemeConfig.fromJson(theme.colorSchemeConfig);
      final appConfig = AppConfig.fromJson(theme.appConfig);

      emit(state.copyWith(
        theme: theme,
        colorSchemeConfig: colorsScheme,
        themeWidgetConfig: widgets,
        appConfig: appConfig,
        themePageConfig: pages,
        assets: theme.assets,
      ));
      emit(state.copyWith(status: ThemePropertyStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePropertyStatus.error,
        error: e,
      ));
    }
  }

  Future<void> _tryGetApplication(GetApplicationEvent event, Emitter<UpdateThemeState> emit) async {
    try {
      emit(state.copyWith(status: ThemePropertyStatus.progress));
      final application = await getApplicationUseCase.execute(id: state.applicationId);

      emit(state.copyWith(status: ThemePropertyStatus.success, applicationModel: application));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ThemePropertyStatus.error,
        error: e,
      ));
    }
  }

  void _updateFont(String font, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    // emit(state.copyTheme(theme: state.theme?.copyWith(fontFamily: font)));
  }

  void _updateTexts(TextsModel? textsModel, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    // emit(state.copyTheme(theme: state.theme?.copyWith(texts: textsModel)));
  }

  void _updatePropertyStateScreen(UpdatePropertyStateScreen event, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(themePropertyScreens: event.propertyStateScreen));
  }

  // void _updateImageResources(ImageSchemeModel? image, Emitter<UpdateThemeState> emit) {
  //   emit(state.copyWith(status: ThemePropertyStatus.success));
  //   // emit(state.copyTheme(theme: state.theme?.copyWith(images: image ?? const ImageSchemeModel())));
  // }

  void _updateSystemAssetImageResources(SystemAssetsModel? image, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    emit(state.copyWith(theme: state.theme?.copyWith(systemAssets: image ?? const SystemAssetsModel())));
  }

  void _updateColor(ColorSchemeModel? color, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.progress));
    // emit(state.copyTheme(theme: state.theme?.copyWith(colorScheme: color)));
    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  void _updateLaunchColor(Emitter<UpdateThemeState> emit, {Color? adaptiveIconBackground, Color? splashBackground}) {
    // final colors = state.colors;
    // final launchColors = colors?.launch;
    //
    // final newAdaptiveIconBackground = adaptiveIconBackground?.toHex() ?? launchColors?.adaptiveIconBackground;
    // final newSplashBackground = splashBackground?.toHex() ?? launchColors?.splashBackground;
    //
    // emit(state.copyWith(status: ThemePropertyStatus.success));
    // emit(state.copyTheme(
    //   theme: state.theme?.copyWith(
    //       // colors: colors?.copyWith(
    //       //   launch: launchColors?.copyWith(
    //       //     adaptiveIconBackground: newAdaptiveIconBackground,
    //       //     splashBackground: newSplashBackground,
    //       //   ),
    //       // ),
    //       ),
    // ));
  }

  void _updateGradientTab(List<Color> colors, Emitter<UpdateThemeState> emit) {
    emit(state.copyWith(status: ThemePropertyStatus.success));
    // emit(state.copyTheme(
    //   theme: state.theme?.copyWith(
    //       // colors: state.theme?.colors?.copyWith(
    //       //   gradientTabColor: colors.map((color) => color.toHex()).nonNulls.toList(),
    //       // ),
    //       ),
    // ));
  }
}
