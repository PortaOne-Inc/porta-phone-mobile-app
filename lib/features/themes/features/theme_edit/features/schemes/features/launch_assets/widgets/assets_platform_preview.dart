import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webtrit_configurator/core/widgets/buttons/image_renderer.dart';
import 'package:webtrit_configurator/core/widgets/decoration/border_container.dart';

import 'assets_launch_icon.dart';

class AssetsPlatformPreview extends StatelessWidget {
  const AssetsPlatformPreview({
    required this.title,
    super.key,
    this.leading,
    required this.resource,
  });

  final String title;
  final Resource resource;
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
            size: const Size.square(108),
            safeZone: const Size.square(81),
            radius: const BorderRadius.all(Radius.circular(1)),
            foreground: resource,
            backgroundColor: Colors.transparent,
            // backgroundImage: theme.systemAssets.adaptiveIconBackground,
            backgroundImage: Resource.empty(),
          ),
          AssetsLaunchIcon(
            size: const Size.square(108),
            safeZone: const Size.square(81),
            radius: const BorderRadius.all(Radius.circular(180)),
            // foreground: theme.systemAssets.androidLauncherIcon,
            foreground: resource,

            backgroundColor: Colors.transparent,
            // backgroundImage: theme.systemAssets.adaptiveIconBackground,
            backgroundImage: Resource.empty(),
          ),
          AssetsLaunchIcon(
            size: const Size.square(108),
            safeZone: const Size.square(81),
            radius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(4),
            ),
            // foreground: theme.systemAssets.androidLauncherIcon,
            foreground: resource,

            backgroundColor: Colors.transparent,
            // backgroundImage: theme.systemAssets.adaptiveIconBackground,
          ),
          AssetsLaunchIcon(
            size: const Size.square(108),
            safeZone: const Size.square(81),
            radius: const BorderRadius.all(Radius.circular(4)),
            // foreground: theme.systemAssets.androidLauncherIcon,
            foreground: resource,

            backgroundColor: Colors.transparent,
            // backgroundImage: theme.systemAssets.adaptiveIconBackground,
          ),
          AssetsLaunchIcon(
            size: const Size.square(108),
            safeZone: const Size.square(81),
            radius: const BorderRadius.all(Radius.circular(16)),
            foreground: resource,

            // foreground: theme.systemAssets.androidLauncherIcon,
            backgroundColor: Colors.transparent,
            // backgroundImage: theme.systemAssets.adaptiveIconBackground,
          ),
        ],
      ),
    );
  }
}
