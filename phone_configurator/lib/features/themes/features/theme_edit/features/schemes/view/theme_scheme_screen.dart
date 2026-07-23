import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class ThemeSchemeScreen extends StatelessWidget with MixinMessages {
  const ThemeSchemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const borderSide = BorderSide(width: 0.1, color: Colors.black87);

    final selectedVariant = context.select<UpdateThemCubit, BrightnessVariant>(
      (cubit) => cubit.state.selectedVariant,
    );
    final theme = context.select<UpdateThemCubit, ThemeModel?>(
      (cubit) => cubit.state.theme,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConfiguratorGroupTitleTile(
            titleData: 'Application Runtime configuration',
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: const BoxDecoration(border: Border(bottom: borderSide)),
            trailing: Dropdown(
              icon: Icon(
                selectedVariant == BrightnessVariant.light
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              ),
              constraints: const BoxConstraints(maxWidth: 124, minHeight: 80),
              items: const ['Light mode', 'Dark mode'],
              onSelect: (int position) {
                final v = position == 0
                    ? BrightnessVariant.light
                    : BrightnessVariant.dark;
                context.read<UpdateThemCubit>().add(UpdateVariantEvent(v));
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.palette, color: colorScheme.primary),
            title: Text(context.l10n.configurator_color_template_title),
            subtitle: const Text(
              'Defines the material color scheme used for theming all UI components.',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () =>
                GoRouter.of(context).goNamed(SchemeRoute.colorScheme.name),
          ),
          ListTile(
            leading: Icon(Icons.settings_display, color: colorScheme.primary),
            title: const Text(
              'Widget style Configuration',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Adjust settings for custom and advanced widgets in the app.',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => GoRouter.of(
              context,
            ).goNamed(SchemeRoute.widgetConfiguration.name),
          ),
          ListTile(
            leading: Icon(
              Icons.screenshot_outlined,
              color: colorScheme.primary,
            ),
            title: const Text(
              'Pages style configuration',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text('Adjust settings for pages in the app.'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => GoRouter.of(
              context,
            ).goNamed(SchemeRoute.pagesConfiguration.name),
          ),
          ListTile(
            leading: Icon(
              Icons.view_comfy_alt_rounded,
              color: colorScheme.primary,
            ),
            title: const Text(
              'Feature Access',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Manage and configure features available in the current build.',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => GoRouter.of(
              context,
            ).goNamed(SchemeRoute.appFeatureConfiguration.name),
          ),
          const ConfiguratorGroupTitleTile(titleData: 'Static Data'),
          ListTile(
            leading: Icon(Icons.image_outlined, color: colorScheme.primary),
            title: const Text(
              'Launch Icons',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Configure and prepare resources for app launch icons.',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => GoRouter.of(
              context,
            ).goNamed(SchemeRoute.launchScheme.name, extra: theme),
          ),
          ListTile(
            leading: Icon(
              Icons.rocket_launch_outlined,
              color: colorScheme.primary,
            ),
            title: const Text(
              'Splash Screen',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Configure and prepare resources for splash screens.',
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => GoRouter.of(
              context,
            ).goNamed(SchemeRoute.splashScreenScheme.name, extra: theme),
          ),
        ],
      ),
    );
  }
}
