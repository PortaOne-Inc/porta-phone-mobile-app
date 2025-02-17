import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/exports/exports.dart';
import 'package:webtrit_configurator/features/features.dart';

class AddSettingItemScreen extends StatefulWidget {
  const AddSettingItemScreen({
    this.item,
    required this.assets,
    required this.embedded,
    super.key,
  });

  final AppConfigSettingsItem? item;
  final List<ThemeAssetModel> assets;
  final List<EmbeddedResource> embedded;

  @override
  _AddSettingItemScreenState createState() => _AddSettingItemScreenState();
}

class _AddSettingItemScreenState extends State<AddSettingItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleL10nController = TextEditingController();
  EmbeddedResource? _selectedEmbedded;
  late final String _selectedType = widget.item?.type ?? 'embedded';
  late final String _selectedIcon = widget.item?.icon ?? '0xe424';
  bool _enable = false;

  @override
  void initState() {
    super.initState();

    // Initialize fields if the item is not null
    if (widget.item != null) {
      _titleL10nController.text = widget.item?.titleL10n ?? '';
      _enable = widget.item?.enabled ?? false;
      _selectedEmbedded = widget.embedded.firstWhereOrNull(
        (e) => e.id == widget.item?.embeddedResourceId,
      );
    }
  }

  void _saveData() {
    if (_formKey.currentState?.validate() ?? false) {
      final embedded = AppConfigSettingsItem(
        enabled: _enable,
        type: _selectedType,
        titleL10n: _titleL10nController.text.trim(),
        icon: _selectedIcon,
        embeddedResourceId: _selectedEmbedded?.id,
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
                controller: TextEditingController(text: _selectedType),
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
                validator: (value) => (value?.trim().isEmpty ?? true) ? 'Title is required' : null,
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
                    : Text(_selectedEmbedded?.toString() ?? ''),
                trailing: _selectedEmbedded == null ? const Icon(Icons.add) : const Icon(Icons.edit),
                onTap: () async {
                  _selectedEmbedded = await GoRouter.of(context)
                      .pushNamed<EmbeddedResource>(SchemeRoute.appFeatureSchemeCollectionEmbedded.name);
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
