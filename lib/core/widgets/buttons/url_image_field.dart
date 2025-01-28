import 'package:flutter/material.dart';

import 'image_renderer.dart';

class UrlImageField extends StatelessWidget {
  const UrlImageField({
    required this.title,
    required this.constraints,
    this.resource,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final String title;
  final Resource? resource;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ConstrainedBox(
      constraints: constraints,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: margin,
          elevation: 1,
          child: Stack(
            children: [
              if (resource == null)
                Positioned.fill(
                  child: CustomPaint(
                    painter: _PatternPainter(primaryColor: theme.colorScheme.primary),
                  ),
                )
              else
                Positioned.fill(
                  child: ImageRenderer(
                    resource: resource!,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: padding,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatternPainter extends CustomPainter {
  _PatternPainter({required this.primaryColor});

  final Color primaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    const cellSize = 20.0;

    for (var row = 0; row < (size.height / cellSize).ceil(); row++) {
      for (var col = 0; col < (size.width / cellSize).ceil(); col++) {
        paint.color = (row + col).isEven ? primaryColor.withOpacity(0.85) : primaryColor.withOpacity(0.65);

        final rect = Rect.fromLTWH(col * cellSize, row * cellSize, cellSize, cellSize);
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
