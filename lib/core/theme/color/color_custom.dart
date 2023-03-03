import 'package:flutter/material.dart';

class ColorCustom {
  const ColorCustom({
    required this.color,
    this.blend = true,
  });

  final Color color;
  final bool blend;
}
