import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../consts/image.dart';
import '../model/models.dart';
import '../widgets/widgets.dart';

import 'page_theme_preview_launch_icons.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ThemePropertyCubit, ThemePropertyState>(
          listener: _listenBloc,
          builder: (BuildContext context, state) {
            return Builder(
              builder: (context) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: state.themePropertyScreens == ThemePropertyScreens.importSvg
                    ? PageThemePreviewLaunchAssets(
                        theme: state.draftTheme!,
                        key: const ValueKey('PageThemePreviewLaunchAssets'),
                      )
                    : Column(
                        key: const ValueKey('ScreenPreview'),
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
                            onTypeOfPreview: (ThemePreviewScreen type) {
                              context.read<ThemePropertyCubit>().add(UpdatePreviewScreen(type));
                            },
                          ),
                          Expanded(
                            child: Builder(
                              builder: (BuildContext context) {
                                Widget layout;

                                switch (state.themePreviewScreen) {
                                  case ThemePreviewScreen.layouts:
                                    layout = PreviewDetails(
                                      type: _previewType,
                                      screens: _phoneScreenshots(state.theme, state.applicationModel),
                                      screenFocus: _focusScreenPosition,
                                      isFrameVisible: _isFrameVisible,
                                      onFocusPosition: _setFocusedScreen,
                                    );
                                    break;
                                  case ThemePreviewScreen.assets:
                                    layout = PageThemePreviewLaunchAssets(
                                      theme: state.theme!,
                                    );
                                    break;
                                }
                                return FlexibleBinaryLayout(
                                  childPrimary: (context, size) => layout,
                                  childSecondary: _previewType == PreviewType.single &&
                                          state.themePreviewScreen == ThemePreviewScreen.layouts
                                      ? (context, size) => DrawerPreview(
                                            screenshots: _phoneScreenshots(state.theme, state.applicationModel),
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
          }),
    );
  }

  List<Widget> _phoneScreenshots(ThemeModel? theme, ApplicationModel? applicationModel) {
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
      MainScreenScreenshot(MainFlavor.favorites, Text(applicationModel?.name ?? '')),
      MainScreenScreenshot(MainFlavor.recents, Text(applicationModel?.name ?? '')),
      MainScreenScreenshot(MainFlavor.keypad, Text(applicationModel?.name ?? '')),
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
    //
    // if (state.themePropertyScreens == ThemePropertyScreens.importSvg) {
    //   Navigator.of(context).pushReplacement(
    //     PageRouteBuilder(
    //       pageBuilder: (context, animation, secondaryAnimation) =>
    //           PageThemePreviewLaunchIcons(theme: state.draftTheme!),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         const begin = Offset(0.0, 1.0);
    //         const end = Offset.zero;
    //         var tween = Tween(begin: begin, end: end);
    //
    //         var offsetAnimation = animation.drive(
    //           Tween<Offset>(
    //             begin: begin,
    //             end: end,
    //           ).chain(
    //             CurveTween(
    //               curve: Curves.easeInOut,
    //             ),
    //           ),
    //         );
    //
    //         return SlideTransition(
    //           position: offsetAnimation,
    //           child: child,
    //         );
    //       },
    //     ),
    //   );
    // } else {
    //   Navigator.of(context).maybePop();
    // }
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }
}
