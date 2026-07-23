import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

class AddSettingSectionScreen extends StatefulWidget {
  const AddSettingSectionScreen({super.key});

  @override
  _AddSettingSectionScreenState createState() =>
      _AddSettingSectionScreenState();
}

class _AddSettingSectionScreenState extends State<AddSettingSectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleL10nController = TextEditingController();

  bool _enable = false;

  void _saveData() {
    if (_formKey.currentState?.validate() ?? false) {
      final embedded = AppConfigSettingsSection(
        enabled: _enable,
        titleL10n: _titleL10nController.text.trim(),
      );

      Navigator.pop(context, embedded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Embedded Section'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _saveData),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleL10nController,
                decoration: const InputDecoration(
                  labelText: 'Title Localization',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) => (value?.trim().isEmpty ?? true)
                    ? 'Title is required'
                    : null,
              ),
              SwitchListTile(
                title: const Text('Enable'),
                value: _enable,
                onChanged: (value) => setState(() {
                  _enable = value;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
