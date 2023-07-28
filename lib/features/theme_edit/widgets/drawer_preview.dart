import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.only(top: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 8);
          },
          itemCount: screenshots.length,
          padding: const EdgeInsets.only(right: 8),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: TypeOfPreview(
                focusIndicator: Icon(
                  index == focusScreenPosition ? Icons.center_focus_strong_rounded : Icons.center_focus_strong_outlined,
                  color: index == focusScreenPosition ? Colors.green : Colors.black45,
                  size: 16,
                ),
                constraints: const BoxConstraints(maxHeight: 124),
                child: screenshots[index],
              ),
              onTap: () => onTapScreen.call(index),
            );
          },
        ));
  }
}
