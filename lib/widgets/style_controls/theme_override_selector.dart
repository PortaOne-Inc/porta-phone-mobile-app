import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

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
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
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
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                SegmentedButton<ThemeModeConfig>(
                  showSelectedIcon: false,
                  segments: _buildSegments(),
                  selected: {config.mode},
                  onSelectionChanged: _onModeChanged,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Apply to AppBar'),
              subtitle: const Text('Force theme on the App Bar as well'),
              value: config.applyToAppBar,
              onChanged: _onAppBarApplyChanged,
            ),
          ],
        ),
      ),
    );
  }

  List<ButtonSegment<ThemeModeConfig>> _buildSegments() {
    return ThemeModeConfig.values.map((mode) {
      return ButtonSegment<ThemeModeConfig>(
        value: mode,
        tooltip: mode.name,
        icon: Icon(_getIconForMode(mode)),
      );
    }).toList();
  }

  IconData _getIconForMode(ThemeModeConfig mode) {
    switch (mode.name.toLowerCase()) {
      case 'light':
        return Icons.light_mode;
      case 'dark':
        return Icons.dark_mode;
      default:
        return Icons.brightness_auto;
    }
  }

  void _onModeChanged(Set<ThemeModeConfig> values) {
    onChanged(config.copyWith(mode: values.first));
  }

  void _onAppBarApplyChanged(bool value) {
    onChanged(config.copyWith(applyToAppBar: value));
  }
}
