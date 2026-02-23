import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../widgets/widgets.dart';

class _ColorGroupDefinition {
  const _ColorGroupDefinition({
    required this.title,
    required this.description,
    required this.contrastTip,
    required this.keys,
  });

  final String title;
  final String description;
  final String contrastTip;
  final List<String> keys;
}

class ColorSchemeConfigurationView extends StatefulWidget {
  const ColorSchemeConfigurationView({super.key});

  @override
  State<ColorSchemeConfigurationView> createState() =>
      _ColorSchemeConfigurationViewState();
}

class _ColorSchemeConfigurationViewState
    extends State<ColorSchemeConfigurationView> {
  static const _tileConstraints = BoxConstraints.tightFor(
    width: 180,
    height: 120,
  );

  // Definitions for grouping and explaining color roles
  final List<_ColorGroupDefinition> _colorGroups = [
    const _ColorGroupDefinition(
      title: 'Primary Brand Colors',
      description:
          'Main brand colors used for high-emphasis buttons, active states, and headers.',
      contrastTip:
          'Ensure "On Primary" text is clearly visible against the "Primary" background.',
      keys: [
        'primary',
        'onPrimary',
        'primaryContainer',
        'onPrimaryContainer',
        'inversePrimary',
      ],
    ),
    const _ColorGroupDefinition(
      title: 'Secondary & Accents',
      description:
          'Used for less prominent components like filter chips, floating action buttons, or secondary navigation.',
      contrastTip:
          'Secondary Container is often used for filled chips; ensure it is not too bold.',
      keys: [
        'secondary',
        'onSecondary',
        'secondaryContainer',
        'onSecondaryContainer',
      ],
    ),
    const _ColorGroupDefinition(
      title: 'Tertiary (Optional Accents)',
      description:
          'Contrasting accents used to balance primary and secondary colors, or for specific elements like input highlights.',
      contrastTip: 'Use sparingly to draw attention to unique elements.',
      keys: [
        'tertiary',
        'onTertiary',
        'tertiaryContainer',
        'onTertiaryContainer',
      ],
    ),
    const _ColorGroupDefinition(
      title: 'Surface (Backgrounds)',
      description:
          'The canvas of your app. "Surface" is the base. "Containers" create depth for Cards, Dialogs, and Menus.',
      contrastTip:
          'CRITICAL: "On Surface" is your main text color. It must contrast well with all surface variants.',
      keys: [
        'surface',
        'onSurface',
        'surfaceContainerLowest',
        'surfaceContainerLow',
        'surfaceContainer',
        'surfaceContainerHigh',
        'surfaceContainerHighest',
        'inverseSurface',
        'onInverseSurface',
        'surfaceDim',
        'surfaceBright',
        'surfaceTint',
      ],
    ),
    const _ColorGroupDefinition(
      title: 'Feedback (Error)',
      description: 'Indicates errors, destructive actions, or critical alerts.',
      contrastTip:
          'Standard pattern: Red background with White text, or Red text on White background.',
      keys: ['error', 'onError', 'errorContainer', 'onErrorContainer'],
    ),
    const _ColorGroupDefinition(
      title: 'Borders & Outlines',
      description:
          'Defines boundaries for dividers, input fields, and card outlines.',
      contrastTip:
          'Outline Variant is softer (for dividers). Outline is stronger (for input fields).',
      keys: ['outline', 'outlineVariant', 'shadow', 'scrim'],
    ),
    const _ColorGroupDefinition(
      title: 'Fixed & Dim (Advanced)',
      description:
          'Colors that stay similar across Light/Dark themes (Fixed) or muted states (Dim).',
      contrastTip: 'Modify these only if you have specific tonal requirements.',
      keys: [
        'primaryFixed',
        'primaryFixedDim',
        'onPrimaryFixed',
        'onPrimaryFixedVariant',
        'secondaryFixed',
        'secondaryFixedDim',
        'onSecondaryFixed',
        'onSecondaryFixedVariant',
        'tertiaryFixed',
        'tertiaryFixedDim',
        'onTertiaryFixed',
        'onTertiaryFixedVariant',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateThemCubit>();

    final allColors = context.select<UpdateThemCubit, List<SchemeColor>>(
      (c) => c.state.colorsScheme,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Scheme'),
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            tooltip: 'Import JSON',
            onPressed: () => _showImportJsonDialog(context, bloc),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _colorGroups.length,
        separatorBuilder: (_, __) => const SizedBox(height: 32),
        itemBuilder: (context, index) =>
            _buildGroupItem(context, _colorGroups[index], allColors, bloc),
      ),
    );
  }

  Widget _buildGroupItem(
    BuildContext context,
    _ColorGroupDefinition group,
    List<SchemeColor> allColors,
    UpdateThemCubit bloc,
  ) {
    // Filter colors belonging to this group safely
    final groupColors = group.keys
        .map((key) {
          try {
            return allColors.firstWhere((c) => c.schemeKey == key);
          } catch (_) {
            return null;
          }
        })
        .whereType<SchemeColor>()
        .toList();

    if (groupColors.isEmpty) return const SizedBox.shrink();

    return _ColorSchemeGroupCard(
      groupDef: group,
      colors: groupColors,
      tileConstraints: _tileConstraints,
      onColorTap: (item) => _handleColorTap(context, item, bloc),
    );
  }

  Future<void> _handleColorTap(
    BuildContext context,
    SchemeColor item,
    UpdateThemCubit bloc,
  ) async {
    final currentColor = item.color ?? Colors.transparent;
    await _selectColor(
      context,
      currentColor,
      (newColor) =>
          bloc.add(UpdateColorSchemeEvent.chane(item.schemeKey, newColor)),
    );
  }

  Future<void> _selectColor(
    BuildContext context,
    Color initial,
    void Function(Color) onSelected,
  ) async {
    final result = await showDialog<Color?>(
      context: context,
      useRootNavigator: false,
      builder: (context) => Center(
        child: ColorPicker(
          initialColor: initial,
          onDeclineColor: () => Navigator.of(context).pop(),
          onAcceptColor: (color) => Navigator.of(context).pop(color),
        ),
      ),
    );

    if (result != null) onSelected(result);
  }

  void _showImportJsonDialog(BuildContext context, UpdateThemCubit bloc) {
    showDialog(
      context: context,
      builder: (dialogContext) => JsonImportDialog(
        onImport: (jsonMap) =>
            bloc.add(UpdateColorSchemeEvent.importJson(jsonMap)),
      ),
    );
  }
}

class _ColorSchemeGroupCard extends StatelessWidget {
  const _ColorSchemeGroupCard({
    required this.groupDef,
    required this.colors,
    required this.tileConstraints,
    required this.onColorTap,
  });

  final _ColorGroupDefinition groupDef;
  final List<SchemeColor> colors;
  final BoxConstraints tileConstraints;
  final ValueChanged<SchemeColor> onColorTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(theme),
        const SizedBox(height: 16),
        _buildColorGrid(theme),
      ],
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          groupDef.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          groupDef.description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        _buildTipBox(theme),
      ],
    );
  }

  Widget _buildTipBox(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              groupDef.contrastTip,
              style: theme.textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorGrid(ThemeData theme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: colors.map((item) {
              return ColorField(
                title: item.schemeKey,
                color: item.color ?? Colors.transparent,
                constraints: tileConstraints,
                onTap: (_) => onColorTap(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
