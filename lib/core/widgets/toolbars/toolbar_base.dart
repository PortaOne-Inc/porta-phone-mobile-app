import 'package:flutter/material.dart';

class BaseToolBar extends StatefulWidget implements PreferredSizeWidget {
  const BaseToolBar({
    super.key,
    required this.child,
    this.isVisibleProgress = false,
  });

  final Widget child;
  final bool isVisibleProgress;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  createState() => _BaseToolBarState();
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
        boxShadow: _getBoxShadow(),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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

  List<BoxShadow> _getBoxShadow() => const [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(1, 1),
        ),
      ];
}
