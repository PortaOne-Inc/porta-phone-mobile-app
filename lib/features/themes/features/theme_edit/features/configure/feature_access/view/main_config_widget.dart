import 'package:data/dto/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_phone/extensions/extensions.dart';

import '../../../../bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

enum MainFlavor {
  favorites,
  recents,
  contacts,
  keypad,
  embedded1,
  embedded2,
  embedded3,
  messaging,
}

class MainConfigWidget extends StatefulWidget {
  const MainConfigWidget({super.key});

  @override
  State<MainConfigWidget> createState() => _MainConfigWidgetState();
}

class _MainConfigWidgetState extends State<MainConfigWidget> {
  final List<AppConfigBottomMenuTab> _activeTabs = List.from(defaultTabs);
  final List<AppConfigBottomMenuTab> _removedTabs = [];

  void _removeTab(int index) {
    setState(() {
      final removedTab = _activeTabs.removeAt(index);
      _removedTabs.add(removedTab);
    });
  }

  void _restoreTab(AppConfigBottomMenuTab tab) {
    setState(() {
      _removedTabs.remove(tab);
      _activeTabs.add(tab);
    });
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
        mainAxisSize: MainAxisSize.min, // To avoid unbounded height conflicts
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
}

const List<AppConfigBottomMenuTab> defaultTabs = [
  AppConfigBottomMenuTab(
    type: 'favorites',
    titleL10n: 'main_BottomNavigationBarItemLabel_favorites',
    icon: '0xe5fd',
  ),
  AppConfigBottomMenuTab(
    type: 'resents',
    titleL10n: 'main_BottomNavigationBarItemLabel_recents',
    icon: '0xe03a',
  ),
  AppConfigBottomMenuTab(
    type: 'contacts',
    titleL10n: 'main_BottomNavigationBarItemLabel_contacts',
    icon: '0xee35',
    data: {
      AppConfigBottomMenuTab.dataContactSourceTypes: ['local', 'external']
    },
  ),
  AppConfigBottomMenuTab(
    initial: true,
    type: 'keypad',
    titleL10n: 'main_BottomNavigationBarItemLabel_keypad',
    icon: '0xe1ce',
  ),
  AppConfigBottomMenuTab(
    type: 'messaging',
    titleL10n: 'main_BottomNavigationBarItemLabel_chats',
    icon: '0xe155',
  ),
  AppConfigBottomMenuTab(
    enabled: false,
    type: 'embedded1',
    titleL10n: 'embaded1TitleL10n',
    icon: '0xe2ce',
    data: {
      AppConfigBottomMenuTab.dataResource: 'https://webtrit-app.web.app/example/example_embedded_advertisement.html',
    },
  ),
  AppConfigBottomMenuTab(
    enabled: false,
    type: 'embedded2',
    titleL10n: 'embaded2TitleL10n',
    icon: '0xe2ce',
    data: {
      AppConfigBottomMenuTab.dataResource: 'https://webtrit-app.web.app/example/example_embedded_call.html',
    },
  ),
  AppConfigBottomMenuTab(
    enabled: false,
    type: 'embedded3',
    titleL10n: 'embaded3TitleL10n',
    icon: '0xe2ce',
    data: {
      AppConfigBottomMenuTab.dataResource: 'https://webtrit-app.web.app/example/example_embedded_wallet_balance.html',
    },
  ),
];
