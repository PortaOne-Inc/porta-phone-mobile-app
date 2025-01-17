import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'launch_icon.dart';

class ThemeAssetsPreview extends StatelessWidget {
  const ThemeAssetsPreview({
    required this.theme,
    super.key,
  });

  final ThemeModel theme;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final titleStyle = textTheme.titleMedium?.copyWith(color: colors.secondary);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Splash screen',
                        style: titleStyle,
                      ),
                    ),
                    // DeviceFrame(
                    //   size: const Size(200, 400),
                    //   isFrameVisible: false,
                    //   child: IgnorePointer(
                    //     child: ColoredBox(
                    //       color: theme.colorScheme?.launch?.splashBackground?.toColor()  ?? Colors.green,
                    //       child: Center(
                    //         child: ImageResource(
                    //           imageModel: theme.systemAssets.adaptiveIconBackground,
                    //           fit: BoxFit.contain,
                    //           defaultWidget: const SizedBox(),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // IgnorePointer(
                    //   child: ColoredBox(
                    //     color: theme.colorScheme?.launch?.splashBackground?.toColor() ?? Colors.green,
                    //     child: Center(
                    //       child: ImageResource(
                    //         imageModel: theme.systemAssets.adaptiveIconBackground,
                    //         fit: BoxFit.contain,
                    //         defaultWidget: const SizedBox(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Web',
                          style: titleStyle,
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          LaunchIcon(
                            size: const Size.square(108),
                            safeZone: const Size.square(108 * 0.90),
                            radius: const BorderRadius.all(Radius.circular(20)),
                            foreground: theme.systemAssets.iosLauncherIcon,
                            backgroundColor: Colors.transparent,
                            backgroundImage: theme.systemAssets.adaptiveIconBackground,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'IOS',
                          style: titleStyle,
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          LaunchIcon(
                            size: const Size.square(108),
                            safeZone: const Size.square(108 * 0.9),
                            radius: const BorderRadius.all(Radius.circular(20)),
                            foreground: theme.systemAssets.iosLauncherIcon,
                            backgroundColor: Colors.transparent,
                            backgroundImage: theme.systemAssets.adaptiveIconBackground,
                          ),
                          LaunchIcon(
                            size: const Size.square(108),
                            safeZone: const Size.square(108 * 0.9),
                            radius: const BorderRadius.all(Radius.circular(90)),
                            foreground: theme.systemAssets.iosLauncherIcon,
                            backgroundColor: Colors.transparent,
                            backgroundImage: theme.systemAssets.adaptiveIconBackground,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Android adaptive icons (>= Android 13)',
                  style: titleStyle,
                ),
              ),
              // Wrap(
              //   spacing: 8,
              //   runSpacing: 8,
              //   children: [
              //     LaunchIcon(
              //       size: const Size.square(108),
              //       safeZone: const Size.square(72),
              //       radius: const BorderRadius.all(Radius.circular(1)),
              //       foreground: theme.systemAssets.adaptiveIconForeground,
              //       backgroundColor: theme.colorScheme?.launch?.adaptiveIconBackground?.toColor() ,
              //       // backgroundImage: theme.systemAssets.adaptiveIconBackground,
              //     ),
              //     LaunchIcon(
              //       size: const Size.square(108),
              //       safeZone: const Size.square(72),
              //       radius: const BorderRadius.all(Radius.circular(180)),
              //       foreground: theme.systemAssets.adaptiveIconForeground,
              //       backgroundColor: theme.colorScheme?.launch?.adaptiveIconBackground?.toColor() ,
              //       // backgroundImage: theme.systemAssets.adaptiveIconBackground,
              //     ),
              //     LaunchIcon(
              //       size: const Size.square(108),
              //       safeZone: const Size.square(72),
              //       radius: const BorderRadius.only(
              //         topLeft: Radius.circular(40),
              //         topRight: Radius.circular(16),
              //         bottomLeft: Radius.circular(16),
              //         bottomRight: Radius.circular(4),
              //       ),
              //       foreground: theme.systemAssets.adaptiveIconForeground,
              //       backgroundColor: theme.colorScheme?.launch?.adaptiveIconBackground?.toColor() ,
              //     ),
              //     LaunchIcon(
              //       size: const Size.square(108),
              //       safeZone: const Size.square(72),
              //       radius: const BorderRadius.all(Radius.circular(4)),
              //       foreground: theme.systemAssets.adaptiveIconForeground,
              //       backgroundColor: theme.colorScheme?.launch?.adaptiveIconBackground?.toColor() ,
              //     ),
              //     LaunchIcon(
              //       size: const Size.square(108),
              //       safeZone: const Size.square(72),
              //       radius: const BorderRadius.all(Radius.circular(16)),
              //       foreground: theme.systemAssets.adaptiveIconForeground,
              //       backgroundColor: theme.colorScheme?.launch?.adaptiveIconBackground?.toColor() ,
              //     ),
              //   ],
              // ),
              const Divider(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Android launch icons (<= Android 12)',
                  style: titleStyle,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  LaunchIcon(
                    size: const Size.square(108),
                    safeZone: const Size.square(81),
                    radius: const BorderRadius.all(Radius.circular(1)),
                    foreground: theme.systemAssets.androidLauncherIcon,
                    backgroundColor: Colors.transparent,
                    backgroundImage: theme.systemAssets.adaptiveIconBackground,
                  ),
                  LaunchIcon(
                    size: const Size.square(108),
                    safeZone: const Size.square(81),
                    radius: const BorderRadius.all(Radius.circular(180)),
                    foreground: theme.systemAssets.androidLauncherIcon,
                    backgroundColor: Colors.transparent,
                    backgroundImage: theme.systemAssets.adaptiveIconBackground,
                  ),
                  LaunchIcon(
                    size: const Size.square(108),
                    safeZone: const Size.square(81),
                    radius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(4),
                    ),
                    foreground: theme.systemAssets.androidLauncherIcon,
                    backgroundColor: Colors.transparent,
                    backgroundImage: theme.systemAssets.adaptiveIconBackground,
                  ),
                  LaunchIcon(
                    size: const Size.square(108),
                    safeZone: const Size.square(81),
                    radius: const BorderRadius.all(Radius.circular(4)),
                    foreground: theme.systemAssets.androidLauncherIcon,
                    backgroundColor: Colors.transparent,
                    backgroundImage: theme.systemAssets.adaptiveIconBackground,
                  ),
                  LaunchIcon(
                    size: const Size.square(108),
                    safeZone: const Size.square(81),
                    radius: const BorderRadius.all(Radius.circular(16)),
                    foreground: theme.systemAssets.androidLauncherIcon,
                    backgroundColor: Colors.transparent,
                    backgroundImage: theme.systemAssets.adaptiveIconBackground,
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
