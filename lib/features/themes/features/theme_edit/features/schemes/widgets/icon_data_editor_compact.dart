import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/widgets/outline_input.dart';

class IconDataEditorCompact extends StatelessWidget {
  const IconDataEditorCompact({
    required this.codePointCtrl,
    required this.onCodePointChanged,
    required this.fontFamilyCtrl,
    required this.onFontFamilyChanged,
    super.key,
    this.matchTextDirection,
    this.onMatchTextDirection,
  });

  final TextEditingController codePointCtrl;
  final ValueChanged<String> onCodePointChanged;

  final TextEditingController fontFamilyCtrl;
  final ValueChanged<String> onFontFamilyChanged;

  final bool? matchTextDirection;
  final ValueChanged<bool>? onMatchTextDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlineInput.hex(
              label: 'Code point (hex/dec, e.g. 0xe497)',
              controller: codePointCtrl,
              onChanged: onCodePointChanged,
            ),
            OutlineInput(
              label: 'Font family',
              controller: fontFamilyCtrl,
              onChanged: onFontFamilyChanged,
            ),
          ],
        ),
        if (matchTextDirection != null && onMatchTextDirection != null) ...[
          const SizedBox(height: 8),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('Match text direction'),
            value: matchTextDirection!,
            onChanged: onMatchTextDirection,
          ),
        ],
      ],
    );
  }
}
