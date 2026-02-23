import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'universal_asset_painter_common.dart';

class UniversalAssetPreviewPainter extends CustomPainter {
  UniversalAssetPreviewPainter({
    required this.backgroundImage,
    required this.foregroundImage,
    required this.backgroundColor,
    required this.artboardPx,
    required this.paddingPx,
    required this.fit,
    required this.safeZonePx,
    required this.maskDiameterPx,
  });

  final ui.Image? backgroundImage;
  final ui.Image? foregroundImage;
  final Color backgroundColor;
  final double artboardPx;
  final double paddingPx;
  final BoxFit fit;
  final double? safeZonePx;
  final double? maskDiameterPx;

  @override
  void paint(Canvas canvas, Size size) {
    // Окремі пенти
    final bgPaint = Paint()
      ..isAntiAlias = true
      ..color = backgroundColor;

    final imgPaint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high; // кращий скейл
    // ВАЖЛИВО: не задаємо color з альфою тут

    final board = Rect.fromLTWH(0, 0, artboardPx, artboardPx);
    canvas.drawRect(board, bgPaint);

    if (backgroundImage != null) {
      _drawFitted(canvas, backgroundImage!, board, paddingPx, fit, imgPaint);
    }
    if (foregroundImage != null) {
      _drawFitted(canvas, foregroundImage!, board, paddingPx, fit, imgPaint);
    }

    final center = Offset(artboardPx / 2, artboardPx / 2);

    final safePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = artboardPx * 0.01
      ..color = Colors.white.withValues(alpha: 0.9);

    final hasMask = maskDiameterPx != null && maskDiameterPx! > 0;
    final hasSafe = safeZonePx != null && safeZonePx! > 0;
    final overlap = hasMask && hasSafe &&
        (safeZonePx! - maskDiameterPx!).abs() < artboardPx * 0.02;

    if (hasSafe && !overlap) {
      canvas.drawCircle(center, safeZonePx! / 2, safePaint);
    }

    if (hasMask) {
      final ring = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = artboardPx * 0.012
        ..color = Colors.redAccent.withValues(alpha: 0.88);
      canvas.drawCircle(center, maskDiameterPx! / 2, ring);
    }

    final frame = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black.withValues(alpha: 0.25)
      ..strokeWidth = artboardPx * 0.015;

    canvas.drawRect(board.deflate(frame.strokeWidth / 2), frame);
  }

  void _drawFitted(
    Canvas canvas,
    ui.Image img,
    Rect board,
    double paddingPx,
    BoxFit fit,
    Paint paint,
  ) {
    final dest = destRectWithPadding(
      artboardPx: board.width,
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

    // Малюємо завжди пеном без альфи/кольору (imgPaint)
    canvas.drawImageRect(img, inputSubrect, outputSubrect, paint);
  }

  @override
  bool shouldRepaint(covariant UniversalAssetPreviewPainter old) =>
      old.backgroundImage != backgroundImage ||
      old.foregroundImage != foregroundImage ||
      old.backgroundColor != backgroundColor ||
      old.artboardPx != artboardPx ||
      old.paddingPx != paddingPx ||
      old.fit != fit ||
      old.safeZonePx != safeZonePx ||
      old.maskDiameterPx != maskDiameterPx;
}
