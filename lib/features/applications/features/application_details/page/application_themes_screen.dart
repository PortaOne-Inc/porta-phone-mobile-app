import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../widgets/widgets.dart';

class ApplicationThemesScreen extends StatelessWidget {
  const ApplicationThemesScreen({
    required this.onNewBranding,
    required this.onOpenBranding,
    required this.onMakeDefault,
    required this.onDelete,
    required this.onShowInfo,
    required this.themes,
    required this.crossAxisCount,
    super.key,
  });

  final void Function() onNewBranding;
  final void Function(String themeId) onOpenBranding;
  final void Function(ThemeModel themeModel) onMakeDefault;
  final void Function(ThemeModel themeModel) onDelete;
  final void Function(ThemeModel themeModel) onShowInfo;

  final List<ThemeModel> themes;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.builder(
            padding: const EdgeInsets.only(top: 24),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return ItemOfListButton(
                  name: 'New theme',
                  description: 'Create new theme for application and change this style when you want',
                  onTab: onNewBranding,
                );
              } else {
                return ItemTheme(
                  themeMode: themes[index - 1],
                  onTap: (theme) => onOpenBranding(theme.id!),
                  onMakeDefault: onMakeDefault,
                  onDelete: onDelete,
                  onInfo: onShowInfo,
                );
              }
            },
            itemCount: themes.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.75,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
