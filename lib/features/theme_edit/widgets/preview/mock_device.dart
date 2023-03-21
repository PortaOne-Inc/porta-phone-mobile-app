import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

class TypeOfPreview extends StatelessWidget {
  const TypeOfPreview({
    super.key,
    required this.child,
    this.size = const Size(400, 800),
    this.isFrameVisible = true,
    this.isFocused = false,
    required this.constraints,
  });

  final Widget child;
  final Size size;
  final bool isFrameVisible;
  final bool isFocused;
  final BoxConstraints constraints;

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
              ),
            ),
          ),
          Icon(
            isFocused ? Icons.center_focus_strong_rounded : Icons.center_focus_strong_outlined,
            color: isFocused ? Colors.green : Colors.black45,
            size: 16,
          ),
        ],
      ),
    );
  }
}
