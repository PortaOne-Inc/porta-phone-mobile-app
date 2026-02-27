import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class PasswordSigninTab extends StatelessWidget {
  const PasswordSigninTab({required this.config, super.key});

  final LoginPageConfig config;

  @override
  Widget build(BuildContext context) {
    final currentConfig = context.select(
      (UpdateThemCubit cubit) =>
          cubit.state.themePageConfig.login.passwordSignin,
    );
    final cubit = context.read<UpdateThemCubit>();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Reference Text Field',
          descriptionWidget: DescriptionRow.info(
            'Styling for the reference input field on the password sign-in screen.',
          ),
          padding: const EdgeInsets.all(16),
          child: TextFieldConfigEditorMinimal(
            value: currentConfig.refTextField ?? const TextFieldConfig(),
            onChanged: (v) => cubit.add(
              ThemePageEvent.setLoginPasswordSignin(
                currentConfig.copyWith(refTextField: v),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Password Text Field',
          descriptionWidget: DescriptionRow.info(
            'Styling for the password input field on the password sign-in screen.',
          ),
          padding: const EdgeInsets.all(16),
          child: TextFieldConfigEditorMinimal(
            value: currentConfig.passwordTextField ?? const TextFieldConfig(),
            onChanged: (v) => cubit.add(
              ThemePageEvent.setLoginPasswordSignin(
                currentConfig.copyWith(passwordTextField: v),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
