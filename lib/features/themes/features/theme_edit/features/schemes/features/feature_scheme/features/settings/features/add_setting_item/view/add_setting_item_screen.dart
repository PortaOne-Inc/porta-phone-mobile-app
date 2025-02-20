import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/exports/exports.dart';
import 'package:webtrit_configurator/features/features.dart';
import 'package:webtrit_phone/extensions/string.dart';

class AddSettingItemScreen extends StatefulWidget {
  const AddSettingItemScreen({
    required this.assets,
    required this.embedded,
    this.item,
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
  final _settingItemIconController = TextEditingController();

  late final String _selectedType = widget.item?.type ?? 'embedded';

  EmbeddedResource? _selectedEmbedded;
  bool _enable = false;

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      _titleL10nController.text = widget.item?.titleL10n ?? '';
      _settingItemIconController.text = widget.item?.icon ?? '';

      _enable = widget.item?.enabled ?? false;
      _selectedEmbedded = widget.embedded.firstWhereOrNull(
        (e) => e.id == widget.item?.embeddedResourceId,
      );
    }
    _selectedEmbedded = widget.embedded.firstWhereOrNull((e) => e.id == widget.item?.embeddedResourceId);
    _settingItemIconController.addListener(() {
      setState(() {});
    });
  }

  void _saveData() {
    if (_formKey.currentState?.validate() ?? false) {
      final embedded = AppConfigSettingsItem(
        enabled: _enable,
        type: _selectedType,
        titleL10n: _titleL10nController.text.trim(),
        icon: _settingItemIconController.text.trim(),
        embeddedResourceId: _selectedEmbedded?.id,
      );

      Navigator.pop(context, embedded);
    }
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.image;

    try {
      icon = _settingItemIconController.text.toIconData();
    } catch (e) {
      // ignore
    }

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
              TextFormField(
                controller: _settingItemIconController,
                decoration: InputDecoration(
                  labelText: 'Setting Item icon',
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(icon),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    // TODO(Serdun): Refactor hardcoded URL
                    onPressed: () async {
                      const url = 'https://fonts.google.com/icons';
                      await launch(url);
                    },
                  ),
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
