import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final bloc = context.read<UpdateThemCubit>();
    final state = bloc.state;
    final pictureConfig = state.themeWidgetConfig.picture;

    final itemConstraints = BoxConstraints.loose(const Size(200, 200));
    final groupConstraints = BoxConstraints.loose(const Size(200, 300));

    final primaryResource =
        pictureConfig.primaryOnboardingLogoUrl != null ? Resource.url(pictureConfig.primaryOnboardingLogoUrl!) : null;

    final secondaryResource = pictureConfig.secondaryOnboardingLogoUrl != null
        ? Resource.url(pictureConfig.secondaryOnboardingLogoUrl!)
        : null;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BorderContainer(
            title: 'Common pages image',
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ConstrainedBox(
                  constraints: groupConstraints,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UrlImageField(
                        title: 'Primary image',
                        resource: primaryResource,
                        constraints: itemConstraints,
                        onTap: () => _onPrimaryImageTap(context, pictureConfig),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Logo scale',
                        style: textTheme.bodyLarge,
                      ),
                      Slider(
                        value: pictureConfig.onboardingPictureLogo.scale ?? .0,
                        divisions: 100,
                        label: (pictureConfig.onboardingPictureLogo.scale ?? .1).toStringAsFixed(2),
                        onChanged: (value) => onChanged(
                          pictureConfig.copyWith(
                            onboardingPictureLogo: pictureConfig.onboardingPictureLogo.copyWith(scale: value),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: groupConstraints,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UrlImageField(
                        title: 'Primary image',
                        resource: secondaryResource,
                        constraints: itemConstraints,
                        onTap: () => _onSecondaryImageTap(context, pictureConfig),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Logo scale',
                        style: textTheme.bodyLarge,
                      ),
                      Slider(
                        value: pictureConfig.onboardingLogo.scale ?? .0,
                        divisions: 100,
                        label: (pictureConfig.onboardingLogo.scale ?? .1).toStringAsFixed(2),
                        onChanged: (value) => onChanged(
                          pictureConfig.copyWith(
                            onboardingLogo: pictureConfig.onboardingLogo.copyWith(scale: value),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPrimaryImageTap(BuildContext context, PictureWidgetConfig pictureConfig) async {
    final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );
    onChanged(
      pictureConfig.copyWith(
        metadata: pictureConfig.metadata.copyWithKey(
          PictureWidgetConfig.metadataPrimaryOnboardingLogoUrl,
          result?.url,
        ),
      ),
    );
  }

  Future<void> _onSecondaryImageTap(BuildContext context, PictureWidgetConfig pictureConfig) async {
    final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );
    onChanged(
      pictureConfig.copyWith(
        metadata: pictureConfig.metadata.copyWithKey(
          PictureWidgetConfig.metadataSecondaryOnboardingLogoUrl,
          result?.url,
        ),
      ),
    );
  }
}
