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
    this.description,
    this.onClear,
    super.key,
  });

  final String label;
  final String? description;
  final TextStyleConfig? value;
  final ValueChanged<TextStyleConfig> onChanged;
  final VoidCallback? onClear;

  void _handleCustomize() {
    onChanged(const TextStyleConfig());
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = value != null;
    final safeValue = value ?? const TextStyleConfig();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _Header(
          label: label,
          description: description,
          isEnabled: isEnabled,
          onClear: onClear,
        ),
        if (isEnabled)
          Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Row 1: Font Family & Size
                  _FontAndSizeRow(
                    fontFamily: safeValue.fontFamily,
                    fontSize: safeValue.fontSize,
                    onPickFont: () => _handlePickFont(context, safeValue),
                    onClearFont: () =>
                        onChanged(safeValue.copyWith(fontFamily: null)),
                    onSizeChanged: (v) =>
                        onChanged(safeValue.copyWith(fontSize: v)),
                  ),
                  const SizedBox(height: 12),

                  // Row 2: Weight, Height, Spacing
                  _MetricsRow(
                    weight: safeValue.fontWeight?.weight,
                    height: safeValue.height,
                    letterSpacing: safeValue.letterSpacing,
                    onWeightChanged: (w) => onChanged(
                      safeValue.copyWith(
                        fontWeight: w == null
                            ? null
                            : FontWeightConfig(weight: w),
                      ),
                    ),
                    onHeightChanged: (v) =>
                        onChanged(safeValue.copyWith(height: v)),
                    onSpacingChanged: (v) =>
                        onChanged(safeValue.copyWith(letterSpacing: v)),
                  ),
                  const SizedBox(height: 12),

                  // Row 3: Colors & Decoration Compact
                  _VisualsRow(
                    textColor: safeValue.color?.toColor(),
                    backgroundColor: safeValue.backgroundColor?.toColor(),
                    isItalic: safeValue.fontStyle?.value == 'italic',
                    decorations: safeValue.decoration?.types ?? [],
                    onTextColorPick: () => _handlePickColor(
                      context,
                      safeValue.color?.toColor(),
                      (hex) => onChanged(safeValue.copyWith(color: hex)),
                    ),
                    onTextColorClear: () =>
                        onChanged(safeValue.copyWith(color: null)),
                    onBgColorPick: () => _handlePickColor(
                      context,
                      safeValue.backgroundColor?.toColor(),
                      (hex) =>
                          onChanged(safeValue.copyWith(backgroundColor: hex)),
                    ),
                    onBgColorClear: () =>
                        onChanged(safeValue.copyWith(backgroundColor: null)),
                    onItalicChanged: (isItalic) => onChanged(
                      safeValue.copyWith(
                        fontStyle: isItalic
                            ? const FontStyleConfig(value: 'italic')
                            : null,
                      ),
                    ),
                    onDecorationChanged: (types) => onChanged(
                      safeValue.copyWith(
                        decoration: types.isEmpty
                            ? null
                            : (safeValue.decoration ??
                                      const TextDecorationConfig())
                                  .copyWith(types: types),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          _EmptyState(onTap: _handleCustomize),
      ],
    );
  }

  Future<void> _handlePickFont(
    BuildContext context,
    TextStyleConfig current,
  ) async {
    final selected = await context.showFontPicker();
    if (context.mounted && selected != null && selected.isNotEmpty) {
      onChanged(current.copyWith(fontFamily: selected));
    }
  }

  Future<void> _handlePickColor(
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

class _Header extends StatelessWidget {
  const _Header({
    required this.label,
    required this.isEnabled,
    this.description,
    this.onClear,
  });

  final String label;
  final String? description;
  final bool isEnabled;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (description != null) ...[
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                description!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ] else
            const Spacer(),
          if (isEnabled && onClear != null)
            InkWell(
              onTap: onClear,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  'Reset',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FontAndSizeRow extends StatelessWidget {
  const _FontAndSizeRow({
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
          child: InkWell(
            onTap: onPickFont,
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Font Family',
                isDense: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      fontFamily ?? 'Default',
                      style: fontFamily == null
                          ? theme.textTheme.bodyMedium?.copyWith(
                              color: theme.hintColor,
                            )
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
        SizedBox(
          width: 80,
          child: NumberInputControl(
            label: 'Size',
            value: fontSize,
            onChanged: onSizeChanged,
          ),
        ),
      ],
    );
  }
}

class _MetricsRow extends StatelessWidget {
  const _MetricsRow({
    required this.weight,
    required this.height,
    required this.letterSpacing,
    required this.onWeightChanged,
    required this.onHeightChanged,
    required this.onSpacingChanged,
  });

  final int? weight;
  final double? height;
  final double? letterSpacing;
  final ValueChanged<int?> onWeightChanged;
  final ValueChanged<double?> onHeightChanged;
  final ValueChanged<double?> onSpacingChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Weight',
              isDense: true,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: weight,
                isExpanded: true,
                hint: const Text('Normal'),
                icon: const Icon(Icons.arrow_drop_down, size: 20),
                style: Theme.of(context).textTheme.bodyMedium,
                items: [100, 200, 300, 400, 500, 600, 700, 800, 900]
                    .map(
                      (w) => DropdownMenuItem(
                        value: w,
                        child: Text(
                          _getWeightLabel(w),
                          style: TextStyle(
                            fontWeight: FontWeight.values[(w ~/ 100) - 1],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onWeightChanged,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 80,
          child: NumberInputControl(
            label: 'Height',
            suffixText: 'x',
            value: height,
            onChanged: onHeightChanged,
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 80,
          child: NumberInputControl(
            label: 'Spacing',
            suffixText: 'px',
            value: letterSpacing,
            onChanged: onSpacingChanged,
          ),
        ),
      ],
    );
  }

  String _getWeightLabel(int w) {
    return switch (w) {
      400 => '400 (Reg)',
      500 => '500 (Med)',
      700 => '700 (Bold)',
      _ => w.toString(),
    };
  }
}

class _VisualsRow extends StatelessWidget {
  const _VisualsRow({
    required this.textColor,
    required this.backgroundColor,
    required this.isItalic,
    required this.decorations,
    required this.onTextColorPick,
    required this.onTextColorClear,
    required this.onBgColorPick,
    required this.onBgColorClear,
    required this.onItalicChanged,
    required this.onDecorationChanged,
  });

  final Color? textColor;
  final Color? backgroundColor;
  final bool isItalic;
  final List<String> decorations;
  final VoidCallback onTextColorPick;
  final VoidCallback onTextColorClear;
  final VoidCallback onBgColorPick;
  final VoidCallback onBgColorClear;
  final ValueChanged<bool> onItalicChanged;
  final ValueChanged<List<String>> onDecorationChanged;

  void _handleDecorationToggle(String type) {
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
    final theme = Theme.of(context);
    // Group Colors and Decorations to save vertical space
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ColorInput(
            label: 'Text',
            color: textColor,
            onTap: onTextColorPick,
            onClear: onTextColorClear,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ColorInput(
            label: 'Bg',
            color: backgroundColor,
            onTap: onBgColorPick,
            onClear: onBgColorClear,
          ),
        ),
        const SizedBox(width: 12),
        // Visual grouping for decorations
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, bottom: 4),
              child: Text(
                'Decoration',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.hintColor,
                  fontSize: 11,
                ),
              ),
            ),
            Container(
              height: 48, // Match standard input height
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHigh.withValues(
                  alpha: 0.3,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
                    onPressed: () => _handleDecorationToggle('underline'),
                  ),
                  _ToolbarIcon(
                    icon: Icons.format_strikethrough,
                    isSelected: decorations.contains('lineThrough'),
                    tooltip: 'Strikethrough',
                    onPressed: () => _handleDecorationToggle('lineThrough'),
                  ),
                  _ToolbarIcon(
                    icon: Icons.vertical_align_top,
                    isSelected: decorations.contains('overline'),
                    tooltip: 'Overline',
                    onPressed: () => _handleDecorationToggle('overline'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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
    final isDark = theme.brightness == Brightness.dark;

    return IconButton(
      icon: Icon(icon, size: 20),
      tooltip: tooltip,
      isSelected: isSelected,
      style: IconButton.styleFrom(
        foregroundColor: isSelected
            ? colorScheme.primary
            : (isDark ? Colors.white70 : Colors.black54),
        backgroundColor: isSelected
            ? colorScheme.primary.withValues(alpha: 0.1)
            : null,
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.all(8),
        minimumSize: const Size(36, 36),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: onPressed,
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: theme.dividerColor.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surfaceContainerLowest.withValues(
            alpha: 0.3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.format_paint_outlined,
              size: 20,
              color: theme.colorScheme.primary.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 8),
            Text(
              'Inherits Default Style',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Customize',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
