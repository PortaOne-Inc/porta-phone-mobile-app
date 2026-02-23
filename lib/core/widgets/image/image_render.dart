import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/widgets/buttons/image_renderer.dart';
import 'package:webtrit_configurator/core/widgets/pattern_painter.dart';

class ImageRender extends StatelessWidget {
  const ImageRender({
    this.fit = BoxFit.cover,
    this.constraints,
    this.resource,
    super.key,
  });

  final Resource? resource;
  final BoxConstraints? constraints;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(),
      child: Stack(
        children: [
          if (resource == null)
            Positioned.fill(
              child: CustomPaint(
                painter: PatternPainter(
                  primaryColor: theme.colorScheme.primary,
                ),
              ),
            )
          else
            Positioned.fill(
              child: ImageRenderer(resource: resource!, fit: fit),
            ),
        ],
      ),
    );
  }
}
