import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'universal_asset_painter_common.dart';

/// Paints a square artboard preview for a single designer page.
///
/// Layers (bottom → top):
///   1. Solid [backgroundColor] fill
///   2. [backgroundImage] fitted inside padding inset
///   3. [foregroundImage] fitted inside padding inset
///   4. Safe-zone circle (white stroke) — visual guide showing the area
///      guaranteed to be visible on the target platform
///   5. Artboard border frame
class UniversalAssetPreviewPainter extends CustomPainter {
  UniversalAssetPreviewPainter({
    required this.backgroundImage,
    required this.foregroundImage,
    required this.backgroundColor,
    required this.artboardPx,
    required this.paddingPx,
    required this.fit,
    required this.safeZonePx,
    this.maskPx,
  });

  final ui.Image? backgroundImage;
  final ui.Image? foregroundImage;
  final Color backgroundColor;

  /// Square artboard side length in logical pixels (already scaled for preview).
  final double artboardPx;

  /// Content inset from each edge in px. Controls how much space is left
  /// between the artboard border and the images.
  final double paddingPx;

  final BoxFit fit;

  /// Diameter (in px) of the safe-zone circle drawn as a white stroke.
  /// Represents the area guaranteed visible after platform masking/cropping.
  /// `null` means no safe-zone guide is drawn.
  final double? safeZonePx;

  /// Diameter (in px) of the platform mask circle. When set, the artboard is
  /// clipped to this circle so the preview shows the icon exactly as the
  /// platform renders it (everything outside the mask is cut away, revealing
  /// the transparency pattern behind). `null` keeps the full square artboard.
  final double? maskPx;

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..isAntiAlias = true
      ..color = backgroundColor;

    final imgPaint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high;

    final board = Rect.fromLTWH(0, 0, artboardPx, artboardPx);
    final center = Offset(artboardPx / 2, artboardPx / 2);
    final masked = maskPx != null && maskPx! > 0;

    if (masked) {
      canvas
        ..save()
        ..clipPath(Path()..addOval(Rect.fromCircle(center: center, radius: maskPx! / 2)));
    }

    canvas.drawRect(board, bgPaint);

    if (backgroundImage != null) {
      _drawFitted(canvas, backgroundImage!, board, paddingPx, fit, imgPaint);
    }
    if (foregroundImage != null) {
      _drawFitted(canvas, foregroundImage!, board, paddingPx, fit, imgPaint);
    }

    if (masked) {
      canvas.restore();
    }

    // Safe-zone circle — contrasting stroke for visibility on any background
    if (safeZonePx != null && safeZonePx! > 0) {
      final lum = backgroundColor.computeLuminance();
      final guideColor = lum > 0.5 ? Colors.black : Colors.white;
      final safePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = artboardPx * 0.01
        ..color = guideColor.withValues(alpha: 0.7);
      canvas.drawCircle(center, safeZonePx! / 2, safePaint);
    }

    // Border frame: follows the mask circle when masked, else the artboard
    final frame = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black.withValues(alpha: 0.25)
      ..strokeWidth = artboardPx * 0.015;

    if (masked) {
      canvas.drawCircle(center, (maskPx! - frame.strokeWidth) / 2, frame);
    } else {
      canvas.drawRect(board.deflate(frame.strokeWidth / 2), frame);
    }
  }

  void _drawFitted(Canvas canvas, ui.Image img, Rect board, double paddingPx, BoxFit fit, Paint paint) {
    final dest = destRectWithPadding(artboardPx: board.width, paddingPx: paddingPx);
    final src = srcRectForImage(img);

    final output = applyBoxFit(fit, Size(src.width, src.height), Size(dest.width, dest.height));

    final renderSize = output.destination;
    final inputSubrect = Alignment.center.inscribe(output.source, src);
    final outputSubrect = Alignment.center.inscribe(renderSize, dest);

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
      old.maskPx != maskPx;
}
