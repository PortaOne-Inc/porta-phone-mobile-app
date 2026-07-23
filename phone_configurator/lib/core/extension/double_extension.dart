import 'package:flutter/widgets.dart';

extension DoubleExtension on double {
  double toPixels(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return this * pixelRatio;
  }

  double toLogicalPixels(BuildContext context) {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return this / pixelRatio;
  }
}
