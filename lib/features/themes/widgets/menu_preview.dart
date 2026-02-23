import 'package:flutter/material.dart';

import 'menu_space.dart';

class MenuPreviewToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  const MenuPreviewToolbar({
    required this.onFrameTab,
    required this.isEnableFrame,
    super.key,
  });

  final void Function(bool isEnableFrame) onFrameTab;

  final bool isEnableFrame;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surfaceDim.withAlpha(50),
      child: MenuSpace(
        isTopPosition: true,
        background: colorScheme.surfaceDim.withValues(alpha: 0.2),
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => onFrameTab(!isEnableFrame),
              child: Icon(
                isEnableFrame
                    ? Icons.phone_android
                    : Icons.phonelink_erase_outlined,
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
