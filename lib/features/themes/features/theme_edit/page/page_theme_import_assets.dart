import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:screenshot/screenshot.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/extension/screenshot_controller.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/input_padding.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/selected_image.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/configurator_cubit.dart';
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
  BoxFit _launchIconsFitBox = BoxFit.scaleDown;
  BoxFit _splashIconsFitBox = BoxFit.fitWidth;

  double _paddingSplash = 0;
  double _paddingAndroidAdaptive = 0;
  double _paddingAndroidLaunch = 0;
  double _paddingAndroidIOS = 0;
  double _paddingAndroidWEB = 0;

  late final bloc = BlocProvider.of<ThemePropertyCubit>(context);

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
                    icon: const Icon(Icons.refresh),
                    tooltip: 'Refresh',
                    onPressed: () => _previewCurrentConfig(),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Visibility(
                  visible: _image != null,
                  child: IconButton(
                    icon: const Icon(Icons.save),
                    tooltip: 'Save',
                    onPressed: () => _save(),
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
                const Text('Splash icon fit type'),
                const Spacer(),
                Dropdown(
                  constraints: const BoxConstraints(maxWidth: 224),
                  items: BoxFit.values.map((e) => e.name).toList(),
                  position: _splashIconsFitBox.index,
                  onSelect: (int position) => _changeSplashIconFitType(position),
                  icon: const Icon(Icons.expand_more_rounded),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Launch icons fit type'),
                const Spacer(),
                Dropdown(
                  constraints: const BoxConstraints(maxWidth: 224),
                  items: BoxFit.values.map((e) => e.name).toList(),
                  position: _launchIconsFitBox.index,
                  onSelect: (int position) => _changeLaunchIconFitType(position),
                  icon: const Icon(Icons.expand_more_rounded),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Splash adaptive scale'),
                const Spacer(),
                InputPadding(onChange: (padding) {
                  _paddingSplash = padding;
                  _previewCurrentConfig();
                  setState(() {});
                })
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Android adaptive scale'),
                const Spacer(),
                InputPadding(onChange: (padding) {
                  _paddingAndroidAdaptive = padding;
                  _previewCurrentConfig();
                })
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Android launcher scale'),
                const Spacer(),
                InputPadding(onChange: (padding) {
                  _paddingAndroidLaunch = padding;
                  _previewCurrentConfig();
                }),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('IOS scale'),
                const Spacer(),
                InputPadding(onChange: (padding) {
                  _paddingAndroidIOS = padding;
                  _previewCurrentConfig();
                }),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Web scale'),
                const Spacer(),
                InputPadding(onChange: (padding) {
                  _paddingAndroidWEB = padding;
                  _previewCurrentConfig();
                }),
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
                            padding: EdgeInsets.all(24 + _paddingAndroidLaunch),
                            color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                            title: '<=Android 12 (Launch icon)\n 192px:192px',
                            fit: _launchIconsFitBox,
                          ),
                          const SizedBox(
                            width: 56,
                          ),
                          GenerateLaunchIcon(
                            screenshotStreamController: _screenshotForegroundIconController,
                            size: const Size(432, 432),
                            padding: EdgeInsets.all(112 + _paddingAndroidAdaptive),
                            imageModel: _image,
                            title: '>=Android 13 (Adaptive foreground) 432px:432px',
                            fit: _launchIconsFitBox,
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
                        padding: EdgeInsets.all(48 + _paddingAndroidIOS),
                        color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                        title: 'iOS 1024px:1024px',
                        fit: _launchIconsFitBox,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      GenerateLaunchIcon(
                        screenshotStreamController: _screenshotWebLaunchIconController,
                        size: const Size(1024, 1024),
                        padding: EdgeInsets.all(48 + _paddingAndroidWEB),
                        color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                        imageModel: _image,
                        title: 'Web 1024px:1024px',
                        fit: _launchIconsFitBox,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      GenerateLaunchIcon(
                        screenshotStreamController: _screenshotSplashIconController,
                        size: const Size(640, 640),
                        padding: EdgeInsets.all(_paddingSplash),
                        color: widget.themeModel.colors?.launch?.adaptiveIconBackground,
                        imageModel: _image,
                        title: 'Android / iOS 640px:640px',
                        fit: _splashIconsFitBox,
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

  void _changeLaunchIconFitType(int position) {
    _launchIconsFitBox = BoxFit.values[position];
    setState(() {});
    _previewCurrentConfig();
  }

  void _changeSplashIconFitType(int position) {
    _splashIconsFitBox = BoxFit.values[position];
    setState(() {});
    _previewCurrentConfig();
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
      _previewCurrentConfig();
    });
  }

  void _previewCurrentConfig() async {
    final image = await _generateSystemAssetsResources(context);
    bloc.add(const ThemeDraftSchemeEvent.enableDraftTheme());
    bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(image));
  }

  void _save() async {
    final image = await _generateSystemAssetsResources(context);
    bloc.add(const ThemeDraftSchemeEvent.disableDraftTheme());
    bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(image));

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<SystemAssetsModel> _generateSystemAssetsResources(BuildContext context) async {
    final screenshotAndroidLaunch = await _screenshotAndroidLaunchIconController.captureBase64();
    final screenshotForegroundIcon = await _screenshotForegroundIconController.captureBase64();
    final screenshotIosLaunchIcon = await _screenshotIosLaunchIconController.captureBase64();
    final screenshotWebLaunchIcon = await _screenshotWebLaunchIconController.captureBase64();
    final screenshotSplashIco = await _screenshotSplashIconController.captureBase64();

    return SystemAssetsModel(
      androidLauncherIcon: ImageModel.png(screenshotAndroidLaunch),
      adaptiveIconForeground: ImageModel.png(screenshotForegroundIcon),
      iosLauncherIcon: ImageModel.png(screenshotIosLaunchIcon),
      webLauncherIcon: ImageModel.png(screenshotWebLaunchIcon),
      adaptiveIconBackground: ImageModel.png(screenshotSplashIco),
    );
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

  @override
  void dispose() {
    bloc.add(const ThemeDraftSchemeEvent.disableDraftTheme());
    super.dispose();
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
