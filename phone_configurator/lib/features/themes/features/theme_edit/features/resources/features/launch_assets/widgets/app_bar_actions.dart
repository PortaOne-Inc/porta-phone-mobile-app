import 'package:flutter/material.dart';

class LaunchAssetsAppBarActions extends StatelessWidget {
  const LaunchAssetsAppBarActions({
    required this.saving,
    required this.loading,
    required this.onDelete,
    required this.onPickForeground,
    required this.onPickBackground,
    required this.onSave,
    super.key,
  });

  final bool saving;
  final bool loading;
  final VoidCallback onDelete;
  final VoidCallback onPickForeground;
  final VoidCallback onPickBackground;
  final Future<void> Function() onSave;

  bool get _disabled => loading || saving;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Clean launcher icons (no image).',
          onPressed: _disabled ? null : onDelete,
          icon: const Icon(Icons.delete_outlined),
        ),
        IconButton(
          tooltip: 'Pick foreground (SVG/PNG)',
          onPressed: _disabled ? null : onPickForeground,
          icon: const Icon(Icons.image),
        ),
        IconButton(
          tooltip: 'Pick background (optional)',
          onPressed: _disabled ? null : onPickBackground,
          icon: const Icon(Icons.layers),
        ),
        IconButton(
          tooltip: 'Save',
          onPressed: _disabled ? null : () async => onSave(),
          icon: saving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.save),
        ),
      ],
    );
  }
}
