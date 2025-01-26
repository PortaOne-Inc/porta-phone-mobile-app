import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/exports/exports.dart';
import 'package:webtrit_phone/extensions/extensions.dart';

class SettingSectionItem extends StatelessWidget {
  const SettingSectionItem({
    required this.section,
    required this.onToggleItemEnabled,
    required this.onReorderItems,
    super.key,
  });

  final AppConfigSettingsSection section;
  final void Function(AppConfigSettingsItem) onToggleItemEnabled;
  final void Function(int, int) onReorderItems;

  @override
  Widget build(BuildContext context) {
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
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'enable_disable',
                      child: Text(item.enabled ? 'Disable' : 'Enable'),
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
