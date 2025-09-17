import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class ActionPadEditorMinimal extends StatelessWidget {
  const ActionPadEditorMinimal({
    required this.value, required this.onChanged, super.key,
  });

  final ActionPadWidgetConfig value;
  final ValueChanged<ActionPadWidgetConfig> onChanged;

  ElevatedButtonWidgetConfig _btnOrNew(ElevatedButtonWidgetConfig? b) => b ?? const ElevatedButtonWidgetConfig();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ColorField(
          title: 'Call start (bg)',
          color: value.callStart.backgroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
          onTap: (_) => context.selectColor(
            initialColor: value.callStart.backgroundColor?.toColor(),
            onColorSelected: (c) => onChanged(
              value.copyWith(callStart: _btnOrNew(value.callStart).copyWith(backgroundColor: c.toHex())),
            ),
          ),
        ),
        ColorField(
          title: 'Transfer (bg)',
          color: value.callTransfer.backgroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
          onTap: (_) => context.selectColor(
            initialColor: value.callTransfer.backgroundColor?.toColor(),
            onColorSelected: (c) => onChanged(
              value.copyWith(callTransfer: _btnOrNew(value.callTransfer).copyWith(backgroundColor: c.toHex())),
            ),
          ),
        ),
        ColorField(
          title: 'Backspace pressed (bg)',
          color: value.backspacePressed.backgroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 200, minHeight: 60),
          onTap: (_) => context.selectColor(
            initialColor: value.backspacePressed.backgroundColor?.toColor(),
            onColorSelected: (c) => onChanged(
              value.copyWith(backspacePressed: _btnOrNew(value.backspacePressed).copyWith(backgroundColor: c.toHex())),
            ),
          ),
        ),
      ],
    );
  }
}
