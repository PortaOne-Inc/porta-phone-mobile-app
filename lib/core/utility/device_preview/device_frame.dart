import 'package:flutter/material.dart';

import 'frame_painter.dart';
import 'screen_clipper.dart';

class DeviceFrame extends StatelessWidget {
  const DeviceFrame({
    required this.child,
    this.size = const Size(1344, 2992),
    this.statusBarHeight = 36,
    this.frameThickness = 16,
    this.isFrameVisible = true,
    super.key,
  });

  final Widget child;
  final Size size;
  final double statusBarHeight;
  final double frameThickness;
  final bool isFrameVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isFrameVisible)
          const Positioned.fill(child: CustomPaint(painter: FramePainter())),
        Padding(
          padding: isFrameVisible
              ? EdgeInsets.all(frameThickness)
              : EdgeInsets.zero,
          child: ClipPath(
            clipper: const ScreenClipper(),
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(size: size),
                child: Column(
                  children: [
                    Container(
                      height: statusBarHeight,
                      color: Theme.of(context).primaryColor,
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
