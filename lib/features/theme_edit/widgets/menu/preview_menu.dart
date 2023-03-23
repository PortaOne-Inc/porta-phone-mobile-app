import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/switchers/switchers.dart';

import '../preview/type_of_preview.dart';
import 'menu_space.dart';

class MenuPreview extends StatelessWidget {
  const MenuPreview({
    super.key,
    required this.onMenuTab,
    required this.onScaleTab,
    required this.onFrameTab,
    required this.isEnableFrame,
  });

  final Function() onMenuTab;
  final Function(PreviewType type) onScaleTab;
  final Function(bool isEnableFrame) onFrameTab;

  final bool isEnableFrame;

  @override
  Widget build(BuildContext context) {
    return MenuSpace(
      isTopPosition: true,
      background: const Color(0xfffafafa),
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
        const Spacer(),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => onMenuTab(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(
                Icons.menu,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
