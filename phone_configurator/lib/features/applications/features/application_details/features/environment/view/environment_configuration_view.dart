import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../bloc/environment_cubit.dart';
import '../widgets/floating_popup.dart';
import '../widgets/widgets.dart';

class EnvironmentConfigurationView extends StatefulWidget {
  const EnvironmentConfigurationView({super.key});

  @override
  State<EnvironmentConfigurationView> createState() =>
      _EnvironmentConfigurationViewState();
}

class _EnvironmentConfigurationViewState
    extends State<EnvironmentConfigurationView> {
  late Map<String, dynamic> config;
  FloatingPopupController popupController = FloatingPopupController();
  TextEditingController keyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    config = {};
  }

  void _updateConfig<T>(String key, T value) {
    context.read<EnvironmentCubit>().updateKeyValue(key, value);
  }

  void _manageKey(bool isEnabled, String key, dynamic value) {
    if (isEnabled) {
      context.read<EnvironmentCubit>().updateKeyValue(key, value);
    } else {
      context.read<EnvironmentCubit>().removeAttribute(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<EnvironmentCubit, EnvironmentState>(
      builder: (context, state) => Scaffold(
        appBar: AppToolbar(
          name: 'Configure Environments',
          themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
          onThemeChange: (mode) => _onThemeModeChanged(context, mode),
        ),
        body: ResizableColumns(
          dividerColor: colorScheme.surfaceContainerLow,
          dividerThickness: 4,
          children: [
            (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(automaticallyImplyLeading: false, actions: const []),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConfigSection(
                          title: 'App Details',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.appNameKeyName + state.status.name,
                              ),
                              label: 'App Name',
                              keyName: state.appNameKeyName,
                              config: state.environment,
                              defaultValue: 'WebTrit',
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.appGreetingKeyName + state.status.name,
                              ),
                              label: 'App Greeting',
                              keyName: state.appGreetingKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.appAboutUrlKeyName + state.status.name,
                              ),
                              label: 'App About URL',
                              keyName: state.appAboutUrlKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.appCredentialsRequestUrlKeyName +
                                    state.status.name,
                              ),
                              label: 'App Credentials Request URL',
                              keyName: state.appCredentialsRequestUrlKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.salesEmailKeyName + state.status.name,
                              ),
                              label: 'Sales Email',
                              keyName: state.salesEmailKeyName,
                              config: state.environment,
                              defaultValue: 'sales@webtrit.com',
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Core Settings',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.coreUrlKeyName + state.status.name,
                              ),
                              label: 'Core URL',
                              keyName: state.coreUrlKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.demoCoreUrlKeyName + state.status.name,
                              ),
                              label: 'Demo Core URL',
                              keyName: state.demoCoreUrlKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              defaultValue: 'http://localhost:4000',
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.coreVersionConstraintKeyName +
                                    state.status.name,
                              ),
                              label: 'Core Version Constraint',
                              keyName: state.coreVersionConstraintKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              defaultValue: '>=0.7.0-alpha <2.0.0',
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.enableAttendedTransferKeyName +
                                    state.status.name,
                              ),
                              label: 'Enable Attended Transfer',
                              keyName: state.enableAttendedTransferKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              defaultValue: true,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Push Notifications',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.fcmVapidKeyKeyName + state.status.name,
                              ),
                              label: 'FCM VAPID Key',
                              keyName: state.fcmVapidKeyKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Logging Settings',
                          fields: [
                            const ConfiguratorGroupTitleTile(
                              titleData: 'Phone Logging',
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.logDebugLevel + state.status.name,
                              ),
                              label: 'Log level',
                              keyName: state.logDebugLevel,
                              config: state.environment,
                              options: Level.LEVELS
                                  .map((level) => level.name)
                                  .toList(),
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.logDatabaseLogStatements +
                                    state.status.name,
                              ),
                              label: 'Database log statements',
                              keyName: state.logDatabaseLogStatements,
                              config: state.environment,
                              defaultValue: false,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            const ConfiguratorGroupTitleTile(
                              titleData: 'Logging Services',
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.remoteLogzioLoggingUrlKeyName +
                                    state.status.name,
                              ),
                              label: 'Logzio Logging URL',
                              keyName: state.remoteLogzioLoggingUrlKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.remoteLogzioLogLevelKeyName +
                                    state.status.name,
                              ),
                              label: 'Logzio Log Level',
                              keyName: state.remoteLogzioLogLevelKeyName,
                              config: state.environment,
                              options: Level.LEVELS
                                  .map((level) => level.name)
                                  .toList(),
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.remoteLogzioLoggingTokenKeyName +
                                    state.status.name,
                              ),
                              label: 'Logzio Logging Token',
                              keyName: state.remoteLogzioLoggingTokenKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.remoteLogzioLoggingBufferSizeKeyName +
                                    state.status.name,
                              ),
                              label: 'Logzio Buffer Size',
                              keyName:
                                  state.remoteLogzioLoggingBufferSizeKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      icon: state.status.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 1),
                            )
                          : const Icon(Icons.save),
                      onPressed: () =>
                          context.read<EnvironmentCubit>().updateEnvironment(),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConfigSection(
                          title: 'Deeplink',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.deeplinkDomain + state.status.name,
                              ),
                              label: 'Domain',
                              keyName: state.deeplinkDomain,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Call Trigger Mechanism',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.callTriggerMechanismSmsKeyName +
                                    state.status.name,
                              ),
                              label: 'Enable SMS Trigger',
                              keyName: state.callTriggerMechanismSmsKeyName,
                              config: state.environment,
                              defaultValue: false,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.callTriggerMechanismSmsPrefixKeyName +
                                    state.status.name,
                              ),
                              label: 'SMS Prefix',
                              keyName:
                                  state.callTriggerMechanismSmsPrefixKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.callTriggerMechanismSmsRegexPatternKeyName +
                                    state.status.name,
                              ),
                              label: 'SMS Regex Pattern',
                              keyName: state
                                  .callTriggerMechanismSmsRegexPatternKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Connectivity',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.connectivityCheckUrlKeyName +
                                    state.status.name,
                              ),
                              label: 'Connectivity Check URL',
                              keyName: state.connectivityCheckUrlKeyName,
                              config: state.environment,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Polling Intervals (seconds)',
                          fields: [
                            ConfigField(
                              key: ValueKey(
                                state.userRepositoryPollingIntervalSecondsKeyName +
                                    state.status.name,
                              ),
                              label: 'User Repository',
                              keyName: state
                                  .userRepositoryPollingIntervalSecondsKeyName,
                              config: state.environment,
                              defaultValue: 10,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.systemInfoRepositoryPollingIntervalSecondsKeyName +
                                    state.status.name,
                              ),
                              label: 'System Info Repository',
                              keyName: state
                                  .systemInfoRepositoryPollingIntervalSecondsKeyName,
                              config: state.environment,
                              defaultValue: 300,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.externalContactsRepositoryPollingIntervalSecondsKeyName +
                                    state.status.name,
                              ),
                              label: 'External Contacts Repository',
                              keyName: state
                                  .externalContactsRepositoryPollingIntervalSecondsKeyName,
                              config: state.environment,
                              defaultValue: 60,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.voicemailRepositoryPollingIntervalSecondsKeyName +
                                    state.status.name,
                              ),
                              label: 'Voicemail Repository',
                              keyName: state
                                  .voicemailRepositoryPollingIntervalSecondsKeyName,
                              config: state.environment,
                              defaultValue: 300,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                            ConfigField(
                              key: ValueKey(
                                state.callerIdSettingsRepositoryPollingIntervalSecondsKeyName +
                                    state.status.name,
                              ),
                              label: 'Caller ID Settings Repository',
                              keyName: state
                                  .callerIdSettingsRepositoryPollingIntervalSecondsKeyName,
                              config: state.environment,
                              defaultValue: 300,
                              onConfigUpdate: _updateConfig,
                              onEnabledChanged: _manageKey,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 4,
                          color: colorScheme.surfaceContainerLow,
                        ),
                        ConfigSection(
                          title: 'Other keys',
                          leading: FloatingPopup(
                            controller: popupController,
                            constraints: const BoxConstraints.expand(
                              width: 224,
                              height: 88,
                            ),
                            trigger: const Icon(Icons.add),
                            floatingContent: Row(
                              children: [
                                Expanded(
                                  child: OutlineInput(
                                    controller: keyController,
                                    label: 'Key',
                                    icon: Icons.text_fields,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    popupController.hide();
                                    context
                                        .read<EnvironmentCubit>()
                                        .updateKeyValue(keyController.text, '');
                                    keyController.clear();
                                  },
                                  icon: const Icon(Icons.save),
                                ),
                              ],
                            ),
                          ),
                          fields: [
                            AdditionalKeysSection(
                              additionalKeys: state.filteredEnvironment,
                              onRemoveKey: context
                                  .read<EnvironmentCubit>()
                                  .removeAttribute,
                              onUpdateKey: context
                                  .read<EnvironmentCubit>()
                                  .updateKeyValue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          orientation: ResizableOrientation.horizontal,
        ),
      ),
    );
  }
}

