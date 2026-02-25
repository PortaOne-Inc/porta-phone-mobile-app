import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/app/route/app_route_consts.dart';

import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/features/themes/features/theme_history/theme_history.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  const PageThemeEdit({
    required this.title,
    required this.children,
    required this.getIt,
    super.key,
  });

  final String title;
  final List<Router<dynamic>> children;
  final GetIt getIt;

  @override
  State<PageThemeEdit> createState() => _PageThemeEditState();
}

class _PageThemeEditState extends State<PageThemeEdit> {
  UpdateThemCubit get _cubit => BlocProvider.of<UpdateThemCubit>(context);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<UpdateThemCubit, UpdateThemeState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: ListTile(
              title: Text(
                'Theme configuration',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                state.loadingStatusText(),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              Tooltip(
                message: 'Fetch latest theme from server',
                child: TextButton.icon(
                  icon: const Icon(Icons.update),
                  label: const Text('Update'),
                  onPressed:
                      state.isProgress || state.syncStatus == SyncStatus.syncing
                      ? null
                      : () => _cubit.add(const InitializeEvent()),
                ),
              ),
              _buildSyncIndicator(state),
              ThemeModeSwitcher(
                themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
                onThemeChange: (mode) =>
                    context.read<CommonBloc>().setThemeMode(mode),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                const VersionInfo(),
                ListTile(
                  title: Text(
                    state.theme?.title ?? '...',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.arrow_back_ios),
                  title: const Text('Application details'),
                  subtitle: Text(state.applicationModel?.name ?? '...'),
                  onTap: () => _openApplicationDetailsCollection(
                    context,
                    state.applicationModel?.id ?? '',
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Applications'),
                  onTap: () => _openApplicationCollection(context),
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text('History'),
                  onTap: () => _openThemeHistory(
                    context,
                    _cubit.applicationId,
                    _cubit.themeId,
                  ),
                ),
                const Divider(),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),
          body: ThemeShellRoute(
            child: ResizableColumns(
              orientation: ResizableOrientation.horizontal,
              dividerColor: colorScheme.surfaceContainerLow,
              dividerThickness: 4,
              minChildSize: 200,
              initialProportions: const [.65, .35],
              children: widget.children
                  .map(
                    (child) =>
                        (_) => child,
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSyncIndicator(UpdateThemeState state) {
    final isBusy = state.isProgress || state.syncStatus == SyncStatus.syncing;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: 'Create a history snapshot',
          child: TextButton.icon(
            icon: const Icon(Icons.camera_alt_outlined),
            label: const Text('Snapshot'),
            onPressed: isBusy ? null : () => _showCreateSnapshotDialog(context),
          ),
        ),
        _buildSyncAction(state, isBusy),
      ],
    );
  }

  Widget _buildSyncAction(UpdateThemeState state, bool isBusy) {
    switch (state.syncStatus) {
      case SyncStatus.syncing:
        return Tooltip(
          message: 'Saving changes...',
          child: TextButton.icon(
            icon: const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            label: const Text('Saving...'),
            onPressed: null,
          ),
        );
      case SyncStatus.synced:
        return Tooltip(
          message: 'All changes saved',
          child: TextButton.icon(
            icon: const Icon(Icons.check_circle, color: Colors.green),
            label: const Text('Saved'),
            onPressed: null,
          ),
        );
      case SyncStatus.failed:
        return Tooltip(
          message: 'Save failed — tap to retry',
          child: TextButton.icon(
            icon: const Icon(Icons.error_outline, color: Colors.red),
            label: const Text('Failed'),
            onPressed: () => _cubit.add(const SyncConfigEvent()),
          ),
        );
      case SyncStatus.partiallyFailed:
        return Tooltip(
          message: 'Some configs failed to save — tap for details',
          child: TextButton.icon(
            icon: const Icon(Icons.warning_amber, color: Colors.orange),
            label: const Text('Partial Save'),
            onPressed: () => _showPartialSyncDialog(context, state),
          ),
        );
      case SyncStatus.conflict:
        return Tooltip(
          message: 'Version conflict — tap to resolve',
          child: TextButton.icon(
            icon: const Icon(Icons.warning, color: Colors.orange),
            label: const Text('Conflict'),
            onPressed: () => _showConflictDialog(context),
          ),
        );
      case SyncStatus.idle:
        return Tooltip(
          message: 'Save all changes',
          child: TextButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save'),
            onPressed: isBusy
                ? null
                : () => _cubit.add(const SyncConfigEvent()),
          ),
        );
    }
  }

  void _showConflictDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Theme was modified by another user'),
        content: const Text(
          'Your changes conflict with remote changes. '
          'Reload to get the latest version?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _cubit.add(const InitializeEvent());
            },
            child: const Text('Reload'),
          ),
        ],
      ),
    );
  }

  void _showCreateSnapshotDialog(BuildContext context) {
    final tagController = TextEditingController();
    final descController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (ctx) => _CreateSnapshotDialog(
        getIt: widget.getIt,
        tagController: tagController,
        descController: descController,
        onSubmit: (tag, description) async {
          try {
            final usecase = widget.getIt.get<GetThemeHistoryUsecase>();
            await usecase.createSnapshot(
              applicationId: _cubit.applicationId,
              themeId: _cubit.themeId,
              tag: tag,
              description: description,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Snapshot created')));
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to create snapshot: $e')),
              );
            }
          }
        },
      ),
    );
  }

  void _handleStateChanges(BuildContext context, UpdateThemeState state) {
    if (state.status == ThemePropertyStatus.error) {
      _showErrorDialog(context, state.error);
    }
  }

  void _showPartialSyncDialog(BuildContext context, UpdateThemeState state) {
    final detail = state.syncDetail;

    Widget statusRow(String label, ConfigSyncResult result) {
      final IconData icon;
      final Color color;
      switch (result) {
        case ConfigSyncResult.success:
          icon = Icons.check_circle;
          color = Colors.green;
        case ConfigSyncResult.failed:
          icon = Icons.error_outline;
          color = Colors.red;
        case ConfigSyncResult.conflict:
          icon = Icons.warning;
          color = Colors.orange;
        case ConfigSyncResult.pending:
          icon = Icons.hourglass_empty;
          color = Colors.grey;
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      );
    }

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Partial Save Results'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            statusRow('Feature access', detail.featureAccess),
            statusRow('Color scheme', detail.colorScheme),
            statusRow('Page config', detail.pageConfig),
            statusRow('Widget config', detail.widgetConfig),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Dismiss'),
          ),
          if (detail.hasFailures)
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                _cubit.add(
                  SyncConfigEvent(retryOnly: detail.failedNames.toSet()),
                );
              },
              child: const Text('Retry Failed'),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _cubit.add(const SyncConfigEvent());
            },
            child: const Text('Retry All'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, Object? error) {
    final displayError = (error is ThemeIsNotValidException)
        ? 'The theme is not valid.'
        : error ?? 'An error occurred.';

    final errorSource = _cubit.state.errorSource;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) => FailureDialog(
        error: displayError,
        onRetry: errorSource != null
            ? () => _cubit.add(ResourcesEvent.retryStream(errorSource))
            : null,
      ),
    );
  }

  void _openApplicationDetailsCollection(
    BuildContext context,
    String applicationId,
  ) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.applicationDetails.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
    );
  }

  void _openApplicationCollection(BuildContext context) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
  }

  void _openThemeHistory(
    BuildContext context,
    String applicationId,
    String themeId,
  ) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider<ThemeHistoryCubit>(
          create: (_) => ThemeHistoryCubit(
            getThemeHistoryUsecase: widget.getIt.get(),
            applicationId: applicationId,
            themeId: themeId,
          ),
          child: const ThemeHistoryPage(),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
    Navigator.pop(context);
  }
}

