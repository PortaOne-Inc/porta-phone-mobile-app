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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        SizedBox(
            height: 124,
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
                    isFocused: index == focusScreenPosition,
                    constraints: const BoxConstraints(maxHeight: 224),
                    child: screenshots[index],
                  ),
                  onTap: () => onTapScreen.call(index),
                );
              },
            ))
      ],
    );
  }
}
