import 'package:flutter/material.dart';

class ConditionalProgressBar extends StatelessWidget {
  const ConditionalProgressBar({
    super.key,
    required this.condition,
    required this.child,
  });

  final bool condition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return condition ? child : const Center(child: CircularProgressIndicator());
  }
}
