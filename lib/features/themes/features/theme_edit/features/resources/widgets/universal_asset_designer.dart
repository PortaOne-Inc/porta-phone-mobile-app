import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/core/widgets/pattern_painter.dart';

import 'universal_asset_preview_painter.dart';
import 'universal_asset_render_painter.dart';

class DesignerPageConfig {
  const DesignerPageConfig({
    required this.id,
    required this.label,
    required this.sizeDp,
    required this.exportSizePx,
    this.safeZoneDp,
    this.maskDp,
    this.isCommon = false,
    this.previewOnlyColor = false,
    this.exportEnabled = true,
    this.inheritsFromCommon = true,
    this.bgInheritsFromCommon = true,
    this.paddingDp,
    this.initialBackgroundHex,
  });

  final String id;
  final String label;
  final double sizeDp;
  final double? safeZoneDp;
  final double? maskDp;
  final int exportSizePx;

  final bool isCommon;

  final bool previewOnlyColor;

  final bool exportEnabled;

  final bool inheritsFromCommon;

  final bool bgInheritsFromCommon;

  final double? paddingDp;

  final String? initialBackgroundHex;
}

class DesignerPageEffective {
  const DesignerPageEffective({
    required this.pageId,
    required this.paddingDp,
    required this.backgroundHex,
  });

  final String pageId;
  final double paddingDp;
  final String? backgroundHex;
}

class DesignerSnapshot {
  const DesignerSnapshot({
    required this.commonBackgroundHex,
    required this.commonPaddingDp,
    required this.pages,
  });

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

  final ValueNotifier<DesignerSnapshot?> snapshot =
      ValueNotifier<DesignerSnapshot?>(null);

  PickColorCallback? onPickColor;

  bool get isAttached => _state != null;

  Future<Map<String, Uint8List>> exportAll() async {
    final s = _state;
    if (s == null) {
      throw StateError(
        'ConfigurableAssetDesignerController is not attached to a widget.',
      );
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

double _scaleForPreview({
  required double artboardDp,
  required double previewPx,
}) => previewPx / artboardDp;

double _dpToPx(double dp, double scale) => dp * scale;

bool _isSvg(AssetModel a) => a.mimeType.toLowerCase().contains('svg');

Future<Uint8List> _bytesFromUrl(String url) async {
  final resp = await http.get(Uri.parse(url));
  if (resp.statusCode != 200)
    throw Exception('HTTP ${resp.statusCode} while fetching $url');
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
        child: FittedBox(
          child: SvgPicture.memory(bytes, allowDrawingOutsideViewBox: true),
        ),
      ),
    );
    final png = await controller.captureFromWidget(w, pixelRatio: 1);
    final codec = await ui.instantiateImageCodec(png);
    final frame = await codec.getNextFrame();
    return frame.image;
  } else {
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: sizePx,
      targetHeight: sizePx,
    );
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
  State<ConfigurableAssetDesigner> createState() =>
      _ConfigurableAssetDesignerState();
}

class _PageState {
  _PageState({
    required bool startInherit,
    required bool startBgInherit,
    double? paddingDp,
    String? initialBgHex,
  }) {
    inheritCommon = startInherit;
    bgInheritCommon = startBgInherit;

    if (!startInherit && paddingDp != null) {
      paddingOverrideDp = paddingDp;
    }
    if (!startBgInherit && initialBgHex != null) {
      bgHexOverride = initialBgHex;
    }
  }

  bool inheritCommon = true;
  FitModel? fitOverride;
  double? paddingOverrideDp;

  bool bgInheritCommon = true;
  String? bgHexOverride;
}

