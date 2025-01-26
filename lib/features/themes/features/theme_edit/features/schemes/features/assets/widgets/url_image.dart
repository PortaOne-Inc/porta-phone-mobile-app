import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageRenderer extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const ImageRenderer({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double? width = constraints.maxWidth == double.infinity ? null : constraints.maxWidth;
        final double? height = constraints.maxHeight == double.infinity ? null : constraints.maxHeight;

        if (imageUrl.toLowerCase().contains('.svg') || imageUrl.contains('?alt=media')) {
          return SvgPicture.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            placeholderBuilder: (BuildContext context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Image.network(
            imageUrl,
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
      },
    );
  }
}
