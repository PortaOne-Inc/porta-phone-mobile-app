import 'package:flutter/material.dart';

import '../models/models.dart';

class TabTypeDropdown extends StatelessWidget {
  const TabTypeDropdown({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final BottomMenuTabKind value;
  final ValueChanged<BottomMenuTabKind> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<BottomMenuTabKind>(
      initialValue: value,
      onChanged: (v) => v != null ? onChanged(v) : null,
      decoration: const InputDecoration(
        labelText: 'Bottom menu tab type',
        border: OutlineInputBorder(),
      ),
      items: BottomMenuTabKind.values
          .map((k) => DropdownMenuItem(value: k, child: Text(k.label)))
          .toList(),
    );
  }
}
