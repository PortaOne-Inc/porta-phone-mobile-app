import 'dart:convert';

import 'package:flutter/material.dart';

class JsonImportDialog extends StatefulWidget {
  const JsonImportDialog({
    required this.onImport,
    super.key,
  });

  final ValueChanged<Map<String, dynamic>> onImport;

  @override
  State<JsonImportDialog> createState() => _JsonImportDialogState();
}

class _JsonImportDialogState extends State<JsonImportDialog> {
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
