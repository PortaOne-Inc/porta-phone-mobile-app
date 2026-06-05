import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

/// The inner list widget that displays draggable items within a section.
class SettingSectionItemList extends StatefulWidget {
  const SettingSectionItemList({
    required this.section,
    required this.onReorderItems,
    required this.onToggleItemEnabled,
    required this.onEditItem,
    required this.onDeleteItem,
    super.key,
  });

  final AppConfigSettingsSection section;
  final void Function(int oldIndex, int newIndex) onReorderItems;
  final ValueChanged<AppConfigSettingsItem> onToggleItemEnabled;
  final ValueChanged<AppConfigSettingsItem> onEditItem;
  final ValueChanged<AppConfigSettingsItem> onDeleteItem;

  @override
  State<SettingSectionItemList> createState() => _SettingSectionItemListState();
}

class _SettingSectionItemListState extends State<SettingSectionItemList> {
  // Using a controller to prevent scroll state preservation issues in nested lists
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(keepScrollOffset: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.section.items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'No items in this section',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: ReorderableListView.builder(
        // This key isolates the list state from the ExpansionTile state
        key: PageStorageKey('${widget.section.titleL10n}_list'),
        // The controller prevents scroll restoration errors (bool vs double type mismatch)
        scrollController: _controller,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        buildDefaultDragHandles: false,
        padding: EdgeInsets.zero,
        itemCount: widget.section.items.length,
        proxyDecorator: (child, index, animation) {
          return Material(
            elevation: 4,
            color: Colors.transparent,
            shadowColor: Colors.black26,
            child: child,
          );
        },
        onReorderItem: widget.onReorderItems,
        itemBuilder: (context, index) {
          final item = widget.section.items[index];

          return ListTile(
            key: ValueKey(item.titleL10n),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            dense: true,
            title: Text(item.titleL10n),
            leading: Checkbox(
              value: item.enabled,
              onChanged: (_) => widget.onToggleItemEnabled(item),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  onPressed: () => widget.onEditItem(item),
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20),
                  onPressed: () => widget.onDeleteItem(item),
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8),
                ),
                ReorderableDragStartListener(
                  index: index,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.drag_handle),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
