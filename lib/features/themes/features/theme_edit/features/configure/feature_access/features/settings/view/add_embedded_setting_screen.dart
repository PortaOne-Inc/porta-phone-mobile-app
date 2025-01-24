import 'package:data/dto/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

import '../../embedded/view.dart';

class AddEmbeddedSettingScreen extends StatefulWidget {
  const AddEmbeddedSettingScreen({
    super.key,
    required this.assets,
    required this.embedded,
  });

  final List<ThemeAssetModel> assets;
  final List<EmbeddedData> embedded;

  @override
  _AddEmbeddedSettingScreenState createState() => _AddEmbeddedSettingScreenState();
}

class _AddEmbeddedSettingScreenState extends State<AddEmbeddedSettingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleL10nController = TextEditingController();
  EmbeddedData? _selectedEmbedded = null;

  String _selectedType = 'login';
  bool _enable = false;

  void _saveData() {
    if (_formKey.currentState?.validate() ?? false) {
      final embedded = AppConfigSettingsItem(
        enabled: _enable,
        type: _selectedType,
        titleL10n: _titleL10nController.text.trim(),
        icon: '0xe424',
      );

      Navigator.pop(context, embedded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Embedded Section'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveData,
          ),
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
                controller: TextEditingController(text: "embedded"),
                decoration: const InputDecoration(
                  labelText: 'Select Type',
                  border: OutlineInputBorder(),
                  enabled: false,
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleL10nController,
                decoration: const InputDecoration(
                  labelText: 'Title Localization',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) => value?.isEmpty == true ? 'Title is required' : null,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Enable'),
                value: _enable,
                onChanged: (value) => setState(() {
                  _enable = value;
                }),
              ),
              ListTile(
                title: _selectedEmbedded == null
                    ? const Text('Add Embedded Data')
                    : Text(_selectedEmbedded?.toString() ?? ""),
                trailing: _selectedEmbedded == null ? const Icon(Icons.add) : const Icon(Icons.edit),
                onTap: () async {
                  _selectedEmbedded = await Navigator.of(context).push(
                    MaterialPageRoute<EmbeddedData>(
                      builder: (BuildContext context) => AddEmbeddedDataScreen(
                        assets: widget.assets,
                        attributes: const {
                          'launch': false,
                        },
                      ),
                    ),
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
