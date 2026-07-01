import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/preview/features/layouts_preview/bloc/preview_mode.dart';

import 'menu_space.dart';

class MenuPreviewToolbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuPreviewToolbar({
    required this.onFrameTab,
    required this.isEnableFrame,
    required this.mode,
    required this.onModeChanged,
    this.onOverrideDartDefine,
    super.key,
  });

  final void Function(bool isEnableFrame) onFrameTab;

  final bool isEnableFrame;

  final PreviewMode mode;

  final void Function(PreviewMode mode) onModeChanged;

  /// When non-null (realtime mode), shows an action that opens the temporary
  /// dart-define override editor.
  final VoidCallback? onOverrideDartDefine;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MenuSpace(
      isTopPosition: true,
      background: colorScheme.surfaceDim.withValues(alpha: 0.2),
      children: [
        const Spacer(),
        Dropdown(
          key: ValueKey(mode),
          items: PreviewMode.values.map((mode) => mode.label).toList(),
          position: mode.index,
          icon: Icon(mode.icon, size: 18, color: colorScheme.secondary),
          onSelect: (position) => onModeChanged(PreviewMode.values[position]),
        ),
        const SizedBox(width: 8),
        if (onOverrideDartDefine != null)
          IconButton(
            tooltip: 'Override dart-define',
            onPressed: onOverrideDartDefine,
            icon: const Icon(Icons.data_object, size: 20),
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
