import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/widgets/image/image_resource.dart';

class LaunchIcon extends StatelessWidget {
  const LaunchIcon({
    super.key,
    required this.size,
    required this.radius,
    required this.foreground,
    required this.backgroundImage,
    this.backgroundColor,
    required this.safeZone,
  });

  final Size size;
  final Size safeZone;
  final ImageModel foreground;
  final ImageModel backgroundImage;
  final Color? backgroundColor;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: radius,
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundColor != null
                ? Container(
                    color: backgroundColor,
                  )
                : ImageResource(
                    imageModel: backgroundImage,
                  ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5), // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
            SizedBox(
              child: ImageResource(
                imageModel: foreground,
                fit: BoxFit.none,
                defaultWidget: const SizedBox(),
              ),
            ),
            Container(
              width: safeZone.width,
              height: safeZone.height,
              decoration: BoxDecoration(
                borderRadius: radius,
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary.withOpacity(0.75), // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
