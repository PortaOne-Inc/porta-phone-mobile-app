import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputControl extends StatefulWidget {
  const NumberInputControl({
    required this.label,
    required this.value,
    required this.onChanged,
    this.tooltip,
    this.suffixText,
    super.key,
  });

  final String label;
  final double? value;
  final ValueChanged<double?> onChanged;
  final String? tooltip;
  final String? suffixText;

  @override
  State<NumberInputControl> createState() => _NumberInputControlState();
}

class _NumberInputControlState extends State<NumberInputControl> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString() ?? '');
  }

  @override
  void didUpdateWidget(covariant NumberInputControl oldWidget) {
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
    final tooltip = widget.tooltip;

    final field = TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.label,
        isDense: true,
        border: const OutlineInputBorder(),
        suffixText: widget.suffixText,
        suffixIcon: tooltip != null
            ? const Icon(Icons.info_outline, size: 14)
            : null,
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]'))],
      onChanged: _handleChanged,
    );

    if (tooltip == null || tooltip.isEmpty) {
      return field;
    }

    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 500),
      child: field,
    );
  }

  void _handleChanged(String v) {
    if (v.isEmpty) {
      widget.onChanged(null);
      return;
    }
    final parsed = double.tryParse(v.replaceAll(',', '.'));
    if (parsed != null) {
      widget.onChanged(parsed);
    }
  }
}
