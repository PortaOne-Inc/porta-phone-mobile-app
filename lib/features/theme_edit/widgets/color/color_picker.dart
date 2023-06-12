import 'package:flutter/material.dart';

import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart' as color_picker;

import 'package:webtrit_configurator/core/l10n/l10n.dart';

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
  late Color _currentColor;

  @override
  void initState() {
    _currentColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            color_picker.ColorPicker(
              color: _currentColor,
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
    );
  }

  void _hideColorChooserAndReturnResult() {
    widget.onAcceptColor?.call(_currentColor);
    setState(() {});
  }

  void _hide() {
    widget.onDeclineColor?.call();
    setState(() {});
  }
}
