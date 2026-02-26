import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import 'package:webtrit_phone/features/settings/widgets/widgets.dart';
import 'package:webtrit_phone/widgets/confirm_dialog_styles.dart';
import 'package:webtrit_phone/widgets/linkify_styles.dart';

import 'bars_config_tab.dart';
import 'button_config_tab.dart';
import 'container_config_tab.dart';
import 'dialog_config.dart';
import 'fonts_config_tab.dart';
import 'group_config_tab.dart';
import 'image_assets_config_tab.dart';
import 'input_config_tab.dart';
import 'statuses_config_tab.dart';
import 'text_config_tab.dart';

class ConfigureWidgetsView extends StatefulWidget {
  const ConfigureWidgetsView({super.key});

  @override
  State<ConfigureWidgetsView> createState() => _ConfigureWidgetsViewState();
}

class _ConfigureWidgetsViewState extends State<ConfigureWidgetsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isJsonMode = false;

  final _tabs = const [
    'Fonts',
    'Buttons',
    'Groups',
    'Bars',
    'Images && Icons',
    'Inputs',
    'Texts',
    'Dialogs',
    'Statuses',
    'Containers',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 11, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();

    final themeWidgetConfig = context
        .select<UpdateThemCubit, ThemeWidgetConfig>(
          (cubit) => cubit.state.themeWidgetConfig,
        );

    final light = ThemeProvider.of(context).light();

    // Theme extensions for previews
    final elevatedButtonStyles = light.extension<ElevatedButtonStyles>();
    final callStatusStyles = light.extension<CallStatusStyles>();
    final registeredStatusStyles = light.extension<RegisteredStatusStyles>();
    final confirmDialogStyles = light.extension<ConfirmDialogStyles>();
    final snackBarStyles = light.extension<SnackBarStyles>();
    final groupTitleListStyles = light.extension<GroupTitleListStyles>();
    final callActionsStyles = light.extension<CallActionsStyles>();
    final linkifyStyles = light.extension<LinkifyStyles>();
    final textSelectionThemeData = light.textSelectionTheme;
    final inputDecorationTheme = light.inputDecorationTheme;

    final fontFamily = light.textTheme.bodyMedium?.fontFamily;

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Configure Widgets', style: textTheme.titleMedium),
        actions: [
          SegmentedButton<bool>(
            segments: const [
              ButtonSegment(value: false, label: Text('UI')),
              ButtonSegment(value: true, label: Text('JSON')),
            ],
            selected: {_isJsonMode},
            onSelectionChanged: (v) => setState(() => _isJsonMode = v.first),
          ),
          const SizedBox(width: 8),
        ],
        bottom: _isJsonMode
            ? null
            : TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
              ),
      ),
      body: IndexedStack(
        index: _isJsonMode ? 1 : 0,
        children: [
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              FontsConfigTab(
                fontFamily: fontFamily,
                sourceFontsConfig: themeWidgetConfig.fonts,
              ),
              ButtonConfigTab(
                sourceButtonWidgetConfig: themeWidgetConfig.button,
                elevatedButtonStyles: elevatedButtonStyles,
              ),
              GroupConfigTab(
                groupTitleListStyles: groupTitleListStyles,
                callActionsStyles: callActionsStyles,
                sourceGroupWidgetConfig: themeWidgetConfig.group,
              ),
              BarsConfigTab(config: themeWidgetConfig.bar),
              ImageAssetsConfigTab(
                imageAssetsConfig: themeWidgetConfig.imageAssets,
              ),
              InputConfigTab(
                inputDecorationTheme: inputDecorationTheme,
                sourceInputWidgetConfig: themeWidgetConfig.input,
              ),
              TextConfigTab(
                sourceTextWidgetConfig: themeWidgetConfig.text,
                linkifyStyles: linkifyStyles,
                textSelectionThemeData: textSelectionThemeData,
              ),
              DialogConfig(
                sourceDialogWidgetConfig: themeWidgetConfig.dialog,
                confirmDialogStyles: confirmDialogStyles,
                snackBarStyles: snackBarStyles,
              ),
              StatusesConfigTab(
                sourceStatusesWidgetConfig: themeWidgetConfig.statuses,
                callStatusStyles: callStatusStyles,
                registeredStatusStyles: registeredStatusStyles,
              ),
              ContainerConfigTab(
                decorationConfig: themeWidgetConfig.decorationConfig,
              ),
            ].map((it) => SingleChildScrollView(child: it)).toList(),
          ),
          JsonEditorPanel(
            initialJson: themeWidgetConfig.toJson(),
            onApply: (json) => cubit.add(ThemeWidgetEvent.importJson(json)),
          ),
        ],
      ),
    );
  }
}
