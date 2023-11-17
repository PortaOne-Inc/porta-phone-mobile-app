import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:screenshot/screenshot.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/extension/screenshot_controller.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/selected_image.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../model/image_filter_model.dart';
import '../utility/utility.dart';

class PageThemeImportAssets extends StatefulWidget {
  const PageThemeImportAssets({
    super.key,
    required this.themeModel,
  });

  final ThemeModel themeModel;

  @override
  State<PageThemeImportAssets> createState() => _PageThemeImportAssetsState();
}

class _PageThemeImportAssetsState extends State<PageThemeImportAssets> with MixinMessages {
  final ScreenshotController _screenshotAndroidLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotForegroundIconController = ScreenshotController();
  final ScreenshotController _screenshotIosLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotWebLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotSplashIconController = ScreenshotController();

  ImageModel? _image;
  BoxFit _fitBox = BoxFit.scaleDown;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  child: const Icon(Icons.arrow_back_ios),
                  onTap: () => Navigator.of(context).pop(),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Import assets from svg',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Visibility(
                  visible: _image != null,
                  child: IconButton(
                    icon: const Icon(Icons.save),
                    tooltip: 'Save',
                    onPressed: () => _generateSystemAssetsResources(context),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Svg file'),
                const Spacer(),
                SelectedImage(
                  name: 'Original image ',
                  description: 'A resource for forming system pictures',
                  imageFilter: ImageFilterModel.svg(),
                  image: _image ?? const ImageModel(),
                  onTap: (ImageFilterModel format) => _selectOriginalSvg(context, format),
                  onRemove: () => _removeOriginalSvg(),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Fit type'),
                const Spacer(),
                Dropdown(
                  constraints: const BoxConstraints(maxWidth: 224),
                  items: BoxFit.values.map((e) => e.name).toList(),
                  onSelect: (int position) => _changeFitType(position),
                  icon: const Icon(Icons.expand_more_rounded),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Exports: ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GenerateLaunchIcon(
                            screenshotStreamController: _screenshotAndroidLaunchIconController,
                            size: const Size(192, 192),
                            imageModel: _image,
                            padding: const EdgeInsets.all(24),
                            color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                            title: '<=Android 12 (Launch icon)\n 192px:192px',
                            fit: _fitBox,
                          ),
                          const SizedBox(
                            width: 56,
                          ),
                          GenerateLaunchIcon(
                            screenshotStreamController: _screenshotForegroundIconController,
                            size: const Size(432, 432),
                            padding: const EdgeInsets.all(112),
                            imageModel: _image,
                            title: '>=Android 13 (Adaptive foreground) 432px:432px',
                            fit: _fitBox,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      GenerateLaunchIcon(
                        screenshotStreamController: _screenshotIosLaunchIconController,
                        size: const Size(1024, 1024),
                        imageModel: _image,
                        padding: const EdgeInsets.all(48),
                        color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                        title: 'iOS 1024px:1024px',
                        fit: _fitBox,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      GenerateLaunchIcon(
                        screenshotStreamController: _screenshotWebLaunchIconController,
                        size: const Size(1024, 1024),
                        padding: const EdgeInsets.all(48),
                        color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                        imageModel: _image,
                        title: 'Web 1024px:1024px',
                        fit: _fitBox,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      GenerateLaunchIcon(
                        screenshotStreamController: _screenshotSplashIconController,
                        size: const Size(640, 640),
                        padding: EdgeInsets.zero,
                        color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                        imageModel: _image,
                        title: 'Android / iOS 640px:640px',
                        fit: _fitBox,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeFitType(int position) {
    _fitBox = BoxFit.values[position];
    setState(() {});
  }

  void _removeOriginalSvg() {
    _image = null;
    setState(() {});
  }

  void _selectOriginalSvg(BuildContext context, ImageFilterModel format) {
    return _catchExceptions(context, () async {
      final image = await UtilityImage.pickImage(format);
      _image = image;
      setState(() {});
    });
  }

  Future<void> _generateSystemAssetsResources(BuildContext context) async {
    final screenshotAndroidLaunch = await _screenshotAndroidLaunchIconController.captureBase64();
    final screenshotForegroundIcon = await _screenshotForegroundIconController.captureBase64();
    final screenshotIosLaunchIcon = await _screenshotIosLaunchIconController.captureBase64();
    final screenshotWebLaunchIcon = await _screenshotWebLaunchIconController.captureBase64();
    final screenshotSplashIco = await _screenshotSplashIconController.captureBase64();

    if (mounted) {
      BlocProvider.of<ThemePropertyCubit>(context).add(
        UpdateThemeSchemeEvent.updateSystemAssetsImages(
          SystemAssetsModel(
            androidLauncherIcon: ImageModel.png(screenshotAndroidLaunch),
            adaptiveIconForeground: ImageModel.png(screenshotForegroundIcon),
            iosLauncherIcon: ImageModel.png(screenshotIosLaunchIcon),
            webLauncherIcon: ImageModel.png(screenshotWebLaunchIcon),
            adaptiveIconBackground: ImageModel.png(screenshotSplashIco),
          ),
        ),
      );
      Navigator.pop(context);
    }
  }

  void _catchExceptions(BuildContext context, Function function) async {
    try {
      await function.call();
    } on InvalidFormatImageException catch (e) {
      if (context.mounted) {
        showFailureMessage(context, context.l10n.feature_theme_edit_Validation_image_format(e.invalidFormat));
      }
    } on InvalidSizeImageException catch (e) {
      if (context.mounted) {
        showFailureMessage(context, context.l10n.feature_theme_edit_Validation_image_size(e.toString()));
      }
    }
  }
}

class GenerateLaunchIcon extends StatelessWidget {
  const GenerateLaunchIcon({
    super.key,
    required this.screenshotStreamController,
    this.imageModel,
    required this.size,
    required this.padding,
    required this.title,
    required this.fit,
    this.color,
  });

  final ScreenshotController screenshotStreamController;
  final ImageModel? imageModel;
  final EdgeInsets padding;
  final Size size;
  final BoxFit fit;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Screenshot(
            controller: screenshotStreamController,
            child: Container(
              padding: padding,
              width: size.width,
              color: color,
              height: size.height,
              child: ImageResource(
                imageModel: imageModel ?? const ImageModel(),
                fit: fit,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
