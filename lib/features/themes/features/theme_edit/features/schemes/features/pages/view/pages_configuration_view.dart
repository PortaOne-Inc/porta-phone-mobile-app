import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../features/about/about.dart';
import '../features/dialing/dialing.dart';
import '../features/keypad/keypad.dart';
import '../features/login/login.dart';
import '../features/settings/settings.dart';

class ConfigureThemePageView extends StatefulWidget {
  const ConfigureThemePageView({super.key});

  @override
  State<ConfigureThemePageView> createState() => _ConfigureThemePageViewState();
}

class _ConfigureThemePageViewState extends State<ConfigureThemePageView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final light = ThemeProvider.of(context).light();
    final loginModeSelectScreenStyles = light.extension<LoginModeSelectScreenStyles>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Configure Theme Pages', style: textTheme.titleMedium),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Login Page'),
            Tab(text: 'About Page'),
            Tab(text: 'Dialing Page'),
            Tab(text: 'Keypad Page'),
            Tab(text: 'Settings Page'),
          ],
        ),
      ),
      body: BlocBuilder<UpdateThemCubit, UpdateThemeState>(
        builder: (context, state) {
          final themePageConfig = state.themeSettings.themePageLightConfig;
          final themeWidgetLightConfig = state.themeSettings.themeWidgetLightConfig;

          return TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              LoginPageTabbedView(
                loginModeSelectScreenStyles: loginModeSelectScreenStyles,
                loginPageConfig: themePageConfig.login,
              ),
              const AboutPageView(),
              DialingPageView(
                dialingPageConfig: themePageConfig.dialing,
                // ignore: deprecated_member_use
                callActions: themeWidgetLightConfig.group?.callActions,
              ),
              const KeypadConfigView(),
              SettingsPageTabbedView(
                config: themePageConfig.settings,
              ),
            ],
          );
        },
      ),
    );
  }
}
