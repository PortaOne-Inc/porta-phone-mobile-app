import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../widgets/widgets.dart';

class ApplicationThemesScreen extends StatelessWidget {
  const ApplicationThemesScreen({
    required this.onNewBranding,
    required this.onOpenBranding,
    required this.onMakeDefault,
    required this.onCopy,
    required this.onCopyToApplication,
    required this.onDelete,
    required this.onShowInfo,
    required this.themes,
    this.onChangeStatus,
    this.onShare,
    super.key,
  });

  final void Function() onNewBranding;
  final void Function(String themeId) onOpenBranding;
  final void Function(ThemeModel themeModel) onMakeDefault;
  final void Function(ThemeModel themeModel) onDelete;
  final void Function(ThemeModel themeModel) onShowInfo;
  final void Function(ThemeModel themeModel) onCopy;
  final void Function(ThemeModel themeModel) onCopyToApplication;
  final void Function(ThemeModel themeModel, ThemeStatus status)?
  onChangeStatus;
  final void Function(ThemeModel themeModel)? onShare;

  final List<ThemeModel> themes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (themes.isEmpty)
          ItemOfListButton(
            name: 'New theme',
            description:
                'Create new theme for application and change this style when you want',
            onTab: onNewBranding,
          )
        else
          ...themes.map(
            (theme) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ItemTheme(
                model: theme,
                onTap: (t) => onOpenBranding(t.id!),
                onMakeDefault: onMakeDefault,
                onDelete: onDelete,
                onInfo: onShowInfo,
                onCopy: onCopy,
                onCopyToApplication: onCopyToApplication,
                onChangeStatus: onChangeStatus,
                onShare: onShare,
              ),
            ),
          ),
      ],
    );
  }
}
