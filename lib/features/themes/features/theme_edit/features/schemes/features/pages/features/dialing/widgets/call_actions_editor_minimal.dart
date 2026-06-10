import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// Edits all actions inside CallPageActionsConfig using ButtonStyleEditorMinimal.
/// No hardcoded defaults — you set exactly what you want per action.
class CallActionsEditorMinimal extends StatelessWidget {
  const CallActionsEditorMinimal({required this.value, required this.onChanged, super.key});

  final CallPageActionsConfig value;
  final ValueChanged<CallPageActionsConfig> onChanged;

  ElevatedButtonWidgetConfig _btnOrNew(ElevatedButtonWidgetConfig? b) => b ?? const ElevatedButtonWidgetConfig();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _section(
          title: 'Call start',
          child: ElevatedButtonConfigEditor(
            title: 'Call start',
            value: value.callStart,
            onChanged: (v) => onChanged(value.copyWith(callStart: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Hangup',
          child: ElevatedButtonConfigEditor(
            title: 'Hangup',
            value: value.hangup,
            onChanged: (v) => onChanged(value.copyWith(hangup: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Transfer',
          child: ElevatedButtonConfigEditor(
            title: 'Transfer',
            value: value.transfer,
            onChanged: (v) => onChanged(value.copyWith(transfer: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Camera',
          child: ElevatedButtonConfigEditor(
            title: 'Camera',
            value: value.camera,
            onChanged: (v) => onChanged(value.copyWith(camera: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Muted',
          child: ElevatedButtonConfigEditor(
            title: 'Muted',
            value: value.muted,
            onChanged: (v) => onChanged(value.copyWith(muted: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Speaker',
          child: ElevatedButtonConfigEditor(
            title: 'Speaker',
            value: value.speaker,
            onChanged: (v) => onChanged(value.copyWith(speaker: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Held',
          child: ElevatedButtonConfigEditor(
            title: 'Held',
            value: value.held,
            onChanged: (v) => onChanged(value.copyWith(held: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Swap',
          child: ElevatedButtonConfigEditor(
            title: 'Swap',
            value: value.swap,
            onChanged: (v) => onChanged(value.copyWith(swap: _btnOrNew(v))),
          ),
        ),
        const SizedBox(height: 12),
        _section(
          title: 'Key',
          child: ElevatedButtonConfigEditor(
            title: 'Key',
            value: value.key,
            onChanged: (v) => onChanged(value.copyWith(key: _btnOrNew(v))),
          ),
        ),
      ],
    );
  }

  Widget _section({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
