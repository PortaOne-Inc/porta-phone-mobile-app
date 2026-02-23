import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/exports/exports.dart';

import 'text_style_config_editor.dart';

class KeypadStyleEditorMinimal extends StatelessWidget {
  const KeypadStyleEditorMinimal({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final KeypadStyleConfig value;
  final ValueChanged<KeypadStyleConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleConfigEditor(
          label: 'Digit Typography',
          value: value.textStyle ?? const TextStyleConfig(),
          onChanged: (newStyle) =>
              onChanged(value.copyWith(textStyle: newStyle)),
        ),
        const SizedBox(height: 16),
        TextStyleConfigEditor(
          label: 'Subtext Typography',
          value: value.subtextStyle ?? const TextStyleConfig(),
          onChanged: (newStyle) =>
              onChanged(value.copyWith(subtextStyle: newStyle)),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text('Layout', style: theme.textTheme.titleSmall),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: _LayoutNumberInput(
                    label: 'Spacing',
                    suffix: 'dp',
                    value: value.spacing,
                    onChanged: (v) => onChanged(value.copyWith(spacing: v)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _LayoutNumberInput(
                    label: 'Padding',
                    suffix: 'dp',
                    value: value.padding,
                    onChanged: (v) => onChanged(value.copyWith(padding: v)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LayoutNumberInput extends StatefulWidget {
  const _LayoutNumberInput({
    required this.label,
    required this.value,
    required this.onChanged,
    this.suffix,
  });

  final String label;
  final String? suffix;
  final double? value;
  final ValueChanged<double?> onChanged;

  @override
  State<_LayoutNumberInput> createState() => _LayoutNumberInputState();
}

class _LayoutNumberInputState extends State<_LayoutNumberInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString() ?? '');
  }

  @override
  void didUpdateWidget(covariant _LayoutNumberInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      final text = _controller.text;
      final parsed = double.tryParse(text);
      if (parsed != widget.value) {
        final newText = widget.value?.toString() ?? '';
        _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixText: widget.suffix,
        isDense: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]'))],
      onChanged: (v) {
        if (v.isEmpty) {
          widget.onChanged(null);
          return;
        }
        final parsed = double.tryParse(v.replaceAll(',', '.'));
        if (parsed != null) {
          widget.onChanged(parsed);
        }
      },
    );
  }
}
