import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../consts/image.dart';
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
                        screens: _phoneScreenshots(state.theme),
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
                    childSecondary: _previewType == PreviewType.single && _layoutType == LayoutType.layout
                        ? (context, size) => DrawerPreview(
                              screenshots: _phoneScreenshots(state.theme),
                              focusScreenPosition: _focusScreenPosition,
                              onTapScreen: _setFocusedScreen,
                            )
                        : null,
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

  List<Widget> _phoneScreenshots(ThemeModel? theme) {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: (theme ?? const ThemeModel()).toThemeSettings(),
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );
    return [
      LoginScreenScreenshot(
        LoginStep.modeSelect,
        appGreeting: theme?.texts?.greeting?.isEmpty ?? false ? null : theme?.texts?.greeting,
      ),

      // TODO: Workaround for remove issues in logs, there are Assertion failed: text_painter.dart  error
      const OverflowBox(
        child: LoginScreenScreenshot(
          LoginStep.coreUrlAssign,
        ),
      ),

      // TODO: Workaround for remove issues in logs, there are Assertion failed: text_painter.dart  error
      const OverflowBox(
        child: LoginScreenScreenshot(
          LoginStep.otpRequest,
        ),
      ),
      const MainScreenScreenshot(
        MainFlavor.favorites,
      ),
      const MainScreenScreenshot(
        MainFlavor.recents,
      ),
      const MainScreenScreenshot(
        MainFlavor.keypad,
      ),
      const SettingScreenScreenshot(),
      const CallScreenScreenshot(false),
      const CallScreenScreenshot(
        true,
        localePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef1,
        remotePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef2,
      ),
    ].map((e) => ScreenshotApp(appBloc: appBloc, child: e)).toList();
  }

  void _listenBloc(BuildContext context, ThemePropertyState state) {
    if (state.isHasFocus) {
      _setFocusedScreen(state.position!);
    }
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }
}
