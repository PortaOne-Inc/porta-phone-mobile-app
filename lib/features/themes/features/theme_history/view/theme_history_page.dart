import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import '../bloc/theme_history_cubit.dart';

class ThemeHistoryPage extends StatelessWidget {
  const ThemeHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme History')),
      body: BlocBuilder<ThemeHistoryCubit, ThemeHistoryState>(
        builder: (context, state) {
          return switch (state.status) {
            ThemeHistoryStatus.initial ||
            ThemeHistoryStatus.loading =>
              const Center(child: CircularProgressIndicator()),
            ThemeHistoryStatus.failure => _FailureView(
                message: state.errorMessage ?? 'Failed to load history',
                onRetry: () =>
                    context.read<ThemeHistoryCubit>().load(),
              ),
            ThemeHistoryStatus.loaded => state.items.isEmpty
                ? const _EmptyView()
                : _HistoryList(
                    items: state.items,
                    isLoadingMore: state.isLoadingMore,
                    hasMore: state.nextCursor != null,
                    onLoadMore: () =>
                        context.read<ThemeHistoryCubit>().loadMore(),
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
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
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
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        title: Text(entry.action),
        subtitle: Text(
          [
            if (entry.changedBy != null) 'by ${entry.changedBy}',
            _formatDate(entry.createdAt),
          ].join(' · '),
        ),
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
