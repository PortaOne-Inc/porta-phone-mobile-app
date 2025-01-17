import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

extension ContextExtensions on BuildContext {
  /// Shows a color picker dialog and returns the selected color.
  Future<void> selectColor({
    required Color? initialColor,
    required void Function(Color) onColorSelected,
  }) async {
    final result = await showDialog<Color?>(
      context: this,
      builder: (context) => Center(
        child: ColorPicker(
          onDeclineColor: () => Navigator.of(this).pop(),
          onAcceptColor: (color) => Navigator.of(this).pop(color),
          initialColor: initialColor ?? Colors.white,
        ),
      ),
      useRootNavigator: false,
    );
    if (result != null) {
      onColorSelected(result);
    }
  }
}
