import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';

// TODO: Do this widgets common for both features
import '../../theme_edit/consts/consts.dart';
import '../../theme_edit/model/models.dart';
import '../../theme_edit/widgets/widgets.dart';

import '../bloc/theme_preview_cubit.dart';

class ThemePreviewPage extends StatefulWidget with MixinMessages {
  ThemePreviewPage({
    super.key,
    required this.title,
    this.draggable = false,
  });

  final String title;
  final bool draggable;

  @override
  State<ThemePreviewPage> createState() => _ThemePreviewPageState();
}

class _ThemePreviewPageState extends State<ThemePreviewPage> {
  var _isFrameVisible = true;
  var _previewType = PreviewType.single;
  var _focusScreenPosition = 0;
  var _typeScreen = ThemePreviewScreen.layouts;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePreviewCubit, ThemePreviewState>(builder: (BuildContext context, state) {
      return Scaffold(
        appBar: AppToolbar(
          isVisibleProgress: state.status == ThemePreviewStatus.progress,
          themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
          onThemeChange: (mode) => BlocProvider.of<CommonBloc>(context).setThemeMode(mode),
          name: 'Preview of "${state.theme?.name}" theme',
        ),
        body: Column(
          children: [
            MenuPreview(
              isEnableFrame: _isFrameVisible,
              onScaleTab: (PreviewType type) {
                _previewType = type;
                setState(() {});
              },
              onTypeOfPreview: (ThemePreviewScreen type) {
                _typeScreen = type;
                setState(() {});
              },
              onFrameTab: (visibility) {
                _isFrameVisible = visibility;
                setState(() {});
              },
            ),
            Expanded(
              child: Builder(
                builder: (BuildContext context) {
                  Widget layout;

                  switch (_typeScreen) {
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
                      layout = ThemeAssetsPreview(
                        theme: state.theme!,
                      );
                      break;
                  }
                  return FlexibleBinaryLayout(
                    draggable: false,
                    dividerThickness: 4,
                    landslide: MediaQuery.of(context).size.height * 0.3,
                    childPrimary: (context, size) => layout,
                    childSecondary: _previewType == PreviewType.single && _typeScreen == ThemePreviewScreen.layouts
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
      );
    });
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
      MainScreenScreenshot(
        MainFlavor.favorites,
        Text(applicationModel?.name ?? ''),
      ),
      MainScreenScreenshot(
        MainFlavor.recents,
        Text(applicationModel?.name ?? ''),
      ),
      MainScreenScreenshot(
        MainFlavor.keypad,
        Text(applicationModel?.name ?? ''),
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

  void _setFocusedScreen(int position) {
    _previewType = PreviewType.single;
    _focusScreenPosition = position;
    setState(() {});
  }
}
