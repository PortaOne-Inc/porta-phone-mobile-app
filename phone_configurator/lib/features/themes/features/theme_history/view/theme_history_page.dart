import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:domain/domain.dart';

import '../bloc/theme_history_cubit.dart';

class ThemeHistoryPage extends StatelessWidget {
  const ThemeHistoryPage({super.key});

  void _showCreateSnapshotDialog(BuildContext context) {
    final tagController = TextEditingController();
    final descController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Create Snapshot'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tagController,
              decoration: const InputDecoration(labelText: 'Tag', hintText: 'e.g. release-1.0'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description', hintText: 'Optional description'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              final tag = tagController.text.trim();
              final desc = descController.text.trim();
              context.read<ThemeHistoryCubit>().createSnapshot(
                tag: tag.isEmpty ? null : tag,
                description: desc.isEmpty ? null : desc,
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme History'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.camera_alt_outlined),
            label: const Text('Create Snapshot'),
            onPressed: () => _showCreateSnapshotDialog(context),
          ),
        ],
      ),
      body: BlocBuilder<ThemeHistoryCubit, ThemeHistoryState>(
        builder: (context, state) {
          return switch (state.status) {
            ThemeHistoryStatus.initial ||
            ThemeHistoryStatus.loading => const Center(child: CircularProgressIndicator()),
            ThemeHistoryStatus.failure => _FailureView(
              message: state.errorMessage ?? 'Failed to load history',
              onRetry: () => context.read<ThemeHistoryCubit>().load(),
            ),
            ThemeHistoryStatus.loaded =>
              state.items.isEmpty
                  ? const _EmptyView()
                  : _HistoryList(
                      items: state.items,
                      isLoadingMore: state.isLoadingMore,
                      hasMore: state.nextCursor != null,
                      onLoadMore: () => context.read<ThemeHistoryCubit>().loadMore(),
                    ),
          };
        },
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.history, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No history entries yet'),
        ],
      ),
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text('Retry')),
        ],
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList({
    required this.items,
    required this.isLoadingMore,
    required this.hasMore,
    required this.onLoadMore,
  });

  final List<ThemeHistoryEntryModel> items;
  final bool isLoadingMore;
  final bool hasMore;
  final VoidCallback onLoadMore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: isLoadingMore
                  ? const CircularProgressIndicator()
                  : TextButton.icon(
                      onPressed: onLoadMore,
                      icon: const Icon(Icons.expand_more),
                      label: const Text('Load more'),
                    ),
            ),
          );
        }
        return _HistoryEntryTile(entry: items[index]);
      },
    );
  }
}

class _HistoryEntryTile extends StatelessWidget {
  const _HistoryEntryTile({required this.entry});

  final ThemeHistoryEntryModel entry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Text(
            'v${entry.snapshotVersion}',
            style: textTheme.labelSmall?.copyWith(color: colorScheme.onPrimaryContainer),
          ),
        ),
        title: Row(
          children: [
            Text(entry.action),
            if (entry.tag.isNotEmpty) ...[
              const SizedBox(width: 8),
              Chip(
                label: Text(entry.tag),
                labelStyle: textTheme.labelSmall,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
            ],
            if (entry.shareTokenId != null) ...[
              const SizedBox(width: 8),
              Tooltip(
                message: 'Has share link',
                child: Icon(Icons.link, size: 18, color: colorScheme.primary),
              ),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (entry.description.isNotEmpty) Text(entry.description),
            Text(
              [if (entry.changedBy != null) 'by ${entry.changedBy}', _formatDate(entry.createdAt)].join(' · '),
              style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (entry.shareTokenId != null) ...[
              IconButton(
                icon: const Icon(Icons.open_in_new, size: 20),
                tooltip: 'Open share link',
                onPressed: _openShareLink,
              ),
              IconButton(
                icon: const Icon(Icons.copy_outlined, size: 20),
                tooltip: 'Copy share link',
                onPressed: () => _copyShareLink(context),
              ),
            ],
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20),
              tooltip: 'Edit tag & description',
              onPressed: () => _showEditDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  String get _shareUrl => '${Uri.base.origin}/share/${entry.shareTokenId}';

  void _openShareLink() {
    launchUrl(Uri.parse(_shareUrl), mode: LaunchMode.externalApplication);
  }

  void _copyShareLink(BuildContext context) {
    Clipboard.setData(ClipboardData(text: _shareUrl));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Share link copied to clipboard')));
  }

  void _showEditDialog(BuildContext context) {
    final tagController = TextEditingController(text: entry.tag);
    final descController = TextEditingController(text: entry.description);

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit history v${entry.snapshotVersion}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tagController,
              decoration: const InputDecoration(labelText: 'Tag', hintText: 'e.g. release-1.0'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description', hintText: 'Optional description'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<ThemeHistoryCubit>().updateEntry(
                entry.id,
                tag: tagController.text,
                description: descController.text,
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate);
      return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return isoDate;
    }
  }
}
