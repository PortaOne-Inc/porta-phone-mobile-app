import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class NetworkImage extends StatelessWidget {
  const NetworkImage({required this.imageUrl, required this.size, super.key});
  final String imageUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(imageUrl);
    final extension = uri.pathSegments.last.split('.').last;
    if (extension.toLowerCase() == 'svg') {
      return SvgPicture.network(
        imageUrl,
        width: size.width,
        height: size.height,
      );
    } else {
      return Image.network(imageUrl, width: size.width, height: size.height);
    }
  }
}
