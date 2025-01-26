import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/route/route.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../../../widgets/group_title_list_tile.dart' as widgets;

class ThemeSchemeScreen extends StatelessWidget with MixinMessages {
  const ThemeSchemeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const borderSide = BorderSide(width: 0.1, color: Colors.black87);

    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (ctx, state) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const widgets.GroupTitleListTile(
              titleData: 'Application Runtime configuration',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(border: Border(bottom: borderSide)),
            ),
            ListTile(
              leading: Icon(Icons.palette, color: colorScheme.primary),
              title: Text(context.l10n.configurator_color_template_title),
              subtitle: const Text('Defines the material color scheme used for theming all UI components.'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => GoRouter.of(context).goNamed(SchemeRoute.colorScheme.name),
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
              onTap: () => GoRouter.of(context).goNamed(SchemeRoute.widgetConfiguration.name),
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
              onTap: () => GoRouter.of(context).goNamed(SchemeRoute.pagesConfiguration.name),
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
              onTap: () => GoRouter.of(context).goNamed(SchemeRoute.appFeatureConfiguration.name),
            ),
            const widgets.GroupTitleListTile(
              titleData: 'Static Data',
            ),
            ListTile(
              leading: Icon(Icons.file_present_rounded, color: colorScheme.primary),
              title: const Text(
                'HTML assets',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Add HTML assets for app configuration.',
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => GoRouter.of(context).goNamed(SchemeRoute.assetsConfiguration.name),
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
              onTap: () => GoRouter.of(context).goNamed(
                SchemeRoute.launchAssetsConfiguration.name,
                extra: state.theme, // Pass the `theme` from the current state
              ),
            ),
          ],
        ),
      ),
    );
  }
}
