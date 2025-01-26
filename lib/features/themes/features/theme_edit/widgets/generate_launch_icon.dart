import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:screenshot/screenshot.dart';

import 'package:webtrit_configurator/core/core.dart';

class GenerateLaunchIcon extends StatelessWidget {
  const GenerateLaunchIcon({
    required this.screenshotStreamController,
    required this.size,
    required this.padding,
    required this.title,
    required this.fit,
    this.imageModel,
    this.color,
    super.key,
  });

  final ScreenshotController screenshotStreamController;
  final ImageModel? imageModel;
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
              width: size.width,
              color: color,
              height: size.height,
              child: ImageResource(
                imageModel: imageModel ?? const ImageModel(),
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
