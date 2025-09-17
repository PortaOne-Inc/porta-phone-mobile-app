import 'package:flutter/material.dart';

class DropdownLabeled<T> extends StatelessWidget {
  const DropdownLabeled({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
    this.width,
  });

  final String label;
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final dd = DropdownButton<T>(
      isDense: true,
      value: items.contains(value) ? value : items.first,
      items: items.map((e) => DropdownMenuItem<T>(value: e, child: Text('$e'))).toList(),
      onChanged: onChanged,
    );

    return SizedBox(
      width: width ?? 200,
      child: InputDecorator(
        decoration: const InputDecoration(border: OutlineInputBorder()).copyWith(labelText: label),
        child: dd,
      ),
    );
  }
}
