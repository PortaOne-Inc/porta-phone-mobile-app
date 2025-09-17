import 'package:flutter/widgets.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/full_size_render.dart';

import '../../../../../widgets/generate_launch_icon.dart';

class SplashIconWidget extends StatelessWidget {
  const SplashIconWidget({
    required ScreenshotController screenshotSplashIconController,
    required Resource? image,
    required double paddingSplash,
    required BoxFit splashIconsFitBox,
    super.key,
  })  : _screenshotSplashIconController = screenshotSplashIconController,
        _image = image,
        _paddingSplash = paddingSplash,
        _splashIconsFitBox = splashIconsFitBox;

  final ScreenshotController _screenshotSplashIconController;
  final Resource? _image;
  final double _paddingSplash;
  final BoxFit _splashIconsFitBox;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: FullSizeRender(
        child: GenerateLaunchIcon1(
          screenshotStreamController: _screenshotSplashIconController,
          size: const Size(640, 640),
          padding: EdgeInsets.all(_paddingSplash),
          resource: _image,
          title: 'Android / iOS 640px:640px',
          fit: _splashIconsFitBox,
        ),
      ),
    );
  }
}
