import 'package:flutter/material.dart';

class ConditionalProgressBar extends StatelessWidget {
  const ConditionalProgressBar({
    required this.condition,
    required this.child,
    super.key,
  });

  final bool condition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return condition ? child : const Center(child: CircularProgressIndicator());
  }
}
