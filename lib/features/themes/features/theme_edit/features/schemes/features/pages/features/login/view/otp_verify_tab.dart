import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../bloc/update_theme_cubit.dart';
import '../widgets/verify_countdown_section.dart';

class OtpVerifyTab extends StatelessWidget {
  const OtpVerifyTab({required this.config, super.key});

  final LoginPageConfig config;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        VerifyCountdownSection(
          title: 'OTP Sign-in Verify',
          description:
              'Controls countdown before the "Repeat" button becomes active again on OTP sign-in verification screen. 0 = disabled.',
          value: config.otpSigninVerify.countdownRepeatIntervalSeconds,
          onChanged: (seconds) => context.read<UpdateThemCubit>().add(
            ThemePageEvent.setLoginOtpSigninVerifyCountdown(seconds),
          ),
        ),
      ],
    );
  }
}
