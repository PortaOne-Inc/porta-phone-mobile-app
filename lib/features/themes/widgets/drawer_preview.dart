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
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8);
            },
            itemCount: screenshots.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            // Symmetric padding for centering
            itemBuilder: (BuildContext context, int index) {
              return TypeOfPreview(
                focusIndicator: IconButton(
                  onPressed: () => onTapScreen.call(index),
                  icon: Icon(
                    index == focusScreenPosition
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off_outlined,
                    color: index == focusScreenPosition
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                    size: 16,
                  ),
                ),
                constraints: const BoxConstraints(maxHeight: 124),
                child: screenshots[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
