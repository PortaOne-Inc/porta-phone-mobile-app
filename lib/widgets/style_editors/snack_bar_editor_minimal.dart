import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class SnackBarEditorMinimal extends StatelessWidget {
  const SnackBarEditorMinimal({
    required this.value,
    required this.onChanged,
    this.boxConstraints = const BoxConstraints(minWidth: 140, minHeight: 60),
    this.description,
    super.key,
  });

  final SnackBarWidgetConfig value;
  final ValueChanged<SnackBarWidgetConfig> onChanged;
  final BoxConstraints boxConstraints;
  final Widget? description;

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
              title: 'Success Background',
              constraints: boxConstraints,
              color: value.successBackgroundColor.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.successBackgroundColor.toColor(),
                (hex) => onChanged(value.copyWith(successBackgroundColor: hex)),
              ),
            ),
            ColorField(
              title: 'Error Background',
              constraints: boxConstraints,
              color: value.errorBackgroundColor.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.errorBackgroundColor.toColor(),
                (hex) => onChanged(value.copyWith(errorBackgroundColor: hex)),
              ),
            ),
            ColorField(
              title: 'Info Background',
              constraints: boxConstraints,
              color: value.infoBackgroundColor.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.infoBackgroundColor.toColor(),
                (hex) => onChanged(value.copyWith(infoBackgroundColor: hex)),
              ),
            ),
            ColorField(
              title: 'Warning Background',
              constraints: boxConstraints,
              color: value.warningBackgroundColor.toColor(),
              onTap: (_) => _pickColor(
                context,
                value.warningBackgroundColor.toColor(),
                (hex) => onChanged(value.copyWith(warningBackgroundColor: hex)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
