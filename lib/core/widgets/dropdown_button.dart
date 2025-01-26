import 'package:flutter/material.dart';

class DropdownButtonExt<T> extends StatelessWidget {
  const DropdownButtonExt({
    required this.label,
    required this.options,
    required this.onChanged,
    required this.optionBuilder,
    this.value,
    super.key,
  });

  final String label;
  final T? value;
  final List<T> options;
  final ValueChanged<T?> onChanged;
  final String Function(T) optionBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<T>(
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
