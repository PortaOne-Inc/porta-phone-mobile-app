import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_phone/features/settings/widgets/widgets.dart';
import 'package:webtrit_phone/theme/styles/styles.dart';
import 'package:webtrit_phone/widgets/widgets.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'action_pad_config_tab.dart';
import 'bars_config_tab.dart';
import 'button_config_tab.dart';
import 'container_config_tab.dart';
import 'dialog_config.dart';
import 'fonts_config_tab.dart';
import 'group_config_tab.dart';
import 'input_config_tab.dart';
import 'picture_config_tab.dart';
import 'statuses_config_tab.dart';
import 'text_config_tab.dart';

class ConfigureWidgetsView extends StatefulWidget {
  const ConfigureWidgetsView({super.key});

  @override
  State<ConfigureWidgetsView> createState() => _ConfigureWidgetsViewState();
}

class _ConfigureWidgetsViewState extends State<ConfigureWidgetsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = const [
    'Fonts',
    'Buttons',
    'Groups',
    'Bars',
    'Pictures',
    'Inputs',
    'Texts',
    'Dialogs',
    'Action Pad',
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

    final themeWidgetConfig = cubit.state.themeWidgetConfig;
    // Get provided theme which uses for phone
    final light = ThemeProvider.of(context).light();

    // Get provided theme extensions
    final actionpadStyles = light.extension<ActionpadStyles>();
    final elevatedButtonStyles = light.extension<ElevatedButtonStyles>();
    final callStatusStyles = light.extension<CallStatusStyles>();
    final registeredStatusStyles = light.extension<RegisteredStatusStyles>();
    final confirmDialogStyles = light.extension<ConfirmDialogStyles>();
    final snackBarStyles = light.extension<SnackBarStyles>();
    final groupTitleListStyles = light.extension<GroupTitleListStyles>();
    final callActionsStyles = light.extension<CallActionsStyles>();
    final gradients = light.extension<Gradients>();
    final linkifyStyles = light.extension<LinkifyStyles>();
    final textSelectionThemeData = light.textSelectionTheme;
    final inputDecorationTheme = light.inputDecorationTheme;

    final bottomNavigationBarThemeData = light.bottomNavigationBarTheme;
    final appBarTheme = light.appBarTheme;
    final fontFamily = light.textTheme.bodyMedium?.fontFamily;

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configure Widgets',
          style: textTheme.titleMedium,
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          FontsConfigTab(
            fontFamily: fontFamily,
            sourceFontsConfig: themeWidgetConfig.fonts,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(fonts: config))),
          ),
          ButtonConfigTab(
            sourceButtonWidgetConfig: themeWidgetConfig.button,
            elevatedButtonStyles: elevatedButtonStyles,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(button: config))),
          ),
          GroupConfigTab(
            groupTitleListStyles: groupTitleListStyles,
            callActionsStyles: callActionsStyles,
            sourceGroupWidgetConfig: themeWidgetConfig.group,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(group: config))),
          ),
          BarsConfigTab(
            bottomNavigationBarTheme: bottomNavigationBarThemeData,
            appBarTheme: appBarTheme,
            sourceBarWidgetConfig: themeWidgetConfig.bar,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(bar: config))),
          ),
          PictureConfigTab(
            pictureConfig: themeWidgetConfig.picture,
            onChanged: (PictureWidgetConfig value) =>
                cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(picture: value))),
          ),
          InputConfigTab(
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(input: config))),
            inputDecorationTheme: inputDecorationTheme,
            sourceInputWidgetConfig: themeWidgetConfig.input,
          ),
          TextConfigTab(
            sourceTextWidgetConfig: themeWidgetConfig.text,
            linkifyStyles: linkifyStyles,
            textSelectionThemeData: textSelectionThemeData,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(text: config))),
          ),
          DialogConfig(
            sourceDialogWidgetConfig: themeWidgetConfig.dialog,
            confirmDialogStyles: confirmDialogStyles,
            snackBarStyles: snackBarStyles,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(dialog: config))),
          ),
          ActionPadConfig(
            source: themeWidgetConfig.actionPad,
            actionpadStyles: actionpadStyles,
            callback: (config) =>
                cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(actionPad: config))),
          ),
          StatusesConfigTab(
            sourceStatusesWidgetConfig: themeWidgetConfig.statuses,
            callStatusStyles: callStatusStyles,
            registeredStatusStyles: registeredStatusStyles,
            callback: (config) => cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(statuses: config))),
          ),
          ContainerConfigTab(
            decorationConfig: themeWidgetConfig.decorationConfig,
            callback: (config) =>
                cubit.add(UpdateSchemeEvent.components(themeWidgetConfig.copyWith(decorationConfig: config))),
          ),
        ].map((it) => SingleChildScrollView(child: it)).toList(),
      ),
    );
  }
}
