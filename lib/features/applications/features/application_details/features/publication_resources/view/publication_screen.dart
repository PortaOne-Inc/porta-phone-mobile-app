import 'package:domain/models/applications/publication_resource_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/publication_resources_cubit.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key});

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PublicationResourcesCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<PublicationResourcesCubit, PublicationResourcesState>(
          listenWhen: (p, n) =>
              p.createError != n.createError && n.createError != null,
          listener: (_, s) =>
              _snack(context, 'Create failed: ${s.createError}'),
        ),
        BlocListener<PublicationResourcesCubit, PublicationResourcesState>(
          listenWhen: (p, n) =>
              p.updateError != n.updateError && n.updateError != null,
          listener: (_, s) =>
              _snack(context, 'Update failed: ${s.updateError}'),
        ),
        BlocListener<PublicationResourcesCubit, PublicationResourcesState>(
          listenWhen: (p, n) =>
              p.deleteError != n.deleteError && n.deleteError != null,
          listener: (_, s) =>
              _snack(context, 'Delete failed: ${s.deleteError}'),
        ),
      ],
      child: BlocBuilder<PublicationResourcesCubit, PublicationResourcesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Publication resources', style: t.titleSmall),
              actions: [
                IconButton(
                  tooltip: 'Refresh',
                  icon: Icon(Icons.refresh, color: cs.primary),
                  onPressed: () =>
                      context.read<PublicationResourcesCubit>().load(),
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

  Widget _buildBody(BuildContext context, PublicationResourcesState state) {
    switch (state.status) {
      case PubResStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case PubResStatus.failure:
        return _ErrorView(
          message: state.error ?? 'Failed to load publication resources.',
          onRetry: () => context.read<PublicationResourcesCubit>().load(),
        );
      case PubResStatus.loaded:
        if (state.items.isEmpty) {
          return _EmptyView(
            onRefresh: () => context.read<PublicationResourcesCubit>().load(),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: state.items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final item = state.items[i];
            final id = item.id;
            final isDeleting = state.deletingIds.contains(id);
            final isUpdating = state.updatingIds.contains(id);

            return ListTile(
              leading: const Icon(Icons.description_outlined),
              title: Text(
                item.title?.isNotEmpty ?? true
                    ? item.title!
                    : (item.url ?? 'Untitled'),
              ),
              subtitle: Text(
                [
                  if (item.url?.isNotEmpty ?? true) 'url: ${item.url}',
                  if (item.note?.isNotEmpty ?? true) 'note: ${item.note}',
                  if (item.text?.isNotEmpty ?? true)
                    'text: ${_short(item.text!, 60)}',
                ].join(' • '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Wrap(
                spacing: 4,
                children: [
                  IconButton(
                    tooltip: 'Edit',
                    onPressed: isUpdating
                        ? null
                        : () async {
                            final result = await showDialog<_EditorResult>(
                              context: context,
                              builder: (_) => _EditorDialog(existing: item),
                            );
                            if (result != null && context.mounted) {
                              await context
                                  .read<PublicationResourcesCubit>()
                                  .update(
                                    id,
                                    title: result.title,
                                    url: result.url,
                                    note: result.note,
                                    text: result.text,
                                  );
                            }
                          },
                    icon: isUpdating
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.edit),
                  ),
                  IconButton(
                    tooltip: 'Delete',
                    onPressed: isDeleting
                        ? null
                        : () => context
                              .read<PublicationResourcesCubit>()
                              .delete(id),
                    icon: isDeleting
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.delete, color: Colors.redAccent),
                  ),
                ],
              ),
            );
          },
        );
      case PubResStatus.initial:
        return const SizedBox.shrink();
    }
  }

  Future<void> _openCreateDialog(BuildContext context) async {
    final result = await showDialog<_EditorResult>(
      context: context,
      builder: (_) => const _EditorDialog(),
    );
    if (!context.mounted || result == null) return;
    await context.read<PublicationResourcesCubit>().create(
      title: result.title,
      url: result.url,
      note: result.note,
      text: result.text,
    );
  }

  void _snack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg)));
  }

  String _short(String s, int max) =>
      s.length <= max ? s : '${s.substring(0, max)}…';
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
          Text('No publication resources yet', style: t.titleMedium),
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

/// ===== Create/Edit dialog =====

class _EditorResult {
  _EditorResult({this.title, this.url, this.note, this.text});

  final String? title;
  final String? url;
  final String? note;
  final String? text;
}

class _EditorDialog extends StatefulWidget {
  const _EditorDialog({this.existing});

  final PublicationResourceModel? existing;

  @override
  State<_EditorDialog> createState() => _EditorDialogState();
}

class _EditorDialogState extends State<_EditorDialog> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _url = TextEditingController();
  final _note = TextEditingController();
  final _text = TextEditingController();

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _title.text = e.title ?? '';
      _url.text = e.url ?? '';
      _note.text = e.note ?? '';
      _text.text = e.text ?? '';
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _url.dispose();
    _note.dispose();
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.existing != null;
    return AlertDialog(
      title: Text(
        isEdit ? 'Edit publication resource' : 'Create publication resource',
      ),
      content: Form(
        key: _form,
        child: SizedBox(
          width: 480,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _url,
                  decoration: const InputDecoration(labelText: 'URL'),
                  keyboardType: TextInputType.url,
                  validator: (v) {
                    final s = v?.trim() ?? '';
                    if (s.isEmpty) return null; // URL optional
                    final ok = Uri.tryParse(s)?.hasAbsolutePath ?? false;
                    return ok ? null : 'Invalid URL';
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _note,
                  decoration: const InputDecoration(labelText: 'Note'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _text,
                  decoration: const InputDecoration(labelText: 'Text'),
                  minLines: 3,
                  maxLines: 6,
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
            if (!(_form.currentState?.validate() ?? false)) return;
            Navigator.of(context).pop(
              _EditorResult(
                title: _title.text.trim().isEmpty ? null : _title.text.trim(),
                url: _url.text.trim().isEmpty ? null : _url.text.trim(),
                note: _note.text.trim().isEmpty ? null : _note.text.trim(),
                text: _text.text.trim().isEmpty ? null : _text.text.trim(),
              ),
            );
          },
          child: Text(isEdit ? 'Save' : 'Create'),
        ),
      ],
    );
  }
}
