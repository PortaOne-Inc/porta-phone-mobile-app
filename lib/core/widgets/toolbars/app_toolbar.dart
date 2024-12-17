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
  Menu({
    required this.items,
    required this.callback,
    this.name,
    this.iconData,
  }) : assert(!(name == null && iconData == null), 'name or iconData must not be null');

  final String? name;
  final IconData? iconData;
  final List<T> items;
  final void Function(BuildContext context, T item) callback;

  void _call(BuildContext context, T data) => callback.call(context, data);
}

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  const AppToolbar({
    required this.name,
    required this.themeMode,
    required this.onThemeChange,
    this.right = const [],
    this.left = const [],
    this.isVisibleProgress = false,
    super.key,
  });

  final List<Menu> right;
  final List<Menu> left;

  final ThemeMode themeMode;
  final void Function(ThemeMode) onThemeChange;

  final String name;
  final bool isVisibleProgress;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        boxShadow: _getBoxShadow(context),
        color: colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: isVisibleProgress ? 1.0 : 0.0,
            child: const LinearProgressIndicator(),
          ),
          Expanded(
              child: _positionPanel(
            context: context,
            name: name,
            left: left.map((it) => _buildMenu(context, it)).toList(),
            right: [
              ...right.map((it) => _buildMenu(context, it)),
              ThemeModeSwitcher(
                themeMode: themeMode,
                onThemeChange: onThemeChange,
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _positionPanel({
    required BuildContext context,
    required String name,
    required List<Widget> left,
    required List<Widget> right,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(children: left),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: right,
          ),
        )
      ],
    );
  }

  Widget _buildMenu<T extends Enum>(
    BuildContext context,
    Menu menu,
  ) {
    final items = menu.items.map(
      (it) => ToolbarMenuItem(
        value: it,
        text: it is SubMenu ? (it as SubMenu).translate(context) : it.name,
      ),
    );
    return ToolbarPopupMenu(
      onSelected: (value) => menu._call(context, value as T),
      items: items.toList(),
      child: menu.name != null
          ? ToolbarLabelItem(
              text: menu.name!,
            )
          : ToolbarLabelWidgetItem(
              icon: menu.iconData!,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
    );
  }

  List<BoxShadow> _getBoxShadow(BuildContext context) => [
        BoxShadow(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(1, 1),
        ),
      ];
}
