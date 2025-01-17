import 'package:flutter/widgets.dart';

import 'package:webtrit_phone/theme/styles/styles.dart';
import 'package:webtrit_phone/widgets/widgets.dart';

import '../../../../../../../../core/core.dart';

class DialogConfig extends StatelessWidget {
  const DialogConfig({
    required this.sourceDialogWidgetConfig,
    required this.confirmDialogStyles,
    required this.snackBarStyles,
    required this.callback,
    super.key,
  });

  final DialogWidgetConfig sourceDialogWidgetConfig;
  final ConfirmDialogStyles? confirmDialogStyles;
  final SnackBarStyles? snackBarStyles;
  final ObjectCallback<DialogWidgetConfig> callback;

  @override
  Widget build(BuildContext context) {
    final light = ThemeProvider.of(context).light();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Confirm Dialog',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Active button color 1',
                  color: confirmDialogStyles?.primary?.activeButtonStyle1?.foregroundColor?.resolve({}),
                  onTap: (color) => context.selectColor(
                    initialColor: confirmDialogStyles?.primary?.activeButtonStyle1?.foregroundColor?.resolve({}),
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        confirmDialog:
                            sourceDialogWidgetConfig.confirmDialog.copyWith(activeButtonColor1: color.toHex()),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Active button color 2',
                  color: confirmDialogStyles?.primary?.activeButtonStyle2?.foregroundColor?.resolve({}),
                  onTap: (color) => context.selectColor(
                    initialColor: confirmDialogStyles?.primary?.activeButtonStyle2?.foregroundColor?.resolve({}),
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        confirmDialog:
                            sourceDialogWidgetConfig.confirmDialog.copyWith(activeButtonColor2: color.toHex()),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Default button color',
                  color: confirmDialogStyles?.primary?.defaultButtonStyle?.foregroundColor?.resolve({}),
                  onTap: (color) => context.selectColor(
                    initialColor: confirmDialogStyles?.primary?.defaultButtonStyle?.foregroundColor?.resolve({}),
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        confirmDialog:
                            sourceDialogWidgetConfig.confirmDialog.copyWith(defaultButtonColor: color.toHex()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BorderContainer(
            title: 'SnackBar',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Success background color',
                  color: snackBarStyles?.primary?.successBackgroundColor,
                  onTap: (color) => context.selectColor(
                    initialColor: snackBarStyles?.primary?.successBackgroundColor,
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        snackBar: sourceDialogWidgetConfig.snackBar.copyWith(successBackgroundColor: color.toHex()),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Error background color',
                  color: snackBarStyles?.primary?.errorBackgroundColor,
                  onTap: (color) => context.selectColor(
                    initialColor: snackBarStyles?.primary?.errorBackgroundColor,
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        snackBar: sourceDialogWidgetConfig.snackBar.copyWith(errorBackgroundColor: color.toHex()),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Info background color',
                  color: snackBarStyles?.primary?.infoBackgroundColor,
                  onTap: (color) => context.selectColor(
                    initialColor: snackBarStyles?.primary?.infoBackgroundColor,
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        snackBar: sourceDialogWidgetConfig.snackBar.copyWith(infoBackgroundColor: color.toHex()),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  title: 'Warning background color',
                  color: snackBarStyles?.primary?.warningBackgroundColor,
                  onTap: (color) => context.selectColor(
                    initialColor: snackBarStyles?.primary?.warningBackgroundColor,
                    onColorSelected: (color) => callback(
                      sourceDialogWidgetConfig.copyWith(
                        snackBar: sourceDialogWidgetConfig.snackBar.copyWith(warningBackgroundColor: color.toHex()),
                      ),
                    ),
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
