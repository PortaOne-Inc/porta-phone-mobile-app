import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

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

  Future<void> _pickColor(
    BuildContext context,
    String? currentHex,
    ValueChanged<String> onApply,
  ) async {
    final newColor = await context.showColorPicker(
      currentColor: currentHex?.tryParseColor(),
    );
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: description,
          ),
        ColorInput(
          label: 'Active button color 1',
          color: value.activeButtonColor1?.tryParseColor(),
          onTap: () => _pickColor(
            context,
            value.activeButtonColor1,
            (hex) => onChanged(value.copyWith(activeButtonColor1: hex)),
          ),
          onClear: () => onChanged(value.copyWith(activeButtonColor1: null)),
        ),
        const SizedBox(height: 12),
        ColorInput(
          label: 'Active button color 2',
          color: value.activeButtonColor2?.tryParseColor(),
          onTap: () => _pickColor(
            context,
            value.activeButtonColor2,
            (hex) => onChanged(value.copyWith(activeButtonColor2: hex)),
          ),
          onClear: () => onChanged(value.copyWith(activeButtonColor2: null)),
        ),
        const SizedBox(height: 12),
        ColorInput(
          label: 'Default button color',
          color: value.defaultButtonColor?.tryParseColor(),
          onTap: () => _pickColor(
            context,
            value.defaultButtonColor,
            (hex) => onChanged(value.copyWith(defaultButtonColor: hex)),
          ),
          onClear: () => onChanged(value.copyWith(defaultButtonColor: null)),
        ),
      ],
    );
  }
}
