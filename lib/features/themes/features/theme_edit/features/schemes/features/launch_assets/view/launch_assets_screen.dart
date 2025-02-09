import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/launch_assets_bloc.dart';
import '../widgets/widgets.dart';

class LaunchAssetsScreen extends StatefulWidget {
  const LaunchAssetsScreen({super.key});

  @override
  State<LaunchAssetsScreen> createState() => _LaunchAssetsScreenState();
}

class _LaunchAssetsScreenState extends State<LaunchAssetsScreen> with MixinMessages {
  final ScreenshotController _screenshotAndroidLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotAdaptiveAndroidIconController = ScreenshotController();
  final ScreenshotController _screenshotIOSLaunchIconController = ScreenshotController();
  final ScreenshotController _screenshotWebLaunchIconController = ScreenshotController();

  final TextEditingController _androidLaunchPaddingController = TextEditingController();
  final TextEditingController _androidAdaptivePaddingController = TextEditingController();
  final TextEditingController _androidIOSPaddingController = TextEditingController();
  final TextEditingController _androidWEBPaddingController = TextEditingController();

  LaunchAssetsCubit get _launchAssetsCubit => context.read<LaunchAssetsCubit>();

  @override
  void initState() {
    super.initState();
    _androidAdaptivePaddingController.addListener(() {
      _launchAssetsCubit.setPadding(
        paddingAndroidAdaptive: double.tryParse(_androidAdaptivePaddingController.text) ?? 0,
      );
    });
    _androidLaunchPaddingController.addListener(() {
      _launchAssetsCubit.setPadding(
        paddingAndroidLaunch: double.tryParse(_androidAdaptivePaddingController.text) ?? 0,
      );
    });
    _androidIOSPaddingController.addListener(() {
      _launchAssetsCubit.setPadding(
        paddingIOS: double.tryParse(_androidAdaptivePaddingController.text) ?? 0,
      );
    });
    _androidWEBPaddingController.addListener(() {
      _launchAssetsCubit.setPadding(
        paddingWEB: double.tryParse(_androidAdaptivePaddingController.text) ?? 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<LaunchAssetsCubit, LaunchAssetsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text('Splash Screen', style: textTheme.titleMedium),
          actions: [
            IconButton(
              onPressed: !state.status.isLoading ? _save : null,
              icon: state.status.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 1),
                    )
                  : const Icon(Icons.save),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: UrlImageField(
                            title: 'Foreground original image',
                            resource: state.selectedForegroundAssetResource,
                            constraints: BoxConstraints.loose(const Size(200, 200)),
                            onTap: _selectForegroundAssets,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: UrlImageField(
                            title: 'Background original image',
                            resource: state.selectedBackgroundAssetResource,
                            constraints: BoxConstraints.loose(const Size(200, 200)),
                            onTap: _selectBackgroundAssets,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ColorField(
                            title: 'Background color',
                            color: state.selectedBackgroundColor,
                            onTap: (color) => _selectColor(context, color,
                                (color) => context.read<LaunchAssetsCubit>().selectBackgroundColor(color)),
                            constraints: BoxConstraints.loose(const Size(200, 200)),
                          ),
                        )
                      ],
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
                                foregroundResource:
                                    Resource.futureByte(_screenshotAndroidLaunchIconController.capture()),
                                backgroundColor: state.selectedBackgroundColor,
                                size: const Size.square(108),
                                safeZone: const Size.square(81),
                                leading: SplashIconConfigCard(
                                  value: state.boxFitAndroidLaunch,
                                  onChanged: (fit) => _launchAssetsCubit.setBoxFit(
                                    boxFitAndroidLaunch: fit ?? state.boxFitAndroidLaunch,
                                  ),
                                  controller: _androidLaunchPaddingController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          AssetsPlatformPreview(
                            title: 'Android launch icons (>= Android 13)',
                            foregroundResource: Resource.futureByte(_screenshotAdaptiveAndroidIconController.capture()),
                            backgroundResource: state.selectedBackgroundAssetResource,
                            backgroundColor: state.selectedBackgroundColor,
                            size: const Size.square(108),
                            safeZone: const Size.square(72),
                            leading: SplashIconConfigCard(
                              value: state.boxFitAndroidAdaptive,
                              onChanged: (fit) => _launchAssetsCubit.setBoxFit(
                                boxFitAndroidAdaptive: fit ?? state.boxFitAndroidAdaptive,
                              ),
                              controller: _androidAdaptivePaddingController,
                            ),
                          ),
                          const SizedBox(height: 16),
                          AssetsPlatformPreview(
                            foregroundResource: Resource.futureByte(_screenshotWebLaunchIconController.capture()),
                            backgroundColor: state.selectedBackgroundColor,
                            size: const Size.square(108),
                            safeZone: const Size.square(108 * 0.90),
                            title: 'Web',
                            leading: SplashIconConfigCard(
                              value: state.boxFitWeb,
                              onChanged: (fit) => _launchAssetsCubit.setBoxFit(
                                boxFitWeb: fit ?? state.boxFitWeb,
                              ),
                              controller: _androidWEBPaddingController,
                            ),
                          ),
                          const SizedBox(height: 16),
                          AssetsPlatformPreview(
                            foregroundResource: Resource.futureByte(_screenshotIOSLaunchIconController.capture()),
                            backgroundColor: state.selectedBackgroundColor,
                            size: const Size.square(108),
                            safeZone: const Size.square(108 * 0.90),
                            title: 'IOS',
                            leading: SplashIconConfigCard(
                              value: state.boxFitIOS,
                              onChanged: (fit) => _launchAssetsCubit.setBoxFit(
                                boxFitIOS: fit ?? state.boxFitIOS,
                              ),
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
              screenshotForegroundIconController: _screenshotAdaptiveAndroidIconController,
              screenshotIosLaunchIconController: _screenshotIOSLaunchIconController,
              screenshotWebLaunchIconController: _screenshotWebLaunchIconController,
              paddingAndroidLaunch: state.paddingAndroidLaunch,
              paddingAndroidAdaptive: state.paddingAndroidAdaptive,
              paddingIOS: state.paddingIOS,
              paddingWEB: state.paddingWEB,
              boxFitAndroidLaunch: state.boxFitAndroidLaunch,
              boxFitAndroidAdaptive: state.boxFitAndroidAdaptive,
              boxFitIOS: state.boxFitIOS,
              boxFitWEB: state.boxFitWeb,
              image: state.selectedForegroundAssetResource,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectForegroundAssets() async {
    final assetModel = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );
    if (assetModel != null && mounted) {
      unawaited(context.read<LaunchAssetsCubit>().selectForegroundAsset(assetModel));
    }
  }

  Future<void> _selectBackgroundAssets() async {
    final assetModel = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );
    if (assetModel != null && mounted) {
      unawaited(context.read<LaunchAssetsCubit>().selectBackgroundAsset(assetModel));
    }
  }

  Future<void> _selectColor(BuildContext context, Color color, void Function(Color) callback) async {
    final result = await showDialog<Color?>(
        context: context,
        builder: (context) => Center(
              child: ColorPicker(
                onDeclineColor: () => Navigator.of(context).pop(),
                onAcceptColor: (color) => Navigator.of(context).pop(color),
                initialColor: color,
              ),
            ),
        useRootNavigator: false);
    if (result is Color) callback(result);
  }

  void _save() {
    context.read<LaunchAssetsCubit>().uploadAssets(
          _screenshotAndroidLaunchIconController.capture(),
          _screenshotAdaptiveAndroidIconController.capture(),
          _screenshotIOSLaunchIconController.capture(),
          _screenshotWebLaunchIconController.capture(),
        );
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
