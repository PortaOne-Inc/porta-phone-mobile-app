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
              child: BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
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
          lightColorSchemeOverride: state.theme?.colors,
          primaryGradientColors: state.theme?.toCustomColorGradientCollection ?? [],
          fontFamily: state.theme?.fontFamily,
          imagesScheme: scheme),
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
        child: const CallScreenScreenshot(false),
      ),
      ScreenshotApp(
        appBloc: appBloc,
        child: const CallScreenScreenshot(true),
      ),
    ]);
  }
}
