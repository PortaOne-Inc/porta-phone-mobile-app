import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../widgets/widgets.dart';

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
  var _focusScreenPosition = 0;

  final _screenshots = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: DrawerPreview(
          screenshots: _screenshots,
          focusScreenPosition: _focusScreenPosition,
          onTapScreen: (position) {
            Scaffold.of(context).closeEndDrawer();
            _focusScreenPosition = position;
            setState(() {});
          },
        ),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            MenuPreview(
              onMenuTab: () => Scaffold.of(context).openEndDrawer(),
              onScaleTab: (PreviewType type) {
                _previewType = type;
                setState(() {});
              },
              onFrameTab: (visibility) {
                _isFrameVisible = visibility;
                setState(() {});
              },
              isEnableFrame: _isFrameVisible,
            ),
            Expanded(
              child: BlocConsumer<ThemePropertyCubit, ThemePropertyState>(
                listener: (BuildContext context, state) {
                  if (state is ThemePropertFocusState) {
                    setState(() {
                      _focusScreenPosition = state.position!;
                    });
                  }
                },
                builder: (BuildContext context, state) {
                  _updatePreviewScreens(state);
                  return Column(
                    children: [
                      Expanded(
                        child: PreviewDetails(
                          type: _previewType,
                          screens: _screenshots,
                          screenFocus: _focusScreenPosition,
                          isFrameVisible: _isFrameVisible,
                          onFocusPosition: (position) {
                            setState(() {
                              _focusScreenPosition = position;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  final scheme = ImagesScheme();

  void complete(BuildContext context, ThemePropertyState state) async {
    final logo = state.theme?.images?.applicationLogo;

    if (logo?.isNetwork ?? false) {
      scheme.setApplicationLogoByUrl(logo!.url!);
    } else if (logo?.data != null) {
      scheme.setApplicationByBytes(base64Decode(logo!.data!));
    } else {
      scheme.clearApplicationLogo();
    }
  }

  void _updatePreviewScreens(ThemePropertyState state) {
    complete(context, state);
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeSettings(
        seedColor: state.theme?.colors?.primary ?? Colors.transparent,
        // lightColorSchemeOverride: state.theme?.colors,
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
        primaryGradientColors: state.theme?.toCustomColorGradientCollection ?? [],
        fontFamily: state.theme?.fontFamily,
        imagesScheme: scheme,
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
          video: false,
        ),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const CallScreenScreenshot(
          video: true,
          remotePlaceholderUrl:
              'https://firebasestorage.googleapis.com/v0/b/webtrit-configurator-stage.appspot.com/o/screenshots%20_video_call%2Fref1.png?alt=media&token=692ccd4f-d43d-48b0-8e1d-9fd7b2f90220',
          localePlaceholderUrl:
              'https://firebasestorage.googleapis.com/v0/b/webtrit-configurator-stage.appspot.com/o/screenshots%20_video_call%2Fref2.png?alt=media&token=3d469e82-9a64-4852-b593-9133f304bbef',
        ),
      ),
    ]);
  }
}
