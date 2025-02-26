import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class ImageAssetsConfigTab extends StatefulWidget {
  const ImageAssetsConfigTab({
    required this.imageAssetsConfig,
    required this.onChanged,
    super.key,
  });

  final ImageAssetsConfig imageAssetsConfig;
  final ValueChanged<ImageAssetsConfig> onChanged;

  @override
  State<ImageAssetsConfigTab> createState() => _ImageAssetsConfigTabState();
}

class _ImageAssetsConfigTabState extends State<ImageAssetsConfigTab> {
  late TextEditingController _primaryController;
  late TextEditingController _secondaryController;

  @override
  void initState() {
    super.initState();
    final pictureConfig = context.read<UpdateThemCubit>().state.themeWidgetConfig.imageAssets;
    _primaryController = TextEditingController(
      text: pictureConfig.primaryOnboardingLogo.widthFactor.toString(),
    );
    _secondaryController = TextEditingController(
      text: pictureConfig.secondaryOnboardingLogo.widthFactor.toString(),
    );
  }

  @override
  void dispose() {
    _primaryController.dispose();
    _secondaryController.dispose();
    super.dispose();
  }

  void _updatePrimaryWidthFactor(String value) {
    final widthFactor = double.tryParse(value) ?? .45;
    setState(() {
      widget.onChanged(
        widget.imageAssetsConfig.copyWith(
          primaryOnboardingLogo: widget.imageAssetsConfig.primaryOnboardingLogo.copyWith(widthFactor: widthFactor),
        ),
      );
    });
  }

  void _updateSecondaryWidthFactor(String value) {
    final widthFactor = double.tryParse(value) ?? .25;
    setState(() {
      widget.onChanged(
        widget.imageAssetsConfig.copyWith(
          secondaryOnboardingLogo: widget.imageAssetsConfig.secondaryOnboardingLogo.copyWith(widthFactor: widthFactor),
        ),
      );
    });
  }

  Future<void> _onImageTap(bool isPrimary) async {
    final imageAsset =
        isPrimary ? widget.imageAssetsConfig.primaryOnboardingLogo : widget.imageAssetsConfig.secondaryOnboardingLogo;

    final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );

    setState(() {
      widget.onChanged(
        widget.imageAssetsConfig.copyWith(
          primaryOnboardingLogo: isPrimary
              ? imageAsset.copyWith(
                  metadata:
                      imageAsset.metadata.copyWithKey(ImageAssetsConfig.metadataPrimaryOnboardingLogoUrl, result?.url))
              : widget.imageAssetsConfig.primaryOnboardingLogo,
          secondaryOnboardingLogo: !isPrimary
              ? imageAsset.copyWith(
                  metadata: imageAsset.metadata
                      .copyWithKey(ImageAssetsConfig.metadataSecondaryOnboardingLogoUrl, result?.url))
              : widget.imageAssetsConfig.secondaryOnboardingLogo,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UpdateThemCubit>().state;
    final pictureConfig = state.themeWidgetConfig.imageAssets;
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
            title: 'Image assets',
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ConstrainedBox(
                  constraints: groupConstraints,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UrlImageField(
                        title: 'Primary image',
                        resource: primaryResource,
                        constraints: itemConstraints,
                        onTap: () => _onImageTap(true),
                      ),
                      OutlineInput(
                        label: 'Width factor',
                        controller: _primaryController,
                        onChanged: _updatePrimaryWidthFactor,
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: groupConstraints,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      UrlImageField(
                        title: 'Secondary image',
                        resource: secondaryResource,
                        constraints: itemConstraints,
                        onTap: () => _onImageTap(false),
                      ),
                      OutlineInput(
                        label: 'Width factor',
                        controller: _secondaryController,
                        onChanged: _updateSecondaryWidthFactor,
                      ),
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
}
