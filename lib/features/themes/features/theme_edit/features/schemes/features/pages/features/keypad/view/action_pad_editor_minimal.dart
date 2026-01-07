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
        ElevatedButtonConfigEditor(
          title: 'Call Start Button',
          value: value.callStart,
          onChanged: (v) => onChanged(value.copyWith(callStart: v)),
        ),
        const SizedBox(height: 16),
        ElevatedButtonConfigEditor(
          title: 'Call Transfer Button',
          value: value.callTransfer,
          onChanged: (v) => onChanged(value.copyWith(callTransfer: v)),
        ),
        const SizedBox(height: 16),
        ElevatedButtonConfigEditor(
          title: 'Backspace Pressed State',
          value: value.backspacePressed,
          onChanged: (v) => onChanged(value.copyWith(backspacePressed: v)),
        ),
      ],
    );
  }
}
