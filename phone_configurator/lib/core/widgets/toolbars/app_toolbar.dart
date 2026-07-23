import 'package:flutter/material.dart';

import '../switchers/theme_mode_switcher.dart';

import 'toolbar_label_icon_item.dart';
import 'toolbar_label_text_item.dart';
import 'toolbar_menu_item.dart';
import 'toolbar_popup_menu.dart';

abstract class SubMenu {
  String translate(BuildContext context);
}

class Menu<T extends Enum> {
  Menu({required this.items, required this.callback, this.name, this.iconData})
    : assert(
        !(name == null && iconData == null),
        'name or iconData must not be null',
      );

  final String? name;
  final IconData? iconData;
  final List<T> items;
  final void Function(BuildContext context, T item) callback;

  void call(BuildContext context, T data) => callback.call(context, data);
}

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  const AppToolbar({
    required this.name,
    required this.themeMode,
    required this.onThemeChange,
    this.right = const [],
    this.left = const [],
    this.isVisibleProgress = false,
    this.automaticallyImplyLeading = true,
    super.key,
  });

  final List<Menu> right;
  final List<Menu> left;

  final ThemeMode themeMode;
  final void Function(ThemeMode) onThemeChange;

  final String name;
  final bool isVisibleProgress;
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;

    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.25),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
        color: colorScheme.surfaceBright,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: isVisibleProgress ? 1.0 : 0.0,
            child: const LinearProgressIndicator(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                if (automaticallyImplyLeading && canPop)
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                Expanded(
                  child: Row(
                    children: left
                        .map((menu) => MenuWidget(menu: menu))
                        .toList(),
                  ),
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...right.map((menu) => MenuWidget(menu: menu)),
                      ThemeModeSwitcher(
                        themeMode: themeMode,
                        onThemeChange: onThemeChange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuWidget<T extends Enum> extends StatelessWidget {
  const MenuWidget({required this.menu, super.key});

  final Menu<T> menu;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = textTheme.labelLarge?.copyWith(
      color: colorScheme.secondary,
      fontWeight: FontWeight.w600,
    );

    final items = menu.items.map(
      (it) => ToolbarMenuItem(
        style: textStyle!,
        value: it,
        text: it is SubMenu ? (it as SubMenu).translate(context) : it.name,
      ),
    );

    return ToolbarPopupMenu(
      onSelected: (value) => menu.call(context, value),
      items: items.toList(),
      background: colorScheme.surfaceBright,
      child: menu.name != null
          ? ToolbarLabelItem(text: menu.name!, color: colorScheme.primary)
          : ToolbarLabelWidgetItem(
              icon: menu.iconData!,
              color: colorScheme.secondary,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
    );
  }
}
