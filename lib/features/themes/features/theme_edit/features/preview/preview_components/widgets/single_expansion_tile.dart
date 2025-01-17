import 'package:flutter/material.dart';

class SingleExpansionTile extends StatelessWidget {
  const SingleExpansionTile({
    required this.tile,
    required this.child,

    this.initiallyExpanded = false,
    super.key,
  }) : super();

  final String tile;
  final bool initiallyExpanded;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      childrenPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      title: Text(tile),
      children: [child],
    );
  }
}