class _ConfigurableAssetDesignerState extends State<ConfigurableAssetDesigner>
    with TickerProviderStateMixin {
  ui.Image? _bgImg;
  ui.Image? _fgImg;

  late double _commonPaddingDp;
  late String? _commonBgHex;

  late final Map<String, _PageState> _pageStates;

  late final TabController _tab = TabController(
    length: widget.pages.length,
    vsync: this,
  );

  DesignerPageConfig? get _commonPage => widget.pages
      .cast<DesignerPageConfig?>()
      .firstWhere((p) => p?.isCommon ?? true, orElse: () => null);

  List<DesignerPageConfig> get _nonCommonPages =>
      widget.pages.where((p) => p.isCommon == false).toList();

  @override
  void initState() {
    super.initState();

    final cp = _commonPage;
    _commonPaddingDp = cp?.paddingDp ?? 0;
    _commonBgHex = cp?.initialBackgroundHex ?? '#FFFFFFFF';

    _pageStates = {
      for (final p in _nonCommonPages)
        p.id: _PageState(
          startInherit: p.inheritsFromCommon,
          startBgInherit: p.bgInheritsFromCommon,
          paddingDp: p.paddingDp,
          initialBgHex: p.initialBackgroundHex,
        ),
    };

    _tab.addListener(_reloadPreview);
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
    _tab
      ..removeListener(_reloadPreview)
      ..dispose();
    super.dispose();
  }

  DesignerPageEffective _effectiveFor(DesignerPageConfig p) {
    if (p.isCommon) {
      return DesignerPageEffective(
        pageId: p.id,
        paddingDp: _commonPaddingDp,
        backgroundHex: _commonBgHex,
      );
    }
    final st = _pageStates[p.id]!;
    final pad = st.inheritCommon
        ? _commonPaddingDp
        : (st.paddingOverrideDp ?? _commonPaddingDp);
    final bg = st.bgInheritCommon
        ? _commonBgHex
        : (st.bgHexOverride ?? _commonBgHex);
    return DesignerPageEffective(
      pageId: p.id,
      paddingDp: pad,
      backgroundHex: bg,
    );
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
    final page = widget.pages[_tab.index];

    final sizeDp = page.sizeDp;
    final scale = _scaleForPreview(
      artboardDp: sizeDp,
      previewPx: widget.previewSize,
    );
    final artboardPx = (sizeDp * scale).round().clamp(64, 4096);

    _loadImagesForSize(artboardPx);
  }

  Future<void> _loadImagesForSize(int sizePx) async {
    final futures = await Future.wait<ui.Image?>([
      if (widget.backgroundAsset != null)
        _rasterizeAsset(widget.backgroundAsset, sizePx)
      else
        Future.value(),
      if (widget.foregroundAsset != null)
        _rasterizeAsset(widget.foregroundAsset, sizePx)
      else
        Future.value(),
    ]);
    if (!mounted) return;
    setState(() {
      _bgImg = futures.isNotEmpty ? futures[0] : null;
      _fgImg = futures.length > 1 ? futures[1] : null;
    });
  }

  // allow controller to switch tab by id
  void _setActiveTabById(String pageId) {
    final idx = widget.pages.indexWhere((p) => p.id == pageId);
    if (idx == -1) return;
    if (idx >= 0 && idx < _tab.length) {
      _tab.animateTo(idx);
    }
  }

  Widget _paddingEditor({
    required double currentDp,
    required double maxDp,
    required ValueChanged<double> onChanged,
  }) {
    final clamped = currentDp.clamp(0, maxDp);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 180,
          child: Slider(
            max: maxDp,
            value: clamped.toDouble(),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 84,
          child: TextFormField(
            initialValue: clamped.toStringAsFixed(0),
            decoration: const InputDecoration(
              isDense: true,
              labelText: 'dp',
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onFieldSubmitted: (txt) {
              final v = double.tryParse(txt) ?? clamped;
              onChanged(v.clamp(0, maxDp).toDouble());
            },
          ),
        ),
      ],
    );
  }

  Widget _bgColorPickerRow({
    required String scopeId,
    required bool enabled,
    required String? currentHex,
    required VoidCallback onColorChanged,
  }) {
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
          onPressed: !enabled
              ? null
              : () async {
                  final picker = widget.controller?.onPickColor;
                  if (picker == null) return;
                  final picked = await picker(
                    ColorPickRequest(scopeId: scopeId, currentHex: currentHex),
                  );
                  if (picked != null) {
                    setState(() {
                      final hex = _normalizeHex(picked);
                      if (scopeId == 'common') {
                        _commonBgHex = hex;
                      } else {
                        final st = _pageStates[scopeId];
                        if (st != null) st.bgHexOverride = hex;
                      }
                    });
                    _emitSnapshot();
                    _reloadPreview();
                    onColorChanged();
                  }
                },
          icon: const Icon(Icons.color_lens_outlined),
          label: Text(enabled ? 'Pick color' : 'Inherited'),
        ),
      ],
    );
  }

  Widget _buildCommonTab(DesignerPageConfig p) {
    final scale = _scaleForPreview(
      artboardDp: p.sizeDp,
      previewPx: widget.previewSize,
    );
    final artboardPx = p.sizeDp * scale;
    final paddingPx = _dpToPx(_commonPaddingDp, scale);
    final safePx = p.safeZoneDp != null ? _dpToPx(p.safeZoneDp!, scale) : null;
    final maskPx = p.maskDp != null ? _dpToPx(p.maskDp!, scale) : null;
    final w = artboardPx;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(p.label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: PatternPainter(primaryColor: Colors.blue),
              ),
            ),
            CustomPaint(
              size: Size(w, w),
              painter: UniversalAssetPreviewPainter(
                backgroundImage: _bgImg,
                foregroundImage: _fgImg,
                backgroundColor: _parseHexColor(_commonBgHex),
                artboardPx: artboardPx,
                paddingPx: paddingPx,
                fit: BoxFit.scaleDown,
                safeZonePx: safePx,
                maskDiameterPx: maskPx,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _bgColorPickerRow(
              scopeId: 'common',
              enabled: true,
              currentHex: _commonBgHex,
              onColorChanged: () {},
            ),
            const Text('Padding:'),
            _paddingEditor(
              currentDp: _commonPaddingDp,
              maxDp: p.sizeDp / 2,
              onChanged: (v) {
                setState(() => _commonPaddingDp = v);
                _emitSnapshot();
                _reloadPreview();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPageTab(DesignerPageConfig p) {
    final st = _pageStates[p.id]!;
    final eff = _effectiveFor(p);

    final scale = _scaleForPreview(
      artboardDp: p.sizeDp,
      previewPx: widget.previewSize,
    );
    final artboardPx = p.sizeDp * scale;
    final paddingPx = _dpToPx(eff.paddingDp, scale);
    final safePx = p.safeZoneDp != null ? _dpToPx(p.safeZoneDp!, scale) : null;
    final maskPx = p.maskDp != null ? _dpToPx(p.maskDp!, scale) : null;
    final w = artboardPx;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(p.label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: PatternPainter(primaryColor: Colors.blue),
              ),
            ),
            CustomPaint(
              size: Size(w, w),
              painter: UniversalAssetPreviewPainter(
                backgroundImage: _bgImg,
                foregroundImage: _fgImg,
                backgroundColor: _parseHexColor(eff.backgroundHex),
                artboardPx: artboardPx,
                paddingPx: paddingPx,
                fit: BoxFit.scaleDown,
                safeZonePx: safePx,
                maskDiameterPx: maskPx,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: st.inheritCommon,
                  onChanged: (v) {
                    setState(() => st.inheritCommon = v);
                    _emitSnapshot();
                    _reloadPreview();
                  },
                ),
                const SizedBox(width: 4),
                const Text('Inherit Common fit/padding'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: st.bgInheritCommon,
                  onChanged: (v) {
                    setState(() => st.bgInheritCommon = v);
                    _emitSnapshot();
                    _reloadPreview();
                  },
                ),
                const SizedBox(width: 4),
                const Text('Inherit Common background'),
              ],
            ),
            _bgColorPickerRow(
              scopeId: p.id,
              enabled: !st.bgInheritCommon,
              currentHex: st.bgInheritCommon
                  ? _commonBgHex
                  : (st.bgHexOverride ?? _commonBgHex),
              onColorChanged: () {},
            ),
            const Text('Padding:'),
            _paddingEditor(
              currentDp: st.inheritCommon
                  ? _commonPaddingDp
                  : (st.paddingOverrideDp ?? _commonPaddingDp),
              maxDp: p.sizeDp / 2,
              onChanged: st.inheritCommon
                  ? (_) {}
                  : (v) {
                      setState(() => st.paddingOverrideDp = v);
                      _emitSnapshot();
                      _reloadPreview();
                    },
            ),
          ],
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
    final tabs = <Tab>[];
    final views = <Widget>[];

    for (final p in widget.pages) {
      tabs.add(Tab(text: p.label));
      views.add(
        Center(child: p.isCommon ? _buildCommonTab(p) : _buildPageTab(p)),
      );
    }

    final hasTabs = tabs.length > 1;

    return Column(
      children: [
        if (hasTabs) TabBar(controller: _tab, tabs: tabs),
        const SizedBox(height: 12),
        Expanded(
          child: hasTabs
              ? TabBarView(controller: _tab, children: views)
              : views.first,
        ),
      ],
    );
  }
}
