import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_phone/extensions/extensions.dart';

class SettingSectionItem extends StatelessWidget {
  const SettingSectionItem({
    required this.section,
    required this.onEditItem,
    required this.onToggleItemEnabled,
    required this.onReorderItems,
    required this.onDeleteItem,
    super.key,
  });

  final AppConfigSettingsSection section;
  final void Function(AppConfigSettingsItem) onToggleItemEnabled;
  final void Function(AppConfigSettingsItem) onEditItem;
  final void Function(AppConfigSettingsItem) onDeleteItem;
  final void Function(int, int) onReorderItems;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ReorderableListView.builder(
      shrinkWrap: true,
      buildDefaultDragHandles: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: section.items.length,
      itemBuilder: (context, itemIndex) {
        final item = section.items[itemIndex];
        return Visibility(
          key: ValueKey('${section.titleL10n}_$itemIndex'),
          visible: item.enabled || !item.enabled,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: Icon(item.icon.toIconData()),
            title: Text(item.titleL10n),
            subtitle: Wrap(
              children: [
                Text('Type: ${item.type}'),
                const SizedBox(width: 8),
                Text('Enabled: ${item.enabled}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'enable_disable') {
                      onToggleItemEnabled(item);
                    }
                    if (value == 'edit') {
                      onEditItem(item);
                    }
                    if (value == 'delete') {
                      onDeleteItem(item);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                        'Edit',
                        style: textTheme.labelMedium,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'enable_disable',
                      child: Text(
                        item.enabled ? 'Disable' : 'Enable',
                        style: textTheme.labelMedium,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(
                        'Delete',
                        style: textTheme.labelMedium?.copyWith(color: colorScheme.error),
                      ),
                    ),
                  ],
                ),
                ReorderableDragStartListener(
                  index: itemIndex,
                  child: const Icon(Icons.drag_handle),
                ),
              ],
            ),
            onTap: () {
              if (item.enabled) {
                // Handle navigation or action
              }
            },
          ),
        );
      },
      onReorder: onReorderItems,
    );
  }
}
