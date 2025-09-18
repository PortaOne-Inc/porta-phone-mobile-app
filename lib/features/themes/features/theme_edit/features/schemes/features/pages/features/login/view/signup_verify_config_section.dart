import 'package:flutter/material.dart';

import 'package:webtrit_appearance_theme/webtrit_appearance_theme.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../widgets/widgets.dart';

class SignupVerifyConfigSection extends StatelessWidget {
  const SignupVerifyConfigSection({
    required this.config,
    required this.onCountdownChanged,
    super.key,
    this.minSeconds = 0,
    this.maxSeconds = 120,
  });

  final LoginSignupVerifyScreenPageConfig config;
  final ValueChanged<int> onCountdownChanged;
  final int minSeconds;
  final int maxSeconds;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: 'Sign-up Verify',
      descriptionWidget: DescriptionRow.info(
        'Controls countdown before the "Repeat" button becomes active again on sign-up verification screen. 0 = disabled.',
      ),
      padding: const EdgeInsets.all(16),
      child: CountdownField(
        value: config.countdownRepeatIntervalSeconds,
        min: minSeconds,
        max: maxSeconds,
        onChanged: onCountdownChanged,
      ),
    );
  }
}
