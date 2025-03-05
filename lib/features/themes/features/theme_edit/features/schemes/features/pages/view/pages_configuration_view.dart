import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '../features/features.dart';

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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bloc = context.read<UpdateThemCubit>();
    final light = ThemeProvider.of(context).light();
    final themePageConfig = bloc.state.themePageConfig;

    final loginModeSelectScreenStyles = light.extension<LoginModeSelectScreenStyles>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configure Theme Pages',
          style: textTheme.titleMedium,
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Login Page'),
            Tab(text: 'About Page'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LoginPageView(
            loginModeSelectScreenStyles: loginModeSelectScreenStyles,
            loginPageConfig: themePageConfig.login,
            callback: (config) => bloc.add(UpdateSchemeEvent.pages(themePageConfig.copyWith(login: config))),
          ),
          const AboutPageView(),
        ],
      ),
    );
  }
}
