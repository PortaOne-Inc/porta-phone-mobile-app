import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/core/core.dart';

class TextStyleEditorCompact extends StatefulWidget {
  const TextStyleEditorCompact({
    required this.title,
    required this.initialColor,
    required this.onColor,
    required this.familyInit,
    required this.onFamily,
    required this.sizeInit,
    required this.onSize,
    required this.weightInit,
    required this.onWeight,
    super.key,
  });

  final String title;
  final Color? initialColor;
  final void Function(Color? c) onColor;

  final String familyInit;
  final void Function(String) onFamily;

  final String sizeInit;
  final void Function(String) onSize;

  final String weightInit;
  final void Function(String) onWeight;

  @override
  State<TextStyleEditorCompact> createState() => _TextStyleEditorCompactState();
}

class _TextStyleEditorCompactState extends State<TextStyleEditorCompact> {
  late final TextEditingController _familyCtrl;
  late final TextEditingController _sizeCtrl;
  late final TextEditingController _weightCtrl;

  @override
  void initState() {
    _familyCtrl = TextEditingController(text: widget.familyInit);
    _sizeCtrl = TextEditingController(text: widget.sizeInit);
    _weightCtrl = TextEditingController(text: widget.weightInit);
    super.initState();
  }

  @override
  void dispose() {
    _familyCtrl.dispose();
    _sizeCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: widget.title,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: OutlineInput(
                  label: 'Font family',
                  controller: _familyCtrl,
                  onChanged: widget.onFamily,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ColorField(
                  title: 'Color',
                  color: widget.initialColor,
                  constraints: const BoxConstraints(minWidth: 160, minHeight: 40, maxHeight: 48),
                  onTap: (_) => context.selectColor(
                    initialColor: widget.initialColor,
                    onColorSelected: widget.onColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlineInput(
                  label: 'Font size',
                  controller: _sizeCtrl,
                  onChanged: widget.onSize,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlineInput(
                  label: 'Font weight (e.g. 700)',
                  controller: _weightCtrl,
                  onChanged: widget.onWeight,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
