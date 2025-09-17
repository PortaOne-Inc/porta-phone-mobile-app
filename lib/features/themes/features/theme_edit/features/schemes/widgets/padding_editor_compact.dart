import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

class PaddingEditorCompact extends StatelessWidget {
  const PaddingEditorCompact({
    required this.leftCtrl,
    required this.topCtrl,
    required this.rightCtrl,
    required this.bottomCtrl,
    required this.onChanged,
    super.key,
  });

  final TextEditingController leftCtrl;
  final TextEditingController topCtrl;
  final TextEditingController rightCtrl;
  final TextEditingController bottomCtrl;

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        OutlineInput.number(label: 'Padding left', controller: leftCtrl, onChanged: (_) => onChanged()),
        OutlineInput.number(label: 'Padding top', controller: topCtrl, onChanged: (_) => onChanged()),
        OutlineInput.number(label: 'Padding right', controller: rightCtrl, onChanged: (_) => onChanged()),
        OutlineInput.number(label: 'Padding bottom', controller: bottomCtrl, onChanged: (_) => onChanged()),
      ],
    );
  }
}
