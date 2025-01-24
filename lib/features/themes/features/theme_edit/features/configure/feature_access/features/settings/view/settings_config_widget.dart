import 'package:domain/entity/models/theme/theme_asset_model.dart';
import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/widgets/group_title_list_tile.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/configure/feature_access/features/settings/view/add_embedded_setting_screen.dart';
import 'package:webtrit_phone/extensions/extensions.dart';

import '../../../../../../../../../../core/exports/webtrit_phone.dart';
import 'add_section_setting_screen.dart';

class SettingsConfigWidget extends StatefulWidget {
  const SettingsConfigWidget({
    required this.config,
    super.key,
    required this.callback,
    required this.assets,
  });

  final AppConfigSettings config;
  final ValueChanged<AppConfigSettings> callback;
  final List<ThemeAssetModel> assets;

  @override
  _SettingsConfigWidgetState createState() => _SettingsConfigWidgetState();
}

class _SettingsConfigWidgetState extends State<SettingsConfigWidget> {
  void _manageModeSelectAvailability({required AppConfigSettingsItem action}) {
    widget.callback(widget.config.copyWith(
      sections: widget.config.sections.map((section) {
        return section.copyWith(
          items: section.items.map((item) {
            if (item.titleL10n == action.titleL10n) {
              return item.copyWith(enabled: !item.enabled);
            }
            return item;
          }).toList(),
        );
      }).toList(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final colorScheme = themeData.colorScheme;

    return CustomWidget(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // add padding as needed
            child: IconButton(
              onPressed: () async {
                final result = await Navigator.of(context).push<AppConfigSettingsSection>(
                  MaterialPageRoute<AppConfigSettingsSection>(
                    builder: (BuildContext context) => const AddSectionSettingScreen(
                      assets: [],
                      embedded: [],
                    ),
                  ),
                );
                widget.callback(widget.config.copyWith(
                  sections: [
                    ...widget.config.sections,
                    result!,
                  ],
                ));
                // widget.callback(widget.config.copyWith(
                //   sections: [
                //     ...widget.config.sections,
                //     const AppConfigSettingsSection(
                //       titleL10n: 'New section',
                //       items: [
                //         AppConfigSettingsItem(
                //           titleL10n: 'New item',
                //           type: 'embedded',
                //           icon: 'add',
                //         ),
                //       ],
                //     ),
                //   ],
                // ));
                // Handle save action
              },
              icon: const Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    "Add section",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
        ],
        //title: Text('Settings Configuration'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.config.sections.length,
        itemBuilder: (context, sectionIndex) {
          final section = widget.config.sections[sectionIndex];

          return Visibility(
            visible: section.enabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GroupTitleListTile(
                  titleData: section.titleL10n,
                  style: textTheme.titleMedium,
                  backgroundColor: colorScheme.primaryFixed.withAlpha(12),
                  // trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'remove') {
                        widget.callback(widget.config.copyWith(
                          sections: widget.config.sections
                              .where((element) => element.titleL10n != section.titleL10n)
                              .toList(),
                        ));
                      } else if (value == 'add') {
                        final result = await Navigator.of(context)
                            .push<AppConfigSettingsItem>(MaterialPageRoute<AppConfigSettingsItem>(
                          builder: (BuildContext context) => AddEmbeddedSettingScreen(
                            assets: widget.assets,
                            embedded: [],
                          ),
                        ));

                        widget.callback(widget.config.copyWith(
                          sections: [
                            ...widget.config.sections.map((s) {
                              if (s.titleL10n == section.titleL10n) {
                                return s.copyWith(
                                  items: [
                                    ...s.items,
                                    result!,
                                  ],
                                );
                              }
                              return s;
                            }),
                          ],
                        ));
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'remove',
                        child: ListTile(
                          title: const Text('Remove section'),
                          leading: const Icon(Icons.delete),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'add',
                        child: ListTile(
                          title: const Text('Add embedded item'),
                          leading: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
                ...section.items.map((item) {
                  return Visibility(
                    visible: item.enabled || !item.enabled,
                    child: ListTile(
                      leading: Icon(item.icon.toIconData()),
                      title: Text(item.titleL10n),
                      subtitle: Wrap(
                        children: [
                          Text('Type: ${item.type}'),
                          const SizedBox(width: 8),
                          Text('Enabled: ${item.enabled}'),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'enable_disable') {
                            _manageModeSelectAvailability(action: item);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'enable_disable',
                            child: Text(item.enabled ? 'Disable' : 'Enable'),
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
                }),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final Widget body;
  final AppBar appBar;

  const CustomWidget({
    required this.body,
    required this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min, // ensures the column wraps its content
        children: [
          appBar, // adds the a
          Divider(
            thickness: 4,
            color: Theme.of(context).colorScheme.surfaceContainerLow,
          ), // pp bar at the top
          Flexible(
            child: body, // ensures the body widget can shrink or expand as needed
          ),
        ],
      ),
    );
  }
}
