import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

class GradientEditor extends StatelessWidget {
  const GradientEditor({
    required this.colors,
    required this.onChanged,
    this.description,
    super.key,
  });

  final List<String> colors;
  final ValueChanged<List<String>> onChanged;
  final Widget? description;

  List<Color> get _activeColors => colors.map((e) => e.toColor()).toList();

  void _updateColors(List<Color> newColors) {
    onChanged(newColors.map((c) => c.toHex()).toList());
  }

  Future<void> _onAddColor(BuildContext context) async {
    final newColor = await context.showColorPicker(currentColor: Colors.blue);
    if (newColor != null) {
      final current = _activeColors;
      _updateColors([...current, newColor]);
    }
  }

  Future<void> _onEditColor(BuildContext context, int index) async {
    final current = _activeColors;
    final newColor = await context.showColorPicker(
      currentColor: current[index],
    );

    if (newColor != null) {
      final updated = List<Color>.from(_activeColors);
      updated[index] = newColor;
      _updateColors(updated);
    }
  }

  void _onRemoveColor(int index) {
    final updated = List<Color>.from(_activeColors)..removeAt(index);
    _updateColors(updated);
  }

  void _onReorder(int oldIndex, int newIndex) {
    var targetIndex = newIndex;
    if (oldIndex < targetIndex) {
      targetIndex -= 1;
    }
    final updated = List<Color>.from(_activeColors);
    final item = updated.removeAt(oldIndex);
    updated.insert(targetIndex, item);
    _updateColors(updated);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColors = _activeColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: description,
          ),
        _GradientPreviewBar(colors: activeColors),
        const SizedBox(height: 16),
        if (activeColors.isEmpty)
          Center(
            child: Text(
              'No colors added.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
          )
        else
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activeColors.length,
            onReorder: _onReorder,
            buildDefaultDragHandles: false,
            proxyDecorator: (child, index, animation) {
              return Material(
                elevation: 4,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: child,
              );
            },
            itemBuilder: (context, index) {
              final color = activeColors[index];
              return _ColorListItem(
                key: ValueKey('${color.toARGB32()}_$index'),
                index: index,
                color: color,
                onTap: () => _onEditColor(context, index),
                onRemove: () => _onRemoveColor(index),
              );
            },
          ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => _onAddColor(context),
            icon: const Icon(Icons.add),
            label: const Text('Add Color Stop'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class _GradientPreviewBar extends StatelessWidget {
  const _GradientPreviewBar({required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasGradient = colors.length >= 2;

    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor),
        color: theme.cardColor,
        gradient: hasGradient
            ? LinearGradient(colors: colors)
            : (colors.length == 1
                  ? LinearGradient(colors: [colors.first, colors.first])
                  : null),
      ),
      child: !hasGradient && colors.isEmpty
          ? Center(
              child: Text(
                'Preview',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            )
          : null,
    );
  }
}

class _ColorListItem extends StatelessWidget {
  const _ColorListItem({
    required this.index,
    required this.color,
    required this.onTap,
    required this.onRemove,
    super.key,
  });

  final int index;
  final Color color;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: theme.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.5)),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ReorderableDragStartListener(
                  index: index,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.drag_handle, color: theme.disabledColor),
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.dividerColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        color.toHex(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Stop ${index + 1}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.close),
                  tooltip: 'Remove color',
                  color: theme.colorScheme.error,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
