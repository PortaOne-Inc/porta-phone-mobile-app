import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          (value) => value.state.themeSettings.themeWidgetLightConfig,
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
          IconButton(
            icon: const Icon(Icons.code),
            tooltip: 'Import JSON',
            onPressed: () => _showImportJsonDialog(context, cubit),
          ),
        ],
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
    );
  }

  void _showImportJsonDialog(BuildContext context, UpdateThemCubit cubit) {
    showDialog<void>(
      context: context,
      builder: (context) => _WidgetJsonImportDialog(
        onImport: (json) => cubit.add(ThemeWidgetEvent.importJson(json)),
      ),
    );
  }
}

class _WidgetJsonImportDialog extends StatefulWidget {
  const _WidgetJsonImportDialog({required this.onImport});

  final ValueChanged<Map<String, dynamic>> onImport;

  @override
  State<_WidgetJsonImportDialog> createState() =>
      _WidgetJsonImportDialogState();
}

class _WidgetJsonImportDialogState extends State<_WidgetJsonImportDialog> {
  final TextEditingController _controller = TextEditingController();

  static const String _exampleJson = '''
{
  "fonts": {
    "fontFamily": "Open Sans"
  },
  "button": {
    "primaryElevatedButton": {
      "backgroundColor": null,
      "foregroundColor": null
    }
  },
  "group": {
    "groupTitleListTile": {
      "backgroundColor": "#ECEBF1",
      "textColor": "#5B7E92"
    }
  },
  "bar": {
    "bottomNavigationBar": {
      "backgroundColor": "#000000",
      "selectedItemColor": "#58CCEB",
      "unSelectedItemColor": "#F4E9E3"
    },
    "appBarConfig": {
      "primary": true,
      "foregroundColor": "#58CCEB"
    }
  },
  "input": {
    "primary": {
      "border": {
        "focused": {
          "errorColor": "#FF5353"
        }
      }
    }
  },
  "dialog": {
    "snackBar": {
      "successBackgroundColor": "#75B943",
      "errorBackgroundColor": "#E74C3C"
    }
  },
  "statuses": {
    "registrationStatuses": {
      "online": "#078A89",
      "offline": "#E74C3C"
    }
  }
}
''';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Import Widget Config JSON'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Theme(
                data: Theme.of(
                  context,
                ).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  leading: const Icon(Icons.info_outline, size: 20),
                  title: const Text(
                    'Show expected structure',
                    style: TextStyle(fontSize: 14),
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).dividerColor.withValues(alpha: 0.2),
                        ),
                      ),
                      width: double.infinity,
                      child: const SelectableText(
                        _exampleJson,
                        style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              TextField(
                controller: _controller,
                maxLines: 12,
                decoration: const InputDecoration(
                  hintText: 'Paste Widget Config JSON here...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => _handleImportPressed(context),
          child: const Text('Import'),
        ),
      ],
    );
  }

  void _handleImportPressed(BuildContext context) {
    try {
      final text = _controller.text;
      if (text.isEmpty) return;

      final dynamic decoded = jsonDecode(text);
      if (decoded is Map<String, dynamic>) {
        widget.onImport(decoded);
        Navigator.of(context).pop();
      } else {
        _showErrorSnackBar(context, 'Invalid JSON format: Expected a Map.');
      }
    } catch (e) {
      _showErrorSnackBar(context, 'JSON Parsing Error: $e');
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
