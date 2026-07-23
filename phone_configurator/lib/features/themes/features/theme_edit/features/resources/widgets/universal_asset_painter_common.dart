import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

Rect destRectWithPadding({
  required double artboardPx,
  required double paddingPx,
}) {
  final s = math.max(0, artboardPx - paddingPx * 2);
  return Rect.fromLTWH(paddingPx, paddingPx, s.toDouble(), s.toDouble());
}

Rect srcRectForImage(ui.Image img) =>
    Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble());
