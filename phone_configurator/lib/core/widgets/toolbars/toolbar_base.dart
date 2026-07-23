import 'package:flutter/material.dart';

class BaseToolBar extends StatefulWidget implements PreferredSizeWidget {
  const BaseToolBar({
    required this.child,
    this.isVisibleProgress = false,
    super.key,
  });

  final Widget child;
  final bool isVisibleProgress;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _BaseToolBarState();
}

class _BaseToolBarState extends State<BaseToolBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        boxShadow: _getBoxShadow(context),
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: widget.isVisibleProgress ? 1.0 : 0.0,
            child: const LinearProgressIndicator(),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  List<BoxShadow> _getBoxShadow(BuildContext context) => [
    BoxShadow(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(1, 1),
    ),
  ];
}
