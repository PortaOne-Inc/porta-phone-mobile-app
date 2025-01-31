import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../launch_assets/bloc/launch_assets_bloc.dart';
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

  BoxFit _iconFit = BoxFit.fitWidth;
  double _padding = 0;

  @override
  void initState() {
    super.initState();
    _paddingController.addListener(() {
      setState(() {
        _padding = double.tryParse(_paddingController.text) ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<SplashAssetsBloc, SplashAssetsState>(
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
        body: Card(
          child: Padding(
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
                              title: "Background color",
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
                              value: _iconFit,
                              onChanged: (fit) => setState(() => _iconFit = fit ?? _iconFit),
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
                  paddingSplash: _padding,
                  splashIconsFitBox: _iconFit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    context.read<SplashAssetsBloc>().uploadAsset(_screenshotController.capture());
  }

  Future<void> _selectImage() async {
    final assetModel = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
      SchemeRoute.assetsScheme.name,
      extra: [ThemeAssetType.vectorImage],
    );
    if (assetModel != null && mounted) {
      unawaited(context.read<SplashAssetsBloc>().selectForegroundAsset(assetModel));
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

  @override
  void dispose() {
    _paddingController.dispose();
    super.dispose();
  }
}
