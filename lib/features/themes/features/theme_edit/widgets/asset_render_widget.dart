import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:screenshot/screenshot.dart';

import 'generate_launch_icon.dart';

class RenderWidget extends StatelessWidget {
  const RenderWidget({
    required ScreenshotController screenshotAndroidLaunchIconController,
    required ImageModel? image,
    required double paddingAndroidLaunch,
    // required this.widget,
    required BoxFit launchIconsFitBox,
    required ScreenshotController screenshotForegroundIconController,
    required double paddingAndroidAdaptive,
    required ScreenshotController screenshotIosLaunchIconController,
    required double paddingAndroidIOS,
    required ScreenshotController screenshotWebLaunchIconController,
    required double paddingAndroidWEB,
    required ScreenshotController screenshotSplashIconController,
    required double paddingSplash,
    required BoxFit splashIconsFitBox,
    super.key,
  })  : _screenshotAndroidLaunchIconController = screenshotAndroidLaunchIconController,
        _image = image,
        _paddingAndroidLaunch = paddingAndroidLaunch,
        _launchIconsFitBox = launchIconsFitBox,
        _screenshotForegroundIconController = screenshotForegroundIconController,
        _paddingAndroidAdaptive = paddingAndroidAdaptive,
        _screenshotIosLaunchIconController = screenshotIosLaunchIconController,
        _paddingAndroidIOS = paddingAndroidIOS,
        _screenshotWebLaunchIconController = screenshotWebLaunchIconController,
        _paddingAndroidWEB = paddingAndroidWEB,
        _screenshotSplashIconController = screenshotSplashIconController,
        _paddingSplash = paddingSplash,
        _splashIconsFitBox = splashIconsFitBox;

  final ScreenshotController _screenshotAndroidLaunchIconController;
  final ImageModel? _image;
  final double _paddingAndroidLaunch;

  // final PageThemeImportAssets widget;
  final BoxFit _launchIconsFitBox;
  final ScreenshotController _screenshotForegroundIconController;
  final double _paddingAndroidAdaptive;
  final ScreenshotController _screenshotIosLaunchIconController;
  final double _paddingAndroidIOS;
  final ScreenshotController _screenshotWebLaunchIconController;
  final double _paddingAndroidWEB;
  final ScreenshotController _screenshotSplashIconController;
  final double _paddingSplash;
  final BoxFit _splashIconsFitBox;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  GenerateLaunchIcon(
                    screenshotStreamController: _screenshotAndroidLaunchIconController,
                    size: const Size(192, 192),
                    imageModel: _image,
                    padding: EdgeInsets.all(24 + _paddingAndroidLaunch),
                    // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                    title: '<=Android 12 (Launch icon)\n 192px:192px',
                    fit: _launchIconsFitBox,
                  ),
                  const SizedBox(width: 56),
                  GenerateLaunchIcon(
                    screenshotStreamController: _screenshotForegroundIconController,
                    size: const Size(432, 432),
                    padding: EdgeInsets.all(112 + _paddingAndroidAdaptive),
                    imageModel: _image,
                    title: '>=Android 13 (Adaptive foreground) 432px:432px',
                    fit: _launchIconsFitBox,
                  ),
                ],
              ),
              const SizedBox(height: 56),
              GenerateLaunchIcon(
                screenshotStreamController: _screenshotIosLaunchIconController,
                size: const Size(1024, 1024),
                imageModel: _image,
                padding: EdgeInsets.all(48 + _paddingAndroidIOS),
                // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                title: 'iOS 1024px:1024px',
                fit: _launchIconsFitBox,
              ),
              const SizedBox(height: 56),
              GenerateLaunchIcon(
                screenshotStreamController: _screenshotWebLaunchIconController,
                size: const Size(1024, 1024),
                padding: EdgeInsets.all(48 + _paddingAndroidWEB),
                // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                imageModel: _image,
                title: 'Web 1024px:1024px',
                fit: _launchIconsFitBox,
              ),
              const SizedBox(height: 56),
              GenerateLaunchIcon(
                screenshotStreamController: _screenshotSplashIconController,
                size: const Size(640, 640),
                padding: EdgeInsets.all(_paddingSplash),
                // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                imageModel: _image,
                title: 'Android / iOS 640px:640px',
                fit: _splashIconsFitBox,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
