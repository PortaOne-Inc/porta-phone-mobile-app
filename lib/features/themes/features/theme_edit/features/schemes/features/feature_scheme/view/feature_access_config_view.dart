import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../features/supported/supported.dart';

// Make sure to import the new SupportedConfigWidget file
// import 'path/to/supported_config_widget.dart';

enum LoginType { defaultLogin, customLogin }

enum CustomLoginOption { url, html }

class ConfigureAppConfigView extends StatefulWidget {
  const ConfigureAppConfigView({super.key});

  @override
  State<ConfigureAppConfigView> createState() => _ConfigureAppConfigViewState();
}

class _ConfigureAppConfigViewState extends State<ConfigureAppConfigView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = const [
    Tab(text: 'Supported'), // NEW TAB
    Tab(text: 'Login'),
    Tab(text: 'Main'),
    Tab(text: 'Settings'),
    Tab(text: 'Call'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Configure App Config', style: textTheme.titleMedium),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs,
        ),
      ),
      body: BlocBuilder<UpdateThemCubit, UpdateThemeState>(
        builder: (context, state) {
          final appConfig = state.appConfig;
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              // 1. NEW Supported Features Tab
              SupportedConfigWidget(
                supportedFeatures: appConfig.supported,
                onChanged: (List<SupportedFeature> newList) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setSupportedFeatures(newList));
                },
              ),

              // 2. Login
              LoginSchemeScreen(
                sourceAppConfigLogin: appConfig.loginConfig,
                callback: (AppConfigLogin loginCfg) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setLoginConfig(loginCfg));
                },
              ),

              // 3. Main
              MainConfigWidget(
                mainConfig: appConfig.mainConfig,
                onChange: (AppConfigMain value) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setMainConfig(value));
                },
                onCacheSelectedTabChange: (bool value) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setBottomMenuCacheSelectedTab(value));
                },
              ),

              // 4. Settings
              SettingSchemeScreen(
                config: appConfig.settingsConfig,
                callback: (AppConfigSettings value) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setSettingsConfig(value));
                },
              ),

              // 5. Call
              AppConfigCallWidget(
                initialVideoEnabled: appConfig.callConfig.videoEnabled,
                initialBlindTransferEnabled: appConfig.callConfig.transfer.enableBlindTransfer,
                initialAttendedTransferEnabled: appConfig.callConfig.transfer.enableAttendedTransfer,
                onVideoEnabledChanged: (bool enabled) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setCallVideoEnabled(enabled));
                },
                onBlindTransferChanged: (bool enabled) {
                  final newTransfer = appConfig.callConfig.transfer.copyWith(enableBlindTransfer: enabled);
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setCallTransfer(newTransfer));
                },
                onAttendedTransferChanged: (bool enabled) {
                  final newTransfer = appConfig.callConfig.transfer.copyWith(enableAttendedTransfer: enabled);
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setCallTransfer(newTransfer));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
