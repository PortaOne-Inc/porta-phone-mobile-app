import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class ColorSchemeConfigurationView extends StatefulWidget {
  const ColorSchemeConfigurationView({super.key});

  @override
  State<ColorSchemeConfigurationView> createState() => _ColorSchemeConfigurationViewState();
}

class _ColorSchemeConfigurationViewState extends State<ColorSchemeConfigurationView> {
  static const _tileConstraints = BoxConstraints.tightFor(width: 180, height: 120);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateThemCubit>();

    final colors = context.select<UpdateThemCubit, List<SchemeColor>>(
      (c) => c.state.colorsScheme,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color scheme'),
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            tooltip: 'Import JSON',
            onPressed: () => _showImportJsonDialog(context, bloc),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(colors.length, (index) {
                    final item = colors[index];
                    final currentColor = item.color ?? Colors.transparent;

                    return ColorField(
                      title: item.schemeKey,
                      color: currentColor,
                      constraints: _tileConstraints,
                      onTap: (picked) async => _selectColor(
                        context,
                        currentColor,
                        (newColor) => bloc.add(
                          UpdateColorSchemeEvent.chane(item.schemeKey, newColor),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectColor(
    BuildContext context,
    Color initial,
    void Function(Color) onSelected,
  ) async {
    final result = await showDialog<Color?>(
      context: context,
      useRootNavigator: false,
      builder: (context) => Center(
        child: ColorPicker(
          initialColor: initial,
          onDeclineColor: () => Navigator.of(context).pop(),
          onAcceptColor: (color) => Navigator.of(context).pop(color),
        ),
      ),
    );

    if (result != null) onSelected(result);
  }

  void _showImportJsonDialog(BuildContext context, UpdateThemCubit bloc) {
    showDialog(
      context: context,
      builder: (dialogContext) => _JsonImportDialog(
        onImport: (jsonMap) => bloc.add(UpdateColorSchemeEvent.importJson(jsonMap)),
      ),
    );
  }
}

class _JsonImportDialog extends StatefulWidget {
  const _JsonImportDialog({
    required this.onImport,
  });

  final ValueChanged<Map<String, dynamic>> onImport;

  @override
  State<_JsonImportDialog> createState() => _JsonImportDialogState();
}

class _JsonImportDialogState extends State<_JsonImportDialog> {
  final TextEditingController _controller = TextEditingController();

  static const String _exampleJson = '''
{
  "primary": "#0D1B2A",
  "onPrimary": "#FFFFFF",
  "secondary": "#078A89",
  "surface": "#0F1722"
}
''';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Import Color JSON'),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  leading: const Icon(Icons.info_outline, size: 20),
                  title: const Text(
                    'Show expected structure',
                    style: TextStyle(fontSize: 14),
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                        ),
                      ),
                      width: double.infinity,
                      child: const SelectableText(
                        _exampleJson,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              TextField(
                controller: _controller,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Paste JSON here...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => _handleImportPressed(context),
          child: const Text('Import'),
        ),
      ],
    );
  }

  void _handleImportPressed(BuildContext context) {
    try {
      final text = _controller.text;
      if (text.isEmpty) return;

      final dynamic decoded = jsonDecode(text);
      if (decoded is Map<String, dynamic>) {
        widget.onImport(decoded);
        Navigator.of(context).pop();
      } else {
        _showErrorSnackBar(context, 'Invalid JSON format: Expected a Map.');
      }
    } catch (e) {
      _showErrorSnackBar(context, 'JSON Parsing Error: $e');
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
