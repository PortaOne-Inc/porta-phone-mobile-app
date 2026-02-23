import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/app/route/app_route_consts.dart';
import '../bloc/embeds_cubit.dart';

class EmbedsScreen extends StatefulWidget {
  const EmbedsScreen({super.key});

  @override
  State<EmbedsScreen> createState() => _EmbedsScreenState();
}

class _EmbedsScreenState extends State<EmbedsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EmbedsCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<EmbedsCubit, EmbedsState>(
          listenWhen: (p, n) =>
              p.deleteError != n.deleteError && n.deleteError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Delete failed: ${state.deleteError}')),
            );
          },
        ),
        BlocListener<EmbedsCubit, EmbedsState>(
          listenWhen: (p, n) =>
              p.createError != n.createError && n.createError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Create failed: ${state.createError}')),
            );
          },
        ),
        BlocListener<EmbedsCubit, EmbedsState>(
          listenWhen: (p, n) =>
              p.updateError != n.updateError && n.updateError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Update failed: ${state.updateError}')),
            );
          },
        ),
      ],
      child: BlocBuilder<EmbedsCubit, EmbedsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Embeds', style: t.titleSmall),
              actions: [
                IconButton(
                  tooltip: 'Refresh',
                  icon: Icon(Icons.refresh, color: cs.primary),
                  onPressed: () => context.read<EmbedsCubit>().load(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: state.creating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.add),
              label: const Text('Add'),
              onPressed: state.creating
                  ? null
                  : () async {
                      final created = await showDialog<_EmbedEditorResult>(
                        context: context,
                        builder: (_) => const _EmbedEditorDialog(),
                      );
                      if (context.mounted && created != null) {
                        await context.read<EmbedsCubit>().createEmbed(
                          uri: created.uri,
                          type: created.type,
                          attributes: created.attributes,
                          payload: created.payload,
                          enableConsoleLogCapture:
                              created.enableConsoleLogCapture,
                          reconnectStrategy: created.reconnectStrategy,
                        );
                      }
                    },
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, EmbedsState state) {
    switch (state.status) {
      case EmbedsStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case EmbedsStatus.failure:
        return _ErrorView(
          message: state.errorMessage ?? 'Failed to load embeds.',
          onRetry: () => context.read<EmbedsCubit>().load(),
        );
      case EmbedsStatus.loaded:
        if (state.items.isEmpty) {
          return _EmptyView(
            onRefresh: () => context.read<EmbedsCubit>().load(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: state.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final embed = state.items[index];
              final id = embed.id!;
              final isDeleting = state.deletingIds.contains(id);
              final isUpdating = state.updatingIds.contains(id);

              return _EmbedTile(
                model: embed,
                isDeleting: isDeleting,
                isUpdating: isUpdating,
                onTap: () {
                  context.pushNamed(
                    AppRoutInfo.applicationEmbedsManage.name,
                    pathParameters: {
                      AppRoutInfo.keyApplicationId: context
                          .read<EmbedsCubit>()
                          .applicationId,
                      AppRoutInfo.keyEmbedsId: id,
                    },
                  );
                },
                onEdit: isUpdating
                    ? null
                    : () async {
                        final updated = await showDialog<_EmbedEditorResult>(
                          context: context,
                          builder: (_) => _EmbedEditorDialog(existing: embed),
                        );
                        if (updated != null && context.mounted) {
                          await context.read<EmbedsCubit>().updateEmbed(
                            id: id,
                            uri: updated.uri,
                            type: updated.type,
                            attributes: updated.attributes,
                            payload: updated.payload,
                            enableConsoleLogCapture:
                                updated.enableConsoleLogCapture,
                            reconnectStrategy: updated.reconnectStrategy,
                          );
                        }
                      },
                onDelete: isDeleting
                    ? null
                    : () => context.read<EmbedsCubit>().deleteEmbed(id),
              );
            },
          ),
        );
      case EmbedsStatus.initial:
        return const SizedBox.shrink();
    }
  }
}

class _EmbedTile extends StatelessWidget {
  const _EmbedTile({
    required this.model,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    this.isDeleting = false,
    this.isUpdating = false,
  });

