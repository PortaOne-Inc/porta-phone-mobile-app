import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';

import '../../../../../widgets/image_render_editor.dart';

class AboutPageView extends StatefulWidget {
  const AboutPageView({super.key});

  @override
  State<AboutPageView> createState() => _AboutPageViewState();
}

class _AboutPageViewState extends State<AboutPageView> {
  UpdateThemCubit get _cubit => context.read<UpdateThemCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        final about = state.themePageConfig.about;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ImageRenderEditor(
                description: 'Pick a logo or illustration for the About screen.',
                source: about.mainLogo,
                onPick: () => _pickAsset(context, state.assets),
                onChanged: (updated) {
                  context
                      .read<UpdateThemCubit>()
                      .add(ThemePageEvent.setAboutPage(state.themePageConfig.about.copyWith(mainLogo: updated)));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (!mounted || picked == null) return;
    _cubit.add(ThemePageEvent.setAboutPicture(picked));
  }
}
