import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../bloc/update_theme_cubit.dart';
import '../widgets/verify_countdown_section.dart';

class SignupVerifyTab extends StatelessWidget {
  const SignupVerifyTab({required this.config, super.key});

  final LoginPageConfig config;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        VerifyCountdownSection(
          title: 'Sign-up Verify',
          description:
              'Controls countdown before the "Repeat" button becomes active again on sign-up verification screen. 0 = disabled.',
          value: config.signupVerify.countdownRepeatIntervalSeconds,
          onChanged: (seconds) => context.read<UpdateThemCubit>().add(
            ThemePageEvent.setLoginSignupVerifyCountdown(seconds),
          ),
        ),
      ],
    );
  }
}
