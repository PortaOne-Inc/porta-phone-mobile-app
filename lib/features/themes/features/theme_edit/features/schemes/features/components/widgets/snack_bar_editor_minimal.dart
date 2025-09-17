import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

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

  SnackBarWidgetConfig _with({
    String? success,
    String? error,
    String? info,
    String? warning,
  }) {
    return value.copyWith(
      successBackgroundColor: success ?? value.successBackgroundColor,
      errorBackgroundColor: error ?? value.errorBackgroundColor,
      infoBackgroundColor: info ?? value.infoBackgroundColor,
      warningBackgroundColor: warning ?? value.warningBackgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final success = value.successBackgroundColor.toColor();
    final error = value.errorBackgroundColor.toColor();
    final info = value.infoBackgroundColor.toColor();
    final warning = value.warningBackgroundColor.toColor();

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
              title: 'Success background color',
              constraints: boxConstraints,
              color: success,
              onTap: (_) => context.selectColor(
                initialColor: success,
                onColorSelected: (c) => onChanged(_with(success: c.toHex())),
              ),
            ),
            ColorField(
              title: 'Error background color',
              constraints: boxConstraints,
              color: error,
              onTap: (_) => context.selectColor(
                initialColor: error,
                onColorSelected: (c) => onChanged(_with(error: c.toHex())),
              ),
            ),
            ColorField(
              title: 'Info background color',
              constraints: boxConstraints,
              color: info,
              onTap: (_) => context.selectColor(
                initialColor: info,
                onColorSelected: (c) => onChanged(_with(info: c.toHex())),
              ),
            ),
            ColorField(
              title: 'Warning background color',
              constraints: boxConstraints,
              color: warning,
              onTap: (_) => context.selectColor(
                initialColor: warning,
                onColorSelected: (c) => onChanged(_with(warning: c.toHex())),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
