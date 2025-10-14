import 'package:flutter/material.dart';

class RecentsFields extends StatelessWidget {
  const RecentsFields({
    required this.useCdrs,
    required this.onUseCdrsChanged,
    super.key,
  });

  final bool useCdrs;
  final ValueChanged<bool> onUseCdrsChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Use CDRs (remote call history)'),
      value: useCdrs,
      onChanged: onUseCdrsChanged,
    );
  }
}
