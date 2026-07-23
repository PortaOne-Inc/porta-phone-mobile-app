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

  Future<void> _pickColor(BuildContext context, String? currentHex, ValueChanged<String> onApply) async {
    final newColor = await context.showColorPicker(currentColor: currentHex?.tryParseColor());
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) Padding(padding: const EdgeInsets.only(bottom: 12), child: description),
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
        const Divider(height: 32),
        // Surface overrides layered on top of the global dialog theme; leave empty
        // to inherit it.
        ColorInput(
          label: 'Background color',
          color: value.backgroundColor?.tryParseColor(),
          onTap: () =>
              _pickColor(context, value.backgroundColor, (hex) => onChanged(value.copyWith(backgroundColor: hex))),
          onClear: () => onChanged(value.copyWith(backgroundColor: null)),
        ),
        const SizedBox(height: 12),
        ColorInput(
          label: 'Surface tint color',
          color: value.surfaceTintColor?.tryParseColor(),
          onTap: () =>
              _pickColor(context, value.surfaceTintColor, (hex) => onChanged(value.copyWith(surfaceTintColor: hex))),
          onClear: () => onChanged(value.copyWith(surfaceTintColor: null)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: NumberInputControl(
                label: 'Elevation',
                value: value.elevation,
                onChanged: (v) => onChanged(value.copyWith(elevation: v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumberInputControl(
                label: 'Corner radius',
                value: value.borderRadius,
                onChanged: (v) => onChanged(value.copyWith(borderRadius: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextStyleConfigEditor(
          label: 'Title text style',
          value: value.titleTextStyle,
          onChanged: (s) => onChanged(value.copyWith(titleTextStyle: s)),
          onClear: () => onChanged(value.copyWith(titleTextStyle: null)),
        ),
        const SizedBox(height: 16),
        TextStyleConfigEditor(
          label: 'Content text style',
          value: value.contentTextStyle,
          onChanged: (s) => onChanged(value.copyWith(contentTextStyle: s)),
          onClear: () => onChanged(value.copyWith(contentTextStyle: null)),
        ),
      ],
    );
  }
}
