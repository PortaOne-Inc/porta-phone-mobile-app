import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaleControl extends StatelessWidget {
  const ScaleControl({
    required this.value,
    required this.controller,
    required this.onChanged,
    required this.onInputChanged,
    this.presets = const [0.25, 0.5, 0.75, 1],
    super.key,
  });

  final double value;
  final TextEditingController controller;
  final ValueChanged<double> onChanged;
  final ValueChanged<String> onInputChanged;
  final List<double> presets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Scale', style: theme.textTheme.labelLarge),
            Text(
              '${(value * 100).toInt()}%',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Slider(value: value, onChanged: onChanged),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 70,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                onChanged: onInputChanged,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]')),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: presets.map((p) {
            return ActionChip(
              label: Text('${(p * 100).toInt()}%'),
              onPressed: () => onChanged(p),
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
            );
          }).toList(),
        ),
      ],
    );
  }
}
