import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/widgets/pattern_painter.dart';
import 'package:webtrit_configurator/exports/exports.dart';

/// Editor widget for an image resource with render configuration (scale 0.0–1.0 and padding).
///
/// Supports nullable [ImageSource]:
/// - If null → shows placeholder and allows selection.
/// - If non-null → shows current preview and editable scale & padding.
/// All edits are committed only when user presses **Apply**.
class ImageRenderEditor extends StatefulWidget {
  const ImageRenderEditor({
    super.key,
    this.source,
    this.title = 'Image',
    this.description,
    this.onChanged,
    this.onPick,
  });

  /// The image source to display and edit. Can be `null` if no image is selected.
  final ImageSource? source;

  /// Title displayed above the editor controls.
  final String title;
  final String? description;

  /// Emits an updated [ImageSource] (or `null` if removed) — triggered only by **Apply**.
  final ValueChanged<ImageSource?>? onChanged;

  /// Called when user taps on preview to pick/select an image.
  final VoidCallback? onPick;

  @override
  State<ImageRenderEditor> createState() => _ImageRenderEditorState();
}

class _ImageRenderEditorState extends State<ImageRenderEditor> {
  final _initialScale = 0.25;
  late double _scaleValue = _initialScale;
  late final TextEditingController _scaleCtrl;
  final _scaleFocus = FocusNode();

  final _initialPadding = 128.0;
  bool _uniformPadding = true;
  late final TextEditingController _padAllCtrl;
  late final TextEditingController _padLeftCtrl;
  late final TextEditingController _padTopCtrl;
  late final TextEditingController _padRightCtrl;
  late final TextEditingController _padBottomCtrl;

  final _padAllFocus = FocusNode();
  final _padLeftFocus = FocusNode();
  final _padTopFocus = FocusNode();
  final _padRightFocus = FocusNode();
  final _padBottomFocus = FocusNode();

  bool _scaleExpanded = false;
  bool _paddingExpanded = false;

  static const _scalePresets = <double>[0.25, 0.50, 0.75, 1];
  static const _paddingPresets = <double>[0, 48, 96, 128, 192, 256];

  @override
  void initState() {
    super.initState();
    _scaleValue = (widget.source?.render?.scale ?? _initialScale).clamp(0.0, 1.0);
    _scaleCtrl = TextEditingController(text: _fmt2(_scaleValue));

    final p = widget.source?.render?.padding;
    _uniformPadding = _isUniform(p);
    _padAllCtrl = TextEditingController(text: _fmt0(_uniformValue(p)));
    _padLeftCtrl = TextEditingController(text: _fmt0(p?.left ?? 0));
    _padTopCtrl = TextEditingController(text: _fmt0(p?.top ?? 0));
    _padRightCtrl = TextEditingController(text: _fmt0(p?.right ?? 0));
    _padBottomCtrl = TextEditingController(text: _fmt0(p?.bottom ?? 0));
  }

  @override
  void didUpdateWidget(covariant ImageRenderEditor oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newScale = (widget.source?.render?.scale ?? _initialScale).clamp(0.0, 1.0);
    if (!_scaleFocus.hasFocus && _scaleValue != newScale) {
      _scaleValue = newScale;
      _setControllerText(_scaleCtrl, _fmt2(newScale));
    }

    final p = widget.source?.render?.padding;
    final newUniform = _isUniform(p);
    if (_uniformPadding != newUniform) _uniformPadding = newUniform;

    if (!_padAllFocus.hasFocus) _setControllerText(_padAllCtrl, _fmt0(_uniformValue(p)));
    if (!_padLeftFocus.hasFocus) _setControllerText(_padLeftCtrl, _fmt0(p?.left ?? 0));
    if (!_padTopFocus.hasFocus) _setControllerText(_padTopCtrl, _fmt0(p?.top ?? 0));
    if (!_padRightFocus.hasFocus) _setControllerText(_padRightCtrl, _fmt0(p?.right ?? 0));
    if (!_padBottomFocus.hasFocus) _setControllerText(_padBottomCtrl, _fmt0(p?.bottom ?? 0));

    setState(() {});
    _applyAll();
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _scaleFocus.dispose();
    _padAllCtrl.dispose();
    _padLeftCtrl.dispose();
    _padTopCtrl.dispose();
    _padRightCtrl.dispose();
    _padBottomCtrl.dispose();
    _padAllFocus.dispose();
    _padLeftFocus.dispose();
    _padTopFocus.dispose();
    _padRightFocus.dispose();
    _padBottomFocus.dispose();
    super.dispose();
  }

