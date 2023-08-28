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
                  return FlexibleBinaryLayout(
                    childPrimary: (context, size) => layout,
                    childSecondary: (context, size) =>
                        _previewType == PreviewType.single && _layoutType == LayoutType.layout
                            ? DrawerPreview(
                                screenshots: _screenshots,
                                focusScreenPosition: _focusScreenPosition,
                                onTapScreen: _setFocusedScreen,
                              )
                            : Container(),
                    orientation: ResizableOrientation.vertical,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listenBloc(BuildContext context, ThemePropertyState state) {
    if (state is ThemePropertFocusState) {
      _setFocusedScreen(state.position!);
    } else {
      _updatePreviewScreens(state.theme ?? const ThemeModel());
    }
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }

  void _updatePreviewScreens(ThemeModel theme) async {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: theme.toThemeSettings(),
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
