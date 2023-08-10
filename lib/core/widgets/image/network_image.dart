import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class NetworkImage extends StatelessWidget {
  final String imageUrl;
  final Size size;

  const NetworkImage({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final Uri uri = Uri.parse(imageUrl);
    final String extension = uri.pathSegments.last.split('.').last;
    if (extension.toLowerCase() == 'svg') {
      return SvgPicture.network(
        imageUrl,
        width: size.width,
        height: size.height,
      );
    } else {
      return Image.network(
        imageUrl,
        width: size.width,
        height: size.height,
      );
    }
  }
}
