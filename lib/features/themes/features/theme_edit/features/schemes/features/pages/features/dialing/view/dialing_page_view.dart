import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';

import '../../../../../widgets/_common/_common.dart';
import '../../../../../widgets/widgets.dart';
import '../widgets/widgets.dart';

class DialingPageView extends StatefulWidget {
  const DialingPageView({
    required this.dialingPageConfig,
    required this.callActions,
    super.key,
  });

  final CallPageConfig dialingPageConfig;

  // TODO(Serdun): Remove in future major release after migrating to CallPageActionsConfig
  // ignore: deprecated_member_use
  final CallActionsWidgetConfig? callActions;

  @override
  State<DialingPageView> createState() => _DialingPageViewState();
}

class _DialingPageViewState extends State<DialingPageView> {
  // Keep original type name to avoid API breakage.
  UpdateThemCubit get _cubit => context.read<UpdateThemCubit>();

  CallPageConfig get _cfg => widget.dialingPageConfig;

  AppBarStyleConfig get _appBar => _cfg.appBarStyle ?? const AppBarStyleConfig();

  CallPageInfoConfig get _info => _cfg.callInfo ?? const CallPageInfoConfig();

  TextStyleConfig _ensureTextStyle(TextStyleConfig? s) => s ?? const TextStyleConfig();

  void _emitAppBar(AppBarStyleConfig Function(AppBarStyleConfig) update) {
    _cubit.add(
      ThemePageEvent.setDialingAppBarStyle(update(_appBar)),
    );
  }

  void _updateInfoTextStyle({
    required TextStyleConfig? current,
    required TextStyleConfig Function(TextStyleConfig base) apply,
    required void Function(TextStyleConfig style) dispatch,
  }) {
    final base = _ensureTextStyle(current);
    dispatch(apply(base));
  }

  void _setAppBarBg(Color? c) => _emitAppBar((a) => a.copyWith(backgroundColor: c?.toHex()));

  void _setAppBarFg(Color? c) => _emitAppBar((a) => a.copyWith(foregroundColor: c?.toHex()));

  void _setAppBarPrimary(bool v) => _emitAppBar((a) => a.copyWith(primary: v));

  void _setAppBarShowBack(bool v) => _emitAppBar((a) => a.copyWith(showBackButton: v));

  void _setOverlay(OverlayStyleModel? v) {
    _cubit.add(ThemePageEvent.setDialingSystemUiOverlay(v));
  }

