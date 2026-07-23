import 'package:flutter/material.dart';

import 'package:webtrit_configurator/widgets/widgets.dart';

import 'countdown_field.dart';

/// Generic section for verification countdown configuration.
/// Works for both OTP Sign-in and Signup flows.
class VerifyCountdownSection extends StatelessWidget {
  const VerifyCountdownSection({
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
    super.key,
    this.minSeconds = 0,
    this.maxSeconds = 120,
  });

  final String title;
  final String description;
  final int value;
  final ValueChanged<int> onChanged;
  final int minSeconds;
  final int maxSeconds;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: title,
      descriptionWidget: DescriptionRow.info(description),
      padding: const EdgeInsets.all(16),
      child: CountdownField(
        value: value,
        min: minSeconds,
        max: maxSeconds,
        onChanged: onChanged,
      ),
    );
  }
}
