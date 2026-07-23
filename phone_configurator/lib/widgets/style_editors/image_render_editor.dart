import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/widgets/pattern_painter.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '../style_controls/style_controls.dart';

class ImageRenderEditor extends StatefulWidget {
  const ImageRenderEditor({
    required this.title,
    super.key,
    this.source,
    this.description,
    this.onChanged,
    this.onPick,
  });

  final String title;
  final ImageSource? source;
  final String? description;
  final ValueChanged<ImageSource?>? onChanged;
  final VoidCallback? onPick;

  @override
  State<ImageRenderEditor> createState() => _ImageRenderEditorState();
}

class _ImageRenderEditorState extends State<ImageRenderEditor> {
  late final TextEditingController _scaleCtrl;
  late final TextEditingController _padAllCtrl;
  late final TextEditingController _padLeftCtrl;
  late final TextEditingController _padTopCtrl;
  late final TextEditingController _padRightCtrl;
  late final TextEditingController _padBottomCtrl;

  late double _scaleValue;
  late bool _uniformPadding;
  late AlignmentConfig _alignment;
  late BoxFitConfig _fit;
  bool _isSettingsExpanded = false;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = TextEditingController();
    _padAllCtrl = TextEditingController();
    _padLeftCtrl = TextEditingController();
    _padTopCtrl = TextEditingController();
    _padRightCtrl = TextEditingController();
    _padBottomCtrl = TextEditingController();

    _syncFromSource();
  }

  @override
  void didUpdateWidget(covariant ImageRenderEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.source != oldWidget.source) {
      _syncFromSource();
    }
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    _padAllCtrl.dispose();
    _padLeftCtrl.dispose();
    _padTopCtrl.dispose();
    _padRightCtrl.dispose();
    _padBottomCtrl.dispose();
    super.dispose();
  }

  void _syncFromSource() {
    final render = widget.source?.render;

    _scaleValue = (render?.scale ?? 0.25).clamp(0, 1);
    _setCtrl(_scaleCtrl, _fmt2(_scaleValue));

    final p = render?.padding;
    _uniformPadding = _isUniform(p);
    _setCtrl(_padAllCtrl, _fmt0(_uniformValue(p)));
    _setCtrl(_padLeftCtrl, _fmt0(p?.left ?? 0));
    _setCtrl(_padTopCtrl, _fmt0(p?.top ?? 0));
    _setCtrl(_padRightCtrl, _fmt0(p?.right ?? 0));
    _setCtrl(_padBottomCtrl, _fmt0(p?.bottom ?? 0));

    _alignment = render?.alignment ?? AlignmentConfig.center;
    _fit = render?.fit ?? BoxFitConfig.contain;
  }

  ImageSource? get _draftSource {
    final current = widget.source;
    if (current == null) return null;

    final padding = _uniformPadding
        ? PaddingConfig.all(_parse(_padAllCtrl.text) ?? 0)
        : PaddingConfig(
            left: _parse(_padLeftCtrl.text) ?? 0,
            top: _parse(_padTopCtrl.text) ?? 0,
            right: _parse(_padRightCtrl.text) ?? 0,
            bottom: _parse(_padBottomCtrl.text) ?? 0,
          );

    return current.copyWith(
      render: ImageRenderSpec(
        scale: _scaleValue,
        padding: padding,
        alignment: _alignment,
        fit: _fit,
      ),
    );
  }

  void _applyChanges() {
    final draft = _draftSource;
    if (draft != null) {
      widget.onChanged?.call(draft);
    }
  }

  void _setCtrl(TextEditingController c, String text) {
    if (c.text == text) return;
    c.text = text;
  }

  double? _parse(String v) => double.tryParse(v.trim().replaceAll(',', '.'));

  String _fmt2(double v) => v.toStringAsFixed(2);

  String _fmt0(double v) => v.toStringAsFixed(0);

  bool _isUniform(PaddingConfig? p) {
    if (p == null) return true;
    return p.left == p.top && p.left == p.right && p.left == p.bottom;
  }

  double _uniformValue(PaddingConfig? p) => (_isUniform(p) ? p?.left : 0) ?? 0;

  void _updatePaddingPreset(double val) {
    final str = _fmt0(val);
    if (_uniformPadding) {
      _setCtrl(_padAllCtrl, str);
    } else {
      _setCtrl(_padLeftCtrl, str);
      _setCtrl(_padTopCtrl, str);
      _setCtrl(_padRightCtrl, str);
      _setCtrl(_padBottomCtrl, str);
    }
    setState(() {});
  }

  void _onScaleChanged(double v) {
    setState(() => _scaleValue = v);
    _setCtrl(_scaleCtrl, _fmt2(v));
  }

  void _onScaleInputChanged(String val) {
    final v = _parse(val);
    if (v != null) setState(() => _scaleValue = v.clamp(0, 1));
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.source != null;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EditorHeader(
            title: widget.title,
            description: widget.description,
            isEnabled: isEnabled,
            onPick: widget.onPick,
            onRemove: () => widget.onChanged?.call(null),
          ),
          if (isEnabled) ...[
            const Divider(height: 1),
            _LivePreview(source: _draftSource, onPick: widget.onPick),
            const Divider(height: 1),
            Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: _isSettingsExpanded,
                onExpansionChanged: (v) =>
                    setState(() => _isSettingsExpanded = v),
                title: const Text('Appearance Settings'),
                subtitle: Text(
                  '${_fit.name.toUpperCase()} • ${(_scaleValue * 100).toInt()}% Scale',
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  const Divider(),
                  const SizedBox(height: 16),
                  LayoutControl(
                    alignment: _alignment,
                    fit: _fit,
                    onAlignmentChanged: (v) => setState(() => _alignment = v),
                    onFitChanged: (v) => setState(() => _fit = v),
                  ),
                  const SizedBox(height: 24),
                  ScaleControl(
                    value: _scaleValue,
                    controller: _scaleCtrl,
                    onChanged: _onScaleChanged,
                    onInputChanged: _onScaleInputChanged,
                  ),
                  const SizedBox(height: 24),
                  PaddingControl(
                    uniform: _uniformPadding,
                    padAllCtrl: _padAllCtrl,
                    padLeftCtrl: _padLeftCtrl,
                    padTopCtrl: _padTopCtrl,
                    padRightCtrl: _padRightCtrl,
                    padBottomCtrl: _padBottomCtrl,
                    onModeChanged: (v) => setState(() => _uniformPadding = v),
                    onPresetSelected: _updatePaddingPreset,
                    onChanged: () => setState(() {}),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _applyChanges,
                      child: const Text('Apply Configuration'),
                    ),
                  ),
                ],
              ),
            ),
          ] else
            _EmptyState(onPick: widget.onPick),
        ],
      ),
    );
  }
}

