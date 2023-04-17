import 'package:flutter/material.dart';

enum SupportFormat {
  svg(format: 'image/svg+xml'),
  png(format: 'image/png');

  const SupportFormat({
    required this.format,
  });

  final String format;
}

class ImageFilterModel {
  ImageFilterModel({
    required this.format,
    this.size,
  });

  ImageFilterModel.png(Size size) : this(format: SupportFormat.png, size: size);

  ImageFilterModel.svg() : this(format: SupportFormat.svg);

  final SupportFormat format;
  final Size? size;

  String get extension => format.name;
}
