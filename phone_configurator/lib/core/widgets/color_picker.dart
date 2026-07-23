import 'package:flutter/material.dart';

import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart'
    as color_picker;

import 'package:webtrit_configurator/localization/localization.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    this.onAcceptColor,
    this.onDeclineColor,
    this.initialColor = Colors.white,
  });

  final void Function(Color color)? onAcceptColor;
  final void Function()? onDeclineColor;
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
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            color_picker.ColorPicker(
              color: _currentColor,
              onChanged: (value) => _currentColor = value,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _hide,
                  child: Text(context.l10n.configurator_cancel),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _hideColorChooserAndReturnResult,
                  child: Text(context.l10n.configurator_got_it),
                ),
              ],
            ),
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
