// ignore_for_file: cascade_invocations
import 'package:flutter/material.dart';

enum SupportFormat {
  svg(format: 'svg'),
  png(format: 'png');

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

  String get extension => format.name.toUpperCase();

  @override
  String toString() {
    final message = StringBuffer();
    message.write(extension);
    if (size != null) {
      message.writeln();
      message.write('${size!.width} : ${size!.height}');
    }
    return message.toString();
  }
}
