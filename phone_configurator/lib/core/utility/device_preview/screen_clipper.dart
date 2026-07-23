import 'package:flutter/rendering.dart';

import 'package:vector_math/vector_math_64.dart';

class ScreenClipper extends CustomClipper<Path> {
  const ScreenClipper();

  @override
  Path getClip(Size size) {
    final bounds = screenPath.getBounds();
    final matrix = Matrix4.identity()
      ..translateByVector3(Vector3(-bounds.left / 2, -bounds.top / 2, 0))
      ..scaleByVector3(
        Vector3(size.width / bounds.width, size.height / bounds.height, 1),
      );
    return screenPath.transform(matrix.storage);
  }

  @override
  bool shouldReclip(ScreenClipper oldClipper) => false;
}

final screenPath = Path()
  ..moveTo(30.3263, 75.7513)
  ..cubicTo(21.7354, 91.0915, 21.7354, 111.551, 21.7354, 152.469)
  ..lineTo(21.7354, 1708.02)
  ..cubicTo(21.7354, 1748.94, 21.7354, 1769.4, 30.3263, 1784.74)
  ..cubicTo(36.3978, 1795.58, 45.3492, 1804.53, 56.1908, 1810.6)
  ..cubicTo(71.531, 1819.19, 91.9901, 1819.19, 132.908, 1819.19)
  ..lineTo(719.093, 1819.19)
  ..cubicTo(760.011, 1819.19, 780.47, 1819.19, 795.81, 1810.6)
  ..cubicTo(806.652, 1804.53, 815.603, 1795.58, 821.675, 1784.74)
  ..cubicTo(830.266, 1769.4, 830.266, 1748.94, 830.266, 1708.02)
  ..lineTo(830.266, 152.469)
  ..cubicTo(830.266, 111.551, 830.266, 91.0915, 821.675, 75.7513)
  ..cubicTo(815.603, 64.9098, 806.652, 55.9584, 795.81, 49.8868)
  ..cubicTo(780.47, 41.2959, 760.011, 41.2959, 719.093, 41.2959)
  ..lineTo(132.908, 41.2959)
  ..cubicTo(91.9901, 41.2959, 71.531, 41.2959, 56.1908, 49.8868)
  ..cubicTo(45.3492, 55.9584, 36.3978, 64.9098, 30.3263, 75.7513)
  ..close()
  ..moveTo(447.734, 88.7347)
  ..cubicTo(447.734, 100.738, 438.003, 110.469, 426, 110.469)
  ..cubicTo(413.996, 110.469, 404.265, 100.738, 404.265, 88.7347)
  ..cubicTo(404.265, 76.731, 413.996, 67, 426, 67)
  ..cubicTo(438.003, 67, 447.734, 76.731, 447.734, 88.7347)
  ..close()
  ..fillType = PathFillType.evenOdd;
