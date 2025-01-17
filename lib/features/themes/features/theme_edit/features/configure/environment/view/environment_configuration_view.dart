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
            _buildSection(
              title: 'Debug & Logging',
              fields: [
                _buildDropdownField(
                  label: 'Debug Level',
                  value: (config['DEBUG_LEVEL'] as String?) ?? 'INFO',
                  options: ['DEBUG', 'INFO', 'WARN', 'ERROR'],
                  onChanged: (value) => _updateConfig<String>('DEBUG_LEVEL', value),
                ),
                _buildSwitchField(
                  label: 'Database Log Statements',
                  value: (config['DATABASE_LOG_STATEMENTS'] as bool?) ?? false,
                  onChanged: (value) => _updateConfig<bool>('DATABASE_LOG_STATEMENTS', value),
                ),
              ],
            ),
            _buildSection(
              title: 'Core Settings',
              fields: [
                _buildTextField(
                  label: 'Core URL',
                  value: (config['CORE_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('CORE_URL', value),
                ),
                _buildTextField(
                  label: 'Demo Core URL',
                  value: (config['DEMO_CORE_URL'] as String?) ?? 'http://localhost:4000',
                  onChanged: (value) => _updateConfig<String>('DEMO_CORE_URL', value),
                ),
                _buildTextField(
                  label: 'Core Version Constraint',
                  value: (config['CORE_VERSION_CONSTRAINT'] as String?) ?? '>=0.7.0-alpha <2.0.0',
                  onChanged: (value) => _updateConfig<String>('CORE_VERSION_CONSTRAINT', value),
                ),
              ],
            ),
            _buildSection(
              title: 'App Details',
              fields: [
                _buildTextField(
                  label: 'App Name',
                  value: (config['APP_NAME'] as String?) ?? 'WebTrit',
                  onChanged: (value) => _updateConfig<String>('APP_NAME', value),
                ),
                _buildTextField(
                  label: 'App Greeting',
                  value: (config['APP_GREETING'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_GREETING', value),
                ),
                _buildTextField(
                  label: 'App Description',
                  value: (config['APP_DESCRIPTION'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_DESCRIPTION', value),
                ),
              ],
            ),
            _buildSection(
              title: 'Links & URLs',
              fields: [
                _buildTextField(
                  label: 'App Help URL',
                  value: (config['APP_HELP_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_HELP_URL', value),
                ),
                _buildTextField(
                  label: 'App About URL',
                  value: (config['APP_ABOUT_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_ABOUT_URL', value),
                ),
                _buildTextField(
                  label: 'App Credentials Request URL',
                  value: (config['APP_CREDENTIALS_REQUEST_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('APP_CREDENTIALS_REQUEST_URL', value),
                ),
              ],
            ),
            _buildSection(
              title: 'Logging Services',
              fields: [
                _buildTextField(
                  label: 'Logzio Logging URL',
                  value: (config['REMOTE_LOGZIO_LOGGING_URL'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('REMOTE_LOGZIO_LOGGING_URL', value),
                ),
                _buildTextField(
                  label: 'Logzio Logging Token',
                  value: (config['REMOTE_LOGZIO_LOGGING_TOKEN'] as String?) ?? '',
                  onChanged: (value) => _updateConfig<String>('REMOTE_LOGZIO_LOGGING_TOKEN', value),
                ),
                _buildTextField(
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
      ),
    );
  }

  Widget _buildSection({required String title, required List<Widget> fields}) {
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

  Widget _buildTextField({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
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
        onChanged: (it) => onChanged,
      ),
    );
  }

  Widget _buildSwitchField({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SwitchListTile(
        title: Text(label),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
