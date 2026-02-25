import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

class CopyThemeToApplicationResult {
  const CopyThemeToApplicationResult({
    required this.targetApplicationId,
    required this.targetApplicationName,
    this.title,
    this.description,
    this.label,
  });

  final String targetApplicationId;
  final String targetApplicationName;
  final String? title;
  final String? description;
  final String? label;
}

class CopyThemeToApplicationDialog extends StatefulWidget {
  const CopyThemeToApplicationDialog({
    required this.currentApplicationId,
    required this.applications,
    this.sourceTitle,
    super.key,
  });

  final String currentApplicationId;
  final List<ApplicationModel> applications;
  final String? sourceTitle;

  static Future<CopyThemeToApplicationResult?> show(
    BuildContext context, {
    required String currentApplicationId,
    required List<ApplicationModel> applications,
    String? sourceTitle,
  }) {
    return showDialog<CopyThemeToApplicationResult>(
      context: context,
      builder: (_) => CopyThemeToApplicationDialog(
        currentApplicationId: currentApplicationId,
        applications: applications,
        sourceTitle: sourceTitle,
      ),
    );
  }

  @override
  State<CopyThemeToApplicationDialog> createState() =>
      _CopyThemeToApplicationDialogState();
}

class _CopyThemeToApplicationDialogState
    extends State<CopyThemeToApplicationDialog> {
  late final List<ApplicationModel> _availableApps = widget.applications
      .where((a) => a.id != widget.currentApplicationId)
      .toList();

  ApplicationModel? _selectedApp;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  String _label = 'dev';

  static const _labels = ['dev', 'stage', 'prod'];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noApps = _availableApps.isEmpty;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: const Text('Copy to Application'),
      content: SizedBox(
        width: 400,
        child: noApps
            ? const Text('No other applications available.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<ApplicationModel>(
                    decoration: const InputDecoration(
                      labelText: 'Target Application',
                      border: OutlineInputBorder(),
                    ),
                    initialValue: _selectedApp,
                    items: _availableApps
                        .map(
                          (app) => DropdownMenuItem(
                            value: app,
                            child: Text(app.name ?? app.id ?? '—'),
                          ),
                        )
                        .toList(),
                    onChanged: (app) => setState(() => _selectedApp = app),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title (optional)',
                      hintText: widget.sourceTitle != null
                          ? '${widget.sourceTitle} (Copy)'
                          : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Label',
                      border: OutlineInputBorder(),
                    ),
                    initialValue: _label,
                    items: _labels
                        .map(
                          (l) => DropdownMenuItem(value: l, child: Text(l)),
                        )
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _label = v);
                    },
                  ),
                ],
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: noApps || _selectedApp == null ? null : _onCopy,
          child: const Text('Copy'),
        ),
      ],
    );
  }

  void _onCopy() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    Navigator.of(context).pop(
      CopyThemeToApplicationResult(
        targetApplicationId: _selectedApp!.id!,
        targetApplicationName: _selectedApp!.name ?? _selectedApp!.id!,
        title: title.isEmpty ? null : title,
        description: description.isEmpty ? null : description,
        label: _label,
      ),
    );
  }
}
