import 'package:flutter/widgets.dart';

import 'package:screenshot/screenshot.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../../../../../widgets/generate_launch_icon.dart';

class RenderWidget extends StatelessWidget {
  const RenderWidget({
    required this.screenshotAndroidLaunchIconController,
    required this.screenshotForegroundIconController,
    required this.screenshotIosLaunchIconController,
    required this.screenshotWebLaunchIconController,
    required this.paddingAndroidLaunch,
    required this.paddingAndroidAdaptive,
    required this.paddingAndroidIOS,
    required this.paddingAndroidWEB,
    required this.boxFitAndroidLaunch,
    required this.boxFitAndroidAdaptive,
    required this.boxFitAndroidIOS,
    required this.boxFitAndroidWEB,
    super.key,
    this.image,
  });

  final ScreenshotController screenshotAndroidLaunchIconController;
  final ScreenshotController screenshotForegroundIconController;
  final ScreenshotController screenshotIosLaunchIconController;
  final ScreenshotController screenshotWebLaunchIconController;

  final double paddingAndroidLaunch;
  final double paddingAndroidAdaptive;
  final double paddingAndroidIOS;
  final double paddingAndroidWEB;

  final BoxFit boxFitAndroidLaunch;
  final BoxFit boxFitAndroidAdaptive;
  final BoxFit boxFitAndroidIOS;
  final BoxFit boxFitAndroidWEB;

  final Resource? image;

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
                    screenshotStreamController: screenshotAndroidLaunchIconController,
                    size: const Size(192, 192),
                    resource: image,
                    padding: EdgeInsets.all(24 + paddingAndroidLaunch),
                    // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                    title: '<=Android 12 (Launch icon)\n 192px:192px',
                    fit: boxFitAndroidLaunch,
                  ),
                  const SizedBox(width: 56),
                  GenerateLaunchIcon(
                    screenshotStreamController: screenshotForegroundIconController,
                    size: const Size(432, 432),
                    padding: EdgeInsets.all(112 + paddingAndroidAdaptive),
                    resource: image,
                    title: '>=Android 13 (Adaptive foreground) 432px:432px',
                    fit: boxFitAndroidAdaptive,
                  ),
                ],
              ),
              const SizedBox(height: 56),
              GenerateLaunchIcon(
                screenshotStreamController: screenshotIosLaunchIconController,
                size: const Size(1024, 1024),
                resource: image,
                padding: EdgeInsets.all(48 + paddingAndroidIOS),
                // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                title: 'iOS 1024px:1024px',
                fit: boxFitAndroidIOS,
              ),
              const SizedBox(height: 56),
              GenerateLaunchIcon(
                screenshotStreamController: screenshotWebLaunchIconController,
                size: const Size(1024, 1024),
                padding: EdgeInsets.all(48 + paddingAndroidWEB),
                // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
                resource: image,
                title: 'Web 1024px:1024px',
                fit: boxFitAndroidWEB,
              ),
              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}
