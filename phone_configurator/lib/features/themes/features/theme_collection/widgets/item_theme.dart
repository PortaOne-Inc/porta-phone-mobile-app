import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class ItemTheme extends StatelessWidget {
  const ItemTheme({
    required this.themeMode,
    required this.onTap,
    required this.onMakeDefault,
    required this.onDelete,
    required this.onInfo,
    super.key,
  });

  final ThemeModel themeMode;
  final void Function(ThemeModel model) onTap;
  final void Function(ThemeModel model) onDelete;
  final void Function(ThemeModel model) onInfo;
  final void Function(ThemeModel model) onMakeDefault;

  static const _menuKeyDelete = '_menuKeyDelete';
  static const _menuKeyThemeDefault = '_menuKeyThemeDefault';
  static const _menuKeyInfo = '_menuKeyInfo';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onTap: () => onTap(themeMode),
      child: Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        themeMode.title ?? themeMode.displayTitle,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Application id:'),
                        subtitle: Text(themeMode.displayTitle),
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
                        ),
                      ),
                      PopupMenuItem(
                        value: _menuKeyInfo,
                        padding: const EdgeInsets.all(8),
                        child: Text(context.l10n.feature_theme_info),
                      ),
                      PopupMenuItem(
                        value: _menuKeyDelete,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          context.l10n.common_text_delete,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
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
      case _menuKeyInfo:
        onInfo.call(themeMode);
      case _menuKeyDelete:
        onDelete.call(themeMode);
      case _menuKeyThemeDefault:
        onMakeDefault.call(themeMode);
    }
  }
}
