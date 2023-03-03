import 'package:flutter/material.dart';

const double menuItemHeight = 32;

class ToolbarMenuItem extends PopupMenuItem {
  ToolbarMenuItem({
    super.key,
    super.value,
    required String text,
  }) : super(
          child: Text(text),
          height: menuItemHeight,
          padding: const EdgeInsets.all(4),
        );
}
