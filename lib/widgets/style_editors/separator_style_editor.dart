import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../style_controls/style_controls.dart';

/// Reusable editor for a [SeparatorStyleConfig] — toggles separator visibility
/// and (when shown) its color. Used by any page that configures list separators.
class SeparatorStyleEditor extends StatelessWidget {
  const SeparatorStyleEditor({
    required this.value,
    required this.onChanged,
    this.title = 'Show List Separators',
    this.subtitle = 'Display divider lines between setting items.',
    this.colorLabel = 'Separator Color',
    super.key,
  });

  final SeparatorStyleConfig? value;
  final ValueChanged<SeparatorStyleConfig> onChanged;
  final String title;
  final String subtitle;
  final String colorLabel;

  @override
  Widget build(BuildContext context) {
    final config = value ?? const SeparatorStyleConfig();
    final enabled = config.enabled ?? true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          value: enabled,
          onChanged: (v) => onChanged(config.copyWith(enabled: v)),
        ),
        if (enabled) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ColorInput(
              label: colorLabel,
              color: config.color?.toColor(),
              onTap: () => _pickColor(context, config),
              onClear: () => onChanged(config.copyWith(color: null)),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }

  Future<void> _pickColor(BuildContext context, SeparatorStyleConfig config) async {
    final picked = await context.showColorPicker(currentColor: config.color?.toColor());
    if (context.mounted && picked != null) {
      onChanged(config.copyWith(color: picked.toHex(includeAlpha: true)));
    }
  }
}
