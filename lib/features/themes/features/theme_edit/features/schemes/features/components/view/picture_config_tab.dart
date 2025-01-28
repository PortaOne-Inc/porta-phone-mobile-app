// picture_config_tab.dart

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/core/widgets/buttons/image_renderer.dart';
import 'package:webtrit_configurator/core/widgets/buttons/url_image_field.dart';
import 'package:webtrit_configurator/core/widgets/decoration/border_container.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../../../../../../../../../core/exports/webtrit_phone.dart';

class PictureConfigTab extends StatelessWidget {
  const PictureConfigTab({
    required this.pictureConfig,
    required this.onChanged,
    super.key,
  });

  final PictureWidgetConfig pictureConfig;
  final ValueChanged<PictureWidgetConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateThemCubit>();
    final state = bloc.state;
    final pictureConfig = state.themeWidgetConfig.picture;

    final primaryOnboardingLogoUrl =
        pictureConfig.metadata.attributes[PictureWidgetConfig.primaryOnboardingLogoUrlKey] as String?;
    final secondaryOnboardingLogoUrl =
        pictureConfig.metadata.attributes[PictureWidgetConfig.secondaryOnboardingLogoUrlKey] as String?;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BorderContainer(
            title: 'Common pages image',
            padding: const EdgeInsets.all(16),
            child: Wrap(spacing: 16, runSpacing: 16, children: [
              UrlImageField(
                title: 'Primary image',
                resource: primaryOnboardingLogoUrl != null ? Resource.url(primaryOnboardingLogoUrl) : null,
                constraints: BoxConstraints.loose(const Size(200, 200)),
                onTap: () async {
                  final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
                    SchemeRoute.assetsScheme.name,
                    extra: [ThemeAssetType.vectorImage],
                  );
                  onChanged(
                    pictureConfig.copyWith(
                      metadata: pictureConfig.metadata.copyWithKey(
                        PictureWidgetConfig.primaryOnboardingLogoUrlKey,
                        result?.url,
                      ),
                    ),
                  );
                },
              ),
              UrlImageField(
                title: 'Secondary image',
                resource: secondaryOnboardingLogoUrl != null ? Resource.url(secondaryOnboardingLogoUrl) : null,
                constraints: BoxConstraints.loose(const Size(200, 200)),
                onTap: () async {
                  final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
                    SchemeRoute.assetsScheme.name,
                    extra: [ThemeAssetType.vectorImage],
                  );
                  onChanged(pictureConfig.copyWith(
                    metadata: pictureConfig.metadata.copyWithKey(
                      PictureWidgetConfig.secondaryOnboardingLogoUrlKey,
                      result?.url,
                    ),
                  ));
                },
              )
            ]),
          ),
        ],
      ),
    );
  }
}
