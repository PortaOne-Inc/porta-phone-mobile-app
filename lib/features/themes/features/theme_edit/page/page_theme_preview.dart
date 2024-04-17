import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/models/models.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';

import '../bloc/configurator_cubit.dart';

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
                    ? ThemeAssetsPreview(
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
                                return FlexibleBinaryLayout(
                                  childPrimary: (context, size) {
                                    switch (state.themePreviewScreen) {
                                      case ThemePreviewScreen.layouts:
                                        return TypePreview(
                                          type: _previewType,
                                          screens: _phoneScreenshots(state.theme, state.applicationModel),
                                          screenFocus: _focusScreenPosition,
                                          isFrameVisible: _isFrameVisible,
                                          onFocusPosition: _setFocusedScreen,
                                        );
                                      case ThemePreviewScreen.assets:
                                        return ThemeAssetsPreview(
                                          theme: state.theme!,
                                        );
                                    }
                                  },
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
      const LoginModeSelectScreenScreenshot(),
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
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }
}
