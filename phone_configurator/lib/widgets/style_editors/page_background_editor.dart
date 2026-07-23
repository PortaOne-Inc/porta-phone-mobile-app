import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../color_field.dart';
import '../style_controls/style_controls.dart';

enum _BackgroundType { none, solid, gradient, image }

class PageBackgroundEditor extends StatelessWidget {
  const PageBackgroundEditor({
    required this.value,
    required this.onChanged,
    this.boxConstraints = const BoxConstraints(minWidth: 140, minHeight: 60),
    super.key,
  });

  final PageBackground? value;
  final ValueChanged<PageBackground?> onChanged;
  final BoxConstraints boxConstraints;

  _BackgroundType get _currentType {
    return value?.map(
          solid: (_) => _BackgroundType.solid,
          gradient: (_) => _BackgroundType.gradient,
          image: (_) => _BackgroundType.image,
        ) ??
        _BackgroundType.none;
  }

  void _onTypeChanged(_BackgroundType? newType) {
    if (newType == null || newType == _BackgroundType.none) {
      onChanged(null);
      return;
    }

    switch (newType) {
      case _BackgroundType.solid:
        onChanged(const PageBackground.solid(color: '#FFFFFF'));
      case _BackgroundType.gradient:
        onChanged(
          const PageBackground.gradient(
            colors: ['#FFFFFF', '#000000'],
            beginY: -1,
            endX: 0,
          ),
        );
      case _BackgroundType.image:
        onChanged(const PageBackground.image(imageUrl: ''));
      case _BackgroundType.none:
        onChanged(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<_BackgroundType>(
          initialValue: _currentType,
          decoration: const InputDecoration(
            labelText: 'Background Type',
            isDense: true,
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(
              value: _BackgroundType.none,
              child: Text('None (Default)'),
            ),
            DropdownMenuItem(
              value: _BackgroundType.solid,
              child: Text('Solid Color'),
            ),
            DropdownMenuItem(
              value: _BackgroundType.gradient,
              child: Text('Gradient'),
            ),
            DropdownMenuItem(
              value: _BackgroundType.image,
              child: Text('Image'),
            ),
          ],
          onChanged: _onTypeChanged,
        ),
        if (_currentType != _BackgroundType.none) ...[
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _buildSpecificEditor(context),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSpecificEditor(BuildContext context) {
    return value!.map(
      solid: (v) => _SolidBackgroundEditor(
        value: v,
        onChanged: onChanged,
        boxConstraints: boxConstraints,
      ),
      gradient: (v) =>
          _GradientBackgroundEditor(value: v, onChanged: onChanged),
      image: (v) => _ImageBackgroundEditor(value: v, onChanged: onChanged),
    );
  }
}

class _SolidBackgroundEditor extends StatelessWidget {
  const _SolidBackgroundEditor({
    required this.value,
    required this.onChanged,
    required this.boxConstraints,
  });

  final PageBackgroundSolid value;
  final ValueChanged<PageBackground> onChanged;
  final BoxConstraints boxConstraints;

  Future<void> _pickColor(BuildContext context) async {
    final picked = await context.showColorPicker(
      currentColor: value.color.toColor(),
    );
    if (context.mounted && picked != null) {
      onChanged(value.copyWith(color: picked.toHex()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColorField(
      title: 'Fill Color',
      constraints: boxConstraints,
      color: value.color.toColor(),
      onTap: (_) => _pickColor(context),
    );
  }
}

class _GradientBackgroundEditor extends StatelessWidget {
  const _GradientBackgroundEditor({
    required this.value,
    required this.onChanged,
  });

  final PageBackgroundGradient value;
  final ValueChanged<PageBackground> onChanged;

  void _updateAlignment(String preset) {
    double bx = 0;
    double by = 0;
    double ex = 0;
    double ey = 0;

    switch (preset) {
      case 'top_bottom':
        bx = 0;
        by = -1;
        ex = 0;
        ey = 1;
      case 'left_right':
        bx = -1;
        by = 0;
        ex = 1;
        ey = 0;
      case 'tl_br':
        bx = -1;
        by = -1;
        ex = 1;
        ey = 1;
      case 'bl_tr':
        bx = -1;
        by = 1;
        ex = 1;
        ey = -1;
    }

    onChanged(value.copyWith(beginX: bx, beginY: by, endX: ex, endY: ey));
  }

  String? _detectPreset() {
    final v = value;
    if (v.beginX == 0 && v.beginY == -1 && v.endX == 0 && v.endY == 1) {
      return 'top_bottom';
    }
    if (v.beginX == -1 && v.beginY == 0 && v.endX == 1 && v.endY == 0) {
      return 'left_right';
    }
    if (v.beginX == -1 && v.beginY == -1 && v.endX == 1 && v.endY == 1) {
      return 'tl_br';
    }
    if (v.beginX == -1 && v.beginY == 1 && v.endX == 1 && v.endY == -1) {
      return 'bl_tr';
    }
    return 'custom';
  }

  void _onPresetChanged(String? v) {
    if (v != null) _updateAlignment(v);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          initialValue: _detectPreset() == 'custom' ? null : _detectPreset(),
          decoration: const InputDecoration(
            labelText: 'Direction',
            isDense: true,
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'top_bottom', child: Text('Top ↓ Bottom')),
            DropdownMenuItem(value: 'left_right', child: Text('Left → Right')),
            DropdownMenuItem(
              value: 'tl_br',
              child: Text('Top-Left ↘ Bottom-Right'),
            ),
            DropdownMenuItem(
              value: 'bl_tr',
              child: Text('Bottom-Left ↗ Top-Right'),
            ),
          ],
          onChanged: _onPresetChanged,
        ),
        const SizedBox(height: 16),
        GradientEditor(
          colors: value.colors,
          onChanged: (newColors) =>
              onChanged(value.copyWith(colors: newColors)),
          description: const Text('Gradient Stops'),
        ),
      ],
    );
  }
}

class _ImageBackgroundEditor extends StatefulWidget {
  const _ImageBackgroundEditor({required this.value, required this.onChanged});

  final PageBackgroundImage value;
  final ValueChanged<PageBackground> onChanged;

  @override
  State<_ImageBackgroundEditor> createState() => _ImageBackgroundEditorState();
}

class _ImageBackgroundEditorState extends State<_ImageBackgroundEditor> {
  late final TextEditingController _urlCtrl;

  @override
  void initState() {
    super.initState();
    _urlCtrl = TextEditingController(text: widget.value.imageUrl);
  }

  @override
  void didUpdateWidget(covariant _ImageBackgroundEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value.imageUrl != oldWidget.value.imageUrl &&
        _urlCtrl.text != widget.value.imageUrl) {
      _urlCtrl.text = widget.value.imageUrl;
    }
  }

  @override
  void dispose() {
    _urlCtrl.dispose();
    super.dispose();
  }

  String _getFitLabel(BoxFitConfig fit) {
    return switch (fit) {
      BoxFitConfig.fill => 'Fill',
      BoxFitConfig.contain => 'Contain',
      BoxFitConfig.cover => 'Cover',
      BoxFitConfig.fitWidth => 'Fit Width',
      BoxFitConfig.fitHeight => 'Fit Height',
      BoxFitConfig.none => 'None',
      BoxFitConfig.scaleDown => 'Scale Down',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _urlCtrl,
          decoration: const InputDecoration(
            labelText: 'Image URL',
            isDense: true,
            border: OutlineInputBorder(),
            hintText: 'https://example.com/bg.png',
          ),
          onChanged: (v) =>
              widget.onChanged(widget.value.copyWith(imageUrl: v)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<BoxFitConfig>(
                initialValue: widget.value.fit,
                decoration: const InputDecoration(
                  labelText: 'Fit',
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                items: BoxFitConfig.values.map((fit) {
                  return DropdownMenuItem(
                    value: fit,
                    child: Text(_getFitLabel(fit)),
                  );
                }).toList(),
                onChanged: (v) => widget.onChanged(
                  widget.value.copyWith(fit: v ?? BoxFitConfig.cover),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opacity: ${(widget.value.opacity * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Slider(
                    value: widget.value.opacity,
                    divisions: 100,
                    label: widget.value.opacity.toStringAsFixed(2),
                    onChanged: (v) =>
                        widget.onChanged(widget.value.copyWith(opacity: v)),
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
