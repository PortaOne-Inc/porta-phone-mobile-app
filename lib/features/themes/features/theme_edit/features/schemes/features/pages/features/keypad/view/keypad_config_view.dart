import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import 'action_pad_editor_minimal.dart';


class KeypadConfigView extends StatefulWidget {
  const KeypadConfigView({super.key});

  @override
  State<KeypadConfigView> createState() => _KeypadConfigViewState();
}

class _KeypadConfigViewState extends State<KeypadConfigView> {
  UpdateThemCubit get _cubit => context.read<UpdateThemCubit>();

  KeypadPageConfig get _cfg {
    final pages = context.watch<UpdateThemCubit>().state.themePageConfig;
    return pages.keypad;
  }

  void _set(KeypadPageConfig cfg) {
    _cubit.add(ThemePageEvent.setKeypadPage(cfg));
  }

  @override
  Widget build(BuildContext context) {
    final cfg = _cfg;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          // НОВЕ
          ThemeOverrideSelector(
            config: cfg.themeOverride,
            onChanged: (v) => _set(cfg.copyWith(themeOverride: v)),
          ),
          const SizedBox(height: 16),

          BorderContainer(
            title: 'System UI Overlay',
            descriptionWidget: DescriptionRow.info(
              'Controls system status bar and navigation bar colors.',
            ),
            child: SystemUiOverlayQuickToggles(
              value: cfg.systemUiOverlayStyle,
              onChanged: (v) => _set(cfg.copyWith(systemUiOverlayStyle: v)),
            ),
          ),
          const SizedBox(height: 16),
          PageBackgroundEditor(
            value: cfg.background,
            onChanged: (PageBackground? value) => _set(cfg.copyWith(background: value)),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Number input (TextField)',
            descriptionWidget: DescriptionRow.info(
              'Configure the appearance of the number input field.',
            ),
            child: TextFieldConfigEditorMinimal(
              value: cfg.textField ?? const TextFieldConfig(),
              onChanged: (v) => _set(cfg.copyWith(textField: v)),
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Contact name (TextField)',
            padding: const EdgeInsets.all(16),
            child: TextFieldConfigEditorMinimal(
              value: cfg.contactName ?? const TextFieldConfig(),
              onChanged: (v) => _set(cfg.copyWith(contactName: v)),
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Keypad styles',
            description: 'Configure digits, subtext, and spacing for the keypad.',
            padding: const EdgeInsets.all(16),
            child: KeypadStyleEditorMinimal(
              value: cfg.keypad ?? const KeypadStyleConfig(),
              onChanged: (v) => _set(cfg.copyWith(keypad: v)),
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Action pad',
            padding: const EdgeInsets.all(16),
            child: ActionPadEditorMinimal(
              value: cfg.actionpad ?? const ActionPadWidgetConfig(),
              onChanged: (v) => _set(cfg.copyWith(actionpad: v)),
            ),
          ),
        ],
      ),
    );
  }
}