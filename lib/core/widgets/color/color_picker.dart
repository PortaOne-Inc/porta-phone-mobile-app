import 'package:flutter/material.dart';

import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart' as color_picker;

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

class AppColorPickerController {
  Function()? _collapse;

  void collapse() {
    _collapse?.call();
  }
}

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    this.onAcceptColor,
    this.onDeclineColor,
    this.initialColor = Colors.white,
  });

  final Function(Color color)? onAcceptColor;
  final Function()? onDeclineColor;
  final Color initialColor;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  bool _isVisibleColorChooser = false;
  Color? _currentColor;

  @override
  void initState() {
    _currentColor = widget.initialColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisibleColorChooser,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 6,
              blurRadius: 20,
            ),
          ],
        ),
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                color_picker.ColorPicker(
                  color: Colors.blue,
                  onChanged: (value) => _currentColor = value,
                  initialPicker: color_picker.Picker.paletteHue,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text(context.l10n.configurator_cancel),
                      onPressed: () => _hide(),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      child: Text(context.l10n.configurator_got_it),
                      onPressed: () => _hideColorChooserAndReturnResult(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _hideColorChooserAndReturnResult() {
    widget.onAcceptColor?.call(_currentColor!);
    setState(() {
      _isVisibleColorChooser = false;
    });
  }

  void _hide() {
    widget.onDeclineColor?.call();
    setState(() {
      _isVisibleColorChooser = false;
    });
  }
}
