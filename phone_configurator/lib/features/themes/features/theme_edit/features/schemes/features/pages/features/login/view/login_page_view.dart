import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/schemes/features/pages/features/login/view/switch_screen_tab.dart';

import 'otp_signin_tab.dart';
import 'otp_verify_tab.dart';
import 'password_signin_tab.dart';
import 'signup_verify_tab.dart';
import 'welcome_screen_tab.dart';

class LoginPageTabbedView extends StatelessWidget {
  const LoginPageTabbedView({
    required this.loginPageConfig,
    required this.loginModeSelectScreenStyles,
    super.key,
  });

  final LoginPageConfig loginPageConfig;
  final LoginModeSelectScreenStyles? loginModeSelectScreenStyles;

  @override
  Widget build(BuildContext context) {
    final tabs = <Tab>[
      const Tab(text: 'Welcome Screen'),
      const Tab(text: 'Switch Screen'),
      const Tab(text: 'OTP Signin'),
      const Tab(text: 'Password Signin'),
      const Tab(text: 'OTP Verify'),
      const Tab(text: 'Signup Verify'),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(isScrollable: true, tabs: tabs),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                WelcomeScreenTab(config: loginPageConfig),
                SwitchScreenTab(config: loginPageConfig.switchPage),
                OtpSigninTab(config: loginPageConfig),
                PasswordSigninTab(config: loginPageConfig),
                OtpVerifyTab(config: loginPageConfig),
                SignupVerifyTab(config: loginPageConfig),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
