import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Configure Environments')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConfigSection(
              title: 'Debug & Logging',
              fields: [
                DropdownField(
                  label: 'Debug Level',
                  value: (config['DEBUG_LEVEL'] as String?) ?? 'INFO',
                  options: ['DEBUG', 'INFO', 'WARN', 'ERROR'],
                  onChanged: (value) => _updateConfig<String>('DEBUG_LEVEL', value),
                ),
                SwitchField(
                  label: 'Database Log Statements',
                  value: (config['DATABASE_LOG_STATEMENTS'] as bool?) ?? false,
                  onChanged: (value) => _updateConfig<bool>('DATABASE_LOG_STATEMENTS', value),
                ),
                ConfigSection(
                  title: 'Logging Services',
                  fields: [
                    TextFieldConfig(
                      label: 'Logzio Logging URL',
                      value: (config['REMOTE_LOGZIO_LOGGING_URL'] as String?) ?? '',
                      onChanged: (value) => _updateConfig<String>('REMOTE_LOGZIO_LOGGING_URL', value),
                    ),
                    TextFieldConfig(
                      label: 'Logzio Logging Token',
                      value: (config['REMOTE_LOGZIO_LOGGING_TOKEN'] as String?) ?? '',
                      onChanged: (value) => _updateConfig<String>('REMOTE_LOGZIO_LOGGING_TOKEN', value),
                    ),
                    TextFieldConfig(
                      label: 'Logzio Buffer Size',
                      value: (config['REMOTE_LOGZIO_LOGGING_BUFFER_SIZE'] as int?).toString(),
                      onChanged: (value) => _updateConfig<int>(
                        'REMOTE_LOGZIO_LOGGING_BUFFER_SIZE',
                        int.tryParse(value) ?? 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ConfigSection(
              title: 'Core Settings',
              fields: [
                TextFieldConfig(
                  label: 'Core URL',
                  value: (config['CORE_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('CORE_URL', value),
                ),
                TextFieldConfig(
                  label: 'Demo Core URL',
                  value: (config['DEMO_CORE_URL'] as String?) ?? 'http://localhost:4000',
                  onChanged: (value) => _updateConfig<String>('DEMO_CORE_URL', value),
                ),
                TextFieldConfig(
                  label: 'Core Version Constraint',
                  value: (config['CORE_VERSION_CONSTRAINT'] as String?) ?? '>=0.7.0-alpha <2.0.0',
                  onChanged: (value) => _updateConfig<String>('CORE_VERSION_CONSTRAINT', value),
                ),
              ],
            ),
            ConfigSection(
              title: 'App Details',
              fields: [
                TextFieldConfig(
                  label: 'App Name',
                  value: (config['APP_NAME'] as String?) ?? 'WebTrit',
                  onChanged: (value) => _updateConfig<String>('APP_NAME', value),
                ),
                TextFieldConfig(
                  label: 'App Description',
                  value: (config['APP_DESCRIPTION'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_DESCRIPTION', value),
                ),
              ],
            ),
            ConfigSection(
              title: 'Links & URLs',
              fields: [
                TextFieldConfig(
                  label: 'App Help URL',
                  value: (config['APP_HELP_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_HELP_URL', value),
                ),
                TextFieldConfig(
                  label: 'App About URL',
                  value: (config['APP_ABOUT_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_ABOUT_URL', value),
                ),
                TextFieldConfig(
                  label: 'App Credentials Request URL',
                  value: (config['APP_CREDENTIALS_REQUEST_URL'] as String?) ?? '',
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

class ConfigSection extends StatelessWidget {
  const ConfigSection({
    required this.title,
    required this.fields,
    super.key,
  });

  final String title;
  final List<Widget> fields;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...fields,
        ],
      ),
    );
  }
}

class TextFieldConfig extends StatelessWidget {
  const TextFieldConfig({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        onChanged: onChanged,
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  const DropdownField({
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    super.key,
  });

  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        items: options
            .map((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: (it) {},
      ),
    );
  }
}

class SwitchField extends StatelessWidget {
  const SwitchField({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
