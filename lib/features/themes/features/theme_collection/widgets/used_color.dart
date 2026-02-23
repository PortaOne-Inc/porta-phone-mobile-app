import 'package:flutter/material.dart';

class UsedColor extends StatelessWidget {
  const UsedColor({
    required this.color,
    this.blurRadius = 16,
    this.boxShadow,
    this.size = 8,
    super.key,
  });

  final Color color;
  final double size;
  final double blurRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 2,
                blurRadius: blurRadius,
              ),
            ],
      ),
    );
  }
}
