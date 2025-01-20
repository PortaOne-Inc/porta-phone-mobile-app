import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_phone/extensions/extensions.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../../bloc/update_theme_cubit.dart';

class MainConfigWidget extends StatefulWidget {
  const MainConfigWidget({
    required this.mainConfig,
    required this.onChange,
    super.key,
  });

  final AppConfigMain mainConfig;
  final ObjectCallback<AppConfigMain> onChange;

  @override
  State<MainConfigWidget> createState() => _MainConfigWidgetState();
}

class _MainConfigWidgetState extends State<MainConfigWidget> {
  final List<AppConfigBottomMenuTab> _activeTabs = List.from([]);
  final List<AppConfigBottomMenuTab> _removedTabs = [];

  @override
  void initState() {
    for (final tab in widget.mainConfig.bottomMenu.tabs) {
      if (tab.enabled) {
        _activeTabs.add(tab);
      } else {
        _removedTabs.add(tab);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UpdateThemCubit>().state;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BorderContainer(
            title: 'Bottom Menu',
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Cache Selected Tab',
                    style: textTheme.titleMedium,
                  ),
                  value: state.appConfig.mainConfig.bottomMenu.cacheSelectedTab,
                  onChanged: (it) {},
                ),
                Divider(
                  color: colorScheme.primary.withValues(alpha: .25),
                ),
                Text(
                  'Configuration tabs',
                  style: textTheme.titleMedium,
                ),
                SizedBox(
                  height: 200,
                  child: ReorderableListView(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final item = _activeTabs.removeAt(oldIndex);
                        _activeTabs.insert(newIndex, item);
                        _updateAppConfig();
                      });
                    },
                    children: _activeTabs.asMap().entries.map((entry) {
                      final index = entry.key;
                      final tab = entry.value;
                      return Padding(
                        key: ValueKey(tab.type),
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
                                            icon: Icon(Icons.edit, size: 16, color: colorScheme.onSurface),
                                            onPressed: () => {}),
                                        IconButton(
                                          icon: Icon(Icons.close, size: 16, color: colorScheme.error),
                                          onPressed: () => _removeTab(index),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      child: Container(
                                        width: 96,
                                        height: 96,
                                        padding: const EdgeInsets.all(8),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  tab.icon.toIconData(),
                                                ),
                                                Text(
                                                  tab.type,
                                                  maxLines: 1,
                                                  style: textTheme.labelMedium,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Edit icon
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                if (_removedTabs.isNotEmpty) ...[
                  Text(
                    'Removed Tabs',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _removedTabs.map((tab) {
                      return GestureDetector(
                        onTap: () => _restoreTab(tab),
                        child: Chip(
                          label: Text(tab.type),
                        ),
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

  void _removeTab(int index) {
    setState(() {
      final removedTab = _activeTabs.removeAt(index);
      _removedTabs.add(removedTab);
      _updateAppConfig();
    });
  }

  void _restoreTab(AppConfigBottomMenuTab tab) {
    setState(() {
      _removedTabs.remove(tab);
      _activeTabs.add(tab);
      _updateAppConfig();
    });
  }

  void _updateAppConfig() {
    final newMainConfig = widget.mainConfig.copyWith(
      bottomMenu: widget.mainConfig.bottomMenu.copyWith(
        tabs: _activeTabs,
      ),
    );
    widget.onChange(newMainConfig);
  }
}
