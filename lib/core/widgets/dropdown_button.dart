import 'package:flutter/material.dart';

class DropdownButtonExt<T> extends StatelessWidget {
  const DropdownButtonExt({
    required this.label,
    required this.options,
    required this.optionBuilder,
    this.onChanged,
    this.value,
    this.constraints,
    this.padding = const EdgeInsets.only(bottom: 16),
    super.key,
  });

  final String label;
  final T? value;
  final List<T> options;
  final ValueChanged<T?>? onChanged;
  final String Function(T) optionBuilder;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ConstrainedBox(
        constraints: constraints ?? const BoxConstraints(),
        child: DropdownButtonFormField<T>(
          isExpanded: true,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          initialValue: value,
          items: options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(optionBuilder(option)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
