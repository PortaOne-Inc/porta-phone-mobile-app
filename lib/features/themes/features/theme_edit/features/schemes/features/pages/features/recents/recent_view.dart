import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class RecentsPageView extends StatelessWidget {
  const RecentsPageView({required this.config, super.key});

  final RecentsPageConfig config;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ThemeOverrideSelector(
          config: config.themeOverride,
          onChanged: (v) {
            context.read<UpdateThemCubit>().add(ThemePageEvent.setRecentsPage(config.copyWith(themeOverride: v)));
          },
        ),
        const SizedBox(height: 16),
        PageBackgroundEditor(
          value: config.background,
          onChanged: (v) {
            context.read<UpdateThemCubit>().add(ThemePageEvent.setRecentsPage(config.copyWith(background: v)));
          },
        ),
      ],
    );
  }
}
