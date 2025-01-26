import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

// ignore: unused_import
import 'package:webtrit_configurator/features/themes/models/models.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_phone/models/models.dart';

class AssetsPreview extends StatefulWidget {
  const AssetsPreview({
    super.key,
  });

  @override
  State<AssetsPreview> createState() => _AssetsPreviewState();
}

class _AssetsPreviewState extends State<AssetsPreview> {
  final _isFrameVisible = true;
  final _previewType = PreviewType.single;
  var _focusScreenPosition = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateThemCubit, UpdateThemeState>(
        listener: _listenBloc,
        builder: (BuildContext context, state) {
          return Builder(
            builder: (context) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Column(
                key: const ValueKey('ScreenPreview'),
                children: [
                  // MenuPreview(
                  //   isEnableFrame: _isFrameVisible,
                  //   onScaleTab: (PreviewType type) {
                  //     _previewType = type;
                  //     setState(() {});
                  //   },
                  //   onFrameTab: (visibility) {
                  //     _isFrameVisible = visibility;
                  //     setState(() {});
                  //   },
                  //   onTypeOfPreview: (ThemePreviewScreen type) {
                  //     context.read<ThemePropertyCubit>().add(UpdatePreviewScreen(type));
                  //   },
                  // ),
                  Expanded(
                    child: Builder(
                      builder: (BuildContext context) {
                        // return WidgetsPreview(
                        //   theme: state.theme,
                        // );
                        return TypePreview(
                          type: _previewType,
                          screens: _phoneScreenshots(state.theme, state.applicationModel),
                          screenFocus: _focusScreenPosition,
                          isFrameVisible: _isFrameVisible,
                          onFocusPosition: _setFocusedScreen,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  List<Widget> _phoneScreenshots(ThemeModel? theme, ApplicationModel? applicationModel) {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeProvider.of(context).settings,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );
    return [
      const LoginModeSelectScreenScreenshot(),
      const LoginCoreUrlAssignScreenScreenshot(),
      const LoginOtpSignInScreenshot(),
      const LoginOtpVerifyInScreenshot(),
      const LoginPasswordSignInScreenshot(),
      const LoginSignUpScreenshot(),
      const LoginSignUpVerifyScreenshot(),
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

  void _listenBloc(BuildContext context, UpdateThemeState state) {
    // if (state.isHasFocus) {
    //   _setFocusedScreen(state.position!);
    // }
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }
}
