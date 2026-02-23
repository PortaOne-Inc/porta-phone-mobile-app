import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

enum BackgroundType { color, resource, none }

class Background {
  const Background._({required this.type, this.color, this.resource});

  factory Background.color(Color color) =>
      Background._(color: color, type: BackgroundType.color);

  factory Background.resource(Resource resource) =>
      Background._(resource: resource, type: BackgroundType.resource);

  static const Background none = Background._(type: BackgroundType.none);

  final Color? color;
  final Resource? resource;
  final BackgroundType type;
}

class AssetsLaunchIcon extends StatelessWidget {
  const AssetsLaunchIcon({
    required this.size,
    required this.radius,
    required this.foreground,
    required this.safeZone,
    this.background = Background.none,
    super.key,
  });

  final Size size;
  final Size safeZone;
  final Resource foreground;
  final Background background;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: radius),
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (background.type == BackgroundType.color)
              Container(
                color: background.color,
                width: size.width,
                height: size.height,
              )
            else if (background.type == BackgroundType.resource)
              ImageRender(resource: background.resource),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.tertiary.withValues(alpha: 0.5),
                ),
              ),
            ),
            SizedBox(
              child: ImageRender(resource: foreground, fit: BoxFit.contain),
            ),
            Container(
              width: safeZone.width,
              height: safeZone.height,
              decoration: BoxDecoration(
                borderRadius: radius,
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.tertiary.withValues(alpha: 0.75),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
