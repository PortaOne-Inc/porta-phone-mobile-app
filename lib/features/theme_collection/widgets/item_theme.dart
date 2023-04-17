import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'used_color.dart';

class ItemTheme extends StatelessWidget {
  const ItemTheme({
    super.key,
    required this.themeMode,
    required this.onTap,
    required this.onMakeDefault,
    required this.onDelete,
  });

  final ThemeModel themeMode;
  final Function(ThemeModel model) onTap;
  final Function(ThemeModel model) onDelete;
  final Function(ThemeModel model) onMakeDefault;

  static const _menuKeyDelete = '_menuKeyDelete';
  static const _menuKeyThemeDefault = '_menuKeyThemeDefault';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () => onTap(themeMode),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: themeMode.colorGradientCollection.toList().map((e) => e.withOpacity(0.25)).toList(),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
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
                    themeMode.name ?? '',
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
                        child: GridView.builder(
                          itemBuilder: (ctx, index) {
                            return FittedBox(
                              child: UsedColor(
                                blurRadius: 2,
                                size: 16,
                                color: themeMode.colorSchemeCollection[index],
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: themeMode.colorSchemeCollection.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
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
                            context.l10n.feature_application_use_current_theme,
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
