import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/webtrit_phone.dart';

import 'alignment_control.dart';

class LayoutControl extends StatelessWidget {
  const LayoutControl({
    required this.alignment,
    required this.fit,
    required this.onAlignmentChanged,
    required this.onFitChanged,
    super.key,
    this.fitOptions = BoxFitConfig.values,
  });

  final AlignmentConfig alignment;
  final BoxFitConfig fit;
  final ValueChanged<AlignmentConfig> onAlignmentChanged;
  final ValueChanged<BoxFitConfig> onFitChanged;
  final List<BoxFitConfig> fitOptions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Layout', style: theme.textTheme.labelLarge),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlignmentControl(
              alignment: alignment,
              onChanged: onAlignmentChanged,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: fitOptions.map((f) {
                  return ChoiceChip(
                    label: Text(f.name),
                    selected: fit == f,
                    onSelected: (_) => onFitChanged(f),
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
