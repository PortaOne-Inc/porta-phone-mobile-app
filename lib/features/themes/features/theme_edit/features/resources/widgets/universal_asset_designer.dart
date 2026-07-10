import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webtrit_configurator/core/widgets/pattern_painter.dart';

import 'universal_asset_preview_painter.dart';
import 'universal_asset_render_painter.dart';

/// Configuration for a single platform page in the asset designer.
///
/// Each page represents one export target (e.g. Android Adaptive, iOS, Web).
/// The "common" page ([isCommon] = true) acts as the reference for
/// proportional padding — its min/max range defines the ratio that drives
/// all other locked pages.
class DesignerPageConfig {
  const DesignerPageConfig({
    required this.id,
    required this.label,
    required this.sizeDp,
    required this.exportSizePx,
    this.safeZoneDp,
    this.isCommon = false,
    this.previewOnlyColor = false,
    this.exportEnabled = true,
    this.bgInheritsFromCommon = true,
    this.paddingDp,
    this.initialBackgroundHex,
    this.maskDp,
  });

  final String id;
  final String label;

  /// Square artboard side in dp. Used for preview scaling and padding math.
  final double sizeDp;

  /// Diameter (dp) of the circular safe zone. Content padding cannot go below
  /// `(sizeDp - safeZoneDp) / 2`, guaranteeing the image stays inside this
  /// area. Drawn as a white circle guide in the preview.
  final double? safeZoneDp;

  /// Export resolution in pixels (square).
  final int exportSizePx;

  /// When true this page is the proportional-padding reference.
  final bool isCommon;

  /// When true the background color is used only for preview, not for export.
  final bool previewOnlyColor;

  final bool exportEnabled;
  final bool bgInheritsFromCommon;

  /// Saved padding value (dp). On init, if it matches the proportional value
  /// (within 1 dp) the page is auto-locked to follow the base slider.
  final double? paddingDp;

  final String? initialBackgroundHex;

  /// Diameter (dp) of the platform mask circle. When set, the preview card is
  /// clipped to this circle so it shows the icon exactly as the platform
  /// renders it (e.g. Android launchers display only the central 72 dp of the
  /// 108 dp adaptive canvas). `null` keeps the full square artboard preview.
  /// Affects only the preview; exports always render the full artboard.
  final double? maskDp;
}

class DesignerPageEffective {
  const DesignerPageEffective({required this.pageId, required this.paddingDp, required this.backgroundHex});

  final String pageId;
  final double paddingDp;
  final String? backgroundHex;
}

class DesignerSnapshot {
  const DesignerSnapshot({required this.commonBackgroundHex, required this.commonPaddingDp, required this.pages});

  final String? commonBackgroundHex;
  final double commonPaddingDp;
  final List<DesignerPageEffective> pages;
}

class ColorPickRequest {
  ColorPickRequest({required this.scopeId, this.currentHex});

  final String scopeId;
  final String? currentHex;
}

typedef PickColorCallback = Future<String?> Function(ColorPickRequest request);

class ConfigurableAssetDesignerController {
  _ConfigurableAssetDesignerState? _state;

  final ValueNotifier<DesignerSnapshot?> snapshot = ValueNotifier<DesignerSnapshot?>(null);

  PickColorCallback? onPickColor;

  bool get isAttached => _state != null;

  Future<Map<String, Uint8List>> exportAll() async {
    final s = _state;
    if (s == null) {
      throw StateError('ConfigurableAssetDesignerController is not attached to a widget.');
    }
    return s._exportAll(returnOnly: true);
  }

  void reloadPreview() {
    _state?._reloadPreview();
  }

  void setActiveTabById(String pageId) {
    _state?._setActiveTabById(pageId);
  }

  // internal
  void _attach(_ConfigurableAssetDesignerState s) {
    _state = s;
    snapshot.value = s._buildSnapshot();
  }

  void _detach(_ConfigurableAssetDesignerState s) {
    if (_state == s) _state = null;
  }
}

