import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webtrit_configurator/core/core.dart';

class UrlImageField extends StatelessWidget {
  const UrlImageField({
    required this.title,
    required this.constraints,
    this.imageUrl,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final String title;
  final String? imageUrl;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: margin,
        elevation: 1,
        child: ConstrainedBox(
          constraints: constraints,
          child: Stack(
            children: [
              if (imageUrl == null || imageUrl!.isEmpty)
                Positioned.fill(
                  child: CustomPaint(
                    painter: _PatternPainter(primaryColor: theme.colorScheme.primary),
                  ),
                )
              else
                Positioned.fill(
                  child: ImageRenderer(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: padding,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageRenderer extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const ImageRenderer({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
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

class _PatternPainter extends CustomPainter {
  _PatternPainter({required this.primaryColor});

  final Color primaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    const cellSize = 20.0;

    for (var row = 0; row < (size.height / cellSize).ceil(); row++) {
      for (var col = 0; col < (size.width / cellSize).ceil(); col++) {
        paint.color = (row + col).isEven ? primaryColor.withOpacity(0.85) : primaryColor.withOpacity(0.65);

        final rect = Rect.fromLTWH(col * cellSize, row * cellSize, cellSize, cellSize);
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
