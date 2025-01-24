import 'dart:convert';
import 'dart:typed_data';

import 'package:data/dto/dto.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../models/models.dart';

final _logger = Logger('AddEmbeddedPage');

class AddEmbeddedDataScreen extends StatefulWidget {
  const AddEmbeddedDataScreen({
    super.key,
    required this.assets,
    this.attributes = const {},
  });

  final List<ThemeAssetModel> assets;
  final Map<String, dynamic> attributes;

  @override
  _AddEmbeddedDataScreenState createState() => _AddEmbeddedDataScreenState();
}

class _AddEmbeddedDataScreenState extends State<AddEmbeddedDataScreen> {
  final _titleL10nController = TextEditingController();
  final _resourceController = TextEditingController();
  final int _id = DateTime.now().millisecondsSinceEpoch;
  late ThemeAssetModel? _asset = widget.assets.firstOrNull;

  bool _showToolbar = true;
  EmbeddedResourceType _customLoginOption = EmbeddedResourceType.url;

  late final List<MapEntry<String, String>> _attributes =
      widget.attributes.entries.map((entry) => MapEntry(entry.key, entry.value.toString())).toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Embedded Data',
          style: theme.textTheme.titleMedium,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildReadOnlyField('ID', _id.toString(), Icons.numbers),
            _buildTextField('Title Localization (titleL10n)', Icons.title, _titleL10nController),
            _buildSwitch('Show Toolbar', _showToolbar, (value) => setState(() => _showToolbar = value)),
            Divider(
              thickness: 4,
              color: colorScheme.surfaceContainerLow,
            ),
            _buildDropdown(
                'HTML source:', _customLoginOption, EmbeddedResourceType.values, _onCustomLoginOptionChanged),
            if (_customLoginOption == EmbeddedResourceType.url) _buildTextField('URL', Icons.link, _resourceController),
            if (_customLoginOption == EmbeddedResourceType.html) _buildAssetDropdown(widget.assets, _asset, theme),
            const SizedBox(height: 16),
            Divider(
              thickness: 4,
              color: colorScheme.surfaceContainerLow,
            ),
            _buildAttributesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAttributesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attributes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _attributes.length,
          itemBuilder: (context, index) {
            final entry = _attributes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Key',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                          text: entry.key,
                          selection: TextSelection.collapsed(offset: entry.key.length),
                        ),
                      ),
                      onChanged: (value) => setState(() => _attributes[index] = MapEntry(value, entry.value)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Value',
                        border: const OutlineInputBorder(),
                      ),
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                          text: entry.value,
                          selection: TextSelection.collapsed(offset: entry.value.length),
                        ),
                      ),
                      onChanged: (value) => setState(() => _attributes[index] = MapEntry(entry.key, value)),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => setState(() => _attributes.removeAt(index)),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Attribute'),
          onPressed: () => setState(() => _attributes.add(const MapEntry('', ''))),
        ),
      ],
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

  Widget _buildSwitch(String label, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SwitchListTile(
        title: Text(label),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdown<T>(String label, T value, List<T> options, ValueChanged<T?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          DropdownButton<T>(
            value: value,
            items: options.map((option) => DropdownMenuItem(value: option, child: Text(option.toString()))).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildAssetDropdown(List<ThemeAssetModel> assets, ThemeAssetModel? selectedAsset, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: assets.isNotEmpty
                ? DropdownButton<ThemeAssetModel>(
                    value: selectedAsset,
                    items: assets.map((asset) {
                      return DropdownMenuItem(
                        value: asset,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(asset.name, style: theme.textTheme.bodyMedium),
                            Text('${asset.id}.html',
                                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _asset = value),
                  )
                : Text('No assets available', style: theme.textTheme.labelLarge),
          ),
        ],
      ),
    );
  }

  void _onCustomLoginOptionChanged(EmbeddedResourceType? value) {
    if (value != null) {
      setState(() => _customLoginOption = value);
    }
  }

  void _saveData() {
    final titleL10n = _titleL10nController.text.trim();
    final resource = _customLoginOption == EmbeddedResourceType.url ? _resourceController.text.trim() : _asset?.id;

    if (titleL10n.isEmpty || resource == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all required fields.')));
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

    Navigator.pop(context, embedded);
  }
}
