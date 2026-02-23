import 'package:flutter/material.dart';

import '../features/theme_edit/widgets/mock_device.dart';

class TypePreview extends StatelessWidget {
  const TypePreview({
    required this.screens,
    required this.screenFocus,
    required this.isFrameVisible,
    required this.onFocusPosition,
    super.key,
  });

  final int screenFocus;
  final bool isFrameVisible;
  final List<Widget> screens;
  final void Function(int position) onFocusPosition;

  @override
  Widget build(BuildContext context) {
    if (screens.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: TypeOfPreview(
          key: ValueKey(screenFocus),
          isFrameVisible: isFrameVisible,
          constraints: const BoxConstraints(),
          child: screens[screenFocus],
        ),
      );
    }
  }
}
