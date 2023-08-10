import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:webtrit_configurator/core/core.dart';

class ImageResource extends StatelessWidget {
  const ImageResource({
    Key? key,
    required this.imageModel,
    this.fit = BoxFit.cover,
    this.defaultWidget = const Center(
      child: GridWidget(
        density: 8,
      ),
    ),
  }) : super(key: key);

  final ImageModel imageModel;
  final Widget defaultWidget;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    switch (imageModel.location) {
      case ImageLocation.memory:
        return MemorySource(
          imageFormat: imageModel.type,
          base64: imageModel.data!,
          fit: fit,
        );
      case ImageLocation.network:
        return NetworkSource(
          imageFormat: imageModel.type,
          url: imageModel.url!,
          fit: fit,
        );
      case ImageLocation.empty:
        return defaultWidget;
    }
  }
}

class MemorySource extends StatelessWidget {
  const MemorySource({
    super.key,
    required this.imageFormat,
    required this.base64,
    this.fit,
  });

  final ImageFormat imageFormat;
  final String base64;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    switch (imageFormat) {
      case ImageFormat.vector:
        return SvgPicture.memory(
          base64Decode(base64),
          fit: BoxFit.cover,
        );
      case ImageFormat.raster:
        return Image.memory(
          base64Decode(base64),
          fit: BoxFit.cover,
        );
    }
  }
}

class NetworkSource extends StatelessWidget {
  const NetworkSource({
    super.key,
    required this.imageFormat,
    required this.url,
    required this.fit,
  });

  final ImageFormat imageFormat;
  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    switch (imageFormat) {
      case ImageFormat.vector:
        return SvgPicture.network(
          url,
          fit: BoxFit.cover,
        );
      case ImageFormat.raster:
        return Image.network(
          url,
          fit: BoxFit.cover,
        );
    }
  }
}
