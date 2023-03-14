import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

import '../model/theme_name_input.dart';
import '../extension/extension.dart';

class ThemeCollectionCreateDialog extends StatefulWidget {
  const ThemeCollectionCreateDialog({
    super.key,
    required this.onCreateTheme,
  });

  final Function(String name, Color color) onCreateTheme;

  @override
  State<ThemeCollectionCreateDialog> createState() => _ThemeCollectionCreateDialogState();
}

class _ThemeCollectionCreateDialogState extends State<ThemeCollectionCreateDialog> {
  var _selectedColor = Colors.black38;
  var nameField = const ThemeNameInput.pure();
  var isDefault = false;
  final _controller = TextEditingController(text: DateTime.now().toIso8601String());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      insetPadding: const EdgeInsets.symmetric(horizontal: 64),
      child: Container(
        height: MediaQuery.of(context).size.width > (MediaQuery.of(context).size.height * 1.4)
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ColorField(
                    title: context.l10n.configurator_color_primary,
                    color: _selectedColor,
                    onTap: _onSelectColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isDefault = !isDefault;
                    });
                  },
                  child: Card(
                    elevation: isDefault ? 2 : 0.75,
                    margin: const EdgeInsets.only(left: 8),
                    child: Tooltip(
                      message: context.l10n.feature_theme_as_default,
                      child: const SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.radio_button_checked,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: context.l10n.theme_name,
                errorText: nameField.errorL10n(context),
              ),
              onChanged: (it) {
                setState(() {
                  nameField = ThemeNameInput.dirty(it);
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Button(
              isEnable: !nameField.invalid,
              title: context.l10n.theme_create,
              onPressed: () {
                widget.onCreateTheme(_controller.text, _selectedColor);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectColor(Color color) async {
    _selectedColor = await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 64),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: ColorPicker(
            onDeclineColor: () => Navigator.of(context).pop(),
            onAcceptColor: (color) => Navigator.of(context).pop(color),
            initialColor: color,
          ),
        ),
      ),
    );
    setState(() {});
  }
}
