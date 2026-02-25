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
                    _MockStatusBar(
                      height: statusBarHeight,
                      backgroundColor: Theme.of(context).primaryColor,
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

class _MockStatusBar extends StatelessWidget {
  const _MockStatusBar({required this.height, required this.backgroundColor});

  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final foreground =
        ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
        ? Colors.white70
        : Colors.black54;
    final iconSize = height * 0.4;
    final fontSize = height * 0.38;

    return Container(
      height: height,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: height * 0.33),
      child: Row(
        children: [
          Text(
            '9:41',
            style: TextStyle(
              color: foreground,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          const Spacer(),
          Icon(Icons.signal_cellular_4_bar, size: iconSize, color: foreground),
          SizedBox(width: iconSize * 0.3),
          Icon(Icons.wifi, size: iconSize, color: foreground),
          SizedBox(width: iconSize * 0.3),
          Icon(Icons.battery_full, size: iconSize, color: foreground),
        ],
      ),
    );
  }
}
