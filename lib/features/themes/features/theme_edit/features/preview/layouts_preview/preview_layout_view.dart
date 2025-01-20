import 'package:flutter/material.dart';

import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_phone/models/models.dart';

class PreviewLayoutView extends StatefulWidget {
  const PreviewLayoutView({
    required this.previewType,
    required this.frameVisibility,
    super.key,
  });

  final PreviewType previewType;
  final bool frameVisibility;

  @override
  State<PreviewLayoutView> createState() => _PreviewLayoutViewState();
}

class _PreviewLayoutViewState extends State<PreviewLayoutView> {
  var _focusScreenPosition = 0;

  @override
  Widget build(BuildContext context) {
    return ResizableColumns(
      initialProportions: const [0.75, 0.25],
      dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
      dividerThickness: 4,
      children: [
        (context) => Align(
              child: TypePreview(
                type: widget.previewType,
                screens: _phoneScreenshots(),
                screenFocus: _focusScreenPosition,
                isFrameVisible: widget.frameVisibility,
                onFocusPosition: _setFocusedScreen,
              ),
            ),
        if (widget.previewType == PreviewType.single)
          (context) => DrawerPreview(
                screenshots: _phoneScreenshots(),
                focusScreenPosition: _focusScreenPosition,
                onTapScreen: _setFocusedScreen,
              ),
      ],
      orientation: ResizableOrientation.vertical,
    );
  }

  List<Widget> _phoneScreenshots() {
    final settings = ThemeProvider.of(context).settings;
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeProvider.of(context).settings,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );
    final loginLabel = settings.appConfig?.loginConfig.label ?? '';
    return [
      LoginModeSelectScreenScreenshot(appGreeting: loginLabel),
      const LoginCoreUrlAssignScreenScreenshot(),
      const LoginOtpSignInScreenshot(),
      const LoginOtpVerifyInScreenshot(),
      const LoginPasswordSignInScreenshot(),
      const LoginSignUpScreenshot(),
      const LoginSignUpVerifyScreenshot(),
      MainScreenScreenshot(MainFlavor.favorites, Text(loginLabel)),
      MainScreenScreenshot(MainFlavor.recents, Text(loginLabel)),
      MainScreenScreenshot(MainFlavor.keypad, Text(loginLabel)),
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
    _focusScreenPosition = position;
    setState(() {});
  }
}
