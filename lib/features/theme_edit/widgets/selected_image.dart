import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:webtrit_configurator/core/widgets/image/image.dart';

import 'package:webtrit_configurator/share/entity/models/theme/image_model.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
    required this.onRemove,
  });

  final ImageModel? image;
  final String name;
  final Function() onTap;
  final Function() onRemove;
  final Size _size = const Size.square(200);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        width: _size.width,
        height: _size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageResource(
              imageModel: image,
              size: _size,
              onTap: onTap,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                color: Colors.black38,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                ),
              ),
            ),
            Visibility(
              visible: (image?.isAvailable ?? false),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () => onRemove(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
