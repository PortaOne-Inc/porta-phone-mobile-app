import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class OtpSigninTab extends StatelessWidget {
  const OtpSigninTab({required this.config, super.key});

  final LoginPageConfig config;

  @override
  Widget build(BuildContext context) {
    final currentConfig = context.select(
      (UpdateThemCubit cubit) => cubit.state.themePageConfig.login.otpSignin,
    );
    final cubit = context.read<UpdateThemCubit>();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Reference Text Field',
          descriptionWidget: DescriptionRow.info(
            'Styling for the reference input field on the OTP sign-in screen.',
          ),
          padding: const EdgeInsets.all(16),
          child: TextFieldConfigEditorMinimal(
            value: currentConfig.refTextField ?? const TextFieldConfig(),
            onChanged: (v) => cubit.add(
              ThemePageEvent.setLoginOtpSignin(
                currentConfig.copyWith(refTextField: v),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
