import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class AddModeActionPage extends StatefulWidget {
  const AddModeActionPage({
    required this.embedded,
    super.key,
  });

  final List<EmbeddedResource> embedded;

  @override
  _AddModeActionPageState createState() => _AddModeActionPageState();
}

class _AddModeActionPageState extends State<AddModeActionPage> {
  final _titleL10nController = TextEditingController();
  EmbeddedResource? _selectedEmbedded;
  bool _enable = false;
  String _selectedType = 'login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Mode Action Details', style: textTheme.titleMedium),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveData,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Title Localization (titleL10n)', Icons.title, _titleL10nController),
            _buildDropdown(
              'Select Type',
              _selectedType,
              ['login', 'embedded'],
              (value) => setState(() => _selectedType = value!),
            ),
            DropdownButtonFormField<EmbeddedResource>(
              hint: const Text('Select embedded'),
              padding: EdgeInsets.zero,
              decoration: const InputDecoration(
                labelText: 'Select embedded',
                border: OutlineInputBorder(),
              ),
              // Removes the underline
              items: widget.embedded.map((embedded) {
                return DropdownMenuItem<EmbeddedResource>(
                  value: embedded,
                  child: Text(embedded.toolbar.titleL10n.toString()),
                );
              }).toList(),
              onChanged: (selectedEmbedded) {
                if (selectedEmbedded != null) {
                  setState(() {
                    _selectedEmbedded = selectedEmbedded;
                  });
                }
              },
            ),
            Divider(
              height: 16,
              thickness: 4,
              color: colorScheme.surfaceContainerLow,
            ),
            _buildSwitch('Enable', _enable, (value) => setState(() => _enable = value)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildSwitch(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  void _saveData() {
    final titleL10n = _titleL10nController.text.trim();

    final embedded = AppConfigModeSelectAction(
      enabled: _enable,
      type: _selectedType,
      embeddedId: _selectedEmbedded?.id,
      titleL10n: titleL10n,
    );

    Navigator.pop(context, embedded);
  }
}
