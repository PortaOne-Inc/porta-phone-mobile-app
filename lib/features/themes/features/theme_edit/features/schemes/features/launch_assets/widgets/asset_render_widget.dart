import 'package:flutter/widgets.dart';

import 'package:screenshot/screenshot.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/full_size_render.dart';

import '../../../../../widgets/generate_launch_icon.dart';

class RenderWidget extends StatelessWidget {
  const RenderWidget({
    required this.androidLaunchScreenshotStreamController,
    required this.androidForegroundScreenshotStreamController,
    required this.iosScreenshotStreamController,
    required this.webScreenshotStreamController,
    required this.paddingAndroidLaunch,
    required this.paddingAndroidAdaptive,
    required this.paddingIOS,
    required this.paddingWEB,
    required this.boxFitAndroidLaunch,
    required this.boxFitAndroidAdaptive,
    required this.boxFitIOS,
    required this.boxFitWEB,
    super.key,
    this.image,
  });

  final ScreenshotController androidLaunchScreenshotStreamController;
  final ScreenshotController androidForegroundScreenshotStreamController;
  final ScreenshotController iosScreenshotStreamController;
  final ScreenshotController webScreenshotStreamController;

  final double paddingAndroidLaunch;
  final double paddingAndroidAdaptive;
  final double paddingIOS;
  final double paddingWEB;

  final BoxFit boxFitAndroidLaunch;
  final BoxFit boxFitAndroidAdaptive;
  final BoxFit boxFitIOS;
  final BoxFit boxFitWEB;

  final Resource? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FullSizeRender(
        child: Column(
          children: [
            Row(
              children: [
                GenerateLaunchIcon(
                  screenshotStreamController: androidLaunchScreenshotStreamController,
                  size: const Size(192, 192),
                  resource: image,
                  padding: EdgeInsets.all(24 + paddingAndroidLaunch),
                  title: '<=Android 12 (Launch icon)\n 192px:192px',
                  fit: boxFitAndroidLaunch,
                ),
                const SizedBox(width: 56),
                GenerateLaunchIcon(
                  screenshotStreamController: androidForegroundScreenshotStreamController,
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
              screenshotStreamController: iosScreenshotStreamController,
              size: const Size(1024, 1024),
              resource: image,
              padding: EdgeInsets.all(48 + paddingIOS),
              // color: widget.themeModel.colorScheme?.launch?.adaptiveIconBackground?.toColor(),
              title: 'iOS 1024px:1024px',
              fit: boxFitIOS,
            ),
            const SizedBox(height: 56),
            GenerateLaunchIcon(
              screenshotStreamController: webScreenshotStreamController,
              size: const Size(1024, 1024),
              padding: EdgeInsets.all(48 + paddingWEB),
              resource: image,
              title: 'Web 1024px:1024px',
              fit: boxFitWEB,
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
