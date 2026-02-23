import 'package:flutter/material.dart';

const double menuItemHeight = 32;

class ToolbarMenuItem<T> extends PopupMenuItem<T> {
  ToolbarMenuItem({
    required String text,
    required TextStyle style,
    super.value,
    super.key,
  }) : super(
         child: Text(text, style: style),
         height: menuItemHeight,
         padding: const EdgeInsets.all(4),
       );
}
