import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/widgets/widgets.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_phone/features/settings/widgets/widgets.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class GroupConfigTab extends StatelessWidget {
  const GroupConfigTab({
    required this.sourceGroupWidgetConfig,
    this.groupTitleListStyles,
    this.callActionsStyles,
    super.key,
  });

  final GroupWidgetConfig? sourceGroupWidgetConfig;
  final GroupTitleListStyles? groupTitleListStyles;
  final CallActionsStyles? callActionsStyles;

  @override
  Widget build(BuildContext context) {
    final group = sourceGroupWidgetConfig ?? const GroupWidgetConfig();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          BorderContainer(
            title: 'Group Title List Tile',
            descriptionWidget: DescriptionRow.info(
              'Configure background and text colors for group titles.',
            ),
            padding: const EdgeInsets.all(16),
            child: GroupTitleListTileEditorMinimal(
              value: group.groupTitleListTile,
              onChanged: (v) => context.read<UpdateThemCubit>().add(
                ThemeWidgetEvent.setGroupTitleListTile(v),
              ),
              // optional preview hint: pull colors from style ext if you want
            ),
          ),
        ],
      ),
    );
  }
}
