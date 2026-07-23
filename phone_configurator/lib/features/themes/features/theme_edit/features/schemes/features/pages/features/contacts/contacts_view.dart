import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class ContactsPageView extends StatelessWidget {
  const ContactsPageView({required this.config, super.key});

  final ContactsPageConfig config;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ThemeOverrideSelector(
          config: config.themeOverride,
          onChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setContactsPage(config.copyWith(themeOverride: v)),
            );
          },
        ),
        const SizedBox(height: 16),
        AppBarSurfaceEditor(
          appBarBlurredSurface: config.appBarBlurredSurface,
          onAppBarBlurredSurfaceChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setContactsPage(config.copyWith(appBarBlurredSurface: v)),
            );
          },
        ),
        const SizedBox(height: 16),
        PageBackgroundEditor(
          value: config.background,
          onChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setContactsPage(config.copyWith(background: v)),
            );
          },
        ),
      ],
    );
  }
}
