import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_phone/extensions/extensions.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class MainConfigWidget extends StatefulWidget {
  const MainConfigWidget({
    required this.mainConfig,
    required this.onChange,
    required this.onCacheSelectedTabChange,
    super.key,
  });

  final AppConfigMain mainConfig;
  final ObjectCallback<AppConfigMain> onChange;
  final ObjectCallback<bool> onCacheSelectedTabChange;

  @override
  State<MainConfigWidget> createState() => _MainConfigWidgetState();
}

class _MainConfigWidgetState extends State<MainConfigWidget> {
  final List<BottomMenuTabScheme> _activeTabs = [];
  final List<BottomMenuTabScheme> _removedTabs = [];

  @override
  void initState() {
    for (final tab in widget.mainConfig.bottomMenu.tabs) {
      addTabToLocalState(tab);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BorderContainer(
            title: 'Common  configuration',
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Cache Selected Tab',
                    style: textTheme.titleMedium,
                  ),
                  value: widget.mainConfig.bottomMenu.cacheSelectedTab,
                  onChanged: (it) => widget.onCacheSelectedTabChange(it),
                ),
              ],
            ),
          ),
          Divider(color: colorScheme.primary.withValues(alpha: .25)),
          BorderContainer(
            title: 'Manage tabs',
            trailing: TextButton(
              onPressed: _addTab,
              child: const Text('Add tab'),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: ReorderableListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) newIndex -= 1;
                        final item = _activeTabs.removeAt(oldIndex);
                        _activeTabs.insert(newIndex, item);
                        _updateAppConfig();
                      });
                    },
                    children: _activeTabs.asMap().entries.map((entry) {
                      final index = entry.key;
                      final tab = entry.value;
                      return Padding(
                        key: ValueKey('tab_${index}_${_tabLabel(tab)}'),
                        padding: EdgeInsets.zero,
                        child: SizedBox(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: colorScheme.onSurface,
                                          ),
                                          onPressed: () =>
                                              _manageBottomMenuTab(index, tab),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            size: 16,
                                            color: colorScheme.error,
                                          ),
                                          onPressed: () => _removeTab(index),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Container(
                                        width: 96,
                                        height: 96,
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(_tabIcon(tab)),
                                              Text(
                                                _tabLabel(tab),
                                                maxLines: 1,
                                                style: textTheme.labelMedium,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                if (_removedTabs.isNotEmpty) ...[
                  Text('Disabled Tabs', style: textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _removedTabs.map((tab) {
                      return GestureDetector(
                        onTap: () => _restoreTab(tab),
                        child: Chip(label: Text(_tabLabel(tab))),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addTab() async {
    final result = await GoRouter.of(context).pushNamed<BottomMenuTabScheme?>(
      SchemeRoute.appFeatureSchemeMainManageTab.name,
    );
    if (result != null) {
      addTabToLocalState(result);
      _sync();
    }
  }

  void _sync() {
    widget.onChange(
      widget.mainConfig.copyWith(
        bottomMenu: widget.mainConfig.bottomMenu.copyWith(tabs: _activeTabs),
      ),
    );
  }

  void addTabToLocalState(BottomMenuTabScheme tab) {
    if (_isEnabled(tab)) {
      _activeTabs.add(tab);
    } else {
      _removedTabs.add(tab);
    }
  }

  Future<void> _manageBottomMenuTab(int index, BottomMenuTabScheme tab) async {
    final result = await GoRouter.of(context).pushNamed<BottomMenuTabScheme?>(
      SchemeRoute.appFeatureSchemeMainManageTab.name,
      extra: tab,
    );
    if (result != null) {
      _activeTabs[index] = result;
      _sync();
    }
  }

  void _removeTab(int index) {
    setState(() {
      final removedTab = _activeTabs.removeAt(index);
      _removedTabs.add(removedTab);
      _updateAppConfig();
    });
  }

  void _restoreTab(BottomMenuTabScheme tab) {
    setState(() {
      _removedTabs.remove(tab);
      _activeTabs.add(tab);
      _updateAppConfig();
    });
  }

  void _updateAppConfig() {
    final newMainConfig = widget.mainConfig.copyWith(
      bottomMenu: widget.mainConfig.bottomMenu.copyWith(tabs: _activeTabs),
    );
    widget.onChange(newMainConfig);
  }

  // ---------- helpers ----------
  bool _isEnabled(BottomMenuTabScheme tab) => tab.map(
    favorites: (t) => t.enabled,
    recents: (t) => t.enabled,
    contacts: (t) => t.enabled,
    keypad: (t) => t.enabled,
    messaging: (t) => t.enabled,
    embedded: (t) => t.enabled,
  );

  String _tabLabel(BottomMenuTabScheme tab) => tab.map(
    favorites: (_) => 'favorites',
    recents: (_) => 'recents',
    contacts: (_) => 'contacts',
    keypad: (_) => 'keypad',
    messaging: (_) => 'messaging',
    embedded: (_) => 'embedded',
  );

  IconData _tabIcon(BottomMenuTabScheme tab) => tab.map(
    favorites: (t) => t.icon.toIconData(),
    recents: (t) => t.icon.toIconData(),
    contacts: (t) => t.icon.toIconData(),
    keypad: (t) => t.icon.toIconData(),
    messaging: (t) => t.icon.toIconData(),
    embedded: (t) => t.icon.toIconData(),
  );
}
