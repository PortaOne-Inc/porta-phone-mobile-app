import 'package:flutter/material.dart';


import 'package:screenshot/screenshot.dart';

import 'package:webtrit_configurator/core/core.dart';

class GenerateLaunchIcon extends StatelessWidget {
  const GenerateLaunchIcon({
    required this.screenshotStreamController,
    required this.size,
    required this.padding,
    required this.title,
    required this.fit,
    this.resource,
    this.color,
    super.key,
  });

  final ScreenshotController screenshotStreamController;
  final Resource? resource;
  final EdgeInsets padding;
  final Size size;
  final BoxFit fit;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredBox(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          child: Screenshot(
            controller: screenshotStreamController,
            child: Container(
              padding: padding,
              color: color,
              width: size.width,
              height: size.height,
              child: ImageRenderer(
                resource: resource ?? Resource.empty(),
                fit: fit,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
