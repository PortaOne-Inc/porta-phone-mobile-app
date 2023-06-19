import 'package:flutter/widgets.dart';

import 'widgets.dart';

class DrawerPreview extends StatelessWidget {
  const DrawerPreview({
    super.key,
    required this.screenshots,
    required this.focusScreenPosition,
    required this.onTapScreen,
  });

  final int focusScreenPosition;
  final List<Widget> screenshots;
  final Function(int position) onTapScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 2, bottom: 2),
      child: ListView.builder(
        itemCount: screenshots.length,
        padding: const EdgeInsets.only(right: 8),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: TypeOfPreview(
              isFocused: index == focusScreenPosition,
              constraints: const BoxConstraints(maxHeight: 300),
              child: screenshots[index],
            ),
            onTap: () => onTapScreen.call(index),
          );
        },
      ),
    );
  }
}
