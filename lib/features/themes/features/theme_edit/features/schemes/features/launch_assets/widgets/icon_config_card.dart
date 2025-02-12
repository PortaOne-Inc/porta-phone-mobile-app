import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class SplashIconConfigCard extends StatelessWidget {
  const SplashIconConfigCard({
    required this.value,
    required this.onChanged,
    required this.controller,
    super.key,
  });

  final BoxFit value;
  final ValueChanged<BoxFit?> onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonExt<BoxFit>(
              label: 'Splash Icon Fit',
              options: BoxFit.values,
              constraints: const BoxConstraints.tightFor(width: 200),
              value: value,
              onChanged: onChanged,
              optionBuilder: (fit) => fit.name,
            ),
            OutlineInput(
              constraints: const BoxConstraints.tightFor(width: 200),
              controller: controller,
              label: 'Padding',
              icon: Icons.padding,
            ),
          ],
        ),
      ),
    );
  }
}
