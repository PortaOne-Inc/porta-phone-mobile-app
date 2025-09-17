import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import '_common/_common.dart';

class KeypadStyleEditorMinimal extends StatefulWidget {
  const KeypadStyleEditorMinimal({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final KeypadStyleConfig value;
  final ValueChanged<KeypadStyleConfig> onChanged;

  @override
  State<KeypadStyleEditorMinimal> createState() => _KeypadStyleEditorMinimalState();
}

class _KeypadStyleEditorMinimalState extends State<KeypadStyleEditorMinimal> {
  TextStyleConfig _tsOrNew(TextStyleConfig? s) => s ?? const TextStyleConfig();

  late final TextEditingController _spacingCtrl;
  late final TextEditingController _paddingCtrl;

  @override
  void initState() {
    _spacingCtrl = TextEditingController(text: (widget.value.spacing ?? '').toString());
    _paddingCtrl = TextEditingController(text: (widget.value.padding ?? '').toString());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant KeypadStyleEditorMinimal oldWidget) {
    if (oldWidget.value.spacing != widget.value.spacing) {
      _spacingCtrl.text = (widget.value.spacing ?? '').toString();
    }
    if (oldWidget.value.padding != widget.value.padding) {
      _paddingCtrl.text = (widget.value.padding ?? '').toString();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _spacingCtrl.dispose();
    _paddingCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final digit = widget.value.textStyle ?? const TextStyleConfig();
    final sub = widget.value.subtextStyle ?? const TextStyleConfig();

    void setDigit(TextStyleConfig s) => widget.onChanged(widget.value.copyWith(textStyle: s));
    void setSub(TextStyleConfig s) => widget.onChanged(widget.value.copyWith(subtextStyle: s));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleEditorCompact(
          title: 'Digit text',
          initialColor: digit.color?.toColor(),
          onColor: (c) => setDigit(_tsOrNew(digit).copyWith(color: c?.toHex())),
          familyInit: digit.fontFamily ?? '',
          onFamily: (v) => setDigit(_tsOrNew(digit).copyWith(fontFamily: v.isEmpty ? null : v)),
          sizeInit: (digit.fontSize ?? '').toString(),
          onSize: (v) => setDigit(_tsOrNew(digit).copyWith(fontSize: double.tryParse(v))),
          weightInit: (digit.fontWeight?.weight ?? '').toString(),
          onWeight: (v) {
            final w = int.tryParse(v);
            setDigit(_tsOrNew(digit).copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w)));
          },
        ),
        const SizedBox(height: 12),
        TextStyleEditorCompact(
          title: 'Subtext',
          initialColor: sub.color?.toColor(),
          onColor: (c) => setSub(_tsOrNew(sub).copyWith(color: c?.toHex())),
          familyInit: sub.fontFamily ?? '',
          onFamily: (v) => setSub(_tsOrNew(sub).copyWith(fontFamily: v.isEmpty ? null : v)),
          sizeInit: (sub.fontSize ?? '').toString(),
          onSize: (v) => setSub(_tsOrNew(sub).copyWith(fontSize: double.tryParse(v))),
          weightInit: (sub.fontWeight?.weight ?? '').toString(),
          onWeight: (v) {
            final w = int.tryParse(v);
            setSub(_tsOrNew(sub).copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w)));
          },
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            OutlineInput(
              label: 'Spacing (dp)',
              controller: _spacingCtrl,
              onChanged: (v) => widget.onChanged(widget.value.copyWith(spacing: double.tryParse(v))),
            ),
            OutlineInput(
              label: 'Padding (dp)',
              controller: _paddingCtrl,
              onChanged: (v) => widget.onChanged(widget.value.copyWith(padding: double.tryParse(v))),
            ),
          ],
        ),
      ],
    );
  }
}
