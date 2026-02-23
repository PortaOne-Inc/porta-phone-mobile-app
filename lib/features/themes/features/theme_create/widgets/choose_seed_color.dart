import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class ChooseSeedColor extends StatelessWidget {
  const ChooseSeedColor({
    required this.onCancel,
    required this.onApply,
    super.key,
  });

  final void Function() onCancel;
  final void Function(Color color) onApply;

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;

    return Card(
      elevation: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Choose type of color scheme generation',
                    style: textScheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          ColorPicker(onDeclineColor: onCancel, onAcceptColor: onApply),
        ],
      ),
    );
  }
}
