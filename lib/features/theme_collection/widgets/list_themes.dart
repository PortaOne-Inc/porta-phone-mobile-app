import 'package:flutter/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'widgets.dart';

class ListThemes extends StatelessWidget {
  const ListThemes({
    super.key,
    required this.themes,
    required this.onOpen,
    required this.onMakeDefault,
    required this.onDelete,
  });

  final List<ThemeModel> themes;

  final Function(ThemeModel theme) onOpen;
  final Function(ThemeModel theme) onMakeDefault;
  final Function(ThemeModel theme) onDelete;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: (ctx, index) {
        return ItemTheme(themeMode: themes[index], onTap: onOpen, onMakeDefault: onMakeDefault, onDelete: onDelete);
      },
      itemCount: themes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, childAspectRatio: 4.0),
    );
  }
}
