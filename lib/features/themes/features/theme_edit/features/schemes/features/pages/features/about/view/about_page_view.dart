import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';

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
              BorderContainer(
                title: 'About Page',
                descriptionWidget: DescriptionRow.info(
                  'Pick a logo or illustration for the About screen.',
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UrlImageField(
                      title: 'About image',
                      resource: Resource.url(about.imageSource?.uri),
                      constraints: BoxConstraints.loose(const Size(200, 200)),
                      onTap: () => _pickAsset(context, state.assets),
                    ),
                  ],
                ),
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