class _CreateSnapshotDialog extends StatefulWidget {
  const _CreateSnapshotDialog({
    required this.getIt,
    required this.tagController,
    required this.descController,
    required this.onSubmit,
  });

  final GetIt getIt;
  final TextEditingController tagController;
  final TextEditingController descController;
  final void Function(String? tag, String? description) onSubmit;

  @override
  State<_CreateSnapshotDialog> createState() => _CreateSnapshotDialogState();
}

class _CreateSnapshotDialogState extends State<_CreateSnapshotDialog> {
  List<PhoneBranch>? _branches;
  bool _loadingBranches = true;

  @override
  void initState() {
    super.initState();
    _fetchBranches();
  }

  Future<void> _fetchBranches() async {
    try {
      final usecase = widget.getIt.get<GetPhoneBranchesUsecase>();
      final branches = await usecase.execute();
      if (mounted) {
        setState(() {
          _branches = branches;
          _loadingBranches = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _loadingBranches = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Snapshot'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Create a history snapshot of the current theme state.'),
          const SizedBox(height: 12),
          if (_loadingBranches)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: LinearProgressIndicator(),
            )
          else if (_branches != null && _branches!.isNotEmpty)
            Autocomplete<String>(
              optionsBuilder: (textEditingValue) {
                final query = textEditingValue.text.toLowerCase();
                final names = _branches!.map((b) => b.name).toList();
                if (query.isEmpty) return names;
                return names.where((n) => n.toLowerCase().contains(query));
              },
              onSelected: (value) => widget.tagController.text = value,
              fieldViewBuilder: (context, controller, focusNode, onSubmitted) {
                // Sync with external controller
                controller.addListener(() {
                  widget.tagController.text = controller.text;
                });
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Tag (branch)',
                    hintText: 'Select or type a branch name',
                  ),
                );
              },
            )
          else
            TextField(
              controller: widget.tagController,
              decoration: const InputDecoration(
                labelText: 'Tag',
                hintText: 'e.g. release-1.0',
              ),
            ),
          const SizedBox(height: 12),
          TextField(
            controller: widget.descController,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Optional description',
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            final tag = widget.tagController.text.trim();
            final desc = widget.descController.text.trim();
            widget.onSubmit(
              tag.isEmpty ? null : tag,
              desc.isEmpty ? null : desc,
            );
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