  final EmbeddedResourceModel model;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isDeleting;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    final canOpen = _canOpenInBrowser(model.uri);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 108,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: cs.surface,
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Stack(
          children: [
            Positioned.fill(child: _ResourceCardBackground(type: model.type)),
            Positioned(
              top: 8,
              left: 8,
              bottom: 8,
              child: _LeftIconAndBadges(model: model),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 72), // offset for the left block
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _displayLabelFromUri(model.uri),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: t.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            model.uri,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: t.bodySmall?.copyWith(
                              color: t.bodySmall?.color?.withValues(
                                alpha: 0.75,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'type: ${model.type.name} · payload: ${model.payload.length} · attrs: ${model.attributes.length}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: t.bodySmall?.copyWith(
                              color: t.bodySmall?.color?.withValues(
                                alpha: 0.75,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Single menu button on the right with all actions
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton<_TileMenuAction>(
                  tooltip: 'More',
                  icon: const Icon(Icons.more_vert),
                  onSelected: (action) => _handleMenuAction(
                    context,
                    action,
                    model.uri,
                    onEdit,
                    onDelete,
                    isUpdating,
                    isDeleting,
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        enabled: onEdit != null && !isUpdating,
                        value: _TileMenuAction.edit,
                        child: ListTile(
                          dense: true,
                          leading: const Icon(Icons.edit),
                          title: Text(isUpdating ? 'Updating…' : 'Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        enabled: onDelete != null && !isDeleting,
                        value: _TileMenuAction.delete,
                        child: ListTile(
                          dense: true,
                          leading: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          title: Text(isDeleting ? 'Deleting…' : 'Delete'),
                        ),
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                        value: _TileMenuAction.copy,
                        child: ListTile(
                          dense: true,
                          leading: Icon(Icons.link),
                          title: Text('Copy link'),
                        ),
                      ),
                      PopupMenuItem(
                        enabled: canOpen,
                        value: _TileMenuAction.open,
                        child: ListTile(
                          dense: true,
                          leading: const Icon(Icons.open_in_new),
                          title: Text(
                            canOpen ? 'Open in browser' : 'Cannot open',
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LeftIconAndBadges extends StatelessWidget {
  const _LeftIconAndBadges({required this.model});

  final EmbeddedResourceModel model;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final typeIcon = switch (model.type) {
      EmbeddedResourceModelType.terms => Icons.description_outlined,
      EmbeddedResourceModelType.unknown => Icons.link_outlined,
    };

    return SizedBox(
      width: 64,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            decoration: BoxDecoration(
              color: cs.surface.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(typeIcon, size: 22, color: cs.onSurfaceVariant),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4,
            runSpacing: 4,
            children: [
              _TypeChip(type: model.type),
              if (model.enableConsoleLogCapture)
                _Badge(
                  background: cs.secondaryContainer,
                  foreground: cs.onSecondaryContainer,
                  child: const Icon(Icons.bug_report, size: 12),
                ),
              if ((model.reconnectStrategy ?? '').isNotEmpty)
                _LabeledBadge(
                  label: model.reconnectStrategy!,
                  background: cs.tertiaryContainer,
                  foreground: cs.onTertiaryContainer,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _TileMenuAction { edit, delete, copy, open }

Future<void> _handleMenuAction(
  BuildContext context,
  _TileMenuAction action,
  String uri,
  VoidCallback? onEdit,
  VoidCallback? onDelete,
  bool isUpdating,
  bool isDeleting,
) async {
  switch (action) {
    case _TileMenuAction.edit:
      if (!isUpdating && onEdit != null) onEdit();
    case _TileMenuAction.delete:
      if (!isDeleting && onDelete != null) onDelete();
    case _TileMenuAction.copy:
      await _copyLink(context, uri);
    case _TileMenuAction.open:
      await _openInBrowser(context, uri);
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
    return Container(
      decoration: BoxDecoration(
        color: base.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(12),
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

bool _canOpenInBrowser(String uri) {
  try {
    final u = Uri.parse(uri);
    return u.scheme == 'http' || u.scheme == 'https';
  } catch (_) {
    return false;
  }
}

Future<void> _copyLink(BuildContext context, String uri) async {
  await Clipboard.setData(ClipboardData(text: uri));
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Link copied')));
  }
}

Future<void> _openInBrowser(BuildContext context, String uri) async {
  try {
    final parsed = Uri.parse(uri);
    final ok = await launchUrl(parsed, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to open link')));
    }
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid link')));
    }
  }
}

String _displayLabelFromUri(String uri) {
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

class _EmptyView extends StatelessWidget {
  const _EmptyView({required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.topic_outlined, size: 48),
          const SizedBox(height: 8),
          Text('No embeds yet', style: t.titleMedium),
          const SizedBox(height: 4),
          Text('Tap refresh or create a new one.', style: t.bodySmall),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            label: const Text('Reload'),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
            const SizedBox(height: 8),
            Text('Something went wrong', style: t.titleMedium),
            const SizedBox(height: 4),
            Text(message, style: t.bodySmall, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---- Editor dialog (create / edit) ----

class _EmbedEditorResult {
  _EmbedEditorResult({
    required this.uri,
    required this.type,
    required this.attributes,
    required this.payload,
    required this.enableConsoleLogCapture,
    required this.reconnectStrategy,
  });

  final String uri;
  final EmbeddedResourceModelType type;
  final Map<String, dynamic> attributes;
  final List<String> payload;
  final bool enableConsoleLogCapture;
  final String? reconnectStrategy;
}

class _EmbedEditorDialog extends StatefulWidget {
  const _EmbedEditorDialog({this.existing});

  final EmbeddedResourceModel? existing;

  @override
  State<_EmbedEditorDialog> createState() => _EmbedEditorDialogState();
}

class _EmbedEditorDialogState extends State<_EmbedEditorDialog> {
  final _formKey = GlobalKey<FormState>();
  final _uriCtrl = TextEditingController();
  final _attrsCtrl = TextEditingController(text: '{}');
  final _payloadCtrl = TextEditingController();
  final _reconnectCtrl = TextEditingController();
  bool _captureLogs = false;
  late EmbeddedResourceModelType _type;

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      final e = widget.existing!;
      _uriCtrl.text = e.uri;
      _type = e.type;
      _attrsCtrl.text = jsonEncode(e.attributes.isEmpty ? {} : e.attributes);
      _payloadCtrl.text = e.payload.join(', ');
      _captureLogs = e.enableConsoleLogCapture;
      _reconnectCtrl.text = e.reconnectStrategy ?? '';
    } else {
      _type = EmbeddedResourceModelType.unknown;
    }
  }

  @override
  void dispose() {
    _uriCtrl.dispose();
    _attrsCtrl.dispose();
    _payloadCtrl.dispose();
    _reconnectCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;

    return AlertDialog(
      title: Text(isEdit ? 'Edit embed' : 'Create embedded resource'),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 460,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _uriCtrl,
                  decoration: const InputDecoration(labelText: 'URI'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<EmbeddedResourceModelType>(
                  initialValue: _type,
                  decoration: const InputDecoration(labelText: 'Type'),
                  items: EmbeddedResourceModelType.values
                      .map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.name)),
                      )
                      .toList(),
                  onChanged: (v) => setState(
                    () => _type = v ?? EmbeddedResourceModelType.unknown,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _attrsCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Attributes (JSON)',
                  ),
                  maxLines: 4,
                  validator: (v) {
                    try {
                      final text = v?.trim() ?? '';
                      if (text.isEmpty) return null;
                      final decoded = jsonDecode(text);
                      if (decoded is Map<String, dynamic>) return null;
                      return 'Must be a JSON object';
                    } catch (_) {
                      return 'Invalid JSON';
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _payloadCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Payload (comma separated)',
                  ),
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Enable console log capture'),
                  value: _captureLogs,
                  onChanged: (v) => setState(() => _captureLogs = v),
                ),
                TextFormField(
                  controller: _reconnectCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Reconnect strategy (optional)',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            if (!(_formKey.currentState?.validate() ?? false)) return;
            final attrs = _safeJsonObject(_attrsCtrl.text);
            final payload = _payloadCtrl.text
                .split(',')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .toList();
            Navigator.of(context).pop(
              _EmbedEditorResult(
                uri: _uriCtrl.text.trim(),
                type: _type,
                attributes: attrs,
                payload: payload,
                enableConsoleLogCapture: _captureLogs,
                reconnectStrategy: _reconnectCtrl.text.trim().isEmpty
                    ? null
                    : _reconnectCtrl.text.trim(),
              ),
            );
          },
          child: Text(isEdit ? 'Save' : 'Create'),
        ),
      ],
    );
  }

  Map<String, dynamic> _safeJsonObject(String src) {
    final text = src.trim();
    if (text.isEmpty) return {};
    try {
      final decoded = jsonDecode(text);
      if (decoded is Map<String, dynamic>) return decoded;
      return {};
    } catch (_) {
      return {};
    }
  }
}