  void _setUsernameColor(Color? c) => _updateInfoTextStyle(
        current: _info.usernameTextStyle,
        apply: (b) => b.copyWith(color: c?.toHex()),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoUsernameStyle(s)),
      );

  void _setUsernameFamily(String v) => _updateInfoTextStyle(
        current: _info.usernameTextStyle,
        apply: (b) => b.copyWith(fontFamily: v.isEmpty ? null : v),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoUsernameStyle(s)),
      );

  void _setUsernameSize(String v) => _updateInfoTextStyle(
        current: _info.usernameTextStyle,
        apply: (b) => b.copyWith(fontSize: double.tryParse(v)),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoUsernameStyle(s)),
      );

  void _setUsernameWeight(String v) => _updateInfoTextStyle(
        current: _info.usernameTextStyle,
        apply: (b) {
          final w = int.tryParse(v);
          return b.copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w));
        },
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoUsernameStyle(s)),
      );

  void _setNumberColor(Color? c) => _updateInfoTextStyle(
        current: _info.numberTextStyle,
        apply: (b) => b.copyWith(color: c?.toHex()),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoNumberStyle(s)),
      );

  void _setNumberFamily(String v) => _updateInfoTextStyle(
        current: _info.numberTextStyle,
        apply: (b) => b.copyWith(fontFamily: v.isEmpty ? null : v),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoNumberStyle(s)),
      );

  void _setNumberSize(String v) => _updateInfoTextStyle(
        current: _info.numberTextStyle,
        apply: (b) => b.copyWith(fontSize: double.tryParse(v)),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoNumberStyle(s)),
      );

  void _setNumberWeight(String v) => _updateInfoTextStyle(
        current: _info.numberTextStyle,
        apply: (b) {
          final w = int.tryParse(v);
          return b.copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w));
        },
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoNumberStyle(s)),
      );

  void _setStatusColor(Color? c) => _updateInfoTextStyle(
        current: _info.callStatusTextStyle,
        apply: (b) => b.copyWith(color: c?.toHex()),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoCallStatusStyle(s)),
      );

  void _setStatusFamily(String v) => _updateInfoTextStyle(
        current: _info.callStatusTextStyle,
        apply: (b) => b.copyWith(fontFamily: v.isEmpty ? null : v),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoCallStatusStyle(s)),
      );

  void _setStatusSize(String v) => _updateInfoTextStyle(
        current: _info.callStatusTextStyle,
        apply: (b) => b.copyWith(fontSize: double.tryParse(v)),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoCallStatusStyle(s)),
      );

  void _setStatusWeight(String v) => _updateInfoTextStyle(
        current: _info.callStatusTextStyle,
        apply: (b) {
          final w = int.tryParse(v);
          return b.copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w));
        },
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoCallStatusStyle(s)),
      );

  void _setProcessingColor(Color? c) => _updateInfoTextStyle(
        current: _info.processingStatusTextStyle,
        apply: (b) => b.copyWith(color: c?.toHex()),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoProcessingStatusStyle(s)),
      );

  void _setProcessingFamily(String v) => _updateInfoTextStyle(
        current: _info.processingStatusTextStyle,
        apply: (b) => b.copyWith(fontFamily: v.isEmpty ? null : v),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoProcessingStatusStyle(s)),
      );

  void _setProcessingSize(String v) => _updateInfoTextStyle(
        current: _info.processingStatusTextStyle,
        apply: (b) => b.copyWith(fontSize: double.tryParse(v)),
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoProcessingStatusStyle(s)),
      );

  void _setProcessingWeight(String v) => _updateInfoTextStyle(
        current: _info.processingStatusTextStyle,
        apply: (b) {
          final w = int.tryParse(v);
          return b.copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w));
        },
        dispatch: (s) => _cubit.add(ThemePageEvent.setDialingInfoProcessingStatusStyle(s)),
      );

  @override
  Widget build(BuildContext context) {
    final cfg = context.watch<UpdateThemCubit>().state.themeSettings.themePageLightConfig.dialing;
    final appBar = cfg.appBarStyle ?? const AppBarStyleConfig();
    final info = cfg.callInfo ?? const CallPageInfoConfig();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          // AppBar
          BorderContainer(
            title: 'AppBar Style',
            descriptionWidget: DescriptionRow.info(
              'Configure app bar background/foreground and navigation.',
            ),
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ColorField(
                  title: 'Background',
                  color: appBar.backgroundColor?.toColor(),
                  constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
                  onTap: (_) => context.selectColor(
                    initialColor: appBar.backgroundColor?.toColor(),
                    onColorSelected: _setAppBarBg,
                  ),
                ),
                ColorField(
                  title: 'Foreground',
                  color: appBar.foregroundColor?.toColor(),
                  constraints: const BoxConstraints(minWidth: 160, minHeight: 60),
                  onTap: (_) => context.selectColor(
                    initialColor: appBar.foregroundColor?.toColor(),
                    onColorSelected: _setAppBarFg,
                  ),
                ),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Primary'),
                  value: appBar.primary,
                  onChanged: _setAppBarPrimary,
                ),
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show back button'),
                  value: appBar.showBackButton,
                  onChanged: _setAppBarShowBack,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'System UI Overlay',
            descriptionWidget: DescriptionRow.info(
              'Controls system status bar and navigation bar colors.',
            ),
            padding: const EdgeInsets.all(16),
            child: SystemUiOverlayQuickToggles(
              value: cfg.systemUiOverlayStyle,
              onChanged: _setOverlay,
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Call Info Styles',
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextStyleEditorCompact(
                  title: 'Username',
                  initialColor: info.usernameTextStyle?.color?.toColor(),
                  onColor: _setUsernameColor,
                  familyInit: info.usernameTextStyle?.fontFamily ?? '',
                  onFamily: _setUsernameFamily,
                  sizeInit: (info.usernameTextStyle?.fontSize ?? '').toString(),
                  onSize: _setUsernameSize,
                  weightInit: (info.usernameTextStyle?.fontWeight?.weight ?? '').toString(),
                  onWeight: _setUsernameWeight,
                ),
                const SizedBox(height: 12),
                TextStyleEditorCompact(
                  title: 'Number',
                  initialColor: info.numberTextStyle?.color?.toColor(),
                  onColor: _setNumberColor,
                  familyInit: info.numberTextStyle?.fontFamily ?? '',
                  onFamily: _setNumberFamily,
                  sizeInit: (info.numberTextStyle?.fontSize ?? '').toString(),
                  onSize: _setNumberSize,
                  weightInit: (info.numberTextStyle?.fontWeight?.weight ?? '').toString(),
                  onWeight: _setNumberWeight,
                ),
                const SizedBox(height: 12),
                TextStyleEditorCompact(
                  title: 'Call Status',
                  initialColor: info.callStatusTextStyle?.color?.toColor(),
                  onColor: _setStatusColor,
                  familyInit: info.callStatusTextStyle?.fontFamily ?? '',
                  onFamily: _setStatusFamily,
                  sizeInit: (info.callStatusTextStyle?.fontSize ?? '').toString(),
                  onSize: _setStatusSize,
                  weightInit: (info.callStatusTextStyle?.fontWeight?.weight ?? '').toString(),
                  onWeight: _setStatusWeight,
                ),
                const SizedBox(height: 12),
                TextStyleEditorCompact(
                  title: 'Processing Status',
                  initialColor: info.processingStatusTextStyle?.color?.toColor(),
                  onColor: _setProcessingColor,
                  familyInit: info.processingStatusTextStyle?.fontFamily ?? '',
                  onFamily: _setProcessingFamily,
                  sizeInit: (info.processingStatusTextStyle?.fontSize ?? '').toString(),
                  onSize: _setProcessingSize,
                  weightInit: (info.processingStatusTextStyle?.fontWeight?.weight ?? '').toString(),
                  onWeight: _setProcessingWeight,
                ),
                const SizedBox(height: 16),
                BorderContainer(
                  title: 'Actions',
                  descriptionWidget: DescriptionRow.info(
                    'Configure styles for call action buttons (call, hangup, mute, etc).',
                  ),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton.icon(
                        icon: const Icon(Icons.move_up),
                        label: const Text('Import from deprecated'),
                        onPressed: _importLegacyActions,
                      ),
                    ],
                  ),
                  child: CallActionsEditorMinimal(
                    value: cfg.actions ?? const CallPageActionsConfig(),
                    onChanged: (v) => _cubit.add(
                      ThemePageEvent.setDialingPage(cfg.copyWith(actions: v)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _importLegacyActions() {
    final legacy = _findLegacyCallActions();
    if (legacy == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Legacy CallActionsWidgetConfig not found.')),
      );
      return;
    }

    final converted = _convertLegacyToNew(legacy);
    final currentDialing = context.read<UpdateThemCubit>().state.themeSettings.themePageLightConfig.dialing;

    context.read<UpdateThemCubit>().add(
          ThemePageEvent.setDialingPage(currentDialing.copyWith(actions: converted)),
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Imported actions from deprecated ${_legacySourceHint()}')),
    );
  }

  // TODO(Serdun): Remove in future major release after migrating to CallPageActionsConfig
  // ignore: deprecated_member_use
  CallActionsWidgetConfig? _findLegacyCallActions() {
    final widgets = context.read<UpdateThemCubit>().state.themeWidgetConfig;

    // root
    if (widget.callActions != null) {
      _lastLegacySource = 'widgets.callActions';
      return widget.callActions;
    }

    // nested under group
    final group = widgets.group;
    // ignore: deprecated_member_use
    if (group?.callActions != null) {
      _lastLegacySource = 'widgets.group.callActions';
      // ignore: deprecated_member_use
      return group!.callActions;
    }

    _lastLegacySource = null;
    return null;
  }

  String? _lastLegacySource;

  String _legacySourceHint() => _lastLegacySource ?? 'unknown location';

  String _withOpacityHex(Color c, double a) => c.withValues(alpha: a).toHex();

  // TODO(Serdun): Remove in future major release after migrating to CallPageActionsConfig
  // ignore: deprecated_member_use
  CallPageActionsConfig _convertLegacyToNew(CallActionsWidgetConfig c) {
    final scheme = Theme.of(context).colorScheme;
    const disabledA = 0.40;

    ElevatedButtonWidgetConfig fixed(String? bgHex) {
      final bg = bgHex?.toColor();
      return ElevatedButtonWidgetConfig(
        backgroundColor: bgHex,
        disabledBackgroundColor: bg == null ? null : _withOpacityHex(bg, disabledA),
      );
    }

    ElevatedButtonWidgetConfig toggle(String? bgHex) {
      final bg = bgHex?.toColor();
      return ElevatedButtonWidgetConfig(
        backgroundColor: bgHex,
        disabledBackgroundColor: bg == null ? null : _withOpacityHex(bg, disabledA),
        foregroundColor: scheme.surface.toHex(),
        iconColor: scheme.surface.toHex(),
        disabledForegroundColor: _withOpacityHex(scheme.surface, disabledA),
        disabledIconColor: _withOpacityHex(scheme.surface, disabledA),
      );
    }

    return CallPageActionsConfig(
      callStart: fixed(c.callStartBackgroundColor),
      hangup: fixed(c.hangupBackgroundColor),
      transfer: fixed(c.transferBackgroundColor),
      swap: fixed(c.swapBackgroundColor),
      key: fixed(c.keyBackgroundColor),
      camera: toggle(c.cameraBackgroundColor),
      muted: toggle(c.mutedBackgroundColor),
      speaker: toggle(c.speakerBackgroundColor),
      held: toggle(c.heldBackgroundColor),
    );
  }
}
