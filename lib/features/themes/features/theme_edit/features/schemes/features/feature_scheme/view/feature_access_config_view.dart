import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../features/contacts_messaging/contacts_messaging.dart';
import '../features/localization/localization.dart';
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
  bool _isJsonMode = false;

  final _tabs = const [
    Tab(text: 'Supported'),
    Tab(text: 'Login'),
    Tab(text: 'Main'),
    Tab(text: 'Settings'),
    Tab(text: 'Call'),
    Tab(text: 'Contacts & Messaging'),
    Tab(text: 'Localization'),
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

    final appConfig = context.select<UpdateThemCubit, AppConfig>((cubit) => cubit.state.appConfig);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configure App Config', style: textTheme.titleMedium),
        actions: [
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: false, label: Text('UI')),
              ButtonSegment(value: true, label: Text('JSON')),
            ],
            selected: {_isJsonMode},
            onSelectionChanged: (v) => setState(() => _isJsonMode = v.first),
          ),
          const SizedBox(width: 8),
        ],
        bottom: _isJsonMode ? null : TabBar(controller: _tabController, isScrollable: true, tabs: _tabs),
      ),
      body: IndexedStack(
        index: _isJsonMode ? 1 : 0,
        children: [
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              SupportedConfigWidget(
                supportedFeatures: appConfig.supported,
                onChanged: (List<SupportedFeature> newList) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setSupportedFeatures(newList));
                },
              ),
              LoginSchemeScreen(
                sourceAppConfigLogin: appConfig.loginConfig,
                callback: (AppConfigLogin loginCfg) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setLoginConfig(loginCfg));
                },
              ),
              MainConfigWidget(
                mainConfig: appConfig.mainConfig,
                onChange: (AppConfigMain value) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setMainConfig(value));
                },
                onCacheSelectedTabChange: (bool value) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setBottomMenuCacheSelectedTab(value));
                },
              ),
              SettingSchemeScreen(
                config: appConfig.settingsConfig,
                callback: (AppConfigSettings value) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setSettingsConfig(value));
                },
              ),
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
              ContactsMessagingConfigWidget(
                contacts: appConfig.contacts,
                messaging: appConfig.messaging,
                onContactsChanged: (contacts) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setContactsConfig(contacts));
                },
                onMessagingChanged: (messaging) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setMessagingConfig(messaging));
                },
              ),
              LocalizationConfigWidget(
                localization: appConfig.localization,
                onChanged: (localization) {
                  context.read<UpdateThemCubit>().add(AppConfigEvent.setLocalizationConfig(localization));
                },
              ),
            ],
          ),
          JsonEditorPanel(
            initialJson: appConfig.toJson(),
            onApply: (json) => context.read<UpdateThemCubit>().add(AppConfigEvent.importJson(json)),
          ),
        ],
      ),
    );
  }
}
