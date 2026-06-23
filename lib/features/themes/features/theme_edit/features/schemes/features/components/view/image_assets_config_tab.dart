import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import 'leading_avatar_editors.dart';

class ImageAssetsConfigTab extends StatelessWidget {
  const ImageAssetsConfigTab({required this.imageAssetsConfig, super.key});

  final ImageAssetsConfig imageAssetsConfig;

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (context.mounted && picked != null) {
      final imageSource = ImageSource(id: picked.id, uri: picked.downloadUrl);
      context.read<UpdateThemCubit>().add(
        ThemeWidgetEvent.setDefaultPlaceholderImage(imageSource),
      );
    }
  }

  void _updateLeadingAvatar(
    BuildContext context,
    LeadingAvatarStyleConfig config,
  ) {
    context.read<UpdateThemCubit>().add(
      ThemeWidgetEvent.setLeadingAvatarStyle(config),
    );
  }

  void _onPlaceholderChanged(BuildContext context, ImageSource? updated) {
    if (updated != null) {
      context.read<UpdateThemCubit>().add(
        ThemeWidgetEvent.setDefaultPlaceholderImage(updated),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = context.select<UpdateThemCubit, ImageAssetsConfig>(
      (cubit) => cubit.state.themeWidgetConfig.imageAssets,
    );
    final assets = context.select<UpdateThemCubit, List<AssetModel>>(
      (cubit) => cubit.state.assets,
    );
    final leading = config.leadingAvatarStyle;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageRenderEditor(
            title: 'Default Placeholder Image',
            description: 'Used for error states and missing assets.',
            source: config.defaultPlaceholderImage,
            onPick: () => _pickAsset(context, assets),
            onChanged: (updated) => _onPlaceholderChanged(context, updated),
          ),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: const Text('Leading Avatar Style'),
                subtitle: const Text('Contact avatars, indicators, and badges'),
                initiallyExpanded: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  _LeadingGeneralSettings(
                    value: leading,
                    onChanged: (v) => _updateLeadingAvatar(context, v),
                  ),
                  const SizedBox(height: 24),
                  TextStyleConfigEditor(
                    label: 'Initials Typography',
                    value: leading.initialsTextStyle,
                    onChanged: (s) => _updateLeadingAvatar(
                      context,
                      leading.copyWith(initialsTextStyle: s),
                    ),
                    onClear: () => _updateLeadingAvatar(
                      context,
                      leading.copyWith(initialsTextStyle: null),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _PlaceholderIconSettings(
                    value:
                        leading.placeholderIcon ??
                        const IconDataConfig(codePoint: 0xe497),
                    onChanged: (icon) => _updateLeadingAvatar(
                      context,
                      leading.copyWith(placeholderIcon: icon),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _LoadingOverlaySettings(
                    value: leading.loading ?? const LoadingOverlayStyleConfig(),
                    onChanged: (loading) => _updateLeadingAvatar(
                      context,
                      leading.copyWith(loading: loading),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DescriptionRow.info(
                    'Presence, registration and smart indicators are configured in '
                    'the Indicators & Statuses tab.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeadingGeneralSettings extends StatelessWidget {
  const _LeadingGeneralSettings({required this.value, required this.onChanged});

  final LeadingAvatarStyleConfig value;
  final ValueChanged<LeadingAvatarStyleConfig> onChanged;

  Future<void> _pickBackgroundColor(BuildContext context) async {
    final newColor = await context.showColorPicker(
      currentColor: value.backgroundColor?.tryParseColor(),
    );
    if (newColor != null) {
      onChanged(value.copyWith(backgroundColor: newColor.toHex()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorField(
            title: 'Background',
            color: value.backgroundColor?.tryParseColor(),
            onTap: (_) => _pickBackgroundColor(context),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: NumberInputControl(
            label: 'Radius',
            value: value.radius,
            onChanged: (v) => onChanged(value.copyWith(radius: v)),
          ),
        ),
      ],
    );
  }
}

class _PlaceholderIconSettings extends StatelessWidget {
  const _PlaceholderIconSettings({
    required this.value,
    required this.onChanged,
  });

  final IconDataConfig value;
  final ValueChanged<IconDataConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Placeholder Icon', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CodePointInput(
                value: value.codePoint,
                onChanged: (v) => onChanged(value.copyWith(codePoint: v)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                initialValue: value.fontFamily,
                decoration: const InputDecoration(
                  labelText: 'Font Family',
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => onChanged(value.copyWith(fontFamily: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Match Text Direction'),
          value: value.matchTextDirection,
          onChanged: (v) => onChanged(value.copyWith(matchTextDirection: v)),
        ),
      ],
    );
  }
}

class _LoadingOverlaySettings extends StatelessWidget {
  const _LoadingOverlaySettings({required this.value, required this.onChanged});

  final LoadingOverlayStyleConfig value;
  final ValueChanged<LoadingOverlayStyleConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loading Overlay', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Show by Default'),
          value: value.showByDefault,
          onChanged: (v) => onChanged(value.copyWith(showByDefault: v)),
        ),
        const SizedBox(height: 8),
        NumberInputControl(
          label: 'Stroke Width',
          value: value.strokeWidth,
          onChanged: (v) => onChanged(value.copyWith(strokeWidth: v)),
        ),
        const SizedBox(height: 12),
        _PaddingInputs(
          value: value.padding,
          onChanged: (p) => onChanged(value.copyWith(padding: p)),
        ),
      ],
    );
  }
}

class _PaddingInputs extends StatelessWidget {
  const _PaddingInputs({required this.value, required this.onChanged});

  final PaddingConfig value;
  final ValueChanged<PaddingConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NumberInputControl(
            label: 'L',
            value: value.left,
            onChanged: (v) => onChanged(value.copyWith(left: v ?? 0)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputControl(
            label: 'T',
            value: value.top,
            onChanged: (v) => onChanged(value.copyWith(top: v ?? 0)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputControl(
            label: 'R',
            value: value.right,
            onChanged: (v) => onChanged(value.copyWith(right: v ?? 0)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputControl(
            label: 'B',
            value: value.bottom,
            onChanged: (v) => onChanged(value.copyWith(bottom: v ?? 0)),
          ),
        ),
      ],
    );
  }
}
