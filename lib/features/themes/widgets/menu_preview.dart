import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../models/theme_preview_screen.dart';

import 'menu_space.dart';
import 'type_preview.dart';

class MenuPreviewToolbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuPreviewToolbar({
    required this.onScaleTab,
    required this.onFrameTab,
    required this.isEnableFrame,
    required this.onTypeOfPreview,
    super.key,
  });

  final void Function(PreviewType type) onScaleTab;
  final void Function(bool isEnableFrame) onFrameTab;
  final void Function(ThemePreviewScreen type) onTypeOfPreview;

  final bool isEnableFrame;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surfaceDim.withAlpha(50), // Adjusted for a subtle background
      child: MenuSpace(
        isTopPosition: true,
        background: colorScheme.surfaceDim.withValues(alpha: 0.2),
        children: [
          Dropdown(
            constraints: const BoxConstraints(maxWidth: 224),
            items: const [
              'Layouts',
              'Launch assets',
            ],
            onSelect: (int position) => onTypeOfPreview(ThemePreviewScreen.values[position]),
            icon: const Icon(Icons.menu_open),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Dropdown(
              constraints: const BoxConstraints(maxWidth: 64),
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
            alignment: Alignment.centerRight,
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
