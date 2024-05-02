import 'dart:convert';

import 'package:screenshot/screenshot.dart';

extension ScreenshotControllerExtension on ScreenshotController {
  Future<String> captureBase64({
    double? pixelRatio,
    Duration delay = const Duration(milliseconds: 20),
  }) async {
    final data = await capture(pixelRatio: pixelRatio, delay: delay);
    return base64Encode(data! as List<int>);
  }
}
