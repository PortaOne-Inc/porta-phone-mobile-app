import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

import '../mime_image_renderer.dart';

/// Shows a dialog with a grid of image/file tiles to pick from.
/// Returns a List<AssetModel> (empty if cancelled).
class AssetPickerDialog extends StatefulWidget {
  const AssetPickerDialog({
    required this.assets,
    super.key,
    this.title = 'Select assets',
    this.multiSelect = false,
    this.initialSelectedIds = const <String>{},
    this.crossAxisCount = 4,
  });

  /// Assets to show (previews are taken from `asset.downloadUrl`).
  final List<AssetModel> assets;

  final String title;
  final bool multiSelect;
  final Set<String> initialSelectedIds;
  final int crossAxisCount;

  static Future<List<AssetModel>?> show(
    BuildContext context, {
    required List<AssetModel> assets,
    String title = 'Select assets',
    bool multiSelect = false,
    Set<String> initialSelectedIds = const <String>{},
    int crossAxisCount = 4,
  }) {
    return showDialog<List<AssetModel>>(
      context: context,
      builder: (_) => AssetPickerDialog(
        assets: assets,
        title: title,
        multiSelect: multiSelect,
        initialSelectedIds: initialSelectedIds,
        crossAxisCount: crossAxisCount,
      ),
    );
  }

  static Future<List<AssetModel>?> showFromFuture(
    BuildContext context, {
    required Future<List<AssetModel>> futureAssets,
    String title = 'Select assets',
    bool multiSelect = false,
    Set<String> initialSelectedIds = const <String>{},
    int crossAxisCount = 4,
  }) async {
    return showDialog<List<AssetModel>>(
      context: context,
      builder: (_) {
        return FutureBuilder<List<AssetModel>>(
          future: futureAssets,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.hasError) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(snap.error.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              );
            }
            return AssetPickerDialog(
              assets: snap.data ?? const [],
              title: title,
              multiSelect: multiSelect,
              initialSelectedIds: initialSelectedIds,
              crossAxisCount: crossAxisCount,
            );
          },
        );
      },
    );
  }

  @override
  State<AssetPickerDialog> createState() => _AssetPickerDialogState();
}

class _AssetPickerDialogState extends State<AssetPickerDialog> {
  late final Set<String> _selectedIds = {
    ...widget.initialSelectedIds,
  }.intersection(widget.assets.map((a) => a.id).toSet());

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: 720,
        height: 520,
        child: GridView.builder(
          itemCount: widget.assets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, i) {
            final asset = widget.assets[i];
            final selected = _selectedIds.contains(asset.id);

            final resource =
                (asset.downloadUrl != null && asset.downloadUrl!.isNotEmpty)
                ? MimeImageResource.fromUrl(
                    asset.downloadUrl!,
                    mimeType: asset.mimeType,
                  )
                : MimeImageResource.empty();

            return InkWell(
              onTap: () => _onTap(asset),
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: MimeAwareImage(
                      resource: resource,
                      fit: BoxFit.cover,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected
                              ? cs.primary
                              : Theme.of(context).dividerColor,
                          width: selected ? 3 : 1,
                        ),
                        color: selected
                            ? cs.primary.withValues(alpha: 0.08)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  if (selected)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: cs.primary,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        _filenameFromPath(asset.storagePath),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop<List<AssetModel>>(<AssetModel>[]),
          child: const Text('Cancel'),
        ),
        if (widget.multiSelect)
          FilledButton(
            onPressed: _selectedIds.isEmpty ? null : _confirmSelection,
            child: Text('Add (${_selectedIds.length})'),
          )
        else
          FilledButton(
            onPressed: _selectedIds.isEmpty ? null : _confirmSelection,
            child: const Text('Select'),
          ),
      ],
    );
  }

  void _onTap(AssetModel asset) {
    if (widget.multiSelect) {
      setState(() {
        if (_selectedIds.contains(asset.id)) {
          _selectedIds.remove(asset.id);
        } else {
          _selectedIds.add(asset.id);
        }
      });
    } else {
      _selectedIds
        ..clear()
        ..add(asset.id);
      _confirmSelection();
    }
  }

  void _confirmSelection() {
    final selected = widget.assets
        .where((a) => _selectedIds.contains(a.id))
        .toList(growable: false);
    Navigator.of(context).pop<List<AssetModel>>(selected);
  }

  String _filenameFromPath(String path) {
    final idx = path.lastIndexOf('/');
    return idx >= 0 ? path.substring(idx + 1) : path;
  }
}
