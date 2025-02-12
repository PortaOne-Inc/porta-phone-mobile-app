import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/splash_assets_bloc.dart';
import '../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with MixinMessages {
  final ScreenshotController _screenshotController = ScreenshotController();
  final TextEditingController _paddingController = TextEditingController();

  SplashAssetsBloc get _splashAssetsBloc => context.read<SplashAssetsBloc>();

  @override
  void initState() {
    super.initState();
    _paddingController.addListener(_updatePadding);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<UpdateThemCubit>().state;
      _handleThemeUpdate(context, state);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<UpdateThemCubit, UpdateThemeState>(
      listener: _handleThemeUpdate,
      child: BlocBuilder<SplashAssetsBloc, SplashAssetsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text('Splash Screen', style: textTheme.titleMedium),
            actions: [
              IconButton(
                onPressed: !state.status.isLoading ? _save : null,
                icon: state.status.isLoading
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 1))
                    : const Icon(Icons.save),
                tooltip: 'Save launch assets',
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UrlImageField(
                              title: 'Original image',
                              resource: state.selectedForegroundAssetResource,
                              constraints: BoxConstraints.loose(const Size(200, 200)),
                              onTap: _selectImage,
                            ),
                            const SizedBox(height: 16),
                            ColorField(
                              title: 'Background color',
                              color: state.backgroundColor,
                              onTap: (color) =>
                                  _selectColor(context, color, context.read<SplashAssetsBloc>().selectBackgroundColor),
                              constraints: const BoxConstraints.tightFor(width: 400),
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonExt<BoxFit>(
                              label: 'Splash Icon Fit',
                              options: BoxFit.values,
                              constraints: const BoxConstraints.tightFor(width: 400),
                              value: state.fit,
                              onChanged: (fit) => _splashAssetsBloc.selectFit(fit),
                              optionBuilder: (fit) => fit.name,
                            ),
                            const SizedBox(height: 8),
                            OutlineInput(
                              constraints: const BoxConstraints.tightFor(width: 400),
                              controller: _paddingController,
                              label: 'Padding',
                              icon: Icons.padding,
                            ),
                          ],
                        ),
                        DeviceFrame(
                          size: const Size(200, 400),
                          child: IgnorePointer(
                            child: ColorField(
                              showCopyButton: false,
                              color: state.backgroundColor,
                              title: '',
                              child: Center(
                                child: ImageRender(
                                  resource: Resource.futureByte(_screenshotController.capture()),
                                  constraints: BoxConstraints.loose(const Size(200, 200)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SplashIconWidget(
                  image: state.selectedForegroundAssetResource,
                  screenshotSplashIconController: _screenshotController,
                  paddingSplash: state.padding,
                  splashIconsFitBox: state.fit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updatePadding() {
    final value = double.tryParse(_paddingController.text) ?? 0;
    _splashAssetsBloc.selectPadding(value);
  }

  void _handleThemeUpdate(BuildContext context, UpdateThemeState state) {
    final originalAssetId = state.theme?.splashAsset.originalAssetId;

    final splashColor = state.theme?.splashAsset.color?.toColor();
    final iconFit = BoxFit.values.firstWhere((element) => element.name == (state.theme?.splashAsset.fit ?? 'fitWidth'));
    final padding = state.theme?.splashAsset.padding ?? 0;
    final asset = state.assets.firstWhere((element) => element.id == originalAssetId);

    _paddingController.text = padding.toString();

    _splashAssetsBloc
      ..selectForegroundAsset(asset)
      ..selectBackgroundColor(splashColor)
      ..selectFit(iconFit)
      ..selectPadding(padding);
  }

  /// Use pixelRatio 1 to avoid scaling the image and get the original size
  void _save() {
    _splashAssetsBloc.uploadAsset(_screenshotController.capture(pixelRatio: 1));
  }

  Future<void> _selectImage() async {
    final assetModel = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );

    if (assetModel != null && mounted) {
      unawaited(_splashAssetsBloc.selectForegroundAsset(assetModel));
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
      useRootNavigator: false,
    );
    if (result is Color) callback(result);
  }

  @override
  void dispose() {
    _paddingController
      ..removeListener(_updatePadding)
      ..dispose();
    super.dispose();
  }
}
