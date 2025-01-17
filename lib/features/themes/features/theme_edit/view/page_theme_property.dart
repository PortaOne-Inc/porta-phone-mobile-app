import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import '../features/features.dart';
import '../theme_edit.dart';
import '../widgets/group_title_list_tile.dart';

class PageThemeProperty extends StatelessWidget with MixinMessages {
  const PageThemeProperty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = context.read<UpdateThemCubit>();

    const borderSide = BorderSide(width: 0.1, color: Colors.black87);

    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (ctx, state) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const GroupTitleListTile(
              titleData: 'Application Runtime configuration',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(border: Border(bottom: borderSide)),
            ),
            ListTile(
              leading: Icon(Icons.palette, color: colorScheme.primary),
              title: Text(context.l10n.configurator_color_template_title),
              subtitle: const Text('Defines the material color scheme used for theming all UI components.'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToChangeColorScheme(context, bloc),
            ),
            ListTile(
              leading: Icon(Icons.settings_display, color: colorScheme.primary),
              title: const Text(
                'Special Widget Configuration',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Adjust settings for custom and advanced widgets in the app.',
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToChangeWidgetConfiguration(context, bloc),
            ),
            ListTile(
              leading: Icon(Icons.screenshot_outlined, color: colorScheme.primary),
              title: const Text(
                'Special page Configuration',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Adjust settings for pages in the app.',
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToChangePagesConfiguration(context, bloc),
            ),
            ListTile(
              leading: Icon(Icons.view_comfy_alt_rounded, color: colorScheme.primary),
              title: const Text(
                'Feature Access',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Manage and configure features available in the current build.',
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToChangeAppFeatureConfiguration(context, bloc),
            ),
            const GroupTitleListTile(
              titleData: 'Static Data Preloaded Outside Application Runtime',
            ),
            ListTile(
              leading: Icon(Icons.rocket_launch_outlined, color: colorScheme.primary),
              title: const Text(
                'Launch Icons & Splash Screen',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Configure and prepare resources for app launch icons and splash screens.',
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToChangeLaunchAssetsConfiguration(context, bloc),
            ),
            const GroupTitleListTile(
              titleData: 'Build environments',
            ),
            ListTile(
              leading: Icon(Icons.line_weight_rounded, color: colorScheme.primary),
              title: const Text(
                'Dart define build Environment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Set up and configure build environments .',
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _navigateToChangeEnvConfiguration(context, bloc),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToChangeColorScheme(BuildContext context, UpdateThemCubit cubit) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const ColorSchemeConfigurationView(),
      ),
    );
  }

  Future<void> _navigateToChangeWidgetConfiguration(BuildContext context, UpdateThemCubit cubit) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const ConfigureWidgetsView(),
      ),
    );
  }

  Future<void> _navigateToChangePagesConfiguration(BuildContext context, UpdateThemCubit cubit) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const ConfigureThemePageView(),
      ),
    );
  }

  Future<void> _navigateToChangeAppFeatureConfiguration(BuildContext context, UpdateThemCubit cubit) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const ConfigureAppConfigView(),
      ),
    );
  }

  Future<void> _navigateToChangeLaunchAssetsConfiguration(BuildContext context, UpdateThemCubit cubit) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => LaunchAssetsConfigurationView(
          themeModel: cubit.state.theme!,
        ),
      ),
    );
  }

  Future<void> _navigateToChangeEnvConfiguration(BuildContext context, UpdateThemCubit cubit) async {
    await Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => const EnvironmentConfigurationView(
        initialConfig: {
          'DEBUG_LEVEL': 'INFO',
          'DATABASE_LOG_STATEMENTS': false,
          'PERIODIC_POLLING': true,
          'ENABLE_ATTENDED_TRANSFER': true,
          'CORE_URL': null,
          'DEMO_CORE_URL': 'http://localhost:4000',
          'CORE_VERSION_CONSTRAINT': '>=0.7.0-alpha <2.0.0',
          'APP_LINK_DOMAIN': '',
          'APP_NAME': 'WebTrit',
          'APP_GREETING': null,
          'APP_DESCRIPTION': null,
          'APP_HELP_URL': null,
          'APP_ABOUT_URL': null,
          'APP_CREDENTIALS_REQUEST_URL': null,
          'SALES_EMAIL': 'sales@webtrit.com',
          'FCM_VAPID_KEY': null,
          'REMOTE_LOGZIO_LOGGING_URL': null,
          'REMOTE_LOGZIO_LOGGING_TOKEN': null,
          'REMOTE_LOGZIO_LOGGING_BUFFER_SIZE': 0,
        },
      ),
    ));
  }
}
