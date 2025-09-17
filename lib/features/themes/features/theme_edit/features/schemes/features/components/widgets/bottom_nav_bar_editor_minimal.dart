import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

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

  BottomNavigationBarWidgetConfig _with({
    String? bg,
    String? selected,
    String? unselected,
  }) {
    return value.copyWith(
      backgroundColor: bg ?? value.backgroundColor,
      selectedItemColor: selected ?? value.selectedItemColor,
      unSelectedItemColor: unselected ?? value.unSelectedItemColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg = value.backgroundColor?.toColor();
    final sel = value.selectedItemColor?.toColor();
    final unsel = value.unSelectedItemColor?.toColor();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) Padding(padding: const EdgeInsets.only(bottom: 8), child: description),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ColorField(
              title: 'Background color',
              constraints: boxConstraints,
              color: bg,
              onTap: (_) => context.selectColor(
                initialColor: bg,
                onColorSelected: (c) => onChanged(_with(bg: c.toHex())),
              ),
            ),
            ColorField(
              title: 'Selected color',
              constraints: boxConstraints,
              color: sel,
              onTap: (_) => context.selectColor(
                initialColor: sel,
                onColorSelected: (c) => onChanged(_with(selected: c.toHex())),
              ),
            ),
            ColorField(
              title: 'Unselected color',
              constraints: boxConstraints,
              color: unsel,
              onTap: (_) => context.selectColor(
                initialColor: unsel,
                onColorSelected: (c) => onChanged(_with(unselected: c.toHex())),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
