import 'package:flutter/material.dart';

class FadeBackground extends StatelessWidget {
  const FadeBackground({required this.visibility, super.key});

  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: visibility
          ? Container(
              color: Colors.white.withValues(alpha: 0.3),
              key: const ValueKey('FadeBackgroundVisible'),
            )
          : const SizedBox(key: ValueKey('FadeBackgroundHidden')),
    );
  }
}
