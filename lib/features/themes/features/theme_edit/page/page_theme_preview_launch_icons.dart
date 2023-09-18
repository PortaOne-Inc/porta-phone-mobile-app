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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Text(
            'Android adaptive icons: ',
            style: Theme.of(context).textTheme.headlineSmall,
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
      ],
    );
  }
}
