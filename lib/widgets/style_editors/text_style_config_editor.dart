import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../style_controls/style_controls.dart';

class TextStyleConfigEditor extends StatelessWidget {
  const TextStyleConfigEditor({
    required this.label,
    required this.value,
    required this.onChanged,
    this.onClear,
    super.key,
  });

  final String label;

  /// Current configuration. If null, the editor shows a "Customize" button.
  final TextStyleConfig? value;

  /// Emits a non-null configuration when properties change.
  final ValueChanged<TextStyleConfig> onChanged;

  /// Called when the user wants to reset/remove the configuration.
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEnabled = value != null;

    // Safe non-null accessor for building UI when enabled
    final safeValue = value ?? const TextStyleConfig();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
          child: Row(
            children: [
              if (label.isNotEmpty) Text(label, style: theme.textTheme.titleSmall),
              const Spacer(),
              if (isEnabled)
                if (onClear != null)
                  InkWell(
                    onTap: onClear,
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        'Reset to default',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink()
              else
                FilledButton.tonal(
                  onPressed: () => onChanged(const TextStyleConfig()),
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: const Text('Customize'),
                ),
            ],
          ),
        ),
        if (isEnabled)
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _FontFamilyRow(
                    fontFamily: safeValue.fontFamily,
                    fontSize: safeValue.fontSize,
                    onPickFont: () async {
                      final selected = await context.showFontPicker();
                      if (context.mounted && selected != null && selected.isNotEmpty) {
                        onChanged(safeValue.copyWith(fontFamily: selected));
                      }
                    },
                    onClearFont: () => onChanged(safeValue.copyWith(fontFamily: null)),
                    onSizeChanged: (v) => onChanged(safeValue.copyWith(fontSize: v)),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ColorInput(
                          label: 'Text Color',
                          color: safeValue.color?.toColor(),
                          onTap: () async {
                            final picked = await context.showColorPicker(
                              currentColor: safeValue.color?.toColor(),
                            );
                            if (context.mounted && picked != null) {
                              onChanged(safeValue.copyWith(color: picked.toHex()));
                            }
                          },
                          onClear: () => onChanged(safeValue.copyWith(color: null)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ColorInput(
                          label: 'Background',
                          color: safeValue.backgroundColor?.toColor(),
                          onTap: () async {
                            final picked = await context.showColorPicker(
                              currentColor: safeValue.backgroundColor?.toColor(),
                            );
                            if (context.mounted && picked != null) {
                              onChanged(safeValue.copyWith(backgroundColor: picked.toHex()));
                            }
                          },
                          onClear: () => onChanged(safeValue.copyWith(backgroundColor: null)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: NumberInputControl(
                          label: 'Line Height',
                          suffixText: 'x',
                          value: safeValue.height,
                          onChanged: (v) => onChanged(safeValue.copyWith(height: v)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: NumberInputControl(
                          label: 'Letter Spacing',
                          suffixText: 'px',
                          value: safeValue.letterSpacing,
                          onChanged: (v) => onChanged(safeValue.copyWith(letterSpacing: v)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _StyleToolbar(
                    weight: safeValue.fontWeight?.weight,
                    isItalic: safeValue.fontStyle?.value == 'italic',
                    decorations: safeValue.decoration?.types ?? [],
                    onWeightChanged: (w) => onChanged(
                      safeValue.copyWith(
                        fontWeight: w == null ? null : FontWeightConfig(weight: w),
                      ),
                    ),
                    onItalicChanged: (isItalic) => onChanged(
                      safeValue.copyWith(
                        fontStyle: isItalic ? const FontStyleConfig(value: 'italic') : null,
                      ),
                    ),
                    onDecorationChanged: (types) => onChanged(
                      safeValue.copyWith(
                        decoration: types.isEmpty
                            ? null
                            : (safeValue.decoration ?? const TextDecorationConfig()).copyWith(types: types),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor.withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.surfaceContainerLowest.withValues(alpha: 0.5),
            ),
            child: Text(
              'Using default style',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}

class _FontFamilyRow extends StatelessWidget {
  const _FontFamilyRow({
    required this.fontFamily,
    required this.fontSize,
    required this.onPickFont,
    required this.onClearFont,
    required this.onSizeChanged,
  });

  final String? fontFamily;
  final double? fontSize;
  final VoidCallback onPickFont;
  final VoidCallback onClearFont;
  final ValueChanged<double?> onSizeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: onPickFont,
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Font Family',
                isDense: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      fontFamily ?? 'Default',
                      style: fontFamily == null
                          ? theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)
                          : theme.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (fontFamily != null) ...[
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: onClearFont,
                      child: const Icon(Icons.close, size: 16),
                    ),
                  ] else
                    const Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: NumberInputControl(
            label: 'Size',
            suffixText: 'px',
            value: fontSize,
            onChanged: onSizeChanged,
          ),
        ),
      ],
    );
  }
}

class _StyleToolbar extends StatelessWidget {
  const _StyleToolbar({
    required this.weight,
    required this.isItalic,
    required this.decorations,
    required this.onWeightChanged,
    required this.onItalicChanged,
    required this.onDecorationChanged,
  });

  final int? weight;
  final bool isItalic;
  final List<String> decorations;
  final ValueChanged<int?> onWeightChanged;
  final ValueChanged<bool> onItalicChanged;
  final ValueChanged<List<String>> onDecorationChanged;

  void _toggleDecoration(String type) {
    final newDecorations = List<String>.from(decorations);
    if (newDecorations.contains(type)) {
      newDecorations.remove(type);
    } else {
      newDecorations.add(type);
    }
    onDecorationChanged(newDecorations);
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Style & Decoration',
        isDense: true,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: weight,
              hint: const Text('Normal'),
              isDense: true,
              style: Theme.of(context).textTheme.bodyMedium,
              items: [100, 200, 300, 400, 500, 600, 700, 800, 900]
                  .map((w) => DropdownMenuItem(
                        value: w,
                        child: Text(
                          w == 400
                              ? '400 (Reg)'
                              : w == 700
                                  ? '700 (Bold)'
                                  : w.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.values[(w ~/ 100) - 1],
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: onWeightChanged,
            ),
          ),
          const VerticalDivider(),
          Row(
            children: [
              _ToolbarIcon(
                icon: Icons.format_italic,
                isSelected: isItalic,
                tooltip: 'Italic',
                onPressed: () => onItalicChanged(!isItalic),
              ),
              _ToolbarIcon(
                icon: Icons.format_underlined,
                isSelected: decorations.contains('underline'),
                tooltip: 'Underline',
                onPressed: () => _toggleDecoration('underline'),
              ),
              _ToolbarIcon(
                icon: Icons.format_strikethrough,
                isSelected: decorations.contains('lineThrough'),
                tooltip: 'Strikethrough',
                onPressed: () => _toggleDecoration('lineThrough'),
              ),
              _ToolbarIcon(
                icon: Icons.vertical_align_top,
                isSelected: decorations.contains('overline'),
                tooltip: 'Overline',
                onPressed: () => _toggleDecoration('overline'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ToolbarIcon extends StatelessWidget {
  const _ToolbarIcon({
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    this.tooltip,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      isSelected: isSelected,
      style: IconButton.styleFrom(
        foregroundColor: isSelected ? colorScheme.primary : theme.iconTheme.color,
        backgroundColor: isSelected ? colorScheme.primary.withValues(alpha: 0.1) : null,
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(32, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
    );
  }
}
