import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

import 'package:webtrit_configurator/core/entity/models/models.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

class PageThemePreviewLaunchSplash extends StatelessWidget {
  const PageThemePreviewLaunchSplash({
    super.key,
    required this.theme,
  });

  final ThemeModel theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DeviceFrame(
              device: DeviceInfo.genericPhone(
                platform: TargetPlatform.iOS,
                id: 'ios_id',
                name: 'IOS',
                screenSize: const Size(400, 800),
              ),
              isFrameVisible: true,
              orientation: Orientation.portrait,
              screen: IgnorePointer(
                child: Container(
                  color: theme.colors?.launch?.splashBackground ?? Colors.green,
                  child: Center(
                      child: ImageResource(
                    imageModel: theme.images.adaptiveIconForeground,
                    fit: BoxFit.none,
                    defaultWidget: const SizedBox(),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
