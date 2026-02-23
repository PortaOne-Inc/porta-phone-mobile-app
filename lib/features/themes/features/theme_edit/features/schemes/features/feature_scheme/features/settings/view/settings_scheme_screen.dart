import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

/// The main screen widget that displays the list of configurable sections.
class SettingSchemeScreen extends StatefulWidget {
  const SettingSchemeScreen({
    required this.config,
    required this.callback,
    super.key,
  });

  final AppConfigSettings config;
  final ValueChanged<AppConfigSettings> callback;

  @override
  State<SettingSchemeScreen> createState() => _SettingSchemeScreenState();
}

class _SettingSchemeScreenState extends State<SettingSchemeScreen> {
  late SchemeEditorController _controller;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant SettingSchemeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config != widget.config) {
      _initController();
    }
  }

  void _initController() {
    _controller = SchemeEditorController(
      config: widget.config,
      onUpdate: widget.callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: _onAddSection,
              icon: const Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('Add section', textAlign: TextAlign.center),
                  SizedBox(width: 4),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ReorderableListView.builder(
        buildDefaultDragHandles: false,
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: widget.config.sections.length,
        onReorder: _controller.reorderSections,
        itemBuilder: (context, index) {
          final section = widget.config.sections[index];

          return SectionTile(
            // Key must be unique for each item to ensure correct reordering state
            key: ValueKey(section.titleL10n),
            index: index,
            section: section,
            controller: _controller,
            onAddSectionItem: () => _onAddItem(section),
            onEditItem: (item) => _onEditItem(section, item),
          );
        },
      ),
    );
  }

  Future<void> _onAddSection() async {
    final result = await GoRouter.of(context)
        .pushNamed<AppConfigSettingsSection>(
          SchemeRoute.appFeatureSchemeAddSettingSection.name,
        );

    if (result != null && mounted) {
      _controller.addSection(result);
    }
  }

  Future<void> _onAddItem(AppConfigSettingsSection section) async {
    final result = await GoRouter.of(context).pushNamed<AppConfigSettingsItem>(
      SchemeRoute.appFeatureSchemeAddSettingSectionItem.name,
    );

    if (result != null && mounted) {
      _controller.addItemToSection(section, result);
    }
  }

  Future<void> _onEditItem(
    AppConfigSettingsSection section,
    AppConfigSettingsItem item,
  ) async {
    final result = await GoRouter.of(context).pushNamed<AppConfigSettingsItem>(
      SchemeRoute.appFeatureSchemeAddSettingSectionItem.name,
      extra: item,
    );

    if (result != null && mounted) {
      _controller.updateItem(section, item, result);
    }
  }
}
