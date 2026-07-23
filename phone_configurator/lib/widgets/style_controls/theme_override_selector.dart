import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

import 'theme_mode_selector.dart';

class ThemeOverrideSelector extends StatelessWidget {
  const ThemeOverrideSelector({
    required this.config,
    required this.onChanged,
    super.key,
  });

  final ThemeOverrideConfig config;
  final ValueChanged<ThemeOverrideConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Override',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Force specific theme mode (Light/Dark) for this screen.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            ThemeModeSelector(
              mode: config.mode,
              onChanged: (newMode) => onChanged(config.copyWith(mode: newMode)),
            ),
            const SizedBox(height: 8),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Apply to AppBar'),
              subtitle: const Text('Force theme on the App Bar as well'),
              value: config.applyToAppBar,
              onChanged: (val) =>
                  onChanged(config.copyWith(applyToAppBar: val)),
            ),
          ],
        ),
      ),
    );
  }
}
