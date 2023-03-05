import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'saved_themes.dart';

class LastSavedThemes extends StatelessWidget {
  const LastSavedThemes({
    super.key,
    required this.themes,
    required this.onClick,
  });

  final List<ThemeModel> themes;
  final Function(ThemeModel theme) onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Wrap(
        children: themes
            .map(
              (theme) => SavedThemes(
                themeMode: theme,
                onTap: () => onClick(theme),
              ),
            )
            .toList(),
      ),
    );
  }
}
