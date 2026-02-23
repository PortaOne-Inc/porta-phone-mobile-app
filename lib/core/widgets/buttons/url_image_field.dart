import 'package:flutter/material.dart';

import '../pattern_painter.dart';
import 'image_renderer.dart';

class UrlImageField extends StatelessWidget {
  const UrlImageField({
    required this.constraints,
    this.title,
    this.resource,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final String? title;
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
              if (resource == null || resource is EmptyResource)
                Positioned.fill(
                  child: CustomPaint(
                    painter: PatternPainter(
                      primaryColor: theme.colorScheme.primary,
                    ),
                  ),
                )
              else
                Positioned.fill(child: ImageRenderer(resource: resource!)),
              if (title != null)
                Padding(
                  padding: padding,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title ?? '',
                      style: textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          const Shadow(
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
