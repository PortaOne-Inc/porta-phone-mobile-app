import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../extension/extension.dart';
import '../model/theme_name_input.dart';

class ThemeCreateDialog extends StatefulWidget {
  const ThemeCreateDialog({
    super.key,
    required this.onCreateTheme,
  });

  final Function(String name, Color color) onCreateTheme;

  @override
  State<ThemeCreateDialog> createState() => _ThemeCreateDialogState();
}

class _ThemeCreateDialogState extends State<ThemeCreateDialog> {
  final _selectedColor = Colors.black38;
  var _isDefault = false;
  final _controller = TextEditingController();
  ThemeNameInput? _themeNameInput;

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
            Text(
              context.l10n.feature_theme_create_title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: context.l10n.theme_name,
                    errorText: _themeNameInput?.errorL10n(context),
                  ),
                  onChanged: (it) {
                    setState(() {
                      _themeNameInput = ThemeNameInput.dirty(it);
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isDefault = !_isDefault;
                  });
                },
                child: Card(
                  elevation: _isDefault ? 2 : 0.75,
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
              )
            ]),
            const SizedBox(
              height: 16,
            ),
            Button(
              isEnable: _themeNameInput?.isValid ?? false,
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
}
