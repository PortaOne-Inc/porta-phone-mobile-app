import 'package:flutter/material.dart';

class InputPadding extends StatelessWidget {
  final Function(double) onChange;

  const InputPadding({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: TextField(
        maxLength: 999,
        decoration: const InputDecoration(hintText: 'Padding'),
        onChanged: (value) {
          final padding = value.isEmpty ? 0.0 : double.tryParse(value);
          if (padding != null) {
            onChange(padding);
          }
        },
      ),
    );
  }
}
