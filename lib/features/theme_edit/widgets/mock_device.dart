import 'package:flutter/widgets.dart';

import 'package:device_preview/device_preview.dart';

class MockDevice extends StatelessWidget {
  const MockDevice({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const platform = TargetPlatform.android;
    const size = Size(400, 800);
    final device = DeviceInfo.genericPhone(
      platform: platform,
      id: 'device_id',
      name: 'Device',
      screenSize: size,
    );
    return DeviceFrame(
        device: device,
        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: IgnorePointer(
          child: child,
        ));
  }
}
