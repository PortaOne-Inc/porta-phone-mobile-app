import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/color_field.dart';

class BottomNavBarEditorMinimal extends StatelessWidget {
  const BottomNavBarEditorMinimal({
    required this.value,
    required this.onChanged,
    this.description,
    this.boxConstraints = const BoxConstraints(minWidth: 140, minHeight: 60),
    super.key,
  });

  final BottomNavigationBarWidgetConfig value;
  final ValueChanged<BottomNavigationBarWidgetConfig> onChanged;
  final Widget? description;
  final BoxConstraints boxConstraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: description,
          ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ColorField(
              title: 'Background color',
              constraints: boxConstraints,
              color: value.backgroundColor?.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.backgroundColor?.toColor(),
                (hex) => onChanged(value.copyWith(backgroundColor: hex)),
              ),
            ),
            ColorField(
              title: 'Selected color',
              constraints: boxConstraints,
              color: value.selectedItemColor?.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.selectedItemColor?.toColor(),
                (hex) => onChanged(value.copyWith(selectedItemColor: hex)),
              ),
            ),
            ColorField(
              title: 'Unselected color',
              constraints: boxConstraints,
              color: value.unSelectedItemColor?.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.unSelectedItemColor?.toColor(),
                (hex) => onChanged(value.copyWith(unSelectedItemColor: hex)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onPick,
  ) async {
    final picked = await context.showColorPicker(currentColor: current);
    if (context.mounted && picked != null) {
      onPick(picked.toHex());
    }
  }
}
