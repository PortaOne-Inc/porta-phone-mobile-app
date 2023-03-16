import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

class ItemTheme extends StatelessWidget {
  const ItemTheme({
    super.key,
    required this.themeMode,
    required this.onTap,
    required this.onMakeDefault,
    required this.onDelete,
  });

  final AppConfigurationModel themeMode;
  final Function(AppConfigurationModel model) onTap;
  final Function(AppConfigurationModel model) onDelete;
  final Function(AppConfigurationModel model) onMakeDefault;

  static const _menuKeyDelete = '_menuKeyDelete';
  static const _menuKeyThemeDefault = '_menuKeyThemeDefault';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => onTap(themeMode),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    themeMode.commonConfig.appName,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: Wrap(
                        children: themeMode.colors
                            .asList()
                            .map((color) => UsedColor(
                                  blurRadius: 4,
                                  size: 16,
                                  color: UtilityColor.tryParseColorFromHex(color, defaultColor: Colors.transparent)!,
                                  boxShadow: const [BoxShadow(color: Colors.black38, spreadRadius: 0.5, blurRadius: 4)],
                                ))
                            .toList(),
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4, right: 8),
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: themeMode.colors.gradientTabColor
                                      .map((color) =>
                                          UtilityColor.tryParseColorFromHex(color, defaultColor: Colors.transparent)!)
                                      .toList()),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 4, right: 8),
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: themeMode.colors.gradientTabColor
                                      .map(
                                        (color) =>
                                            UtilityColor.tryParseColorFromHex(color, defaultColor: Colors.transparent)!,
                                      )
                                      .toList()),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: PopupMenuButton(
                    offset: const Offset(0, 32),
                    elevation: 6,
                    onSelected: _handleMenuTab,
                    padding: const EdgeInsets.only(top: 8),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (c) => [
                      PopupMenuItem(
                          value: _menuKeyThemeDefault,
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            context.l10n.feature_vendor_use_current_theme,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.deepPurple,
                                ),
                          )),
                      PopupMenuItem(
                        value: _menuKeyDelete,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context.l10n.common_text_delete,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.red,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuTab(String key) {
    switch (key) {
      case _menuKeyDelete:
        onDelete.call(themeMode);
        break;
      case _menuKeyThemeDefault:
        onMakeDefault.call(themeMode);
        break;
    }
  }
}