class _EditorHeader extends StatelessWidget {
  const _EditorHeader({
    required this.title,
    required this.isEnabled,
    this.description,
    this.onPick,
    this.onRemove,
  });

  final String title;
  final bool isEnabled;
  final String? description;
  final VoidCallback? onPick;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image_outlined, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),
                if (description != null)
                  Text(
                    description!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
              ],
            ),
          ),
          if (isEnabled)
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Remove',
              color: theme.colorScheme.error,
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({this.onPick});

  final VoidCallback? onPick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      color: theme.colorScheme.surfaceContainerLowest,
      alignment: Alignment.center,
      child: OutlinedButton.icon(
        onPressed: onPick,
        icon: const Icon(Icons.add_photo_alternate_outlined),
        label: const Text('Select Image Source'),
      ),
    );
  }
}

class _LivePreview extends StatelessWidget {
  const _LivePreview({required this.source, this.onPick});

  final ImageSource? source;
  final VoidCallback? onPick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 180,
      width: double.infinity,
      color: theme.colorScheme.surfaceContainerLowest,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: PatternPainter(
                primaryColor: theme.colorScheme.onSurface.withValues(
                  alpha: 0.05,
                ),
              ),
            ),
          ),
          if (source != null)
            Positioned.fill(
              child: ImageRenderer(resource: Resource.url(source!.uri)),
            ),
          Positioned(
            top: 12,
            right: 12,
            child: FilledButton.tonalIcon(
              onPressed: onPick,
              icon: const Icon(Icons.edit, size: 16),
              label: const Text('Change'),
              style: FilledButton.styleFrom(
                visualDensity: VisualDensity.compact,
                backgroundColor: theme.colorScheme.surface.withValues(
                  alpha: 0.9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
