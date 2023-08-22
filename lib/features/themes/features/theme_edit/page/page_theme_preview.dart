import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../widgets/widgets.dart';
import 'page_theme_preview_launch_icons.dart';
import 'page_theme_preview_native_splash.dart';

class PageThemePreview extends StatefulWidget {
  const PageThemePreview({
    super.key,
  });

  @override
  State<PageThemePreview> createState() => _PageThemePreviewState();
}

class _PageThemePreviewState extends State<PageThemePreview> {
  var _isFrameVisible = true;
  var _previewType = PreviewType.single;
  var _layoutType = LayoutType.layout;
  var _focusScreenPosition = 0;

  final _screenshots = <Widget>[];

  final _previewImageScheme = ImagesScheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Column(
          children: [
            MenuPreview(
              isEnableFrame: _isFrameVisible,
              onScaleTab: (PreviewType type) {
                _previewType = type;
                setState(() {});
              },
              onFrameTab: (visibility) {
                _isFrameVisible = visibility;
                setState(() {});
              },
              onTypeOfPreview: (LayoutType type) {
                _layoutType = type;
                setState(() {});
              },
            ),
            Expanded(
              child: BlocConsumer<ThemePropertyCubit, ThemePropertyState>(
                listener: _listenBloc,
                builder: (BuildContext context, state) {
                  Widget layout;

                  switch (_layoutType) {
                    case LayoutType.layout:
                      layout = PreviewDetails(
                        type: _previewType,
                        screens: _screenshots,
                        screenFocus: _focusScreenPosition,
                        isFrameVisible: _isFrameVisible,
                        onFocusPosition: _setFocusedScreen,
                      );
                      break;
                    case LayoutType.splash:
                      layout = PageThemePreviewLaunchSplash(
                        theme: state.theme!,
                      );
                      break;
                    case LayoutType.icons:
                      layout = PageThemePreviewLaunchIcons(
                        theme: state.theme!,
                      );

                      break;
                  }

                  return BackgroundBinaryResizableVertical(
                    topChild: layout,
                    bottomChild: _previewType == PreviewType.single && _layoutType == LayoutType.layout
                        ? DrawerPreview(
                            screenshots: _screenshots,
                            focusScreenPosition: _focusScreenPosition,
                            onTapScreen: _setFocusedScreen,
                          )
                        : null,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listenBloc(BuildContext context, state) {
    if (state is ThemePropertFocusState) {
      _setFocusedScreen(state.position!);
    } else {
      _updatePreviewScreens(state);
    }
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }

  void _updatePreviewScreens(ThemePropertyState state) async {
    final primaryOnboardingLogo = state.theme?.images.primaryOnboardingLogo;
    final secondaryOnboardingLogo = state.theme?.images.secondaryOnboardingLogo;

    if (primaryOnboardingLogo?.isAvailable == true) {
      _previewImageScheme.setPrimaryOnboardingLogo(
        url: primaryOnboardingLogo?.url,
        bytes: base64DecodeOrNull(primaryOnboardingLogo?.data),
      );
    } else {
      _previewImageScheme.clearPrimaryOnboardingLogoStream();
    }

    if (secondaryOnboardingLogo?.isAvailable == true) {
      _previewImageScheme.setSecondaryOnboardingLogo(
        url: secondaryOnboardingLogo?.url,
        bytes: base64DecodeOrNull(secondaryOnboardingLogo?.data),
      );
    } else {
      _previewImageScheme.clearSecondaryOnboardingLogoStream();
    }

    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeSettings(
        seedColor: state.theme?.colors?.primary ?? Colors.transparent,
        lightColorSchemeOverride: ColorSchemeOverride(
          primary: state.theme?.colors?.primary,
          onPrimary: state.theme?.colors?.onPrimary,
          primaryContainer: state.theme?.colors?.primaryContainer,
          onPrimaryContainer: state.theme?.colors?.onPrimaryContainer,
          secondary: state.theme?.colors?.secondary,
          onSecondary: state.theme?.colors?.onSecondary,
          secondaryContainer: state.theme?.colors?.secondaryContainer,
          onSecondaryContainer: state.theme?.colors?.onSecondaryContainer,
          tertiary: state.theme?.colors?.tertiary,
          onTertiary: state.theme?.colors?.onTertiary,
          tertiaryContainer: state.theme?.colors?.tertiaryContainer,
          error: state.theme?.colors?.error,
          onError: state.theme?.colors?.onError,
          errorContainer: state.theme?.colors?.errorContainer,
          onErrorContainer: state.theme?.colors?.onErrorContainer,
          outline: state.theme?.colors?.outline,
          outlineVariant: state.theme?.colors?.outlineVariant,
          background: state.theme?.colors?.background,
          onBackground: state.theme?.colors?.onBackground,
          surface: state.theme?.colors?.surface,
          onSurface: state.theme?.colors?.onSurface,
          surfaceVariant: state.theme?.colors?.surfaceVariant,
          onSurfaceVariant: state.theme?.colors?.onSurfaceVariant,
          inverseSurface: state.theme?.colors?.inverseSurface,
          shadow: state.theme?.colors?.shadow,
          scrim: state.theme?.colors?.scrim,
          surfaceTint: state.theme?.colors?.surfaceTint,
        ),
        //TODO: Add possibility to add null
        primaryGradientColors: state.theme!.toCustomColorGradientCollection(),
        fontFamily: state.theme?.fontFamily,
        imagesScheme: _previewImageScheme,
        appName: state.theme?.texts?.greeting,
      ),
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );

    _screenshots.clear();
    _screenshots.addAll([
      ScreenshotApp(
        appBloc: appBloc,
        child: const LoginScreenScreenshot(LoginStep.modeSelect),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const LoginScreenScreenshot(LoginStep.coreUrlAssign),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const LoginScreenScreenshot(LoginStep.otpRequest),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const MainScreenScreenshot(MainFlavor.favorites),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const MainScreenScreenshot(MainFlavor.recents),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const MainScreenScreenshot(MainFlavor.keypad),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const SettingScreenScreenshot(),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const CallScreenScreenshot(
          false,
        ),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const CallScreenScreenshot(
          true,
          localePlaceholderImageUrl:
              'https://firebasestorage.googleapis.com/v0/b/webtrit-configurator-stage.appspot.com/o/screenshots%20_video_call%2Fref1.png?alt=media&token=692ccd4f-d43d-48b0-8e1d-9fd7b2f90220',
          remotePlaceholderImageUrl:
              'https://firebasestorage.googleapis.com/v0/b/webtrit-configurator-stage.appspot.com/o/screenshots%20_video_call%2Fref2.png?alt=media&token=3d469e82-9a64-4852-b593-9133f304bbef',
        ),
      ),
    ]);
    setState(() {});
  }
}
