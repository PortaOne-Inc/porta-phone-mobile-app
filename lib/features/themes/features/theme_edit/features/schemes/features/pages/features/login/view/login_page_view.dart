import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/schemes/features/pages/features/login/view/signup_verify_config_section.dart';

// Reusable widgets barrel (BorderContainer, DescriptionRow, SystemUiOverlayQuickToggles, ColorField, etc.)
import '../../../../../widgets/widgets.dart';
import 'otp_signin_verify_config_section.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({
    required this.loginPageConfig,
    required this.loginModeSelectScreenStyles,
    super.key,
  });

  final LoginPageConfig loginPageConfig;
  final LoginModeSelectScreenStyles? loginModeSelectScreenStyles;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();
    final modeSelect = loginPageConfig.modeSelect;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          // Images
          BorderContainer(
            title: 'Images',
            descriptionWidget: DescriptionRow.info(
              'Pick or link a logo for the login page.',
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UrlImageField(
                  title: 'Welcome image',
                  resource: Resource.url(loginPageConfig.imageSource?.uri),
                  constraints: BoxConstraints.loose(const Size(200, 200)),
                  onTap: () async => _pickAsset(context, cubit.state.assets),
                ),
                const SizedBox(height: 16),
                ColorField(
                  title: 'Label color',
                  color: loginPageConfig.labelColor?.toColor(),
                  onTap: (_) => context.selectColor(
                    initialColor: loginPageConfig.labelColor?.toColor(),
                    onColorSelected: (c) => cubit.add(ThemePageEvent.setLoginLabelColor(c.toHex())),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Logo scale', style: Theme.of(context).textTheme.bodyLarge),
                Slider(
                  value: (loginPageConfig.scale ?? .25).clamp(0.0, 1.0),
                  divisions: 100,
                  label: (loginPageConfig.scale ?? .25).toStringAsFixed(2),
                  onChanged: (value) => cubit.add(ThemePageEvent.setLoginScale(value)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Mode Select: System UI Overlay
          BorderContainer(
            title: 'Mode Select — System UI Overlay',
            descriptionWidget: DescriptionRow.info(
              'Controls status bar and navigation bar colors on the mode selection screen.',
            ),
            padding: const EdgeInsets.all(16),
            child: SystemUiOverlayQuickToggles(
              value: modeSelect.systemUiOverlayStyle,
              onChanged: (v) => cubit.add(
                ThemePageEvent.setLoginModeSelect(
                  modeSelect.copyWith(systemUiOverlayStyle: v),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Mode Select: Buttons
          BorderContainer(
            title: 'Login Mode Select Page Config',
            descriptionWidget: DescriptionRow.info(
              'Choose button styles for Login/Signup actions.',
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<ElevatedButtonStyleType>(
                  value: modeSelect.buttonLoginStyleType,
                  decoration: const InputDecoration(labelText: 'Login Button Style'),
                  items: ElevatedButtonStyleType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.toString().split('.').last),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      cubit.add(
                        ThemePageEvent.setLoginModeSelectButtonLoginStyle(value),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ElevatedButtonStyleType>(
                  value: modeSelect.buttonSignupStyleType,
                  decoration: const InputDecoration(labelText: 'Signup Button Style'),
                  items: ElevatedButtonStyleType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.toString().split('.').last),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      cubit.add(
                        ThemePageEvent.setLoginModeSelectButtonSignupStyle(value),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                OtpSigninVerifyConfigSection(
                  config: loginPageConfig.otpSigninVerify,
                  onCountdownChanged: (sec) => context.read<UpdateThemCubit>().add(
                        ThemePageEvent.setLoginOtpSigninVerifyCountdown(sec),
                      ),
                ),
                const SizedBox(height: 16),
                SignupVerifyConfigSection(
                  config: loginPageConfig.signupVerify,
                  onCountdownChanged: (sec) => context.read<UpdateThemCubit>().add(
                        ThemePageEvent.setLoginSignupVerifyCountdown(sec),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (context.mounted && picked != null) {
      context.read<UpdateThemCubit>().add(ThemePageEvent.setLoginPicture(picked));
    }
  }
}
