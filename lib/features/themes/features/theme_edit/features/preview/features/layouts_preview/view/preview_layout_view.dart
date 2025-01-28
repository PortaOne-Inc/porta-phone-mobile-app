import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_phone/data/feature_access.dart';
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
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeProvider.of(context).settings,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );

    final loginFeature = context.read<FeatureAccess?>()?.loginFeature;
    final loginLabel = loginFeature?.titleL10n;

    return [
      LoginModeSelectScreenScreenshot(appGreeting: loginLabel),
      const LoginCoreUrlAssignScreenScreenshot(),
      const LoginOtpSignInScreenshot(),
      const LoginOtpVerifyInScreenshot(),
      const LoginPasswordSignInScreenshot(),
      const LoginSignUpScreenshot(),
      const LoginSignUpVerifyScreenshot(),
      MainScreenScreenshot(MainFlavor.favorites, loginLabel != null ? Text(loginLabel) : null),
      MainScreenScreenshot(MainFlavor.recents, loginLabel != null ? Text(loginLabel) : null),
      MainScreenScreenshot(MainFlavor.keypad, loginLabel != null ? Text(loginLabel) : null),
      const SettingScreenScreenshot(),
      const CallScreenScreenshot(false),
      const CallScreenScreenshot(
        true,
        localePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef1,
        remotePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef2,
      ),
    ]
        .map((it) => ScreenshotApp(
              appBloc: appBloc,
              child: Theme(data: ThemeProvider.of(context).light()!, child: it),
            ))
        .toList();
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }
}
