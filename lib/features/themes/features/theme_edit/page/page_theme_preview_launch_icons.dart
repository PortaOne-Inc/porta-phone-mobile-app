import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import '../widgets/lauch_icon.dart';

class PageThemePreviewLaunchIcons extends StatelessWidget {
  const PageThemePreviewLaunchIcons({
    super.key,
    required this.theme,
  });

  final ThemeModel theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              'Android adaptive icons (>= Android 13)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(72),
                radius: const BorderRadius.all(Radius.circular(1)),
                foreground: theme.images.adaptiveIconForeground,
                backgroundColor: theme.colors?.launch?.adaptiveIconBackground,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(72),
                radius: const BorderRadius.all(Radius.circular(180)),
                foreground: theme.images.adaptiveIconForeground,
                backgroundColor: theme.colors?.launch?.adaptiveIconBackground,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(72),
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4),
                ),
                foreground: theme.images.adaptiveIconForeground,
                backgroundColor: theme.colors?.launch?.adaptiveIconBackground,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(72),
                radius: const BorderRadius.all(Radius.circular(4)),
                foreground: theme.images.adaptiveIconForeground,
                backgroundColor: theme.colors?.launch?.adaptiveIconBackground,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(72),
                radius: const BorderRadius.all(Radius.circular(16)),
                foreground: theme.images.adaptiveIconForeground,
                backgroundColor: theme.colors?.launch?.adaptiveIconBackground,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
            ],
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              'Android launch icons (<= Android 12)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(81),
                radius: const BorderRadius.all(Radius.circular(1)),
                foreground: theme.images.androidLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(81),
                radius: const BorderRadius.all(Radius.circular(180)),
                foreground: theme.images.androidLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(81),
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4),
                ),
                foreground: theme.images.androidLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(81),
                radius: const BorderRadius.all(Radius.circular(4)),
                foreground: theme.images.androidLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(81),
                radius: const BorderRadius.all(Radius.circular(16)),
                foreground: theme.images.androidLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
            ],
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              'IOS',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(108 * 0.9),
                radius: const BorderRadius.all(Radius.circular(20)),
                foreground: theme.images.iosLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(108 * 0.9),
                radius: const BorderRadius.all(Radius.circular(90)),
                foreground: theme.images.iosLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
            ],
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.all(16),
            child: Text(
              'Web',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              LaunchIcon(
                size: const Size.square(108),
                safeZone: const Size.square(108 * 0.90),
                radius: const BorderRadius.all(Radius.circular(20)),
                foreground: theme.images.iosLauncherIcon,
                backgroundColor: Colors.transparent,
                backgroundImage: theme.images.adaptiveIconBackground,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
