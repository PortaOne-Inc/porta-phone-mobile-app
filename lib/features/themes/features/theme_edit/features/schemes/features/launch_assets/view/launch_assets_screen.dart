import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../../../../../../../core/widgets/widgets.dart';
import '../../splash_screen/widgets/splash_icon_widget_render.dart';
import '../widgets/assets_platform_preview.dart';
import '../widgets/icon_config_card.dart';
import '../widgets/widgets.dart';

class LaunchAssetsScreen extends StatefulWidget {
  const LaunchAssetsScreen({super.key});

  @override
  State<LaunchAssetsScreen> createState() => _LaunchAssetsScreenState();
}

class _LaunchAssetsScreenState extends State<LaunchAssetsScreen> with MixinMessages {
  final ScreenshotController _screenshotAndroidLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotForegroundIconController = ScreenshotController();
  final ScreenshotController _screenshotIosLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotWebLaunchIconController = ScreenshotController();

  final TextEditingController _androidLaunchPaddingController = TextEditingController();
  final TextEditingController _androidAdaptivePaddingController = TextEditingController();
  final TextEditingController _androidIOSPaddingController = TextEditingController();
  final TextEditingController _androidWEBPaddingController = TextEditingController();

  BoxFit _boxFitAndroidLaunch = BoxFit.scaleDown;
  BoxFit _boxFitAndroidAdaptive = BoxFit.scaleDown;
  BoxFit _boxFitAndroidIOS = BoxFit.scaleDown;
  BoxFit _boxFitAndroidWEB = BoxFit.scaleDown;

  ThemeAssetModel? _assetModel;

  double _paddingAndroidLaunch = 0;
  double _paddingAndroidAdaptive = 0;
  double _paddingAndroidIOS = 0;
  double _paddingAndroidWEB = 0;

  @override
  void initState() {
    super.initState();
    _androidAdaptivePaddingController.addListener(() {
      setState(() {
        _paddingAndroidAdaptive = double.tryParse(_androidAdaptivePaddingController.text) ?? 0;
      });
    });
    _androidLaunchPaddingController.addListener(() {
      setState(() {
        _paddingAndroidLaunch = double.tryParse(_androidLaunchPaddingController.text) ?? 0;
      });
    });
    _androidIOSPaddingController.addListener(() {
      setState(() {
        _paddingAndroidIOS = double.tryParse(_androidIOSPaddingController.text) ?? 0;
      });
    });
    _androidWEBPaddingController.addListener(() {
      setState(() {
        _paddingAndroidWEB = double.tryParse(_androidWEBPaddingController.text) ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen', style: textTheme.titleMedium),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
            tooltip: 'Save launch assets',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: UrlImageField(
                      title: 'Original image',
                      resource: _assetModel?.url != null ? Resource.url(_assetModel!.url!) : null,
                      constraints: BoxConstraints.loose(const Size(200, 200)),
                      onTap: _selectImage,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 4,
                    color: colorScheme.surfaceContainerLow,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Wrap(
                          children: [
                            AssetsPlatformPreview(
                              title: 'Android launch icons (<= Android 12)',
                              resource: Resource.futureByte(_screenshotAndroidLaunchIconController.capture()),
                              leading: SplashIconConfigCard(
                                value: _boxFitAndroidLaunch,
                                onChanged: (fit) => setState(() => _boxFitAndroidLaunch = fit ?? _boxFitAndroidLaunch),
                                controller: _androidLaunchPaddingController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        AssetsPlatformPreview(
                          title: 'Android launch icons (>= Android 13)',
                          resource: Resource.futureByte(_screenshotForegroundIconController.capture()),
                          leading: SplashIconConfigCard(
                            value: _boxFitAndroidAdaptive,
                            onChanged: (fit) => setState(() => _boxFitAndroidAdaptive = fit ?? _boxFitAndroidAdaptive),
                            controller: _androidAdaptivePaddingController,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AssetsPlatformPreview(
                          resource: Resource.futureByte(_screenshotWebLaunchIconController.capture()),
                          title: 'Web',
                          leading: SplashIconConfigCard(
                            value: _boxFitAndroidIOS,
                            onChanged: (fit) => setState(() => _boxFitAndroidIOS = fit ?? _boxFitAndroidIOS),
                            controller: _androidWEBPaddingController,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AssetsPlatformPreview(
                          resource: Resource.futureByte(_screenshotIosLaunchIconController.capture()),
                          title: 'IOS',
                          leading: SplashIconConfigCard(
                            value: _boxFitAndroidWEB,
                            onChanged: (fit) => setState(() => _boxFitAndroidWEB = fit ?? _boxFitAndroidWEB),
                            controller: _androidIOSPaddingController,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          RenderWidget(
            screenshotAndroidLaunchIconController: _screenshotAndroidLaunchIconController,
            image: _assetModel?.url != null ? Resource.url(_assetModel!.url!) : Resource.empty(),
            paddingAndroidLaunch: _paddingAndroidLaunch,
            screenshotForegroundIconController: _screenshotForegroundIconController,
            paddingAndroidAdaptive: _paddingAndroidAdaptive,
            screenshotIosLaunchIconController: _screenshotIosLaunchIconController,
            paddingAndroidIOS: _paddingAndroidIOS,
            screenshotWebLaunchIconController: _screenshotWebLaunchIconController,
            paddingAndroidWEB: _paddingAndroidWEB,
            boxFitAndroidLaunch: _boxFitAndroidLaunch,
            boxFitAndroidAdaptive: _boxFitAndroidAdaptive,
            boxFitAndroidIOS: _boxFitAndroidIOS,
            boxFitAndroidWEB: _boxFitAndroidWEB,
          )
        ],
      ),
    );
  }

  Future<void> _selectImage() async {
    final assetModel = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );
    if (assetModel != null) {
      setState(() => _assetModel = assetModel);
    }
  }

  @override
  void dispose() {
    _androidLaunchPaddingController.dispose();
    _androidAdaptivePaddingController.dispose();
    _androidIOSPaddingController.dispose();
    _androidWEBPaddingController.dispose();
    super.dispose();
  }
}
