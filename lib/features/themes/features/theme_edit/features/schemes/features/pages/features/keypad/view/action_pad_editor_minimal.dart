import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class ActionPadEditorMinimal extends StatelessWidget {
  const ActionPadEditorMinimal({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final ActionPadWidgetConfig value;
  final ValueChanged<ActionPadWidgetConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonStyleConfigEditor(
          label: 'Call Start Button',
          value: value.callStart,
          onChanged: (v) => onChanged(value.copyWith(callStart: v)),
          onClear: () =>
              onChanged(value.copyWith(callStart: const ButtonStyleConfig())),
        ),
        const SizedBox(height: 24),
        ButtonStyleConfigEditor(
          label: 'Call Transfer Button',
          value: value.callTransfer,
          onChanged: (v) => onChanged(value.copyWith(callTransfer: v)),
          onClear: () => onChanged(
            value.copyWith(callTransfer: const ButtonStyleConfig()),
          ),
        ),
        const SizedBox(height: 24),
        ButtonStyleConfigEditor(
          label: 'Backspace Pressed State',
          value: value.backspacePressed,
          onChanged: (v) => onChanged(value.copyWith(backspacePressed: v)),
          onClear: () => onChanged(
            value.copyWith(backspacePressed: const ButtonStyleConfig()),
          ),
        ),
      ],
    );
  }
}
