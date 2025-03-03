import 'package:flutter/material.dart';

class DropdownButtonExt<T> extends StatelessWidget {
  const DropdownButtonExt({
    required this.label,
    required this.options,
    required this.onChanged,
    required this.optionBuilder,
    this.value,
    this.constraints,
    super.key,
  });

  final String label;
  final T? value;
  final List<T> options;
  final ValueChanged<T?> onChanged;
  final String Function(T) optionBuilder;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(),
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        value: value,
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(optionBuilder(option)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
