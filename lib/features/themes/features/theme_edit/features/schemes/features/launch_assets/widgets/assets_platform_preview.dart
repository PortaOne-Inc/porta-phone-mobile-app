import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webtrit_configurator/core/widgets/buttons/image_renderer.dart';
import 'package:webtrit_configurator/core/widgets/decoration/border_container.dart';

import 'assets_launch_icon.dart';

class AssetsPlatformPreview extends StatelessWidget {
  const AssetsPlatformPreview({
    required this.title,
    required this.foregroundResource,
    required this.size,
    required this.safeZone,
    this.backgroundResource,
    this.backgroundColor,
    super.key,
    this.leading,
  });

  final String title;
  final Resource foregroundResource;
  final Resource? backgroundResource;
  final Color? backgroundColor;
  final Size size;
  final Size safeZone;

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: title,
      child: Wrap(
        spacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 8,
        children: [
          if (leading != null) leading!,
          AssetsLaunchIcon(
            size: size,
            safeZone: safeZone,
            radius: const BorderRadius.all(Radius.circular(1)),
            foreground: foregroundResource,
            background: _background,
          ),
          AssetsLaunchIcon(
            size: size,
            safeZone: safeZone,
            radius: const BorderRadius.all(Radius.circular(180)),
            foreground: foregroundResource,
            background: _background,
          ),
          AssetsLaunchIcon(
            size: size,
            safeZone: safeZone,
            radius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(4),
            ),
            foreground: foregroundResource,
            background: _background,
          ),
          AssetsLaunchIcon(
            size: size,
            safeZone: safeZone,
            radius: const BorderRadius.all(Radius.circular(4)),
            foreground: foregroundResource,
            background: _background,
          ),
          AssetsLaunchIcon(
            size: size,
            safeZone: safeZone,
            radius: const BorderRadius.all(Radius.circular(16)),
            foreground: foregroundResource,
            background: _background,
          ),
        ],
      ),
    );
  }

  Background get _background => backgroundResource != null
      ? Background.resource(backgroundResource!)
      : backgroundColor != null
          ? Background.color(backgroundColor!)
          : Background.none;
}
