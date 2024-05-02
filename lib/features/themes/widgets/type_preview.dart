import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

import '../features/theme_edit/widgets/mock_device.dart';

enum PreviewType {
  single(position: 0),
  grid(position: 1),
  smallGrid(position: 2);

  const PreviewType({
    required this.position,
  });

  final int position;
}

class TypePreview extends StatelessWidget {
  const TypePreview({
    required this.type,
    required this.screens,
    required this.screenFocus,
    required this.isFrameVisible,
    required this.onFocusPosition,
    super.key,
  });

  final PreviewType type;
  final int screenFocus;
  final bool isFrameVisible;
  final List<Widget> screens;
  final void Function(int position) onFocusPosition;

  @override
  Widget build(BuildContext context) {
    if (screens.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      switch (type) {
        case PreviewType.single:
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: TypeOfPreview(
              key: ValueKey(screenFocus),
              isFrameVisible: isFrameVisible,
              constraints: const BoxConstraints(),
              child: screens[screenFocus],
            ),
          );
        case PreviewType.grid:
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: screens
                  .mapIndexed(
                    (index, screen) => GestureDetector(
                      onTap: () => onFocusPosition(index),
                      child: TypeOfPreview(
                        focusIndicator: Icon(
                          index == screenFocus ? Icons.center_focus_strong_rounded : Icons.center_focus_strong_outlined,
                          color: index == screenFocus ? Colors.green : Colors.black45,
                          size: 16,
                        ),
                        isFrameVisible: isFrameVisible,
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: screen,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );

        case PreviewType.smallGrid:
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: screens
                  .mapIndexed(
                    (index, screen) => GestureDetector(
                      onTap: () => onFocusPosition(index),
                      child: TypeOfPreview(
                        focusIndicator: Icon(
                          index == screenFocus ? Icons.center_focus_strong_rounded : Icons.center_focus_strong_outlined,
                          color: index == screenFocus ? Colors.green : Colors.black45,
                          size: 16,
                        ),
                        isFrameVisible: isFrameVisible,
                        constraints: const BoxConstraints(maxHeight: 500),
                        child: screen,
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
      }
    }
  }
}
