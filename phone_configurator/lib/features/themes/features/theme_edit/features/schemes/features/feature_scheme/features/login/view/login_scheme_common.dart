import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class LoginSchemeCommon extends StatefulWidget {
  const LoginSchemeCommon({
    required this.config,
    required this.callback,
    super.key,
  });

  final AppConfigLoginCommon? config;
  final ObjectCallback<AppConfigLoginCommon> callback;

  @override
  State<LoginSchemeCommon> createState() => _LoginSchemeCommonState();
}

class _LoginSchemeCommonState extends State<LoginSchemeCommon> {
  bool get _isEmbedded =>
      widget.config?.fullScreenLaunchEmbeddedResourceId?.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final selectedEmbed = context
        .read<UpdateThemCubit>()
        .state
        .embeddedResources
        .firstWhereOrNull(
          (it) => it.id == widget.config?.fullScreenLaunchEmbeddedResourceId,
        );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ModeStatusBar(
          isEmbedded: _isEmbedded,
          onClearToNative: _isEmbedded ? _setNative : null,
        ),
        const SizedBox(height: 16),
        Text(
          'What the user sees first on app start.',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Embedded first screen (WebView)',
            style: theme.textTheme.titleMedium,
          ),
        ),
        Text(
          'Pick an embedded resource to use it as the first screen. '
          'Remove it to switch back to native.',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: !_isEmbedded
              ? _EmptyEmbeddedCard(onAdd: _pickEmbedded)
              : _SelectedEmbeddedCard(
                  title: selectedEmbed?.displayLabel() ?? 'Selected embedded',
                  onChange: _pickEmbedded,
                  onRemove: _setNative,
                ),
        ),
      ],
    );
  }

  void _setNative() {
    final current = widget.config;
    if (current == null) return;
    if (current.fullScreenLaunchEmbeddedResourceId == null) return;
    widget.callback(current.copyWith(fullScreenLaunchEmbeddedResourceId: null));
  }

  Future<void> _pickEmbedded() async {
    final selectedEmbed = context
        .read<UpdateThemCubit>()
        .state
        .embeddedResources;
    final picked = await EmbedPickerDialog.show(
      context,
      title: 'Select embedded resource',
      items: selectedEmbed,
    );
    if (picked != null && picked.isNotEmpty) {
      final current = widget.config;
      if (current == null) return;
      widget.callback(
        current.copyWith(fullScreenLaunchEmbeddedResourceId: picked.first.id),
      );
    }
  }
}

class _ModeStatusBar extends StatelessWidget {
  const _ModeStatusBar({required this.isEmbedded, this.onClearToNative});

  final bool isEmbedded;
  final VoidCallback? onClearToNative;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = isEmbedded ? 'Mode: Embedded' : 'Mode: Native';
    final icon = isEmbedded ? Icons.web : Icons.phone_android;
    final bg = isEmbedded
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.secondaryContainer;
    final fg = isEmbedded
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSecondaryContainer;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isEmbedded
              ? theme.colorScheme.primary
              : theme.colorScheme.secondary,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: fg),
          const SizedBox(width: 10),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: fg,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: fg.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              isEmbedded ? 'WebView' : 'Material',
              style: theme.textTheme.labelSmall?.copyWith(color: fg),
            ),
          ),
          const Spacer(),
          if (isEmbedded && onClearToNative != null)
            TextButton.icon(
              onPressed: onClearToNative,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Remove embedded'),
              style: TextButton.styleFrom(foregroundColor: fg),
            ),
        ],
      ),
    );
  }
}

class _EmptyEmbeddedCard extends StatelessWidget {
  const _EmptyEmbeddedCard({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      key: const ValueKey('embedded-empty'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.web_asset_outlined, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'No embedded first screen selected',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Add embedded'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedEmbeddedCard extends StatelessWidget {
  const _SelectedEmbeddedCard({
    required this.title,
    required this.onChange,
    required this.onRemove,
  });

  final String title;
  final VoidCallback onChange;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      key: const ValueKey('embedded-selected'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.web, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: onChange,
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Change'),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Remove'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'This embedded resource will be shown as the first screen.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
