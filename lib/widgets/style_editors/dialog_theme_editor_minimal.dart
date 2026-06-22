import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// Editor for the global [DialogThemeConfig] mapped to `ThemeData.dialogTheme`.
///
/// Drives the baseline appearance of every dialog. Unset fields fall back to a
/// readable color-scheme role in the app, so leaving everything empty already
/// fixes the Material default that resolves the background to `surfaceContainerHigh`.
class DialogThemeEditorMinimal extends StatelessWidget {
  const DialogThemeEditorMinimal({required this.value, required this.onChanged, this.description, super.key});

  final DialogThemeConfig value;
  final ValueChanged<DialogThemeConfig> onChanged;
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
        ColorInput(
          label: 'Shadow color',
          color: value.shadowColor?.tryParseColor(),
          onTap: () => _pickColor(context, value.shadowColor, (hex) => onChanged(value.copyWith(shadowColor: hex))),
          onClear: () => onChanged(value.copyWith(shadowColor: null)),
        ),
        const SizedBox(height: 12),
        ColorInput(
          label: 'Barrier color',
          color: value.barrierColor?.tryParseColor(),
          onTap: () => _pickColor(context, value.barrierColor, (hex) => onChanged(value.copyWith(barrierColor: hex))),
          onClear: () => onChanged(value.copyWith(barrierColor: null)),
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
