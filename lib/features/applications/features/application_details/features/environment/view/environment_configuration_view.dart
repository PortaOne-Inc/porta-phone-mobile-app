import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../widgets/widgets.dart';

class EnvironmentConfigurationView extends StatefulWidget {
  const EnvironmentConfigurationView({
    required this.initialConfig,
    super.key,
  });

  final Map<String, dynamic> initialConfig;

  @override
  State<EnvironmentConfigurationView> createState() => _EnvironmentConfigurationViewState();
}

class _EnvironmentConfigurationViewState extends State<EnvironmentConfigurationView> {
  late Map<String, dynamic> config;

  @override
  void initState() {
    super.initState();
    config = Map<String, dynamic>.from(widget.initialConfig);
  }

  void _updateConfig<T>(String key, T value) {
    setState(() {
      config[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppToolbar(
        name: 'Configure Environments',
        themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
        onThemeChange: (mode) => _onThemeModeChanged(context, mode),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConfigSection(
              title: 'Debug & Logging',
              fields: [
                DropdownButtonExt<String>(
                  label: 'Debug Level',
                  value: (config['DEBUG_LEVEL'] as String?) ?? 'INFO',
                  options: const ['DEBUG', 'INFO', 'WARN', 'ERROR'],
                  onChanged: (value) => _updateConfig<String>('DEBUG_LEVEL', value ?? 'INFO'),
                  optionBuilder: (option) => option,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Database Log Statements'),
                    value: (config['DATABASE_LOG_STATEMENTS'] as bool?) ?? false,
                    onChanged: (value) => _updateConfig<bool>('DATABASE_LOG_STATEMENTS', value),
                  ),
                ),
                ConfigSection(
                  title: 'Logging Services',
                  fields: [
                    OutlineInput(
                      label: 'Logzio Logging URL',
                      controller: TextEditingController(
                        text: (config['REMOTE_LOGZIO_LOGGING_URL'] as String?) ?? '',
                      ),
                      icon: Icons.link,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      onChanged: (value) => _updateConfig<String>('REMOTE_LOGZIO_LOGGING_URL', value),
                    ),
                    OutlineInput(
                      label: 'Logzio Logging Token',
                      controller: TextEditingController(
                        text: (config['REMOTE_LOGZIO_LOGGING_TOKEN'] as String?) ?? '',
                      ),
                      icon: Icons.lock,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      onChanged: (value) => _updateConfig<String>('REMOTE_LOGZIO_LOGGING_TOKEN', value),
                    ),
                    OutlineInput(
                      label: 'Logzio Buffer Size',
                      controller: TextEditingController(
                        text: (config['REMOTE_LOGZIO_LOGGING_BUFFER_SIZE'] as int?).toString(),
                      ),
                      icon: Icons.storage,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      onChanged: (value) => _updateConfig<int>(
                        'REMOTE_LOGZIO_LOGGING_BUFFER_SIZE',
                        int.tryParse(value) ?? 0,
                      ),
                    ),
                  ],
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
                OutlineInput(
                  label: 'Core URL',
                  controller: TextEditingController(
                    text: (config['CORE_URL'] as String?) ?? '',
                  ),
                  icon: Icons.link,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('CORE_URL', value),
                ),
                OutlineInput(
                  label: 'Demo Core URL',
                  controller: TextEditingController(
                    text: (config['DEMO_CORE_URL'] as String?) ?? 'http://localhost:4000',
                  ),
                  icon: Icons.link,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('DEMO_CORE_URL', value),
                ),
                OutlineInput(
                  label: 'Core Version Constraint',
                  controller: TextEditingController(
                    text: (config['CORE_VERSION_CONSTRAINT'] as String?) ?? '>=0.7.0-alpha <2.0.0',
                  ),
                  icon: Icons.build,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('CORE_VERSION_CONSTRAINT', value),
                ),
              ],
            ),
            Divider(
              thickness: 4,
              color: colorScheme.surfaceContainerLow,
            ),
            ConfigSection(
              title: 'App Details',
              fields: [
                OutlineInput(
                  label: 'App Name',
                  controller: TextEditingController(
                    text: (config['APP_NAME'] as String?) ?? 'WebTrit',
                  ),
                  icon: Icons.app_settings_alt,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('APP_NAME', value),
                ),
                OutlineInput(
                  label: 'App Description',
                  controller: TextEditingController(
                    text: (config['APP_DESCRIPTION'] as String?) ?? '',
                  ),
                  icon: Icons.description,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('APP_DESCRIPTION', value),
                ),
              ],
            ),
            Divider(
              thickness: 4,
              color: colorScheme.surfaceContainerLow,
            ),
            ConfigSection(
              title: 'Links & URLs',
              fields: [
                OutlineInput(
                  label: 'App Help URL',
                  controller: TextEditingController(
                    text: (config['APP_HELP_URL'] as String?) ?? '',
                  ),
                  icon: Icons.help,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('APP_HELP_URL', value),
                ),
                OutlineInput(
                  label: 'App About URL',
                  controller: TextEditingController(
                    text: (config['APP_ABOUT_URL'] as String?) ?? '',
                  ),
                  icon: Icons.info,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('APP_ABOUT_URL', value),
                ),
                OutlineInput(
                  label: 'App Credentials Request URL',
                  controller: TextEditingController(
                    text: (config['APP_CREDENTIALS_REQUEST_URL'] as String?) ?? '',
                  ),
                  icon: Icons.vpn_key,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  onChanged: (value) => _updateConfig<String>('APP_CREDENTIALS_REQUEST_URL', value),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
  BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
}
