import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../../../widgets/_common/_common.dart';
import '../../../widgets/widgets.dart';

class ImageAssetsConfigTab extends StatefulWidget {
  const ImageAssetsConfigTab({
    required this.imageAssetsConfig,
    super.key,
  });

  final ImageAssetsConfig imageAssetsConfig;

  @override
  State<ImageAssetsConfigTab> createState() => _ImageAssetsConfigTabState();
}

class _ImageAssetsConfigTabState extends State<ImageAssetsConfigTab> {
  // leading avatar base
  late final TextEditingController _radiusCtrl;

  // placeholder icon
  late final TextEditingController _placeholderCodePointCtrl;
  late final TextEditingController _placeholderFontFamilyCtrl;
  bool _placeholderMatchTextDirection = false;

  // loading overlay
  bool _loadingShowByDefault = false;
  late final TextEditingController _loadingStrokeWidthCtrl;
  late final TextEditingController _loadingPadL;
  late final TextEditingController _loadingPadT;
  late final TextEditingController _loadingPadR;
  late final TextEditingController _loadingPadB;

  // smart indicator
  late final TextEditingController _smartIconCodePointCtrl;
  late final TextEditingController _smartIconFontFamilyCtrl;
  late final TextEditingController _smartSizeFactorCtrl;

  // badge
  late final TextEditingController _badgeSizeFactorCtrl;

  String _formatHex(int? value) => value == null ? '' : '0x${value.toRadixString(16)}';

  int? _parseCodePoint(String input) {
    final v = input.trim();
    if (v.isEmpty) return null;
    if (v.startsWith('0x') || v.startsWith('0X')) return int.tryParse(v.substring(2), radix: 16);
    if (RegExp(r'^[0-9a-fA-F]+$').hasMatch(v)) {
      final hex = int.tryParse(v, radix: 16);
      if (hex != null) return hex;
    }
    return int.tryParse(v);
  }

  @override
  void initState() {
    super.initState();
    final s = widget.imageAssetsConfig.leadingAvatarStyle;

    _radiusCtrl = TextEditingController(text: (s.radius ?? 20.0).toString());

    final ph = s.placeholderIcon;
    _placeholderCodePointCtrl = TextEditingController(text: _formatHex(ph?.codePoint));
    _placeholderFontFamilyCtrl = TextEditingController(text: ph?.fontFamily ?? '');
    _placeholderMatchTextDirection = ph?.matchTextDirection ?? false;

    final loading = s.loading;
    _loadingShowByDefault = loading?.showByDefault ?? false;
    _loadingStrokeWidthCtrl = TextEditingController(text: (loading?.strokeWidth ?? 1.0).toString());
    _loadingPadL = TextEditingController(text: (loading?.padding.left ?? 2.0).toString());
    _loadingPadT = TextEditingController(text: (loading?.padding.top ?? 2.0).toString());
    _loadingPadR = TextEditingController(text: (loading?.padding.right ?? 2.0).toString());
    _loadingPadB = TextEditingController(text: (loading?.padding.bottom ?? 2.0).toString());

    final smart = s.smartIndicator;
    _smartIconCodePointCtrl = TextEditingController(text: _formatHex(smart?.icon?.codePoint ?? 0xe491));
    _smartIconFontFamilyCtrl = TextEditingController(text: smart?.icon?.fontFamily ?? 'MaterialIcons');
    _smartSizeFactorCtrl = TextEditingController(text: (smart?.sizeFactor ?? 0.4).toString());

    final badge = s.registeredBadge;
    _badgeSizeFactorCtrl = TextEditingController(text: (badge?.sizeFactor ?? 0.2).toString());
  }

  @override
  void dispose() {
    _radiusCtrl.dispose();
    _placeholderCodePointCtrl.dispose();
    _placeholderFontFamilyCtrl.dispose();
    _loadingStrokeWidthCtrl.dispose();
    _loadingPadL.dispose();
    _loadingPadT.dispose();
    _loadingPadR.dispose();
    _loadingPadB.dispose();
    _smartIconCodePointCtrl.dispose();
    _smartIconFontFamilyCtrl.dispose();
    _smartSizeFactorCtrl.dispose();
    _badgeSizeFactorCtrl.dispose();
    super.dispose();
  }

  LeadingAvatarStyleConfig _currentLeadingAvatar() =>
      context.read<UpdateThemCubit>().state.themeSettings.themeWidgetLightConfig.imageAssets.leadingAvatarStyle;

  TextStyleConfig _initialsTS(LeadingAvatarStyleConfig s) => s.initialsTextStyle ?? const TextStyleConfig();

  IconDataConfig _ph(LeadingAvatarStyleConfig s) => s.placeholderIcon ?? const IconDataConfig(codePoint: 0xe497);

  LoadingOverlayStyleConfig _loading(LeadingAvatarStyleConfig s) => s.loading ?? const LoadingOverlayStyleConfig();

  SmartIndicatorStyleConfig _smart(LeadingAvatarStyleConfig s) =>
      s.smartIndicator ?? const SmartIndicatorStyleConfig(icon: IconDataConfig(codePoint: 0xe491));

