// picture_config_tab.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../../../../bloc/update_theme_cubit.dart';

class PictureConfigTab extends StatelessWidget {
  const PictureConfigTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateThemCubit>();
    final state = bloc.state;
    final pictureConfig = state.themeWidgetConfig.picture;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Picture Configuration',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: pictureConfig.primaryOnboardingLogo,
            decoration: const InputDecoration(
              labelText: 'Primary Onboarding Logo Path',
            ),
            onChanged: (value) {
              // bloc.updateThemeWidgetConfig(
              //       (config) => config.copyWith.picture(primaryOnboardingLogo: value),
              //   );
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: pictureConfig.secondaryOnboardingLogo,
            decoration: const InputDecoration(
              labelText: 'Secondary Onboarding Logo Path',
            ),
            onChanged: (value) {
              // bloc.updateThemeWidgetConfig(
              //       (config) => config.copyWith.picture(secondaryOnboardingLogo: value),
              //  );
            },
          ),
        ],
      ),
    );
  }
}
