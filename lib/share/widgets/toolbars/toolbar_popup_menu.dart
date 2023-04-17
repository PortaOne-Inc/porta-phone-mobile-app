import 'package:flutter/material.dart';

class ToolbarPopupMenu extends PopupMenuButton {
  ToolbarPopupMenu({
    super.key,
    super.onSelected,
    super.child,
    required List<PopupMenuItem> items,
  }) : super(
          itemBuilder: (context) => items,
          offset: const Offset(8, kToolbarHeight),
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        );
}
