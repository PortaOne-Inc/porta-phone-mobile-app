import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../features/features.dart';

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
        title: Text(
          'Configure App Config',
          style: textTheme.titleMedium,
        ),
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
              BuildLoginConfig(
                sourceAppConfigLogin: appConfig.loginConfig,
                callback: (config) => context.read<UpdateThemCubit>().add(
                      UpdateSchemeEvent.featureAccess(appConfig.copyWith(loginConfig: config)),
                    ),
                assets: state.assets,
              ),
              MainConfigWidget(
                mainConfig: appConfig.mainConfig,
                onChange: (AppConfigMain value) => context.read<UpdateThemCubit>().add(
                      UpdateSchemeEvent.featureAccess(appConfig.copyWith(mainConfig: value)),
                    ),
              ),
              SettingSchemeScreen(
                config: appConfig.settingsConfig,
                callback: (AppConfigSettings value) {
                  context.read<UpdateThemCubit>().add(
                        UpdateSchemeEvent.featureAccess(appConfig.copyWith(settingsConfig: value)),
                      );
                },
                assets: state.assets,
              ),
              AppConfigCallWidget(
                initialVideoEnabled: true,
                initialBlindTransferEnabled: true,
                initialAttendedTransferEnabled: true,
                onVideoEnabledChanged: (value) => context.read<UpdateThemCubit>().add(
                      UpdateSchemeEvent.featureAccess(
                          appConfig.copyWith(callConfig: appConfig.callConfig.copyWith(videoEnabled: value))),
                    ),
                onBlindTransferChanged: (value) => context.read<UpdateThemCubit>().add(
                      UpdateSchemeEvent.featureAccess(appConfig.copyWith(
                          callConfig: appConfig.callConfig
                              .copyWith(transfer: appConfig.callConfig.transfer.copyWith(enableBlindTransfer: value)))),
                    ),
                onAttendedTransferChanged: (value) => context.read<UpdateThemCubit>().add(
                      UpdateSchemeEvent.featureAccess(appConfig.copyWith(
                          callConfig: appConfig.callConfig.copyWith(
                              transfer: appConfig.callConfig.transfer.copyWith(enableAttendedTransfer: value)))),
                    ),
              ),
            ].map((widget) => SingleChildScrollView(child: widget)).toList(),
          );
        },
      ),
    );
  }
}
