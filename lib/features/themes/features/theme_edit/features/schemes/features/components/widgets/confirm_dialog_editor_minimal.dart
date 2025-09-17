import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class ConfirmDialogEditorMinimal extends StatelessWidget {
  const ConfirmDialogEditorMinimal({
    required this.value,
    required this.onChanged,
    this.boxConstraints = const BoxConstraints(minWidth: 140, minHeight: 60),
    this.description,
    super.key,
  });

  final ConfirmDialogWidgetConfig value;
  final ValueChanged<ConfirmDialogWidgetConfig> onChanged;
  final BoxConstraints boxConstraints;
  final Widget? description;

  void _patch({String? c1, String? c2, String? def}) {
    onChanged(
      value.copyWith(
        activeButtonColor1: c1 ?? value.activeButtonColor1,
        activeButtonColor2: c2 ?? value.activeButtonColor2,
        defaultButtonColor: def ?? value.defaultButtonColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final active1 = value.activeButtonColor1?.toColor();
    final active2 = value.activeButtonColor2?.toColor();
    final def = value.defaultButtonColor?.toColor();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Padding(padding: const EdgeInsets.only(bottom: 8), child: description),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ColorField(
              title: 'Active button color 1',
              constraints: boxConstraints,
              color: active1,
              onTap: (_) => context.selectColor(
                initialColor: active1,
                onColorSelected: (c) => _patch(c1: c.toHex()),
              ),
            ),
            ColorField(
              title: 'Active button color 2',
              constraints: boxConstraints,
              color: active2,
              onTap: (_) => context.selectColor(
                initialColor: active2,
                onColorSelected: (c) => _patch(c2: c.toHex()),
              ),
            ),
            ColorField(
              title: 'Default button color',
              constraints: boxConstraints,
              color: def,
              onTap: (_) => context.selectColor(
                initialColor: def,
                onColorSelected: (c) => _patch(def: c.toHex()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
