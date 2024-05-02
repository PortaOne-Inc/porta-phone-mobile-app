import 'package:flutter/material.dart';

const double menuItemHeight = 32;

class ToolbarMenuItem<T> extends PopupMenuItem<T> {
  ToolbarMenuItem({
    required String text,
    super.value,
    super.key,
  }) : super(
          child: Text(text),
          height: menuItemHeight,
          padding: const EdgeInsets.all(4),
        );
}
