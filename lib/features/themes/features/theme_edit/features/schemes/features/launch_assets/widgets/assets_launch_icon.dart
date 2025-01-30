import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/core/widgets/image/image_resource.dart';


class AssetsLaunchIcon extends StatelessWidget {
  const AssetsLaunchIcon({
    required this.size,
    required this.radius,
    required this.foreground,
    required this.safeZone,
    this.backgroundImage,
    this.backgroundColor,
    super.key,
  });

  final Size size;
  final Size safeZone;
  final Resource foreground;
  final Resource? backgroundImage;
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
            if (backgroundColor != null)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: backgroundColor,
              )
            else
              backgroundImage != null
                  ? ImageRender(
                      resource: backgroundImage!,
                    )
                  : const SizedBox(),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.5), // Border color
                ),
              ),
            ),
            SizedBox(
              child: ImageRender(
                resource: foreground,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: safeZone.width,
              height: safeZone.height,
              decoration: BoxDecoration(
                borderRadius: radius,
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.75), // Border color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
