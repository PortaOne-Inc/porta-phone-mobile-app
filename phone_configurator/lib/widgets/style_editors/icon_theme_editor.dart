import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../color_field.dart';
import '../style_controls/style_controls.dart';

class IconThemeEditor extends StatelessWidget {
  const IconThemeEditor({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final IconThemeDataConfig? value;
  final ValueChanged<IconThemeDataConfig?> onChanged;

  @override
  Widget build(BuildContext context) {
    final cfg = value ?? const IconThemeDataConfig();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            Expanded(
              child: ColorField(
                title: 'Color',
                color: cfg.color?.toColor(),
                onTap: (color) => _handleColorPicker(context, cfg),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumberInputControl(
                label: 'Size',
                value: cfg.size,
                onChanged: (v) => onChanged(cfg.copyWith(size: v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumberInputControl(
                label: 'Opacity',
                value: cfg.opacity,
                onChanged: (v) => onChanged(cfg.copyWith(opacity: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: NumberInputControl(
                label: 'Weight',
                value: cfg.weight,
                tooltip: 'e.g. 400 (Regular), 700 (Bold)',
                onChanged: (v) => onChanged(cfg.copyWith(weight: v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumberInputControl(
                label: 'Grade',
                value: cfg.grade,
                tooltip: 'e.g. -25, 0, 200',
                onChanged: (v) => onChanged(cfg.copyWith(grade: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: NumberInputControl(
                label: 'Fill',
                value: cfg.fill,
                tooltip: '0.0 (Outlined) to 1.0 (Filled)',
                onChanged: (v) => onChanged(cfg.copyWith(fill: v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumberInputControl(
                label: 'Optical Size',
                value: cfg.opticalSize,
                tooltip: 'e.g. 24, 48',
                onChanged: (v) => onChanged(cfg.copyWith(opticalSize: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Apply Text Scaling'),
          dense: true,
          value: cfg.applyTextScaling ?? false,
          onChanged: (v) => onChanged(cfg.copyWith(applyTextScaling: v)),
        ),
      ],
    );
  }

  /// Handles the color picker dialog interaction and updates the configuration.
  Future<void> _handleColorPicker(
    BuildContext context,
    IconThemeDataConfig cfg,
  ) async {
    final selectedColor = await context.showColorPicker(
      currentColor: cfg.color?.toColor(),
    );
    if (selectedColor != null) {
      onChanged(cfg.copyWith(color: selectedColor.toHex()));
    }
  }
}
