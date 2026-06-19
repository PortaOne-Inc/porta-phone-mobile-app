import 'package:flutter/material.dart';

class RecentsFields extends StatelessWidget {
  const RecentsFields({
    required this.supportsCallHistory,
    required this.onSupportsCallHistoryChanged,
    super.key,
  });

  final bool supportsCallHistory;
  final ValueChanged<bool> onSupportsCallHistoryChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Use CDRs (remote call history)'),
      value: supportsCallHistory,
      onChanged: onSupportsCallHistoryChanged,
    );
  }
}
