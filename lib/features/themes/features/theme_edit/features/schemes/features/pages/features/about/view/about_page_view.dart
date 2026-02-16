import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';

import 'package:webtrit_configurator/widgets/widgets.dart';

class AboutPageView extends StatefulWidget {
  const AboutPageView({super.key});

  @override
  State<AboutPageView> createState() => _AboutPageViewState();
}

class _AboutPageViewState extends State<AboutPageView> {
  UpdateThemCubit get _cubit => context.read<UpdateThemCubit>();

  @override
  Widget build(BuildContext context) {
    // Використовуємо select для оптимізації ребілдів
    final currentConfig = context.select(
      (UpdateThemCubit cubit) => cubit.state.themePageConfig.about,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          // ThemeOverrideSelector(
          //   config: currentConfig.themeOverride,
          //   onChanged: (v) {
          //     _cubit.add(
          //       ThemePageEvent.setAboutPage(
          //         currentConfig.copyWith(themeOverride: v),
          //       ),
          //     );
          //   },
          // ),
          const SizedBox(height: 16),
          PageBackgroundEditor(
            value: currentConfig.background,
            onChanged: (PageBackground? value) {
              _cubit.add(
                ThemePageEvent.setAboutPage(
                  currentConfig.copyWith(background: value),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ImageRenderEditor(
            description: 'Pick a logo or illustration for the About screen.',
            source: currentConfig.mainLogo,
            onPick: () => _pickAsset(context, _cubit.state.assets),
            onChanged: (updated) {
              // Беремо свіжий конфіг перед оновленням
              final freshConfig = _cubit.state.themePageConfig.about;
              _cubit.add(
                ThemePageEvent.setAboutPage(
                  freshConfig.copyWith(mainLogo: updated),
                ),
              );
            },
            title: 'About screen',
          ),
        ],
      ),
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);

    if (mounted && picked != null) {
      final imageSource = ImageSource(id: picked.id, uri: picked.downloadUrl);

      // Беремо свіжий конфіг
      final freshConfig = _cubit.state.themePageConfig.about;

      _cubit.add(
        ThemePageEvent.setAboutPage(
          freshConfig.copyWith(mainLogo: imageSource),
        ),
      );
    }
  }
}
