import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({
    required this.image,
    required this.name,
    required this.onTap,
    required this.onRemove,
    required this.imageFilter,
    this.description,
    super.key,
  });

  final String name;
  final String? description;

  Size get _size => const Size.square(200);

  final ImageModel image;
  final ImageFilterModel imageFilter;

  final void Function(ImageFilterModel format) onTap;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.surfaceDim.withValues(alpha: 0.5),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        width: _size.width,
        height: _size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              child: SizedBox(
                width: _size.width,
                height: _size.height,
                child: ImageResource(
                  imageModel: image,
                ),
              ),
              onTap: () => onTap(imageFilter),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Tooltip(
                margin: const EdgeInsets.only(left: 32, top: 8, bottom: 8, right: 8),
                preferBelow: true,
                message: description ?? '',
                child: Container(
                  height: _size.height / 5,
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  color: colorScheme.tertiaryContainer.withValues(alpha: 0.95),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tooltip(
                    message: imageFilter.toString(),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme.tertiary.withValues(alpha: 0.4)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Icon(
                        Icons.info_outline,
                        color: colorScheme.tertiary,
                      ),
                    ),
                  ),
                  // TODO(dmitry): Remove also on server if user delete image
                  Visibility(
                    visible: image.isAvailable,
                    child: GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.error.withValues(alpha: 0.5)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Icon(
                          Icons.remove_circle,
                          color: colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
