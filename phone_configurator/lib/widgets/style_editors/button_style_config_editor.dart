import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../style_controls/color_input_control.dart';
import '../style_controls/number_input_control.dart';

class ButtonStyleConfigEditor extends StatelessWidget {
  const ButtonStyleConfigEditor({
    required this.label,
    required this.value,
    required this.onChanged,
    this.description,
    this.onClear,
    super.key,
  });

  final String label;
  final String? description;
  final ButtonStyleConfig? value;
  final ValueChanged<ButtonStyleConfig> onChanged;
  final VoidCallback? onClear;

  void _handleCustomize() {
    onChanged(const ButtonStyleConfig());
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = value != null;
    final safeValue = value ?? const ButtonStyleConfig();
    final theme = Theme.of(context);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Normal Colors
                  _ColorsRow(
                    backgroundColor: safeValue.backgroundColor?.toColor(),
                    foregroundColor: safeValue.foregroundColor?.toColor(),
                    overlayColor: safeValue.overlayColor?.toColor(),
                    onBgColorPick: () => _pickColor(
                      context,
                      safeValue.backgroundColor?.toColor(),
                      (hex) =>
                          onChanged(safeValue.copyWith(backgroundColor: hex)),
                    ),
                    onBgColorClear: () =>
                        onChanged(safeValue.copyWith(backgroundColor: null)),
                    onFgColorPick: () => _pickColor(
                      context,
                      safeValue.foregroundColor?.toColor(),
                      (hex) =>
                          onChanged(safeValue.copyWith(foregroundColor: hex)),
                    ),
                    onFgColorClear: () =>
                        onChanged(safeValue.copyWith(foregroundColor: null)),
                    onOverlayColorPick: () => _pickColor(
                      context,
                      safeValue.overlayColor?.toColor(),
                      (hex) => onChanged(safeValue.copyWith(overlayColor: hex)),
                    ),
                    onOverlayColorClear: () =>
                        onChanged(safeValue.copyWith(overlayColor: null)),
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 8),

                  // Label for Disabled State
                  Text(
                    'Disabled State',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Row 2: Disabled Colors
                  _DisabledColorsRow(
                    backgroundColor: safeValue.disabledBackgroundColor
                        ?.toColor(),
                    foregroundColor: safeValue.disabledForegroundColor
                        ?.toColor(),
                    iconColor: safeValue.disabledIconColor?.toColor(),
                    onBgColorPick: () => _pickColor(
                      context,
                      safeValue.disabledBackgroundColor?.toColor(),
                      (hex) => onChanged(
                        safeValue.copyWith(disabledBackgroundColor: hex),
                      ),
                    ),
                    onBgColorClear: () => onChanged(
                      safeValue.copyWith(disabledBackgroundColor: null),
                    ),
                    onFgColorPick: () => _pickColor(
                      context,
                      safeValue.disabledForegroundColor?.toColor(),
                      (hex) => onChanged(
                        safeValue.copyWith(disabledForegroundColor: hex),
                      ),
                    ),
                    onFgColorClear: () => onChanged(
                      safeValue.copyWith(disabledForegroundColor: null),
                    ),
                    onIconColorPick: () => _pickColor(
                      context,
                      safeValue.disabledIconColor?.toColor(),
                      (hex) =>
                          onChanged(safeValue.copyWith(disabledIconColor: hex)),
                    ),
                    onIconColorClear: () =>
                        onChanged(safeValue.copyWith(disabledIconColor: null)),
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),

                  // Row 3: Geometry
                  _GeometryRow(
                    borderRadius: safeValue.shape?.borderRadius,
                    elevation: safeValue.elevation,
                    onRadiusChanged: (v) {
                      final currentShape =
                          safeValue.shape ?? const ShapeBorderConfig();
                      onChanged(
                        safeValue.copyWith(
                          shape: currentShape.copyWith(borderRadius: v),
                        ),
                      );
                    },
                    onElevationChanged: (v) =>
                        onChanged(safeValue.copyWith(elevation: v)),
                  ),
                  const SizedBox(height: 12),

                  // Row 4: Padding
                  _PaddingRow(
                    padding: safeValue.padding,
                    onChanged: (p) => onChanged(safeValue.copyWith(padding: p)),
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

class _ColorsRow extends StatelessWidget {
  const _ColorsRow({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.overlayColor,
    required this.onBgColorPick,
    required this.onBgColorClear,
    required this.onFgColorPick,
    required this.onFgColorClear,
    required this.onOverlayColorPick,
    required this.onOverlayColorClear,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? overlayColor;
  final VoidCallback onBgColorPick;
  final VoidCallback onBgColorClear;
  final VoidCallback onFgColorPick;
  final VoidCallback onFgColorClear;
  final VoidCallback onOverlayColorPick;
  final VoidCallback onOverlayColorClear;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorInput(
            label: 'Background',
            color: backgroundColor,
            onTap: onBgColorPick,
            onClear: onBgColorClear,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ColorInput(
            label: 'Foreground',
            color: foregroundColor,
            onTap: onFgColorPick,
            onClear: onFgColorClear,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ColorInput(
            label: 'Overlay',
            color: overlayColor,
            onTap: onOverlayColorPick,
            onClear: onOverlayColorClear,
          ),
        ),
      ],
    );
  }
}

class _DisabledColorsRow extends StatelessWidget {
  const _DisabledColorsRow({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.iconColor,
    required this.onBgColorPick,
    required this.onBgColorClear,
    required this.onFgColorPick,
    required this.onFgColorClear,
    required this.onIconColorPick,
    required this.onIconColorClear,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? iconColor;
  final VoidCallback onBgColorPick;
  final VoidCallback onBgColorClear;
  final VoidCallback onFgColorPick;
  final VoidCallback onFgColorClear;
  final VoidCallback onIconColorPick;
  final VoidCallback onIconColorClear;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorInput(
            label: 'Background',
            color: backgroundColor,
            onTap: onBgColorPick,
            onClear: onBgColorClear,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ColorInput(
            label: 'Text',
            color: foregroundColor,
            onTap: onFgColorPick,
            onClear: onFgColorClear,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ColorInput(
            label: 'Icon',
            color: iconColor,
            onTap: onIconColorPick,
            onClear: onIconColorClear,
          ),
        ),
      ],
    );
  }
}

class _GeometryRow extends StatelessWidget {
  const _GeometryRow({
    required this.borderRadius,
    required this.elevation,
    required this.onRadiusChanged,
    required this.onElevationChanged,
  });

  final double? borderRadius;
  final double? elevation;
  final ValueChanged<double?> onRadiusChanged;
  final ValueChanged<double?> onElevationChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NumberInputControl(
            label: 'Corner Radius',
            value: borderRadius,
            onChanged: onRadiusChanged,
            suffixText: 'px',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: NumberInputControl(
            label: 'Elevation',
            value: elevation,
            onChanged: onElevationChanged,
          ),
        ),
      ],
    );
  }
}

class _PaddingRow extends StatelessWidget {
  const _PaddingRow({required this.padding, required this.onChanged});

  final EdgeInsetsConfig? padding;
  final ValueChanged<EdgeInsetsConfig?> onChanged;

  @override
  Widget build(BuildContext context) {
    final safePadding = padding ?? const EdgeInsetsConfig();

    final horizontal = safePadding.left;
    final vertical = safePadding.top;

    return Row(
      children: [
        Expanded(
          child: NumberInputControl(
            label: 'Padding Horiz.',
            value: horizontal == 0 ? null : horizontal,
            onChanged: (v) {
              final val = v ?? 0.0;
              onChanged(safePadding.copyWith(left: val, right: val));
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: NumberInputControl(
            label: 'Padding Vert.',
            value: vertical == 0 ? null : vertical,
            onChanged: (v) {
              final val = v ?? 0.0;
              onChanged(safePadding.copyWith(top: val, bottom: val));
            },
          ),
        ),
      ],
    );
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
