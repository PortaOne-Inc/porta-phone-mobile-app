import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../widgets/widgets.dart';

class SettingSchemeScreen extends StatefulWidget {
  const SettingSchemeScreen({
    required this.config,
    required this.callback,
    required this.assets,
    super.key,
  });

  final AppConfigSettings config;
  final ValueChanged<AppConfigSettings> callback;
  final List<ThemeAssetModel> assets;

  @override
  _SettingSchemeScreenState createState() => _SettingSchemeScreenState();
}

class _SettingSchemeScreenState extends State<SettingSchemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final colorScheme = themeData.colorScheme;

    return SimpleScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: _manageSection,
              icon: const Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Add section',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ReorderableListView(
        shrinkWrap: true,
        buildDefaultDragHandles: false,
        physics: const NeverScrollableScrollPhysics(),
        onReorder: _reorderSections,
        children: List.generate(widget.config.sections.length, (sectionIndex) {
          final section = widget.config.sections[sectionIndex];

          return Visibility(
            key: ValueKey(section.titleL10n),
            visible: section.enabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GroupTitleListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        titleData: section.titleL10n,
                        style: textTheme.titleMedium,
                        backgroundColor: colorScheme.primaryFixed.withAlpha(12),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PopupMenuButton<String>(
                              onSelected: (value) async => _manageSectionItemMenu(value, section),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'remove',
                                  child: ListTile(
                                    title: Text('Remove section'),
                                    leading: Icon(Icons.delete),
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'add',
                                  child: ListTile(
                                    title: Text('Add embedded item'),
                                    leading: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            ReorderableDragStartListener(
                              index: sectionIndex,
                              child: const Icon(Icons.drag_handle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SettingSectionItem(
                  section: section,
                  onReorderItems: (previous, now) => _reorderItemsInSection(section, previous, now),
                  onToggleItemEnabled: _toggleItemEnabled,
                ),
                const Divider(),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _manageSectionItemMenu(String value, AppConfigSettingsSection section) {
    if (value == 'remove') {
      _removeSection(section);
    } else if (value == 'add') {
      unawaited(_manageSectionItem());
    }
  }

  Future<void> _manageSection() async {
    final result = await GoRouter.of(context)
        .pushNamed<AppConfigSettingsSection>(SchemeRoute.appFeatureSchemeAddSettingSection.name);

    if (result != null) _addSection(result);
  }

  Future<void> _manageSectionItem() async {
    final result = await GoRouter.of(context)
        .pushNamed<AppConfigSettingsItem>(SchemeRoute.appFeatureSchemeAddSettingSectionItem.name);

    if (result != null) _addItemToSection(widget.config.sections.first, result);
  }

  void _updateSections(List<AppConfigSettingsSection> updatedSections) {
    widget.callback(widget.config.copyWith(sections: updatedSections));
  }

  void _addSection(AppConfigSettingsSection section) {
    _updateSections([...widget.config.sections, section]);
  }

  void _removeSection(AppConfigSettingsSection section) {
    _updateSections(
        widget.config.sections.where((existingSection) => existingSection.titleL10n != section.titleL10n).toList());
  }

  void _addItemToSection(AppConfigSettingsSection section, AppConfigSettingsItem item) {
    _updateSections(widget.config.sections.map((s) {
      if (s.titleL10n == section.titleL10n) {
        return s.copyWith(items: [...s.items, item]);
      }
      return s;
    }).toList());
  }

  void _reorderSections(int oldIndex, int newIndex) {
    final adjustedIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final updatedSections = [...widget.config.sections];
    final movedSection = updatedSections.removeAt(oldIndex);
    updatedSections.insert(adjustedIndex, movedSection);
    _updateSections(updatedSections);
  }

  void _reorderItemsInSection(AppConfigSettingsSection section, int oldIndex, int newIndex) {
    final adjustedIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final updatedItems = [...section.items];
    final movedItem = updatedItems.removeAt(oldIndex);
    updatedItems.insert(adjustedIndex, movedItem);

    _updateSections(widget.config.sections.map((s) {
      if (s.titleL10n == section.titleL10n) {
        return s.copyWith(items: updatedItems);
      }
      return s;
    }).toList());
  }

  void _toggleItemEnabled(AppConfigSettingsItem action) {
    _updateSections(widget.config.sections.map((section) {
      return section.copyWith(
        items: section.items.map((item) {
          if (item.titleL10n == action.titleL10n) {
            return item.copyWith(enabled: !item.enabled);
          }
          return item;
        }).toList(),
      );
    }).toList());
  }
}
