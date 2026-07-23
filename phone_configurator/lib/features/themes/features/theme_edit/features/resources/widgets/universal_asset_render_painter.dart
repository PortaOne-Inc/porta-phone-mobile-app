import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

import 'universal_asset_painter_common.dart';

class UniversalAssetRenderPainter {
  static Future<Uint8List> renderPng({
    required int sizePx,
    required ui.Image? backgroundImage,
    required ui.Image? foregroundImage,
    required ui.Color backgroundColor,
    required double paddingRatio,
    required BoxFit fit,
    bool foregroundOnly = false,
    bool backgroundOnly = false,
  }) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final bgPaint = Paint()
      ..isAntiAlias = true
      ..color = backgroundColor;
    final imgPaint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high;

    final board = Rect.fromLTWH(0, 0, sizePx.toDouble(), sizePx.toDouble());
    canvas.drawRect(board, bgPaint);

    final paddingPx = sizePx * paddingRatio;

    void drawLayer(ui.Image img) {
      final dest = destRectWithPadding(
        artboardPx: sizePx.toDouble(),
        paddingPx: paddingPx,
      );
      final src = srcRectForImage(img);
      final output = applyBoxFit(
        fit,
        Size(src.width, src.height),
        Size(dest.width, dest.height),
      );
      final renderSize = output.destination;
      final inputSubrect = Alignment.center.inscribe(output.source, src);
      final outputSubrect = Alignment.center.inscribe(renderSize, dest);
      canvas.drawImageRect(img, inputSubrect, outputSubrect, imgPaint);
    }

    if (!foregroundOnly && backgroundImage != null) drawLayer(backgroundImage);
    if (!backgroundOnly && foregroundImage != null) drawLayer(foregroundImage);

    final picture = recorder.endRecording();
    final img = await picture.toImage(sizePx, sizePx);
    final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }
}
