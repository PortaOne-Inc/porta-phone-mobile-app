import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../../../bloc/update_theme_cubit.dart';
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
  UpdateThemCubit get _cubit => context.read<UpdateThemCubit>();

  // Helper to get fresh config for callbacks
  CallPageConfig get _freshConfig => _cubit.state.themePageConfig.dialing;

  void _onAppBarChanged(AppBarConfig config) {
    _cubit.add(ThemePageEvent.setDialingAppBarStyle(config));
  }

  void _onOverlayChanged(OverlayStyleModel? overlay) {
    _cubit.add(ThemePageEvent.setDialingSystemUiOverlay(overlay));
  }

  void _onActionsChanged(CallPageActionsConfig actions) {
    _cubit.add(
      ThemePageEvent.setDialingPage(_freshConfig.copyWith(actions: actions)),
    );
  }

  String? _lastLegacySource;

  // TODO(Serdun): Remove in future major release after migrating to CallPageActionsConfig
  // ignore: deprecated_member_use
  CallActionsWidgetConfig? _findLegacyCallActions() {
    final widgets = context.read<UpdateThemCubit>().state.themeWidgetConfig;

    if (widget.callActions != null) {
      _lastLegacySource = 'widgets.callActions';
      return widget.callActions;
    }

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

  // TODO(Serdun): Remove in future major release after migrating to CallPageActionsConfig
  void _importLegacyActions() {
    final legacy = _findLegacyCallActions();
    if (legacy == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Legacy CallActionsWidgetConfig not found.'),
        ),
      );
      return;
    }

    final scheme = Theme.of(context).colorScheme;
    const disabledA = 0.40;

    String? withAlpha(String? hex, double alpha) {
      if (hex == null) return null;
      return hex.tryParseColor()?.withValues(alpha: alpha).toHex();
    }

    ElevatedButtonWidgetConfig fixed(String? bgHex) {
      return ElevatedButtonWidgetConfig(
        backgroundColor: bgHex,
        disabledBackgroundColor: withAlpha(bgHex, disabledA),
      );
    }

    ElevatedButtonWidgetConfig toggle(String? bgHex) {
      final surfaceHex = scheme.surface.toHex();
      return ElevatedButtonWidgetConfig(
        backgroundColor: bgHex,
        disabledBackgroundColor: withAlpha(bgHex, disabledA),
        foregroundColor: surfaceHex,
        iconColor: surfaceHex,
        disabledForegroundColor: withAlpha(surfaceHex, disabledA),
        disabledIconColor: withAlpha(surfaceHex, disabledA),
      );
    }

    final converted = CallPageActionsConfig(
      callStart: fixed(legacy.callStartBackgroundColor),
      hangup: fixed(legacy.hangupBackgroundColor),
      transfer: fixed(legacy.transferBackgroundColor),
      swap: fixed(legacy.swapBackgroundColor),
      key: fixed(legacy.keyBackgroundColor),
      camera: toggle(legacy.cameraBackgroundColor),
      muted: toggle(legacy.mutedBackgroundColor),
      speaker: toggle(legacy.speakerBackgroundColor),
      held: toggle(legacy.heldBackgroundColor),
    );

    _onActionsChanged(converted);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Imported actions from deprecated ${_lastLegacySource ?? 'unknown'}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // FIX: Use select to listen to the specific part of the state
    final currentConfig = context.select(
      (UpdateThemCubit cubit) => cubit.state.themePageConfig.dialing,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          // ThemeOverrideSelector(
          //   config: currentConfig.themeOverride,
          //   onChanged: (v) {
          //     _cubit.add(
          //       ThemePageEvent.setDialingPage(
          //         currentConfig.copyWith(themeOverride: v),
          //       ),
          //     );
          //   },
          // ),
          const SizedBox(height: 16),
          AppBarSurfaceEditor(
            appBarBlurredSurface: currentConfig.appBarBlurredSurface,
            onAppBarBlurredSurfaceChanged: (v) {
              _cubit.add(
                ThemePageEvent.setDialingPage(
                  _freshConfig.copyWith(appBarBlurredSurface: v),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          PageBackgroundEditor(
            value: currentConfig.background,
            onChanged: (v) {
              _cubit.add(
                ThemePageEvent.setDialingPage(
                  currentConfig.copyWith(background: v),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _AppBarSettings(
            value: currentConfig.appBarStyle ?? const AppBarConfig(),
            onChanged: _onAppBarChanged,
          ),
          const SizedBox(height: 16),
          _SystemOverlaySettings(
            value: currentConfig.systemUiOverlayStyle,
            onChanged: _onOverlayChanged,
          ),
          const SizedBox(height: 16),
          _CallInfoSettings(
            value: currentConfig.callInfo ?? const CallPageInfoConfig(),
            onUpdate: (event) => _cubit.add(event),
          ),
          const SizedBox(height: 16),
          _ActionsSettings(
            value: currentConfig.actions ?? const CallPageActionsConfig(),
            onChanged: _onActionsChanged,
            onImportLegacy: _importLegacyActions,
          ),
        ],
      ),
    );
  }
}

class _AppBarSettings extends StatelessWidget {
  const _AppBarSettings({required this.value, required this.onChanged});

  final AppBarConfig value;
  final ValueChanged<AppBarConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text('Navigation Bar', style: theme.textTheme.titleSmall),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ColorField(
                        title: 'Background',
                        color: value.backgroundColor?.tryParseColor(),
                        onTap: (_) => _pickColor(
                          context,
                          value.backgroundColor?.tryParseColor(),
                          (hex) =>
                              onChanged(value.copyWith(backgroundColor: hex)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ColorField(
                        title: 'Foreground',
                        color: value.foregroundColor?.tryParseColor(),
                        onTap: (_) => _pickColor(
                          context,
                          value.foregroundColor?.tryParseColor(),
                          (hex) =>
                              onChanged(value.copyWith(foregroundColor: hex)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Use Primary Color'),
                  value: value.primary,
                  onChanged: (v) => onChanged(value.copyWith(primary: v)),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show Back Button'),
                  value: value.showBackButton,
                  onChanged: (v) =>
                      onChanged(value.copyWith(showBackButton: v)),
                ),
              ],
            ),
          ),
        ),
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
      onPick(picked.toHex(includeAlpha: true));
    }
  }
}

class _SystemOverlaySettings extends StatelessWidget {
  const _SystemOverlaySettings({required this.value, required this.onChanged});

  final OverlayStyleModel? value;
  final ValueChanged<OverlayStyleModel?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text('System UI', style: theme.textTheme.titleSmall),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SystemUiOverlayQuickToggles(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class _CallInfoSettings extends StatelessWidget {
  const _CallInfoSettings({required this.value, required this.onUpdate});

  final CallPageInfoConfig value;
  final ValueChanged<ThemePageEvent> onUpdate;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: const Text('Call Information Typography'),
        subtitle: const Text('Styles for Username, Number, and Statuses'),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          TextStyleConfigEditor(
            label: 'Username',
            value: value.usernameTextStyle ?? const TextStyleConfig(),
            onChanged: (s) =>
                onUpdate(ThemePageEvent.setDialingInfoUsernameStyle(s)),
          ),
          const SizedBox(height: 24),
          TextStyleConfigEditor(
            label: 'Number',
            value: value.numberTextStyle ?? const TextStyleConfig(),
            onChanged: (s) =>
                onUpdate(ThemePageEvent.setDialingInfoNumberStyle(s)),
          ),
          const SizedBox(height: 24),
          TextStyleConfigEditor(
            label: 'Call Status',
            value: value.callStatusTextStyle ?? const TextStyleConfig(),
            onChanged: (s) =>
                onUpdate(ThemePageEvent.setDialingInfoCallStatusStyle(s)),
          ),
          const SizedBox(height: 24),
          TextStyleConfigEditor(
            label: 'Processing Status',
            value: value.processingStatusTextStyle ?? const TextStyleConfig(),
            onChanged: (s) =>
                onUpdate(ThemePageEvent.setDialingInfoProcessingStatusStyle(s)),
          ),
        ],
      ),
    );
  }
}

class _ActionsSettings extends StatelessWidget {
  const _ActionsSettings({
    required this.value,
    required this.onChanged,
    required this.onImportLegacy,
  });

  final CallPageActionsConfig value;
  final ValueChanged<CallPageActionsConfig> onChanged;
  final VoidCallback onImportLegacy;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: const Text('Call Actions'),
        subtitle: const Text('Buttons for Call, Hangup, Mute, Transfer, etc.'),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onImportLegacy,
              icon: const Icon(Icons.cloud_download_outlined, size: 18),
              label: const Text('Import from Legacy Config'),
            ),
          ),
          const Divider(),
          const SizedBox(height: 8),
          CallActionsEditorMinimal(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
