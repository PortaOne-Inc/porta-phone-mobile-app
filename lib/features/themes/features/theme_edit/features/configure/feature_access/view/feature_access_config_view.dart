import 'package:data/dto/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_phone/theme/theme_provider.dart';

import '../../../../bloc/update_theme_cubit.dart';

import 'app_config_call_widget.dart';
import 'build_login_config.dart';
import 'main_config_widget.dart';
import 'settings_config_widget.dart';

enum LoginType { defaultLogin, customLogin }

enum CustomLoginOption { url, html }

class ConfigureAppConfigView extends StatefulWidget {
  const ConfigureAppConfigView({super.key});

  @override
  State<ConfigureAppConfigView> createState() => _ConfigureAppConfigViewState();
}

class _ConfigureAppConfigViewState extends State<ConfigureAppConfigView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  LoginType loginType = LoginType.defaultLogin;
  CustomLoginOption customLoginOption = CustomLoginOption.url;
  final _tabs = const [
    Tab(text: 'Login'),
    Tab(text: 'Main'),
    Tab(text: 'Settings'),
    Tab(text: 'Call'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();
    final appConfig = cubit.state.appConfig;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configure App Config'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          BuildLoginConfig(
            sourceAppConfigLogin: appConfig.loginConfig,
            callback: (config) => cubit.add(UpdateSchemeEvent.featureAccess(appConfig.copyWith(loginConfig: config))),
          ),
          MainConfigWidget(
            mainConfig: appConfig.mainConfig,
            onChange: (AppConfigMain value) =>
                cubit.add(UpdateSchemeEvent.featureAccess(appConfig.copyWith(mainConfig: value))),
          ),
          // _buildSettingsConfig(context, bloc),
          SettingsConfigWidget(
            config: appConfig.settingsConfig,
          ),

          AppConfigCallWidget(
            initialVideoEnabled: true,
            initialBlindTransferEnabled: true,
            initialAttendedTransferEnabled: true,
            onVideoEnabledChanged: (value) {
              debugPrint('Video Enabled: $value');
            },
            onBlindTransferChanged: (value) {
              debugPrint('Blind Transfer Enabled: $value');
            },
            onAttendedTransferChanged: (value) {
              debugPrint('Attended Transfer Enabled: $value');
            },
          ),
        ].map((it) => SingleChildScrollView(child: it)).toList(),
      ),
    );
  }
}