  RegisteredBadgeStyleConfig _badge(LeadingAvatarStyleConfig s) =>
      s.registeredBadge ?? const RegisteredBadgeStyleConfig();

  void _dispatchSetLeadingAvatar(LeadingAvatarStyleConfig cfg) =>
      context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setLeadingAvatarStyle(cfg));

  // base
  void _setLeadingBackground(Color? c) =>
      _dispatchSetLeadingAvatar(_currentLeadingAvatar().copyWith(backgroundColor: c?.toHex()));

  void _setRadius(String v) => _dispatchSetLeadingAvatar(_currentLeadingAvatar().copyWith(radius: double.tryParse(v)));

  // initials via TextStyleEditorCompact
  void _setInitialsColor(Color? c) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(initialsTextStyle: _initialsTS(s).copyWith(color: c?.toHex())));
  }

  void _setInitialsFamily(String v) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(initialsTextStyle: _initialsTS(s).copyWith(fontFamily: v.isEmpty ? null : v)));
  }

  void _setInitialsSize(String v) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(initialsTextStyle: _initialsTS(s).copyWith(fontSize: double.tryParse(v))));
  }

  void _setInitialsWeight(String v) {
    final s = _currentLeadingAvatar();
    final w = int.tryParse(v);
    _dispatchSetLeadingAvatar(
      s.copyWith(
        initialsTextStyle: _initialsTS(s).copyWith(
          fontWeight: w == null ? null : FontWeightConfig(weight: w),
        ),
      ),
    );
  }

  // placeholder
  void _setPlaceholderCodePoint(String v) {
    final parsed = _parseCodePoint(v);
    if (parsed == null) return;
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(placeholderIcon: _ph(s).copyWith(codePoint: parsed)));
  }

  void _setPlaceholderFontFamily(String v) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(placeholderIcon: _ph(s).copyWith(fontFamily: v)));
  }

  void _setPlaceholderMatchDir(bool v) {
    final s = _currentLeadingAvatar();
    setState(() => _placeholderMatchTextDirection = v);
    _dispatchSetLeadingAvatar(s.copyWith(placeholderIcon: _ph(s).copyWith(matchTextDirection: v)));
  }

  // loading
  void _setLoadingShowByDefault(bool v) {
    final s = _currentLeadingAvatar();
    setState(() => _loadingShowByDefault = v);
    _dispatchSetLeadingAvatar(s.copyWith(loading: _loading(s).copyWith(showByDefault: v)));
  }

  void _setLoadingStrokeWidth(String v) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(loading: _loading(s).copyWith(strokeWidth: double.tryParse(v))));
  }

  void _setLoadingPadding() {
    final s = _currentLeadingAvatar();
    final pad = PaddingConfig(
      left: double.tryParse(_loadingPadL.text) ?? 2.0,
      top: double.tryParse(_loadingPadT.text) ?? 2.0,
      right: double.tryParse(_loadingPadR.text) ?? 2.0,
      bottom: double.tryParse(_loadingPadB.text) ?? 2.0,
    );
    _dispatchSetLeadingAvatar(s.copyWith(loading: _loading(s).copyWith(padding: pad)));
  }

  // smart indicator
  void _setSmartBackground(Color? c) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(smartIndicator: _smart(s).copyWith(backgroundColor: c?.toHex())));
  }

  void _setSmartIconCodePoint(String v) {
    final parsed = _parseCodePoint(v);
    if (parsed == null) return;
    final s = _currentLeadingAvatar();
    final icon = (_smart(s).icon ?? const IconDataConfig(codePoint: 0xe491)).copyWith(codePoint: parsed);
    _dispatchSetLeadingAvatar(s.copyWith(smartIndicator: _smart(s).copyWith(icon: icon)));
  }

  void _setSmartIconFontFamily(String v) {
    final s = _currentLeadingAvatar();
    final icon = (_smart(s).icon ?? const IconDataConfig(codePoint: 0xe491)).copyWith(fontFamily: v);
    _dispatchSetLeadingAvatar(s.copyWith(smartIndicator: _smart(s).copyWith(icon: icon)));
  }

  void _setSmartSizeFactor(String v) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(smartIndicator: _smart(s).copyWith(sizeFactor: double.tryParse(v))));
  }

  // badge
  void _setBadgeRegistered(Color? c) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(registeredBadge: _badge(s).copyWith(registeredColor: c?.toHex())));
  }

  void _setBadgeUnregistered(Color? c) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(registeredBadge: _badge(s).copyWith(unregisteredColor: c?.toHex())));
  }

  void _setBadgeSizeFactor(String v) {
    final s = _currentLeadingAvatar();
    _dispatchSetLeadingAvatar(s.copyWith(registeredBadge: _badge(s).copyWith(sizeFactor: double.tryParse(v))));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<UpdateThemCubit>().state;
    final imageAssets = state.themeSettings.themeWidgetLightConfig.imageAssets;

    final s = imageAssets.leadingAvatarStyle;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ImageRenderEditor(
            description:
                'Default image displayed for placeholders, error states, and other image assets throughout the app',
            source: state.themeSettings.themeWidgetLightConfig.imageAssets.defaultPlaceholderImage,
            onPick: () => _pickAsset(context, state.assets),
            onChanged: (updated) {
              if (updated == null) return;
              context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setDefaultPlaceholderImage(updated));
            },
          ),
          BorderContainer(
            title: 'Leading Avatar Style',
            descriptionWidget: DescriptionRow.info('Customize contact avatar, placeholders and indicators.'),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // base
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ColorField(
                      title: 'Background color',
                      constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
                      color: s.backgroundColor?.toColor(),
                      onTap: (_) => context.selectColor(
                        initialColor: s.backgroundColor?.toColor(),
                        onColorSelected: _setLeadingBackground,
                      ),
                    ),
                    OutlineInput.number(
                      label: 'Radius',
                      controller: _radiusCtrl,
                      onChanged: _setRadius,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                TextStyleEditorCompact(
                  title: 'Initials Text Style',
                  initialColor: s.initialsTextStyle?.color?.toColor(),
                  onColor: _setInitialsColor,
                  familyInit: s.initialsTextStyle?.fontFamily ?? '',
                  onFamily: _setInitialsFamily,
                  sizeInit: (s.initialsTextStyle?.fontSize ?? '').toString(),
                  onSize: _setInitialsSize,
                  weightInit: (s.initialsTextStyle?.fontWeight?.weight ?? '').toString(),
                  onWeight: _setInitialsWeight,
                ),
                const SizedBox(height: 12),

                // placeholder icon — спільний редактор
                BorderContainer(
                  title: 'Placeholder Icon',
                  child: IconDataEditorCompact(
                    codePointCtrl: _placeholderCodePointCtrl,
                    onCodePointChanged: _setPlaceholderCodePoint,
                    fontFamilyCtrl: _placeholderFontFamilyCtrl,
                    onFontFamilyChanged: _setPlaceholderFontFamily,
                    matchTextDirection: _placeholderMatchTextDirection,
                    onMatchTextDirection: _setPlaceholderMatchDir,
                  ),
                ),
                const SizedBox(height: 12),

                // loading overlay — спільний редактор padding
                BorderContainer(
                  title: 'Loading Overlay',
                  child: Column(
                    children: [
                      SwitchListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Show by default'),
                        value: _loadingShowByDefault,
                        onChanged: _setLoadingShowByDefault,
                      ),
                      const SizedBox(height: 8),
                      OutlineInput.number(
                        label: 'Stroke width',
                        controller: _loadingStrokeWidthCtrl,
                        onChanged: _setLoadingStrokeWidth,
                      ),
                      const SizedBox(height: 8),
                      PaddingEditorCompact(
                        leftCtrl: _loadingPadL,
                        topCtrl: _loadingPadT,
                        rightCtrl: _loadingPadR,
                        bottomCtrl: _loadingPadB,
                        onChanged: _setLoadingPadding,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                BorderContainer(
                  title: 'Smart Indicator',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ColorField(
                        title: 'Background color',
                        constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
                        color: s.smartIndicator?.backgroundColor?.toColor(),
                        onTap: (_) => context.selectColor(
                          initialColor: s.smartIndicator?.backgroundColor?.toColor(),
                          onColorSelected: _setSmartBackground,
                        ),
                      ),
                      IconDataEditorCompact(
                        codePointCtrl: _smartIconCodePointCtrl,
                        onCodePointChanged: _setSmartIconCodePoint,
                        fontFamilyCtrl: _smartIconFontFamilyCtrl,
                        onFontFamilyChanged: _setSmartIconFontFamily,
                      ),
                      OutlineInput.number(
                        label: 'Size factor',
                        controller: _smartSizeFactorCtrl,
                        onChanged: _setSmartSizeFactor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                BorderContainer(
                  title: 'Registered Badge',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ColorField(
                        title: 'Registered color',
                        constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
                        color: s.registeredBadge?.registeredColor?.toColor(),
                        onTap: (_) => context.selectColor(
                          initialColor: s.registeredBadge?.registeredColor?.toColor(),
                          onColorSelected: _setBadgeRegistered,
                        ),
                      ),
                      ColorField(
                        title: 'Unregistered color',
                        constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
                        color: s.registeredBadge?.unregisteredColor?.toColor(),
                        onTap: (_) => context.selectColor(
                          initialColor: s.registeredBadge?.unregisteredColor?.toColor(),
                          onColorSelected: _setBadgeUnregistered,
                        ),
                      ),
                      OutlineInput.number(
                        label: 'Size factor',
                        controller: _badgeSizeFactorCtrl,
                        onChanged: _setBadgeSizeFactor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (context.mounted && picked != null) {
      final imageSource = ImageSource(id: picked.id, uri: picked.downloadUrl);
      context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setDefaultPlaceholderImage(imageSource));
    }
  }
}
