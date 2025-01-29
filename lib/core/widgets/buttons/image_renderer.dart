import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ImageRenderer extends StatelessWidget {
  const ImageRenderer({
    required this.resource,
    super.key,
    this.fit = BoxFit.cover,
  });

  final Resource resource;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth == double.infinity ? null : constraints.maxWidth;
        final height = constraints.maxHeight == double.infinity ? null : constraints.maxHeight;

        if (resource is UrlResource) {
          final urlResource = resource as UrlResource;
          if (urlResource.url.toLowerCase().contains('.svg')) {
            return SvgPicture.network(
              urlResource.url,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Image.network(
              urlResource.url,
              width: width,
              height: height,
              fit: fit,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Center(child: Icon(Icons.broken_image, size: 48));
              },
            );
          }
        } else if (resource is ByteResource) {
          final byteResource = resource as ByteResource;
          if (_isSvgBytes(byteResource.bytes)) {
            return SvgPicture.memory(
              byteResource.bytes,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Image.memory(
              byteResource.bytes,
              width: width,
              height: height,
              fit: fit,
            );
          }
        } else {
          return const Center(child: Icon(Icons.error, size: 48));
        }
      },
    );
  }

  bool _isSvgBytes(Uint8List bytes) {
    final header = utf8.decode(bytes.take(100).toList(), allowMalformed: true).trimLeft();
    return header.startsWith('<svg');
  }
}

abstract class Resource {
  const Resource();

  factory Resource.byte(Uint8List bytes) {
    return ByteResource(bytes);
  }

  factory Resource.url(String url) {
    return UrlResource(url);
  }
}

class UrlResource extends Resource {
  const UrlResource(this.url);

  final String url;
}

class ByteResource extends Resource {
  const ByteResource(this.bytes);

  final Uint8List bytes;
}