Color _parseHexColor(String? hex) {
  if (hex == null || hex.isEmpty) return Colors.transparent;
  final v = hex.replaceFirst('#', '');
  if (v.length == 6) return Color(int.parse('FF$v', radix: 16));
  if (v.length == 8) return Color(int.parse(v, radix: 16));
  return Colors.transparent;
}

String _normalizeHex(String raw) {
  var t = raw.trim().toUpperCase();
  if (t.startsWith('#')) t = t.substring(1);
  t = t.replaceAll(RegExp('[^0-9A-F]'), '');
  if (t.length == 6 || t.length == 8) return '#$t';
  return raw;
}

double _scaleForPreview({required double artboardDp, required double previewPx}) => previewPx / artboardDp;

double _dpToPx(double dp, double scale) => dp * scale;

bool _isSvg(AssetModel a) => a.mimeType.toLowerCase().contains('svg');

Future<Uint8List> _bytesFromUrl(String url) async {
  final resp = await http.get(Uri.parse(url));
  if (resp.statusCode != 200) {
    throw Exception('HTTP ${resp.statusCode} while fetching $url');
  }
  return resp.bodyBytes;
}

Future<ui.Image?> _rasterizeAsset(AssetModel? asset, int sizePx) async {
  if (asset?.downloadUrl == null) return null;

  final bytes = await _bytesFromUrl(asset!.downloadUrl!);

  if (_isSvg(asset)) {
    final controller = ScreenshotController();
    final w = RepaintBoundary(
      child: SizedBox(
        width: sizePx.toDouble(),
        height: sizePx.toDouble(),
        child: FittedBox(child: SvgPicture.memory(bytes, allowDrawingOutsideViewBox: true)),
      ),
    );
    final png = await controller.captureFromWidget(w, pixelRatio: 1);
    final codec = await ui.instantiateImageCodec(png);
    final frame = await codec.getNextFrame();
    return frame.image;
  } else {
    final codec = await ui.instantiateImageCodec(bytes, targetWidth: sizePx, targetHeight: sizePx);
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}

class ConfigurableAssetDesigner extends StatefulWidget {
  const ConfigurableAssetDesigner({
    required this.pages,
    super.key,
    this.foregroundAsset,
    this.backgroundAsset,
    this.previewSize = 360,
    this.onSnapshotChanged,
    this.onExport,
    this.controller,
  });

  final List<DesignerPageConfig> pages;

  final AssetModel? foregroundAsset;
  final AssetModel? backgroundAsset;

  final double previewSize;

  final void Function(DesignerSnapshot snapshot)? onSnapshotChanged;

  final void Function(Map<String, Uint8List> outputs)? onExport;

  final ConfigurableAssetDesignerController? controller;

  @override
  State<ConfigurableAssetDesigner> createState() => _ConfigurableAssetDesignerState();
}

class _PageState {
  _PageState({required bool startBgInherit, double? paddingDp, double minPaddingDp = 0, String? initialBgHex}) {
    bgInheritCommon = startBgInherit;

    paddingOverrideDp = math.max(paddingDp ?? minPaddingDp, minPaddingDp);
    if (!startBgInherit && initialBgHex != null) {
      bgHexOverride = initialBgHex;
    }
  }

  FitModel? fitOverride;
  double? paddingOverrideDp;
  bool paddingLocked = true;

  bool bgInheritCommon = true;
  String? bgHexOverride;
}

class _ConfigurableAssetDesignerState extends State<ConfigurableAssetDesigner> {
  ui.Image? _bgImg;
  ui.Image? _fgImg;

  late double _commonPaddingDp;
  late String? _commonBgHex;
  late double _paddingRatio;
  late TextEditingController _basePaddingTextCtrl;

  late final Map<String, _PageState> _pageStates;

  DesignerPageConfig? get _commonPage =>
      widget.pages.cast<DesignerPageConfig?>().firstWhere((p) => p?.isCommon ?? true, orElse: () => null);

  List<DesignerPageConfig> get _nonCommonPages => widget.pages.where((p) => p.isCommon == false).toList();

  double _minPadFor(DesignerPageConfig p) => (p.sizeDp - (p.safeZoneDp ?? p.sizeDp)) / 2;

  double _maxPadFor(DesignerPageConfig p) => p.sizeDp / 2;

  double _proportionalPadFor(DesignerPageConfig p) {
    final mn = _minPadFor(p);
    final mx = _maxPadFor(p);
    return mn + _paddingRatio * (mx - mn);
  }

  @override
  void initState() {
    super.initState();

    final cp = _commonPage;
    final commonMinPad = cp != null ? (cp.sizeDp - (cp.safeZoneDp ?? cp.sizeDp)) / 2 : 0.0;
    _commonPaddingDp = math.max(cp?.paddingDp ?? 0, commonMinPad);
    _commonBgHex = cp?.initialBackgroundHex ?? '#FFFFFFFF';

    // Compute initial ratio from common page
    if (cp != null) {
      final cMin = _minPadFor(cp);
      final cMax = _maxPadFor(cp);
      _paddingRatio = (cMax > cMin) ? ((_commonPaddingDp - cMin) / (cMax - cMin)).clamp(0.0, 1.0) : 0.0;
    } else {
      _paddingRatio = 0.0;
    }

    _basePaddingTextCtrl = TextEditingController(text: _commonPaddingDp.toStringAsFixed(0));

    _pageStates = {
      for (final p in _nonCommonPages)
        p.id: _PageState(
          startBgInherit: p.bgInheritsFromCommon,
          paddingDp: p.paddingDp,
          minPaddingDp: (p.sizeDp - (p.safeZoneDp ?? p.sizeDp)) / 2,
          initialBgHex: p.initialBackgroundHex,
        ),
    };

    // Detect if saved padding matches proportional (within 1dp tolerance)
    for (final p in _nonCommonPages) {
      final st = _pageStates[p.id]!;
      final proportional = _proportionalPadFor(p);
      final diff = (st.paddingOverrideDp! - proportional).abs();
      st.paddingLocked = diff < 1.0;
      if (st.paddingLocked) st.paddingOverrideDp = null;
    }

    widget.controller?._attach(this);

    _reloadPreview();
    _emitSnapshot();
  }

  @override
  void didUpdateWidget(covariant ConfigurableAssetDesigner oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._detach(this);
      widget.controller?._attach(this);
      widget.controller?.snapshot.value = _buildSnapshot();
    }

    if (oldWidget.foregroundAsset != widget.foregroundAsset ||
        oldWidget.backgroundAsset != widget.backgroundAsset ||
        oldWidget.pages != widget.pages) {
      _reloadPreview();
      _emitSnapshot();
    }
  }

  @override
  void dispose() {
    widget.controller?._detach(this);
    _basePaddingTextCtrl.dispose();
    super.dispose();
  }

  DesignerPageEffective _effectiveFor(DesignerPageConfig p) {
    if (p.isCommon) {
      return DesignerPageEffective(pageId: p.id, paddingDp: _commonPaddingDp, backgroundHex: _commonBgHex);
    }
    final st = _pageStates[p.id]!;
    final pad = st.paddingLocked ? _proportionalPadFor(p) : (st.paddingOverrideDp ?? _proportionalPadFor(p));
    final bg = _commonBgHex;
    return DesignerPageEffective(pageId: p.id, paddingDp: pad, backgroundHex: bg);
  }

  DesignerSnapshot _buildSnapshot() {
    return DesignerSnapshot(
      commonBackgroundHex: _commonBgHex,
      commonPaddingDp: _commonPaddingDp,
      pages: widget.pages.map(_effectiveFor).toList(),
    );
  }

  void _emitSnapshot() {
    final snap = _buildSnapshot();
    widget.onSnapshotChanged?.call(snap);
    widget.controller?.snapshot.value = snap;
  }

  void _reloadPreview() {
    final sizePx = (widget.previewSize * 2).round().clamp(64, 4096);
    _loadImagesForSize(sizePx);
  }

  Future<void> _loadImagesForSize(int sizePx) async {
    final futures = await Future.wait<ui.Image?>([
      if (widget.backgroundAsset != null) _rasterizeAsset(widget.backgroundAsset, sizePx) else Future.value(),
      if (widget.foregroundAsset != null) _rasterizeAsset(widget.foregroundAsset, sizePx) else Future.value(),
    ]);
    if (!mounted) return;
    setState(() {
      _bgImg = futures.isNotEmpty ? futures[0] : null;
      _fgImg = futures.length > 1 ? futures[1] : null;
    });
  }

  // Controller API — kept as no-op for backward compatibility
  void _setActiveTabById(String pageId) {}

  Widget _bgColorPickerRow({required String scopeId, required String? currentHex}) {
    final color = _parseHexColor(currentHex);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          onPressed: () async {
            final picker = widget.controller?.onPickColor;
            if (picker == null) return;
            final picked = await picker(ColorPickRequest(scopeId: scopeId, currentHex: currentHex));
            if (picked != null) {
              setState(() {
                _commonBgHex = _normalizeHex(picked);
              });
              _emitSnapshot();
              _reloadPreview();
            }
          },
          icon: const Icon(Icons.color_lens_outlined),
          label: const Text('Pick color'),
        ),
      ],
    );
  }

  Widget _buildSharedControls() {
    final cp = _commonPage;
    final minDp = cp != null ? _minPadFor(cp) : 0.0;
    final maxDp = cp != null ? _maxPadFor(cp) : 100.0;
    final clamped = _commonPaddingDp.clamp(minDp, maxDp);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _bgColorPickerRow(scopeId: 'common', currentHex: _commonBgHex),
          const Text('Padding:'),
          SizedBox(
            width: 180,
            child: Slider(
              min: minDp,
              max: maxDp,
              value: clamped,
              onChanged: (v) {
                setState(() {
                  _commonPaddingDp = v;
                  // Recompute ratio
                  if (cp != null) {
                    final cMin = _minPadFor(cp);
                    final cMax = _maxPadFor(cp);
                    _paddingRatio = (cMax > cMin) ? ((v - cMin) / (cMax - cMin)).clamp(0.0, 1.0) : 0.0;
                  }
                  _basePaddingTextCtrl.text = v.toStringAsFixed(0);
                });
                _emitSnapshot();
              },
            ),
          ),
          SizedBox(
            width: 84,
            child: TextField(
              controller: _basePaddingTextCtrl,
              decoration: const InputDecoration(isDense: true, labelText: 'dp', border: OutlineInputBorder()),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (txt) {
                final v = (double.tryParse(txt) ?? clamped).clamp(minDp, maxDp);
                setState(() {
                  _commonPaddingDp = v;
                  if (cp != null) {
                    final cMin = _minPadFor(cp);
                    final cMax = _maxPadFor(cp);
                    _paddingRatio = (cMax > cMin) ? ((v - cMin) / (cMax - cMin)).clamp(0.0, 1.0) : 0.0;
                  }
                  _basePaddingTextCtrl.text = v.toStringAsFixed(0);
                });
                _emitSnapshot();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewGrid(double previewSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [for (final p in widget.pages) _buildPlatformCard(p, previewSize)],
      ),
    );
  }

  Widget _buildPlatformCard(DesignerPageConfig p, double cardSize) {
    final eff = _effectiveFor(p);
    final scale = _scaleForPreview(artboardDp: p.sizeDp, previewPx: cardSize);
    final artboardPx = p.sizeDp * scale;
    final paddingPx = _dpToPx(eff.paddingDp, scale);
    final safePx = p.safeZoneDp != null ? _dpToPx(p.safeZoneDp!, scale) : null;
    final maskPx = p.maskDp != null ? _dpToPx(p.maskDp!, scale) : null;

    final isCommon = p.isCommon;
    final st = isCommon ? null : _pageStates[p.id];
    final locked = st?.paddingLocked ?? true;

    return SizedBox(
      width: cardSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header — fixed height so common and non-common align
          SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(p.label, style: Theme.of(context).textTheme.titleSmall),
                if (!isCommon) ...[
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Icon(locked ? Icons.lock_outline : Icons.lock_open, size: 18),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    tooltip: locked ? 'Unlock padding' : 'Lock padding',
                    onPressed: () {
                      setState(() {
                        st!.paddingLocked = !st.paddingLocked;
                        if (st.paddingLocked) {
                          st.paddingOverrideDp = null;
                        } else {
                          st.paddingOverrideDp = _proportionalPadFor(p);
                        }
                      });
                      _emitSnapshot();
                    },
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Preview
          Center(
            child: CustomPaint(
              size: Size(artboardPx, artboardPx),
              painter: UniversalAssetPreviewPainter(
                backgroundImage: _bgImg,
                foregroundImage: _fgImg,
                backgroundColor: _parseHexColor(eff.backgroundHex),
                artboardPx: artboardPx,
                paddingPx: paddingPx,
                fit: BoxFit.scaleDown,
                safeZonePx: safePx,
                maskPx: maskPx,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Footer
          if (isCommon)
            Text('${eff.paddingDp.toStringAsFixed(0)} dp', style: Theme.of(context).textTheme.bodySmall)
          else if (locked)
            Text('${eff.paddingDp.toStringAsFixed(0)} dp', style: Theme.of(context).textTheme.bodySmall)
          else
            _buildUnlockedFooter(p, st!, cardSize),
        ],
      ),
    );
  }

  Widget _buildUnlockedFooter(DesignerPageConfig p, _PageState st, double cardWidth) {
    final minDp = _minPadFor(p);
    final maxDp = _maxPadFor(p);
    final current = (st.paddingOverrideDp ?? _proportionalPadFor(p)).clamp(minDp, maxDp);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: cardWidth - 100,
          child: Slider(
            min: minDp,
            max: maxDp,
            value: current,
            onChanged: (v) {
              setState(() => st.paddingOverrideDp = v);
              _emitSnapshot();
            },
          ),
        ),
        SizedBox(
          width: 72,
          child: TextFormField(
            key: ValueKey('pad_${p.id}_${current.toStringAsFixed(0)}'),
            initialValue: current.toStringAsFixed(0),
            decoration: const InputDecoration(isDense: true, labelText: 'dp', border: OutlineInputBorder()),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onFieldSubmitted: (txt) {
              final v = (double.tryParse(txt) ?? current).clamp(minDp, maxDp);
              setState(() => st.paddingOverrideDp = v);
              _emitSnapshot();
            },
          ),
        ),
      ],
    );
  }

  Future<Map<String, Uint8List>> _buildExports() async {
    final outputs = <String, Uint8List>{};

    for (final p in widget.pages) {
      if (!p.exportEnabled) continue;

      final exportSize = p.exportSizePx;
      final foregroundAsset = widget.foregroundAsset;

      final effective = _effectiveFor(p);
      final foreground = await _rasterizeAsset(foregroundAsset, exportSize);

      final bg = await _rasterizeAsset(widget.backgroundAsset, p.exportSizePx);
      final paddingRatio = p.sizeDp == 0 ? 0 : (effective.paddingDp / p.sizeDp);
      final bgColor = _parseHexColor(effective.backgroundHex);

      outputs[p.id] = await UniversalAssetRenderPainter.renderPng(
        sizePx: p.exportSizePx,
        backgroundImage: bg,
        foregroundImage: foreground,
        backgroundColor: p.previewOnlyColor ? Colors.transparent : bgColor,
        paddingRatio: paddingRatio.toDouble(),
        fit: BoxFit.scaleDown,
      );
    }

    return outputs;
  }

  Future<Map<String, Uint8List>> _exportAll({bool returnOnly = false}) async {
    final outputs = await _buildExports();
    if (!returnOnly) {
      widget.onExport?.call(outputs);
    }
    return outputs;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardPreviewSize = ((constraints.maxWidth - 48) / 2).clamp(0.0, 260.0);
        return Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: PatternPainter(primaryColor: Theme.of(context).colorScheme.surfaceContainerHighest),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  _buildSharedControls(),
                  const SizedBox(height: 16),
                  _buildPreviewGrid(cardPreviewSize),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
