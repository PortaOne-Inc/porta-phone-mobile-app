import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';

import '../bloc/manage_embeds_cubit.dart';

class ManageEmbedsScreen extends StatefulWidget {
  const ManageEmbedsScreen({super.key});

  @override
  State<ManageEmbedsScreen> createState() => _ManageEmbedsScreenState();
}

class _ManageEmbedsScreenState extends State<ManageEmbedsScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<ManageEmbedsCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<ManageEmbedsCubit, ManageEmbedsState>(
          listenWhen: (p, n) =>
              p.createError != n.createError && n.createError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Create failed: ${state.createError}')),
            );
          },
        ),
        BlocListener<ManageEmbedsCubit, ManageEmbedsState>(
          listenWhen: (p, n) =>
              p.deleteError != n.deleteError && n.deleteError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Delete failed: ${state.deleteError}')),
            );
          },
        ),
      ],
      child: BlocBuilder<ManageEmbedsCubit, ManageEmbedsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Manage Embeds', style: t.titleSmall),
              actions: [
                IconButton(
                  tooltip: 'Refresh',
                  icon: Icon(Icons.refresh, color: cs.primary),
                  onPressed: () => context.read<ManageEmbedsCubit>().load(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: state.creating
                  ? null
                  : () => _openCreateDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('New'),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ManageEmbedsState state) {
    switch (state.status) {
      case ManageEmbedsStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case ManageEmbedsStatus.failure:
        return _ErrorView(
          message: state.error ?? 'Failed to load embeds.',
          onRetry: () => context.read<ManageEmbedsCubit>().load(),
        );
      case ManageEmbedsStatus.loaded:
        if (state.items.isEmpty) {
          return _EmptyView(
            onRefresh: () => context.read<ManageEmbedsCubit>().load(),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: state.items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final item = state.items[i];
            final isDeleting = state.deletingIds.contains(item.id);
            return ListTile(
              leading: const Icon(Icons.extension),
              title: Text(
                item.uri,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'type: ${item.type.name} • payload: ${item.payload.length} • attrs: ${item.attributes.length}',
              ),
              trailing: IconButton(
                tooltip: 'Delete',
                onPressed: isDeleting
                    ? null
                    : () => context.read<ManageEmbedsCubit>().delete(item.id!),
                icon: isDeleting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.delete, color: Colors.redAccent),
              ),
            );
          },
        );
      case ManageEmbedsStatus.initial:
        return const SizedBox.shrink();
    }
  }

  Future<void> _openCreateDialog(BuildContext context) async {
    final created = await showDialog<_CreateEmbedResult>(
      context: context,
      builder: (ctx) => const _CreateEmbedDialog(),
    );
    if (!context.mounted || created == null) return;

    await context.read<ManageEmbedsCubit>().create(
      uri: created.uri,
      type: created.type,
      attributes: created.attributes,
      payload: created.payload,
      enableConsoleLogCapture: created.enableConsoleLogCapture,
      reconnectStrategy: created.reconnectStrategy,
    );
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

class _CreateEmbedResult {
  _CreateEmbedResult({
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

class _CreateEmbedDialog extends StatefulWidget {
  const _CreateEmbedDialog();

  @override
  State<_CreateEmbedDialog> createState() => _CreateEmbedDialogState();
}

class _CreateEmbedDialogState extends State<_CreateEmbedDialog> {
  final _formKey = GlobalKey<FormState>();
  final _uriCtrl = TextEditingController();
  EmbeddedResourceModelType _type = EmbeddedResourceModelType.unknown;
  final _attrsCtrl = TextEditingController(text: '{}');
  final _payloadCtrl = TextEditingController();
  bool _captureLogs = false;
  final _reconnectCtrl = TextEditingController();

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
    final t = Theme.of(context).textTheme;

    return AlertDialog(
      title: const Text('Create embedded resource'),
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
                      final decoded = (v?.trim().isEmpty ?? true)
                          ? <String, dynamic>{}
                          : jsonDecode(v!);
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
                const SizedBox(height: 8),
                Text(
                  'Tip: attributes accept any JSON object. Payload is an array (comma-separated here).',
                  style: t.bodySmall,
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
              _CreateEmbedResult(
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
          child: const Text('Create'),
        ),
      ],
    );
  }

  Map<String, dynamic> _safeJsonObject(String src) {
    if (src.trim().isEmpty) return {};
    final decoded = jsonDecode(src);
    if (decoded is Map<String, dynamic>) return decoded;
    return {};
  }
}
