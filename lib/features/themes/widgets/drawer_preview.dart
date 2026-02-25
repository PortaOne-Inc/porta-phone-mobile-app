import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../features/theme_edit/widgets/widgets.dart';

class DrawerPreview extends StatelessWidget {
  const DrawerPreview({
    required this.screenshots,
    required this.focusScreenPosition,
    required this.onTapScreen,
    super.key,
  });

  final int focusScreenPosition;
  final List<Widget> screenshots;
  final void Function(int position) onTapScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.trackpad},
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            cacheExtent: 200,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8);
            },
            itemCount: screenshots.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (BuildContext context, int index) {
              final isFocused = index == focusScreenPosition;
              return RepaintBoundary(
                child: GestureDetector(
                  onTap: () => onTapScreen(index),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: isFocused
                          ? Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TypeOfPreview(
                      constraints: const BoxConstraints(maxHeight: 124),
                      child: screenshots[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
