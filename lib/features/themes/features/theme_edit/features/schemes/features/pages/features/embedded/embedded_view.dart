import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class EmbeddedPageView extends StatelessWidget {
  const EmbeddedPageView({required this.config, super.key});

  final EmbeddedPageConfig config;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ThemeOverrideSelector(
          config: config.themeOverride,
          onChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setEmbeddedPage(config.copyWith(themeOverride: v)),
            );
          },
        ),
        const SizedBox(height: 16),
        AppBarSurfaceEditor(
          appBarBackgroundColor: config.appBarBackgroundColor,
          appBarBlurredSurface: config.appBarBlurredSurface,
          onAppBarBackgroundColorChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setEmbeddedPage(config.copyWith(appBarBackgroundColor: v)),
            );
          },
          onAppBarBlurredSurfaceChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setEmbeddedPage(config.copyWith(appBarBlurredSurface: v)),
            );
          },
        ),
        const SizedBox(height: 16),
        PageBackgroundEditor(
          value: config.background,
          onChanged: (v) {
            context.read<UpdateThemCubit>().add(
              ThemePageEvent.setEmbeddedPage(config.copyWith(background: v)),
            );
          },
        ),
      ],
    );
  }
}
