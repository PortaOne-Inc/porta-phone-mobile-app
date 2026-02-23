import 'package:flutter/material.dart';

class SimpleScaffold extends StatelessWidget {
  const SimpleScaffold({required this.body, required this.appBar, super.key});

  final Widget body;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          appBar,
          Divider(
            thickness: 4,
            color: Theme.of(context).colorScheme.surfaceContainerLow,
          ),
          Flexible(child: body),
        ],
      ),
    );
  }
}
