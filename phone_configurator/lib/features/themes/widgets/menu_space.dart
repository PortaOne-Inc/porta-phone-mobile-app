import 'package:flutter/material.dart';

class MenuSpace extends StatelessWidget {
  const MenuSpace({
    required this.children,
    required this.isTopPosition,
    this.border = Colors.black87,
    this.borderWidth = 0.1,
    this.background,
    super.key,
  });

  final List<Widget> children;
  final bool isTopPosition;
  final Color border;
  final double borderWidth;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      decoration: BoxDecoration(
        border: Border(
          top: isTopPosition
              ? BorderSide.none
              : BorderSide(width: borderWidth, color: border),
          bottom: isTopPosition
              ? BorderSide(width: borderWidth, color: border)
              : BorderSide.none,
        ),
        color: background ?? Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: children),
    );
  }
}
