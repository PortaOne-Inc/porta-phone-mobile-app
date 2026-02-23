import 'package:flutter/material.dart';

class DropdownRow<T> extends StatelessWidget {
  const DropdownRow({
    required this.label,
    required this.value,
    required this.items,
    required this.itemLabelBuilder,
    required this.onChanged,
    super.key,
  });

  final String label;
  final T value;
  final List<T> items;
  final String Function(T) itemLabelBuilder;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        FocusScope(
          canRequestFocus: false,
          child: DropdownButton<T>(
            value: value,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            items: items
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    child: Text(itemLabelBuilder(item)),
                  ),
                )
                .toList(),
            focusColor: Colors.transparent,
            underline: Container(),
          ),
        ),
      ],
    );
  }
}
