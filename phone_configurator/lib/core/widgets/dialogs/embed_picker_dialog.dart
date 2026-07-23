import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:domain/domain.dart';

/// Shows a dialog with a grid of embedded resources to pick from.
/// Returns a List<EmbeddedResourceModel> (empty if cancelled).
class EmbedPickerDialog extends StatefulWidget {
  const EmbedPickerDialog({
    required this.items,
    super.key,
    this.title = 'Select embedded resources',
    this.multiSelect = false,
    this.initialSelectedIds = const <String>{},
    this.crossAxisCount = 4,
  });

  final List<EmbeddedResourceModel> items;

  final String title;
  final bool multiSelect;
  final Set<String> initialSelectedIds;
  final int crossAxisCount;

  static Future<List<EmbeddedResourceModel>?> show(
    BuildContext context, {
    required List<EmbeddedResourceModel> items,
    String title = 'Select embedded resources',
    bool multiSelect = false,
    Set<String> initialSelectedIds = const <String>{},
    int crossAxisCount = 4,
  }) {
    return showDialog<List<EmbeddedResourceModel>>(
      context: context,
      builder: (_) => EmbedPickerDialog(
        items: items,
        title: title,
        multiSelect: multiSelect,
        initialSelectedIds: initialSelectedIds,
        crossAxisCount: crossAxisCount,
      ),
    );
  }

  static Future<List<EmbeddedResourceModel>?> showFromFuture(
    BuildContext context, {
    required Future<List<EmbeddedResourceModel>> futureItems,
    String title = 'Select embedded resources',
    bool multiSelect = false,
    Set<String> initialSelectedIds = const <String>{},
    int crossAxisCount = 4,
  }) {
    return showDialog<List<EmbeddedResourceModel>>(
      context: context,
      builder: (_) {
        return FutureBuilder<List<EmbeddedResourceModel>>(
          future: futureItems,
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
            return EmbedPickerDialog(
              items: snap.data ?? const [],
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
  State<EmbedPickerDialog> createState() => _EmbedPickerDialogState();
}

class _EmbedPickerDialogState extends State<EmbedPickerDialog> {
  late final Set<String> _selectedIds = {
    ...widget.initialSelectedIds,
  }.intersection(widget.items.map((e) => e.id).whereType<String>().toSet());

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
          itemCount: widget.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, i) {
            final item = widget.items[i];
            final id = item.id ?? item.uri; // fallback if id is absent
            final selected = _selectedIds.contains(id);

            final canOpen = _canOpenInBrowser(item.uri);

            return InkWell(
              onTap: () => _onTap(id),
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  // Background thumb (iconic representation)
                  Positioned.fill(
                    child: _ResourceCardBackground(type: item.type),
                  ),

                  // Selection overlay
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

                  // Top-left actions: copy & open
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _IconCircleButton(
                          tooltip: 'Copy link',
                          icon: Icons.link,
                          onPressed: () => _copyLink(item.uri),
                        ),
                        const SizedBox(width: 6),
                        _IconCircleButton(
                          tooltip: canOpen
                              ? 'Open in browser'
                              : 'Cannot open this scheme',
                          icon: Icons.open_in_new,
                          onPressed: canOpen
                              ? () => _openInBrowser(item.uri)
                              : null,
                        ),
                      ],
                    ),
                  ),

                  // Top-right badges
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        if (selected)
                          _Badge(
                            background: cs.primary,
                            foreground: Colors.white,
                            child: const Icon(Icons.check, size: 14),
                          ),
                        _TypeChip(type: item.type),
                        if (item.enableConsoleLogCapture)
                          _Badge(
                            background: cs.secondaryContainer,
                            foreground: cs.onSecondaryContainer,
                            child: const Icon(Icons.bug_report, size: 14),
                          ),
                        if ((item.reconnectStrategy ?? '').isNotEmpty)
                          _LabeledBadge(
                            label: item.reconnectStrategy!,
                            background: cs.tertiaryContainer,
                            foreground: cs.onTertiaryContainer,
                          ),
                      ],
                    ),
                  ),

