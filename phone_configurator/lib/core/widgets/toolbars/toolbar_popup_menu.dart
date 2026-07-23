import 'package:flutter/material.dart';

class ToolbarPopupMenu<T> extends PopupMenuButton<T> {
  ToolbarPopupMenu({
    required List<PopupMenuItem<T>> items,
    required Color background,
    super.style,
    super.child,
    super.onSelected,
    super.key,
  }) : super(
         itemBuilder: (context) => items,
         offset: const Offset(8, kToolbarHeight),
         color: background,
         elevation: 1,
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(8),
             bottomRight: Radius.circular(8),
           ),
         ),
       );
}
