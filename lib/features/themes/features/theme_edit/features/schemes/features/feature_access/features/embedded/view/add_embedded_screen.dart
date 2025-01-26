import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/route/route.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/widgets.dart';

import '../models/models.dart';

class AddEmbeddedDataScreen extends StatefulWidget {
  const AddEmbeddedDataScreen({
    super.key,
    this.attributes = const {},
  });

  final Map<String, dynamic> attributes;

  @override
  _AddEmbeddedDataScreenState createState() => _AddEmbeddedDataScreenState();
}

class _AddEmbeddedDataScreenState extends State<AddEmbeddedDataScreen> {
  final _titleL10nController = TextEditingController();
  final _resourceController = TextEditingController();
  final int _id = DateTime.now().millisecondsSinceEpoch;

  List<ThemeAssetModel> get _assets => Provider.of<AssetsProvider>(context, listen: false).assets;
  late ThemeAssetModel? _asset = _assets.isNotEmpty ? _assets.first : null;

  bool _showToolbar = true;
  EmbeddedResourceType _customLoginOption = EmbeddedResourceType.url;

  late final List<MapEntry<String, String>> _attributes =
      widget.attributes.entries.map((entry) => MapEntry(entry.key, entry.value.toString())).toList();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Embedded Data',
          style: textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveData,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildReadOnlyField('ID', _id.toString(), Icons.numbers),
                  OutlineInput(
                    label: 'Name of resource',
                    icon: Icons.title,
                    controller: _titleL10nController,
                    margin: const EdgeInsets.only(bottom: 16),
                  ),
                  DropdownButtonExt<EmbeddedResourceType>(
                    label: 'HTML Source',
                    value: _customLoginOption,
                    options: EmbeddedResourceType.values,
                    onChanged: (value) => setState(() => _customLoginOption = value!),
                    optionBuilder: (value) => value.name,
                  ),
                  Visibility(
                    visible: _customLoginOption == EmbeddedResourceType.url,
                    child: OutlineInput(
                      label: 'URL',
                      icon: Icons.link,
                      controller: _resourceController,
                      margin: const EdgeInsets.only(bottom: 16),
                    ),
                  ),
                  Visibility(
                    visible: _customLoginOption == EmbeddedResourceType.html,
                    child: DropdownButtonExt<ThemeAssetModel>(
                      label: 'Select HTML Asset',
                      value: _asset,
                      options: _assets,
                      optionBuilder: (asset) => '${asset.name} (${asset.id}.html)',
                      onChanged: (value) => setState(() => _asset = value),
                    ),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Show Toolbar'),
                    value: _showToolbar,
                    onChanged: (value) => setState(() => _showToolbar = value),
                  ),
                ],
              ),
            ),
            AttributesWidget(
              attributes: _attributes,
              onAddAttribute: () => setState(() => _attributes.add(const MapEntry('', ''))),
              onUpdateAttribute: (index, key, value) => setState(() => _attributes[index] = MapEntry(key, value)),
              onRemoveAttribute: (index) => setState(() => _attributes.removeAt(index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: TextEditingController(text: value),
        enabled: false,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  void _saveData() {
    final titleL10n = _titleL10nController.text.trim();
    final resource = _customLoginOption == EmbeddedResourceType.url ? _resourceController.text.trim() : _asset?.id;

    if (titleL10n.isEmpty || resource == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    final initialUrl = Uri.dataFromBytes(
      _asset?.file?.toList() ?? [],
      mimeType: 'text/html',
    );

    final embedded = EmbeddedData(
      id: _id,
      resource: initialUrl,
      toolbar: ToolbarConfig(
        titleL10n: titleL10n,
        showToolbar: _showToolbar,
      ),
      attributes: Map.fromEntries(_attributes),
    );

    GoRouter.of(context).pop(embedded);
  }
}
