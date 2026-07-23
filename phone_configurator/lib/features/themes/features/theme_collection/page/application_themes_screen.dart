import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:domain/domain.dart';

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
        children: [
          Section(
            title: 'Schemes',
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return ItemTheme(
                    themeMode: themes[index],
                    onTap: (theme) => onOpenBranding(theme.id!),
                    onMakeDefault: onMakeDefault,
                    onDelete: onDelete,
                    onInfo: onShowInfo,
                  );
                },
                itemCount: themes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.75,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
