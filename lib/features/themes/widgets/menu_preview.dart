import 'package:flutter/material.dart';

import 'menu_space.dart';

class MenuPreviewToolbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuPreviewToolbar({
    required this.onFrameTab,
    required this.isEnableFrame,
    required this.onInteractiveTab,
    required this.isInteractive,
    super.key,
  });

  final void Function(bool isEnableFrame) onFrameTab;

  final bool isEnableFrame;

  final void Function(bool isInteractive) onInteractiveTab;

  final bool isInteractive;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MenuSpace(
      isTopPosition: true,
      background: colorScheme.surfaceDim.withValues(alpha: 0.2),
      children: [
        const Spacer(),
        IconButton(
          tooltip: isInteractive ? 'Disable preview interaction' : 'Enable preview interaction',
          onPressed: () => onInteractiveTab(!isInteractive),
          icon: Icon(isInteractive ? Icons.touch_app : Icons.do_not_touch_outlined, size: 20),
        ),
        IconButton(
          tooltip: isEnableFrame ? 'Hide device frame' : 'Show device frame',
          onPressed: () => onFrameTab(!isEnableFrame),
          icon: Icon(isEnableFrame ? Icons.phone_android : Icons.phonelink_erase_outlined, size: 20),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
