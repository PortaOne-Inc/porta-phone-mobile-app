import 'package:flutter/material.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({
    required this.mode,
    required this.onChanged,
    this.labelText,
    this.helperText,
    super.key,
  });

  final ThemeModeConfig mode;
  final ValueChanged<ThemeModeConfig> onChanged;
  final String? labelText;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (labelText != null || helperText != null) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (labelText != null)
                  Text(
                    labelText!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                if (helperText != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    helperText!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
        SegmentedButton<ThemeModeConfig>(
          showSelectedIcon: false,
          segments: _buildSegments(),
          selected: {mode},
          onSelectionChanged: (Set<ThemeModeConfig> values) {
            onChanged(values.first);
          },
        ),
      ],
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
    switch (mode) {
      case ThemeModeConfig.light:
        return Icons.light_mode;
      case ThemeModeConfig.dark:
        return Icons.dark_mode;
      case ThemeModeConfig.system:
        return Icons.brightness_auto;
    }
  }
}