  void _setControllerText(TextEditingController c, String text) {
    if (c.text == text) return;
    c.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  double? _parse(String v) {
    final s = v.trim().replaceAll(',', '.');
    if (s.isEmpty) return null;
    return double.tryParse(s);
  }

  String _fmt2(double v) => v.toStringAsFixed(2);

  String _fmt0(double v) => v.toStringAsFixed(0);

  bool _isUniform(PaddingConfig? p) {
    if (p == null) return true;
    return p.left == p.top && p.left == p.right && p.left == p.bottom;
  }

  double _uniformValue(PaddingConfig? p) {
    if (p == null) return _initialPadding;
    return _isUniform(p) ? p.left : 0;
  }

  ImageSource? _withRender(ImageRenderSpec spec) {
    final current = widget.source;
    if (current == null) return null;
    return current.copyWith(
      render: current.render?.copyWith(
            scale: spec.scale,
            padding: spec.padding,
          ) ??
          spec,
    );
  }

  void _setScaleDraft(double newValue) {
    final clamped = newValue.clamp(0.0, 1.0);
    setState(() => _scaleValue = clamped);
    _setControllerText(_scaleCtrl, _fmt2(clamped));
  }

  void _onScaleChangedDraft(String text) {
    final parsed = _parse(text);
    if (parsed != null) _setScaleDraft(parsed);
  }

  void _onScalePresetDraft(double preset) => _setScaleDraft(preset);

  void _applyPaddingPresetDraft(double value) {
    if (_uniformPadding) {
      _setControllerText(_padAllCtrl, _fmt0(value));
    } else {
      _setControllerText(_padLeftCtrl, _fmt0(value));
      _setControllerText(_padTopCtrl, _fmt0(value));
      _setControllerText(_padRightCtrl, _fmt0(value));
      _setControllerText(_padBottomCtrl, _fmt0(value));
    }
  }

  void _toggleUniform(bool value) {
    setState(() => _uniformPadding = value);
  }

  void _applyAll() {
    final current = widget.source;
    if (current == null) return;

    final scaleParsed = _parse(_scaleCtrl.text);
    final scale = (scaleParsed ?? _scaleValue).clamp(0.0, 1.0);

    final prev = current.render?.padding ?? const PaddingConfig();
    final padding = _uniformPadding
        ? PaddingConfig.all(_parse(_padAllCtrl.text) ?? _uniformValue(prev))
        : PaddingConfig(
            left: _parse(_padLeftCtrl.text) ?? prev.left,
            top: _parse(_padTopCtrl.text) ?? prev.top,
            right: _parse(_padRightCtrl.text) ?? prev.right,
            bottom: _parse(_padBottomCtrl.text) ?? prev.bottom,
          );

    final updated = _withRender(ImageRenderSpec(scale: scale, padding: padding));
    if (updated != null) widget.onChanged?.call(updated);
  }

  void _onRemove() => widget.onChanged?.call(null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final src = widget.source;

    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.image_outlined, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(child: Text(widget.title, style: textTheme.labelLarge)),
              Tooltip(
                message: src == null ? 'Choose image' : 'Change image',
                child: FilledButton.icon(
                  onPressed: widget.onPick,
                  icon: const Icon(Icons.photo_library_outlined),
                  label: Text(src == null ? 'Choose' : 'Change'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 120, height: 120),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        if (src == null || src is EmptyResource)
                          Positioned.fill(
                            child: CustomPaint(
                              painter: PatternPainter(primaryColor: theme.primaryColor),
                            ),
                          )
                        else
                          Positioned.fill(
                            child: ImageRenderer(
                              resource: Resource.url(src.uri),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.description != null) ...[
                        Text(
                          widget.description!,
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                      ],
                      Text(
                        src?.uri ?? 'No image selected',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(
                          color: src?.uri != null ? null : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: _scaleExpanded,
              onExpansionChanged: (v) => setState(() => _scaleExpanded = v),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text('Scale', style: textTheme.titleSmall),
              subtitle: Text('0.00–1.00 (Apply to save into metadata.render.scale)', style: textTheme.bodySmall),
              childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              children: [
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _scalePresets.map((p) {
                    final selected = (_scaleValue - p).abs() < 0.001;
                    return ChoiceChip(
                      label: Text('${(p * 100).round()}%'),
                      selected: selected,
                      onSelected: src == null ? null : (_) => _onScalePresetDraft(p),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        divisions: 100,
                        value: _scaleValue,
                        label: _fmt2(_scaleValue),
                        onChanged: src == null ? null : _setScaleDraft,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: _scaleCtrl,
                        focusNode: _scaleFocus,
                        enabled: src != null,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]')),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Scale',
                          helperText: '0.00–1.00',
                          isDense: true,
                        ),
                        textInputAction: TextInputAction.done,
                        onChanged: _onScaleChangedDraft,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: _paddingExpanded,
              onExpansionChanged: (v) => setState(() => _paddingExpanded = v),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text('Padding', style: textTheme.titleSmall),
              subtitle: Text('px (Apply to save into metadata.render.padding)', style: textTheme.bodySmall),
              childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              children: [
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Switch(
                      value: _uniformPadding,
                      onChanged: src == null ? null : _toggleUniform,
                    ),
                    const SizedBox(width: 8),
                    Text(_uniformPadding ? 'Uniform' : 'Custom'),
                    const Spacer(),
                    Wrap(
                      spacing: 8,
                      children: _paddingPresets.map((p) {
                        return OutlinedButton(
                          onPressed: src == null ? null : () => _applyPaddingPresetDraft(p),
                          child: Text(p.toStringAsFixed(0)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (_uniformPadding) ...[
                  TextField(
                    controller: _padAllCtrl,
                    focusNode: _padAllFocus,
                    enabled: src != null,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'All sides',
                      helperText: 'px',
                      isDense: true,
                    ),
                  ),
                ] else ...[
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _padLeftCtrl,
                          focusNode: _padLeftFocus,
                          enabled: src != null,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(labelText: 'Left', helperText: 'px', isDense: true),
                          onChanged: (_) {},
                          onEditingComplete: () {},
                          onSubmitted: (_) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _padTopCtrl,
                          focusNode: _padTopFocus,
                          enabled: src != null,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(labelText: 'Top', helperText: 'px', isDense: true),
                          onChanged: (_) {},
                          onEditingComplete: () {},
                          onSubmitted: (_) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _padRightCtrl,
                          focusNode: _padRightFocus,
                          enabled: src != null,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(labelText: 'Right', helperText: 'px', isDense: true),
                          onChanged: (_) {},
                          onEditingComplete: () {},
                          onSubmitted: (_) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _padBottomCtrl,
                          focusNode: _padBottomFocus,
                          enabled: src != null,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(labelText: 'Bottom', helperText: 'px', isDense: true),
                          onChanged: (_) {},
                          onEditingComplete: () {},
                          onSubmitted: (_) {},
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              if (src != null)
                TextButton.icon(
                  onPressed: _onRemove,
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Remove image'),
                ),
              const Spacer(),
              if (src != null)
                FilledButton(
                  onPressed: _applyAll,
                  child: const Text('Apply'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
