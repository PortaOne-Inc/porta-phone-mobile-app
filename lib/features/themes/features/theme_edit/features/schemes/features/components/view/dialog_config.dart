import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_phone/widgets/widgets.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class DialogConfig extends StatelessWidget {
  const DialogConfig({
    required this.sourceDialogWidgetConfig,
    required this.confirmDialogStyles,
    required this.snackBarStyles,
    super.key,
  });

  final DialogWidgetConfig sourceDialogWidgetConfig;
  final ConfirmDialogStyles? confirmDialogStyles;
  final SnackBarStyles? snackBarStyles;

  @override
  Widget build(BuildContext context) {
    final dialogCfg = sourceDialogWidgetConfig;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Confirm Dialog',
            descriptionWidget: DescriptionRow.info(
              'Configure the confirm dialog active/default button colors.',
            ),
            padding: const EdgeInsets.all(16),
            child: ConfirmDialogEditorMinimal(
              value: dialogCfg.confirmDialog,
              onChanged: (v) => context.read<UpdateThemCubit>().add(
                ThemeWidgetEvent.setConfirmDialog(v),
              ),
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'SnackBar',
            descriptionWidget: DescriptionRow.info(
              'Configure background colors for success, error, info and warning snackbars.',
            ),
            padding: const EdgeInsets.all(16),
            child: SnackBarEditorMinimal(
              value: dialogCfg.snackBar,
              onChanged: (v) => context.read<UpdateThemCubit>().add(
                ThemeWidgetEvent.setSnackBar(v),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
