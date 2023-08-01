import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:webtrit_configurator/core/core.dart';

import 'network_image.dart' as widgets;

// TODO: Change logic
class ImageResource extends StatelessWidget {
  const ImageResource({
    Key? key,
    this.imageModel,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final ImageModel? imageModel;
  final Function() onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black.withOpacity(0.05),
        padding: const EdgeInsets.all(16),
        child: isNetwork(imageModel)
            ? widgets.NetworkImage(
                imageUrl: imageModel!.url!,
                size: size,
              )
            : isVector(imageModel)
                ? SvgPicture.memory(
                    width: size.width,
                    height: size.height,
                    base64Decode(imageModel!.data!),
                    fit: BoxFit.cover,
                  )
                : isRaster(imageModel)
                    ? Image.memory(
                        width: size.width,
                        height: size.height,
                        base64Decode(imageModel!.data!),
                        fit: BoxFit.cover,
                      )
                    : SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Colors.orange.withOpacity(0.3),
                          size: 32,
                        ),
                      ),
      ),
    );
  }

  bool isRaster(ImageModel? image) {
    if (image?.isNotAvailable ?? false) {
      return false;
    } else {
      return image!.isRaster;
    }
  }

  bool isNetwork(ImageModel? image) {
    return image?.isNetwork ?? false;
  }

  bool isVector(ImageModel? image) {
    if (image?.isNotAvailable ?? false) {
      return false;
    } else {
      return image!.isVector;
    }
  }
}
