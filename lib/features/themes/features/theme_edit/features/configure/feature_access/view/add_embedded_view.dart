import 'dart:typed_data';

import 'package:data/dto/dto.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../models/custom_login_option.dart';

final _logger = Logger('AddEmbeddedPage');

class AddEmbeddedPage extends StatefulWidget {
  const AddEmbeddedPage({super.key, required this.assets});

  final List<ThemeAssetModel> assets;

  @override
  _AddEmbeddedPageState createState() => _AddEmbeddedPageState();
}

class _AddEmbeddedPageState extends State<AddEmbeddedPage> {
  final _titleL10nController = TextEditingController();
  final _resourceController = TextEditingController();
  final int _id = DateTime.now().millisecondsSinceEpoch;
  late ThemeAssetModel? _asset = widget.assets.firstOrNull;

  bool _launch = false;
  bool _showToolbar = true;
  CustomLoginOption _customLoginOption = CustomLoginOption.url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Embedded Data'),
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
            _buildSectionTitle('Add Embedded Details', theme.textTheme.titleLarge),
            _buildReadOnlyField('ID', _id.toString(), Icons.numbers),
            _buildTextField('Title Localization (titleL10n)', Icons.title, _titleL10nController),
            _buildSwitch('Launch', _launch, (value) => setState(() => _launch = value)),
            _buildSwitch('Show Toolbar', _showToolbar, (value) => setState(() => _showToolbar = value)),
            Divider(
              thickness: 4,
              color: colorScheme.surfaceContainerLow,
            ),
            _buildDropdown('HTML source:', _customLoginOption, CustomLoginOption.values, _onCustomLoginOptionChanged),
            if (_customLoginOption == CustomLoginOption.url) _buildTextField('URL', Icons.link, _resourceController),
            if (_customLoginOption == CustomLoginOption.html) _buildAssetDropdown(widget.assets, _asset, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: style),
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

  void _onCustomLoginOptionChanged(CustomLoginOption? value) {
    if (value != null) {
      setState(() => _customLoginOption = value);
    }
  }

  void _saveData() {
    final titleL10n = _titleL10nController.text.trim();
    final resource = _customLoginOption == CustomLoginOption.url ? _resourceController.text.trim() : _asset?.id;

    if (titleL10n.isEmpty || resource == null || resource.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all required fields.')));
      return;
    }

    final embedded = AppConfigLoginEmbedded(
      id: _id,
      resource: resource,
      titleL10n: titleL10n,
      launch: _launch,
      metadata: {'assetId': _asset?.id},
      showToolbar: _showToolbar,
    );

    Navigator.pop(context, embedded);
  }
}