                  // Footer (domain / uri)
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _displayLabelFromUri(item.uri),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: t.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (item.uri.isNotEmpty)
                            Text(
                              item.uri,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: t.bodySmall?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                        ],
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
          onPressed: () => Navigator.of(
            context,
          ).pop<List<EmbeddedResourceModel>>(<EmbeddedResourceModel>[]),
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

  void _onTap(String id) {
    if (widget.multiSelect) {
      setState(() {
        if (_selectedIds.contains(id)) {
          _selectedIds.remove(id);
        } else {
          _selectedIds.add(id);
        }
      });
    } else {
      _selectedIds
        ..clear()
        ..add(id);
      _confirmSelection();
    }
  }

  void _confirmSelection() {
    // match by id (fallback to uri if id is null)
    final byId = <String, EmbeddedResourceModel>{};
    for (final e in widget.items) {
      final key = e.id ?? e.uri;
      byId[key] = e;
    }
    final selected = _selectedIds
        .map((id) => byId[id])
        .whereType<EmbeddedResourceModel>()
        .toList(growable: false);
    Navigator.of(context).pop<List<EmbeddedResourceModel>>(selected);
  }

  // ---- helpers

  bool _canOpenInBrowser(String uri) {
    try {
      final u = Uri.parse(uri);
      return u.scheme == 'http' || u.scheme == 'https';
    } catch (_) {
      return false;
    }
  }

  Future<void> _copyLink(String uri) async {
    await Clipboard.setData(ClipboardData(text: uri));
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Link copied')));
    }
  }

  Future<void> _openInBrowser(String uri) async {
    try {
      final parsed = Uri.parse(uri);
      final ok = await launchUrl(parsed, mode: LaunchMode.externalApplication);
      if (!ok && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to open link')));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid link')));
      }
    }
  }

  String _displayLabelFromUri(String uri) {
    // for http(s) show hostname, otherwise the last segment or the string itself
    try {
      final u = Uri.parse(uri);
      if (u.hasScheme && (u.scheme == 'http' || u.scheme == 'https')) {
        return u.host.isNotEmpty ? u.host : uri;
      }
      final idx = uri.lastIndexOf('/');
      return idx >= 0 ? uri.substring(idx + 1) : uri;
    } catch (_) {
      return uri;
    }
  }
}

class _IconCircleButton extends StatelessWidget {
  const _IconCircleButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final disabled = onPressed == null;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: disabled ? cs.surface.withValues(alpha: 0.7) : cs.surface,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              size: 16,
              color: disabled ? cs.onSurfaceVariant : cs.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _ResourceCardBackground extends StatelessWidget {
  const _ResourceCardBackground({required this.type});

  final EmbeddedResourceModelType type;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final base = switch (type) {
      EmbeddedResourceModelType.terms => cs.secondaryContainer,
      EmbeddedResourceModelType.unknown => cs.surfaceContainerHighest,
    };
    final icon = switch (type) {
      EmbeddedResourceModelType.terms => Icons.description_outlined,
      EmbeddedResourceModelType.unknown => Icons.link_outlined,
    };

    return Container(
      decoration: BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 48,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({required this.type});

  final EmbeddedResourceModelType type;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final (bg, fg, label) = switch (type) {
      EmbeddedResourceModelType.terms => (
        cs.secondaryContainer,
        cs.onSecondaryContainer,
        'terms',
      ),
      EmbeddedResourceModelType.unknown => (
        cs.surfaceContainerHigh,
        cs.onSurfaceVariant,
        'unknown',
      ),
    };
    return _LabeledBadge(label: label, background: bg, foreground: fg);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.background,
    required this.foreground,
    required this.child,
  });

  final Color background;
  final Color foreground;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: IconTheme.merge(
        data: IconThemeData(size: 14, color: foreground),
        child: child,
      ),
    );
  }
}

class _LabeledBadge extends StatelessWidget {
  const _LabeledBadge({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        label,
        style: t.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
