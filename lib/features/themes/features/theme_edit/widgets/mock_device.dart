import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

class TypeOfPreview extends StatelessWidget {
  const TypeOfPreview({
    super.key,
    required this.child,
    this.size = const Size(400, 800),
    this.isFrameVisible = true,
    required this.constraints,
    this.focusIndicator,
  });

  final Widget child;
  final Size size;
  final bool isFrameVisible;
  final BoxConstraints constraints;
  final Widget? focusIndicator;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              elevation: isFrameVisible ? 0 : 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(isFrameVisible ? 0.0 : 1.0),
              ),
              child: FittedBox(
                  child: DeviceFrame(
                device: DeviceInfo.genericPhone(
                  platform: TargetPlatform.android,
                  id: 'device_id',
                  name: 'Device',
                  screenSize: size,
                ),
                isFrameVisible: isFrameVisible,
                orientation: Orientation.portrait,
                screen: IgnorePointer(
                  child: child,
                ),
              )),
            ),
          ),
          focusIndicator ?? const SizedBox()
        ],
      ),
    );
  }
}
