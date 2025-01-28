import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ImageRenderer extends StatelessWidget {
  final Resource resource;
  final BoxFit fit;

  const ImageRenderer({
    Key? key,
    required this.resource,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double? width = constraints.maxWidth == double.infinity ? null : constraints.maxWidth;
        final double? height = constraints.maxHeight == double.infinity ? null : constraints.maxHeight;

        if (resource is UrlResource) {
          final urlResource = resource as UrlResource;
          if (urlResource.url.toLowerCase().contains('.svg')) {
            return SvgPicture.network(
              urlResource.url,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (BuildContext context) => Center(
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
                return const Center(child: Icon(Icons.broken_image, size: 48.0));
              },
            );
          }
        } else if (resource is ByteResource) {
          final byteResource = resource as ByteResource;
          return Image.memory(
            byteResource.bytes,
            width: width,
            height: height,
            fit: fit,
          );
        } else {
          return const Center(child: Icon(Icons.error, size: 48.0));
        }
      },
    );
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
  final String url;

  const UrlResource(this.url);
}

class ByteResource extends Resource {
  final Uint8List bytes;

  const ByteResource(this.bytes);
}
