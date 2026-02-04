import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../features/about/about.dart';
import '../features/contacts/contacts.dart';
import '../features/dialing/dialing.dart';
import '../features/embedded/embedded_view.dart';
import '../features/favorites/favorites_view.dart';
import '../features/keypad/keypad.dart';
import '../features/login/login.dart';
import '../features/messaging/conversations_view.dart';
import '../features/recents/recent_view.dart';
import '../features/settings/settings.dart';

class ConfigureThemePageView extends StatefulWidget {
  const ConfigureThemePageView({super.key});

  @override
  State<ConfigureThemePageView> createState() => _ConfigureThemePageViewState();
}

class _ConfigureThemePageViewState extends State<ConfigureThemePageView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final light = ThemeProvider.of(context).light();
    final loginModeSelectScreenStyles = light.extension<LoginModeSelectScreenStyles>();

    final cubit = context.read<UpdateThemCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Configure Theme Pages', style: textTheme.titleMedium),
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
          tabs: const [
            Tab(text: 'Login'),
            Tab(text: 'About'),
            Tab(text: 'Dialing'),
            Tab(text: 'Keypad'),
            Tab(text: 'Settings'),
            Tab(text: 'Contacts'),
            Tab(text: 'Recents'),
            Tab(text: 'Favorites'),
            Tab(text: 'Conversations'),
            Tab(text: 'Embedded'),
          ],
        ),
      ),
      body: BlocBuilder<UpdateThemCubit, UpdateThemeState>(
        builder: (context, state) {
          final themePageConfig = state.themeSettings.themePageLightConfig;
          final themeWidgetLightConfig = state.themeSettings.themeWidgetLightConfig;

          return TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              LoginPageTabbedView(
                loginModeSelectScreenStyles: loginModeSelectScreenStyles,
                loginPageConfig: themePageConfig.login,
              ),
              const AboutPageView(),
              DialingPageView(
                dialingPageConfig: themePageConfig.dialing,
                callActions: themeWidgetLightConfig.group?.callActions,
              ),
              const KeypadConfigView(),
              SettingsPageTabbedView(
                config: themePageConfig.settings,
              ),
              ContactsPageView(
                config: themePageConfig.contacts,
              ),
              RecentsPageView(
                config: themePageConfig.recents,
              ),
              FavoritesPageView(
                config: themePageConfig.favorites,
              ),
              ConversationsPageView(
                config: themePageConfig.conversations,
              ),
              EmbeddedPageView(
                config: themePageConfig.embedded,
              ),
            ],
          );
        },
      ),
    );
  }

  void _showImportJsonDialog(BuildContext context, UpdateThemCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => _PageJsonImportDialog(
        onImport: (json) => cubit.add(ThemePageEvent.importJson(json)),
      ),
    );
  }
}

class _PageJsonImportDialog extends StatefulWidget {
  const _PageJsonImportDialog({
    required this.onImport,
  });

  final ValueChanged<Map<String, dynamic>> onImport;

  @override
  State<_PageJsonImportDialog> createState() => _PageJsonImportDialogState();
}

class _PageJsonImportDialogState extends State<_PageJsonImportDialog> {
  final TextEditingController _controller = TextEditingController();

  static const String _exampleJson = '''
{
  "login": {
    "modeSelect": {
      "buttonLoginStyle": "elevated",
      "buttonSignupStyle": "outlined"
    },
    "otpSigninVerifyCountdown": 60,
    "signupVerifyCountdown": 60
  },
  "about": {
    "picture": null,
    "metadata": {
      "applicationName": "Webtrit Phone",
      "applicationVersion": true,
      "applicationPackageName": false
    }
  },
  "dialing": {
    "style": "light",
    "appBarStyle": {
      "primary": true,
      "backgroundColor": null,
      "foregroundColor": null
    },
    "info": {
      "usernameStyle": {
        "color": "#FFFFFF",
        "fontSize": 24.0,
        "fontWeight": "w600"
      },
      "numberStyle": {
        "color": "#DDE1E5",
        "fontSize": 16.0
      },
      "callStatusStyle": {
         "color": "#848581"
      }
    }
  },
  "keypad": {
    "filterInput": true
  },
  "contacts": {},
  "recents": {},
  "settings": {}
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
      title: const Text('Import Page Config JSON'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
                        ),
                      ),
                      width: double.infinity,
                      child: const SelectableText(
                        _exampleJson,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
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
                  hintText: 'Paste Page Config JSON here...',
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
