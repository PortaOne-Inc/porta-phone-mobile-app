import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';
import 'setting_section_item_list.dart';

/// A widget representing a single expandable section in the list.
class SectionTile extends StatelessWidget {
  const SectionTile({
    required super.key,
    required this.index,
    required this.section,
    required this.controller,
    required this.onAddSectionItem,
    required this.onEditItem,
  });

  final int index;
  final AppConfigSettingsSection section;
  final SchemeEditorController controller;
  final VoidCallback onAddSectionItem;
  final ValueChanged<AppConfigSettingsItem> onEditItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        // Suffix added to key to avoid conflict with ScrollPosition storage
        key: PageStorageKey('${section.titleL10n}_expansion'),
        shape: Border.all(color: Colors.transparent),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: theme.colorScheme.surfaceContainerLow,
        leading: ReorderableDragStartListener(
          index: index,
          child: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.drag_handle),
          ),
        ),
        title: Text(section.titleL10n, style: theme.textTheme.titleMedium),
        trailing: _buildActionMenu(),
        children: [
          const Divider(height: 1),
          SettingSectionItemList(
            section: section,
            onReorderItems: (oldIdx, newIdx) =>
                controller.reorderItems(section, oldIdx, newIdx),
            onToggleItemEnabled: (item) => controller.updateItem(
              section,
              item,
              item.copyWith(enabled: !item.enabled),
            ),
            onDeleteItem: (item) => controller.removeItem(section, item),
            onEditItem: onEditItem,
          ),
        ],
      ),
    );
  }

  Widget _buildActionMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'remove') controller.removeSection(section);
        if (value == 'add') onAddSectionItem();
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'add',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.add),
            title: Text('Add Item'),
          ),
        ),
        const PopupMenuItem(
          value: 'remove',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('Remove Section', style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
