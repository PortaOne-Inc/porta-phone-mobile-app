import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../bloc/environment_cubit.dart';
import '../widgets/floating_popup.dart';
import '../widgets/widgets.dart';

class EnvironmentConfigurationView extends StatefulWidget {
  const EnvironmentConfigurationView({super.key});

  @override
  State<EnvironmentConfigurationView> createState() => _EnvironmentConfigurationViewState();
}

class _EnvironmentConfigurationViewState extends State<EnvironmentConfigurationView> {
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

  void _manageKey(bool isEnabled, String key, String value) {
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
                    AppBar(
                      automaticallyImplyLeading: false,
                      actions: [],
                    ),
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
                                  label: 'App Name',
                                  keyName: state.appNameKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'App Description',
                                  keyName: state.appDescriptionKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                              ],
                            ),
                            Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                            ConfigSection(
                              title: 'Core Settings',
                              fields: [
                                ConfigField(
                                  label: 'Core URL',
                                  keyName: state.coreUrlKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'Demo Core URL',
                                  keyName: state.demoCoreUrlKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  defaultValue: 'http://localhost:4000',
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'Core Version Constraint',
                                  keyName: state.coreVersionConstraintKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  defaultValue: '>=0.7.0-alpha <2.0.0',
                                  onEnabledChanged: _manageKey,
                                ),
                              ],
                            ),
                            Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                            ConfigSection(
                              title: 'Logging Services',
                              fields: [
                                ConfigField(
                                  label: 'Logzio Logging URL',
                                  keyName: state.remoteLogzioLoggingUrlKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'Logzio Logging Token',
                                  keyName: state.remoteLogzioLoggingTokenKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'Logzio Buffer Size',
                                  keyName: state.remoteLogzioLoggingBufferSizeKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
                              ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 1))
                              : const Icon(Icons.save),
                          onPressed: () => context.read<EnvironmentCubit>().updateEnvironment(),
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
                              title: 'Links & URLs',
                              fields: [
                                ConfigField(
                                  label: 'App Help URL',
                                  keyName: state.appHelpUrlKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'App About URL',
                                  keyName: state.appAboutUrlKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                                ConfigField(
                                  label: 'App Credentials Request URL',
                                  keyName: state.appCredentialsRequestUrlKeyName,
                                  config: state.environment,
                                  onConfigUpdate: _updateConfig,
                                  onEnabledChanged: _manageKey,
                                ),
                              ],
                            ),
                            Divider(thickness: 4, color: colorScheme.surfaceContainerLow),
                            ConfigSection(
                                title: 'Other keys',
                                leading: FloatingPopup(
                                  controller: popupController,
                                  constraints: const BoxConstraints.expand(width: 224, height: 88),
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
                                          context.read<EnvironmentCubit>().updateKeyValue(keyController.text, '');
                                          keyController.clear();
                                        },
                                        icon: const Icon(Icons.save),
                                      )
                                    ],
                                  ),
                                ),
                                fields: [
                                  AdditionalKeysSection(
                                      additionalKeys: state.filteredEnvironment,
                                      onRemoveKey: context.read<EnvironmentCubit>().removeAttribute,
                                      onUpdateKey: context.read<EnvironmentCubit>().updateKeyValue)
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
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
    _valueControllers =
        widget.additionalKeys.entries.map((entry) => TextEditingController(text: entry.value.toString())).toList();
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
    for (var controller in _valueControllers) {
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