class AdditionalKeysSection extends StatefulWidget {
  const AdditionalKeysSection({
    required this.additionalKeys,
    required this.onRemoveKey,
    required this.onUpdateKey,
    super.key,
  });

  final Map<String, dynamic> additionalKeys;
  final void Function(String) onRemoveKey;
  final void Function(String, dynamic) onUpdateKey;

  @override
  State<AdditionalKeysSection> createState() => _AdditionalKeysSectionState();
}

class _AdditionalKeysSectionState extends State<AdditionalKeysSection> {
  late List<TextEditingController> _valueControllers;

  @override
  void initState() {
    super.initState();
    _initializeValueControllers();
  }

  void _initializeValueControllers() {
    _valueControllers = widget.additionalKeys.entries
        .map((entry) => TextEditingController(text: entry.value.toString()))
        .toList();
  }

  @override
  void didUpdateWidget(covariant AdditionalKeysSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.additionalKeys.length != widget.additionalKeys.length) {
      _initializeValueControllers();
    }
  }

  @override
  void dispose() {
    for (final controller in _valueControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.additionalKeys.entries.map((entry) {
          final index = widget.additionalKeys.keys.toList().indexOf(entry.key);
          return Row(
            children: [
              Expanded(
                child: OutlineInput(
                  label: entry.key,
                  controller: _valueControllers[index],
                  icon: Icons.text_fields,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) {
                    widget.onUpdateKey(entry.key, value);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () => widget.onRemoveKey(entry.key),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
  BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
}
