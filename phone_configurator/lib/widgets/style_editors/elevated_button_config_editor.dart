import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// A compact, tabbed editor for [ElevatedButtonWidgetConfig].
/// Separates configuration into Active and Disabled states for better UX.
class ElevatedButtonConfigEditor extends StatelessWidget {
  const ElevatedButtonConfigEditor({
    required this.value,
    required this.onChanged,
    super.key,
    this.title,
  });

  final ElevatedButtonWidgetConfig value;
  final ValueChanged<ElevatedButtonWidgetConfig> onChanged;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
            child: Text(title!, style: theme.textTheme.titleSmall),
          ),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: theme.colorScheme.primary,
                  unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'Active State'),
                    Tab(text: 'Disabled State'),
                  ],
                ),
                SizedBox(
                  height:
                      240, // Fixed height to accommodate content comfortably
                  child: TabBarView(
                    children: [
                      _ActiveStatePanel(value: value, onChanged: onChanged),
                      _DisabledStatePanel(value: value, onChanged: onChanged),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActiveStatePanel extends StatelessWidget {
  const _ActiveStatePanel({required this.value, required this.onChanged});

  final ElevatedButtonWidgetConfig value;
  final ValueChanged<ElevatedButtonWidgetConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ColorInput(
          label: 'Background',
          color: value.backgroundColor?.toColor(),
          onTap: () =>
              _pickColor(context, value.backgroundColor?.toColor(), (hex) {
                onChanged(value.copyWith(backgroundColor: hex));
              }),
          onClear: () => onChanged(value.copyWith(backgroundColor: null)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ColorInput(
                label: 'Text',
                color: value.textColor?.toColor(),
                onTap: () =>
                    _pickColor(context, value.textColor?.toColor(), (hex) {
                      onChanged(value.copyWith(textColor: hex));
                    }),
                onClear: () => onChanged(value.copyWith(textColor: null)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ColorInput(
                label: 'Icon',
                color: value.iconColor?.toColor(),
                onTap: () =>
                    _pickColor(context, value.iconColor?.toColor(), (hex) {
                      onChanged(value.copyWith(iconColor: hex));
                    }),
                onClear: () => onChanged(value.copyWith(iconColor: null)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ColorInput(
          label: 'Overlay / Ripple',
          color: value.foregroundColor?.toColor(),
          onTap: () =>
              _pickColor(context, value.foregroundColor?.toColor(), (hex) {
                onChanged(value.copyWith(foregroundColor: hex));
              }),
          onClear: () => onChanged(value.copyWith(foregroundColor: null)),
        ),
      ],
    );
  }

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onPick,
  ) async {
    final picked = await context.showColorPicker(currentColor: current);
    if (context.mounted && picked != null) {
      onPick(picked.toHex());
    }
  }
}

class _DisabledStatePanel extends StatelessWidget {
  const _DisabledStatePanel({required this.value, required this.onChanged});

  final ElevatedButtonWidgetConfig value;
  final ValueChanged<ElevatedButtonWidgetConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ColorInput(
          label: 'Background',
          color: value.disabledBackgroundColor?.toColor(),
          onTap: () => _pickColor(
            context,
            value.disabledBackgroundColor?.toColor(),
            (hex) {
              onChanged(value.copyWith(disabledBackgroundColor: hex));
            },
          ),
          onClear: () =>
              onChanged(value.copyWith(disabledBackgroundColor: null)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ColorInput(
                label: 'Text / FG',
                color: value.disabledForegroundColor?.toColor(),
                onTap: () => _pickColor(
                  context,
                  value.disabledForegroundColor?.toColor(),
                  (hex) {
                    onChanged(value.copyWith(disabledForegroundColor: hex));
                  },
                ),
                onClear: () =>
                    onChanged(value.copyWith(disabledForegroundColor: null)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ColorInput(
                label: 'Icon',
                color: value.disabledIconColor?.toColor(),
                onTap: () => _pickColor(
                  context,
                  value.disabledIconColor?.toColor(),
                  (hex) {
                    onChanged(value.copyWith(disabledIconColor: hex));
                  },
                ),
                onClear: () =>
                    onChanged(value.copyWith(disabledIconColor: null)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'These colors apply when the button is inactive.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onPick,
  ) async {
    final picked = await context.showColorPicker(currentColor: current);
    if (context.mounted && picked != null) {
      onPick(picked.toHex());
    }
  }
}
