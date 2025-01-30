import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:screenshot/screenshot.dart';
import 'package:domain/domain.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../../../../../../../core/widgets/widgets.dart';
import '../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with MixinMessages {
  final ScreenshotController _screenshotController = ScreenshotController();
  final TextEditingController _paddingController = TextEditingController();

  ThemeAssetModel? _assetModel;
  Color? _backgroundColor;
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen', style: textTheme.titleMedium),
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
                            resource: _assetModel?.url != null ? Resource.url(_assetModel!.url!) : null,
                            constraints: BoxConstraints.loose(const Size(200, 200)),
                            onTap: _selectImage,
                          ),
                          const SizedBox(height: 16),
                          ColorField(
                            title: "Background color",
                            color: _backgroundColor,
                            onTap: (color) => setState(() => _backgroundColor = color),
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
                            color: _backgroundColor,
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
                image: _assetModel?.url != null ? Resource.url(_assetModel!.url!) : null,
                screenshotSplashIconController: _screenshotController,
                paddingSplash: _padding,
                splashIconsFitBox: _iconFit,
              ),
            ],
          ),
        ),
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
    _paddingController.dispose();
    super.dispose();
  }
}
