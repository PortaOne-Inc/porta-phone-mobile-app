import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageRenderer extends StatelessWidget {
  const ImageRenderer({
    required this.resource,
    super.key,
    this.fit = BoxFit.scaleDown,
  });

  final Resource resource;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth == double.infinity
            ? null
            : constraints.maxWidth;
        final height = constraints.maxHeight == double.infinity
            ? null
            : constraints.maxHeight;

        if (resource is UrlResource) {
          final urlResource = resource as UrlResource;
          if (_isSvgUrl(urlResource.url)) {
            return SvgPicture.network(
              urlResource.url,
              width: width,
              height: height,
              fit: fit,
              placeholderBuilder: (BuildContext context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else {
            return Image.network(
              urlResource.url,
              width: width,
              height: height,
              fit: fit,
              loadingBuilder:
                  (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                    return const Center(
                      child: Icon(Icons.broken_image, size: 48),
                    );
                  },
            );
          }
        } else if (resource is ByteResource) {
          final byteResource = resource as ByteResource;
          return _buildByteImage(byteResource.bytes, width, height);
        } else if (resource is FutureByteResource) {
          final futureByteResource = resource as FutureByteResource;
          return FutureBuilder<Uint8List?>(
            future: futureByteResource.bytesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data == null) {
                return const Center(child: Icon(Icons.broken_image, size: 48));
              }
              return _buildByteImage(snapshot.data!, width, height);
            },
          );
        } else if (resource is EmptyResource) {
          return SizedBox(width: width, height: height);
        } else {
          return const Center(child: Icon(Icons.error, size: 48));
        }
      },
    );
  }

  Widget _buildByteImage(Uint8List bytes, double? width, double? height) {
    final cleanSvgBytes = _cleanSvgBytes(bytes);
    if (_isSvgBytes(cleanSvgBytes)) {
      return SvgPicture.memory(
        cleanSvgBytes,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (BuildContext context) =>
            const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Image.memory(
        bytes,
        width: width,
        height: height,
        fit: fit,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Center(child: Icon(Icons.broken_image, size: 48));
            },
      );
    }
  }

  bool _isSvgUrl(String url) {
    final uri = Uri.parse(url);
    final path = uri.path.toLowerCase();
    return path.endsWith('.svg');
  }

  bool _isSvgBytes(Uint8List bytes) {
    final header = utf8
        .decode(bytes.take(100).toList(), allowMalformed: true)
        .trimLeft();
    return header.startsWith('<svg') || header.contains('<svg');
  }

  Uint8List _cleanSvgBytes(Uint8List bytes) {
    final svgString = utf8.decode(bytes, allowMalformed: true);
    final cleanedSvg = svgString
        .replaceAll(
          RegExp(r'<\?xml.*?\?>|<!DOCTYPE[^>]*>', multiLine: true),
          '',
        )
        .trim();
    return Uint8List.fromList(utf8.encode(cleanedSvg));
  }
}

abstract class Resource {
  const Resource();

  factory Resource.byte(Uint8List bytes) {
    return ByteResource(bytes);
  }

  factory Resource.empty() {
    return EmptyResource();
  }

  factory Resource.url(String? url) {
    if (url == null || url.isEmpty) {
      return EmptyResource();
    }
    return UrlResource(url);
  }

  factory Resource.futureByte(Future<Uint8List?> bytesFuture) {
    return FutureByteResource(bytesFuture);
  }
}

class UrlResource extends Resource {
  const UrlResource(this.url);

  final String url;
}

class EmptyResource extends Resource {}

class ByteResource extends Resource {
  const ByteResource(this.bytes);

  final Uint8List bytes;
}

class FutureByteResource extends Resource {
  const FutureByteResource(this.bytesFuture);

  final Future<Uint8List?> bytesFuture;
}
