import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaddingControl extends StatelessWidget {
  const PaddingControl({
    required this.uniform,
    required this.padAllCtrl,
    required this.padLeftCtrl,
    required this.padTopCtrl,
    required this.padRightCtrl,
    required this.padBottomCtrl,
    required this.onModeChanged,
    required this.onPresetSelected,
    required this.onChanged,
    this.presets = const [0, 16, 24, 48],
    super.key,
  });

  final bool uniform;
  final TextEditingController padAllCtrl;
  final TextEditingController padLeftCtrl;
  final TextEditingController padTopCtrl;
  final TextEditingController padRightCtrl;
  final TextEditingController padBottomCtrl;
  final ValueChanged<bool> onModeChanged;
  final ValueChanged<double> onPresetSelected;
  final VoidCallback onChanged;
  final List<double> presets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Padding', style: theme.textTheme.labelLarge),
            const Spacer(),
            SizedBox(
              height: 28,
              child: ToggleButtons(
                isSelected: [uniform, !uniform],
                onPressed: (idx) => onModeChanged(idx == 0),
                borderRadius: BorderRadius.circular(8),
                constraints: const BoxConstraints(minWidth: 60),
                children: const [
                  Text('Uniform', style: TextStyle(fontSize: 12)),
                  Text('Sides', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (uniform)
          TextField(
            controller: padAllCtrl,
            decoration: const InputDecoration(
              labelText: 'All Sides (px)',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            keyboardType: TextInputType.number,
            onChanged: (_) => onChanged(),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          )
        else
          Row(
            children: [
              Expanded(
                child: _PaddingCompactInput(
                  controller: padLeftCtrl,
                  label: 'L',
                  onChanged: onChanged,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _PaddingCompactInput(
                  controller: padTopCtrl,
                  label: 'T',
                  onChanged: onChanged,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _PaddingCompactInput(
                  controller: padRightCtrl,
                  label: 'R',
                  onChanged: onChanged,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _PaddingCompactInput(
                  controller: padBottomCtrl,
                  label: 'B',
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: presets.map((p) {
            return ActionChip(
              label: Text('${p.toInt()}px'),
              onPressed: () => onPresetSelected(p),
              visualDensity: VisualDensity.compact,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _PaddingCompactInput extends StatelessWidget {
  const _PaddingCompactInput({
    required this.controller,
    required this.onChanged,
    this.label,
  });

  final TextEditingController controller;
  final VoidCallback onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      onChanged: (_) => onChanged(),
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        border: const OutlineInputBorder(),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]'))],
    );
  }
}
