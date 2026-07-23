import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

/// Manages the state and logic for modifying the App Configuration Scheme.
/// Handles adding, removing, updating, and reordering sections and items.
class SchemeEditorController {
  SchemeEditorController({required this.config, required this.onUpdate});

  final AppConfigSettings config;
  final ValueChanged<AppConfigSettings> onUpdate;

  /// Appends a new section to the configuration.
  void addSection(AppConfigSettingsSection section) {
    _emit(config.copyWith(sections: [...config.sections, section]));
  }

  /// Removes a specific section based on its localized title.
  void removeSection(AppConfigSettingsSection section) {
    final updated = config.sections
        .where((s) => s.titleL10n != section.titleL10n)
        .toList();
    _emit(config.copyWith(sections: updated));
  }

  /// Toggles the enabled state of a section.
  void toggleSectionEnabled(AppConfigSettingsSection section) {
    _updateSection(section, (s) => s.copyWith(enabled: !s.enabled));
  }

  /// Reorders sections within the main list.
  void reorderSections(int oldIndex, int newIndex) {
    if (oldIndex < 0 || oldIndex >= config.sections.length) return;

    final sections = [...config.sections];
    final item = sections.removeAt(oldIndex);
    sections.insert(newIndex, item);

    _emit(config.copyWith(sections: sections));
  }

  /// Adds a new item to a specific target section.
  void addItemToSection(
    AppConfigSettingsSection targetSection,
    AppConfigSettingsItem item,
  ) {
    _updateSection(targetSection, (s) => s.copyWith(items: [...s.items, item]));
  }

  /// Updates an existing item within a specific section.
  void updateItem(
    AppConfigSettingsSection targetSection,
    AppConfigSettingsItem oldItem,
    AppConfigSettingsItem newItem,
  ) {
    _updateSection(targetSection, (s) {
      final newItems = s.items
          .map((i) => i.titleL10n == oldItem.titleL10n ? newItem : i)
          .toList();
      return s.copyWith(items: newItems);
    });
  }

  /// Removes an item from a specific section.
  void removeItem(
    AppConfigSettingsSection targetSection,
    AppConfigSettingsItem item,
  ) {
    _updateSection(targetSection, (s) {
      final newItems = s.items
          .where((i) => i.titleL10n != item.titleL10n)
          .toList();
      return s.copyWith(items: newItems);
    });
  }

  /// Reorders items within a specific section.
  void reorderItems(
    AppConfigSettingsSection targetSection,
    int oldIndex,
    int newIndex,
  ) {
    _updateSection(targetSection, (s) {
      if (oldIndex < 0 || oldIndex >= s.items.length) return s;

      final items = [...s.items];
      final movedItem = items.removeAt(oldIndex);
      items.insert(newIndex, movedItem);

      return s.copyWith(items: items);
    });
  }

  // Helper method to find a section and apply modifications to it.
  void _updateSection(
    AppConfigSettingsSection target,
    AppConfigSettingsSection Function(AppConfigSettingsSection) modifier,
  ) {
    final updatedSections = config.sections.map((s) {
      return s.titleL10n == target.titleL10n ? modifier(s) : s;
    }).toList();
    _emit(config.copyWith(sections: updatedSections));
  }

  void _emit(AppConfigSettings newConfig) {
    onUpdate(newConfig);
  }
}
