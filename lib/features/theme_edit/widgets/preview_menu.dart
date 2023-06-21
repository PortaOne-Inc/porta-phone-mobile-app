import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/widgets/switchers/switchers.dart';

import 'type_of_preview.dart';
import 'menu_space.dart';

class MenuPreview extends StatelessWidget {
  const MenuPreview({
    super.key,
    required this.onScaleTab,
    required this.onFrameTab,
    required this.isEnableFrame,
  });

  final Function(PreviewType type) onScaleTab;
  final Function(bool isEnableFrame) onFrameTab;

  final bool isEnableFrame;

  @override
  Widget build(BuildContext context) {
    return MenuSpace(
      isTopPosition: true,
      background: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Dropdown(
            items: [
              context.l10n.feature_theme_edit_Dropdown_scale_x1,
              context.l10n.feature_theme_edit_Dropdown_scale_x2,
              context.l10n.feature_theme_edit_Dropdown_scale_x3,
            ],
            onSelect: (int position) {
              onScaleTab(PreviewType.values[position]);
            },
          ),
        ),
        const SizedBox(width: 8),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => onFrameTab(!isEnableFrame),
            child: Icon(
              isEnableFrame ? Icons.phone_android : Icons.phonelink_erase_outlined,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
