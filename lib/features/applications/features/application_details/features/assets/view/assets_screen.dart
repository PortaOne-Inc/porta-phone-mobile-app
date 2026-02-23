import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../bloc/assets_cubit.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AssetsCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return MultiBlocListener(
      listeners: [
        BlocListener<AssetsCubit, AssetsState>(
          listenWhen: (prev, curr) =>
              prev.creating != curr.creating ||
              prev.createError != curr.createError ||
              prev.assets.length != curr.assets.length,
          listener: (context, state) {
            if (state.creating) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Creating asset...'),
                  duration: Duration(milliseconds: 800),
                ),
              );
            } else if (state.createError != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Create failed: ${state.createError}')),
              );
            }
          },
        ),
        BlocListener<AssetsCubit, AssetsState>(
          listenWhen: (prev, curr) =>
              prev.deleting != curr.deleting ||
              prev.deleteError != curr.deleteError,
          listener: (context, state) {
            if (state.deleting) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Deleting asset...'),
                  duration: Duration(milliseconds: 800),
                ),
              );
            } else if (state.deleteError != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Delete failed: ${state.deleteError}')),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<AssetsCubit, AssetsState>(
        builder: (context, state) {
          final title = Text('Assets', style: textTheme.titleSmall);

          return Scaffold(
            appBar: AppBar(
              title: title,
              actions: [
                IconButton(
                  tooltip: 'Refresh',
                  icon: Icon(Icons.refresh, color: colorScheme.primary),
                  onPressed: () => context.read<AssetsCubit>().load(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: state.creating ? null : () => _onAddPressed(context),
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Future<void> _onAddPressed(BuildContext context) async {
    await context.read<AssetsCubit>().pickAndUpload();
  }

  Widget _buildBody(BuildContext context, AssetsState state) {
    if (state.status == AssetsStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == AssetsStatus.failure) {
      return _ErrorView(
        message: state.errorMessage ?? 'Failed to load assets.',
        onRetry: () => context.read<AssetsCubit>().load(),
      );
    }

    if (state.assets.isEmpty) {
      return _EmptyView(onRefresh: () => context.read<AssetsCubit>().load());
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: state.assets.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          final asset = state.assets[index];
          final isDeleting =
              state.deleting && state.deletingAssetId == asset.id;

          return _AssetTile(
            asset: asset,
            isDeleting: isDeleting,
            onDownload: () => asset.downloadUrl?.launchAsUrl(),
            onDelete: () => context.read<AssetsCubit>().deleteAsset(asset.id),
          );
        },
      ),
    );
  }
}

class _AssetTile extends StatelessWidget {
  const _AssetTile({
    required this.asset,
    required this.onDownload,
    required this.onDelete,
    this.isDeleting = false,
  });

  final AssetModel asset;
  final VoidCallback onDownload;
  final VoidCallback onDelete;
  final bool isDeleting;

  bool get _isImage => asset.mimeType.toLowerCase().startsWith('image/');

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final url = asset.downloadUrl;
    final hasUrl = url != null && url.isNotEmpty;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Preview
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: hasUrl
                    ? MimeAwareImage(
                        resource: MimeImageResource.fromUrl(
                          url,
                          mimeType: asset.mimeType,
                        ),
                      )
                    : Container(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withValues(alpha: 0.5),
                        alignment: Alignment.center,
                        child: Icon(
                          _isImage ? Icons.image : Icons.insert_drive_file,
                          size: 40,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),

            // Meta + actions
            Row(
              children: [
                Expanded(
                  child: Text(
                    _filenameFromPath(asset.storagePath),
                    style: t.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: hasUrl ? onDownload : null,
                  tooltip: 'Download',
                ),
                IconButton(
                  icon: isDeleting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: isDeleting ? null : onDelete,
                  tooltip: 'Delete',
                ),
              ],
            ),
            Text('MIME: ${asset.mimeType}', style: t.bodySmall),
            Text('Size: ${_humanSize(asset.size)}', style: t.bodySmall),
            if ((asset.refCount) > 0)
              Text('Used by: ${asset.refCount}', style: t.bodySmall),
          ],
        ),
      ),
    );
  }

  String _filenameFromPath(String path) {
    final idx = path.lastIndexOf('/');
    return idx >= 0 ? path.substring(idx + 1) : path;
  }

  String _humanSize(int bytes) {
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var s = bytes.toDouble();
    var i = 0;
    while (s >= 1024 && i < units.length - 1) {
      s /= 1024;
      i++;
    }
    return '${s.toStringAsFixed(s < 10 && i > 0 ? 1 : 0)} ${units[i]}';
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
          const Icon(Icons.folder_open, size: 48),
          const SizedBox(height: 8),
          Text('No assets yet', style: t.titleMedium),
          const SizedBox(height: 4),
          Text('Pull to refresh or add new assets.', style: t.bodySmall),
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
