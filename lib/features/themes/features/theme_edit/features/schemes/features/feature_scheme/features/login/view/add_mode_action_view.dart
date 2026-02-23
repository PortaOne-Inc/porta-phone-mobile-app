import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/core/core.dart';

class AddModeActionPage extends StatefulWidget {
  const AddModeActionPage({required this.embedded, super.key});

  final List<EmbeddedResourceModel> embedded;

  @override
  State<AddModeActionPage> createState() => _AddModeActionPageState();
}

class _AddModeActionPageState extends State<AddModeActionPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleL10nController = TextEditingController();

  String _selectedType = 'login';

  bool _enabled = true;

  EmbeddedResourceModel? _selectedEmbedded;

  @override
  void dispose() {
    _titleL10nController.dispose();
    super.dispose();
  }

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
            tooltip: 'Save',
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
              TextFormField(
                controller: _titleL10nController,
                decoration: const InputDecoration(
                  labelText: 'Title Localization (titleL10n)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedType,
                decoration: const InputDecoration(
                  labelText: 'Select Type',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'login', child: Text('login')),
                  DropdownMenuItem(value: 'embedded', child: Text('embedded')),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedType = value;
                    if (_selectedType == 'login') {
                      _selectedEmbedded = null;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              if (_selectedType == 'embedded') ...[
                _EmbeddedPickerTile(
                  selected: _selectedEmbedded,
                  onPick: _addEmbeddedPage,
                  onClear: () => setState(() {
                    _selectedEmbedded = null;
                  }),
                ),
                const SizedBox(height: 16),
              ],
              Divider(
                height: 16,
                thickness: 4,
                color: colorScheme.surfaceContainerLow,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Enable'),
                value: _enabled,
                onChanged: (v) => setState(() => _enabled = v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addEmbeddedPage() async {
    final picked = await EmbedPickerDialog.show(
      context,
      title: 'Select embeds',
      items: widget.embedded,
    );

    if (picked != null && picked.isNotEmpty) {
      setState(() {
        _selectedEmbedded = picked.first;
      });
    }
  }

  void _saveData() {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedType == 'embedded' && _selectedEmbedded == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an embedded resource')),
      );
      return;
    }

    final titleL10n = _titleL10nController.text.trim();

    final action = AppConfigModeSelectAction(
      enabled: _enabled,
      type: _selectedType,
      titleL10n: titleL10n,
      embeddedId: _selectedType == 'embedded' ? _selectedEmbedded?.id : null,
    );

    Navigator.pop(context, action);
  }
}

class _EmbeddedPickerTile extends StatelessWidget {
  const _EmbeddedPickerTile({
    required this.selected,
    required this.onPick,
    required this.onClear,
  });

  final EmbeddedResourceModel? selected;
  final VoidCallback onPick;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        title: const Text('Embedded'),
        subtitle: Text(selected?.displayLabel() ?? 'No embedded selected'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Pick',
              icon: const Icon(Icons.folder_open),
              onPressed: onPick,
            ),
            IconButton(
              tooltip: 'Clear',
              icon: Icon(Icons.clear, color: colorScheme.error),
              onPressed: selected == null ? null : onClear,
            ),
          ],
        ),
      ),
    );
  }
}
