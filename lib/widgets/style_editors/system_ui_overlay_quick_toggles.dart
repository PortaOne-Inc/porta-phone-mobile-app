import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

class SystemUiOverlayQuickToggles extends StatelessWidget {
  const SystemUiOverlayQuickToggles({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final OverlayStyleModel? value;
  final ValueChanged<OverlayStyleModel?> onChanged;

  static const _lightModel = OverlayStyleModel(
    systemNavigationBarColor: '#FFFFFF',
    systemNavigationBarIconBrightness: 'dark',
    statusBarIconBrightness: 'dark',
    statusBarBrightness: 'light',
  );

  static const _darkModel = OverlayStyleModel(
    systemNavigationBarColor: '#000000',
    systemNavigationBarIconBrightness: 'light',
    statusBarIconBrightness: 'light',
    statusBarBrightness: 'dark',
  );

  bool _matches(OverlayStyleModel target) {
    if (value == null) return false;
    return value?.systemNavigationBarColor == target.systemNavigationBarColor &&
        value?.statusBarIconBrightness == target.statusBarIconBrightness;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCustom =
        value != null && !_matches(_lightModel) && !_matches(_darkModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _PresetCard(
                label: 'Light',
                isSelected: _matches(_lightModel),
                backgroundColor: Colors.white,
                iconColor: Colors.black,
                onTap: () => onChanged(_lightModel),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _PresetCard(
                label: 'Dark',
                isSelected: _matches(_darkModel),
                backgroundColor: Colors.black,
                iconColor: Colors.white,
                onTap: () => onChanged(_darkModel),
              ),
            ),
          ],
        ),
        if (value != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(8),
              border: isCustom
                  ? Border.all(
                      color: theme.colorScheme.tertiary.withValues(alpha: 0.5),
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      isCustom
                          ? 'Custom Configuration'
                          : 'Active Configuration',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: isCustom
                            ? theme.colorScheme.tertiary
                            : theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => onChanged(null),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Reset',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _DetailRow(
                  label: 'Nav Bar Color',
                  value: value?.systemNavigationBarColor,
                ),
                _DetailRow(
                  label: 'Nav Icons',
                  value: value?.systemNavigationBarIconBrightness,
                ),
                _DetailRow(
                  label: 'Status Bar Icons',
                  value: value?.statusBarIconBrightness,
                ),
                _DetailRow(
                  label: 'Status Bar Brightness',
                  value: value?.statusBarBrightness,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _PresetCard extends StatelessWidget {
  const _PresetCard({
    required this.label,
    required this.isSelected,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = isSelected
        ? theme.colorScheme.primary
        : theme.dividerColor;
    final borderWidth = isSelected ? 2.0 : 1.0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Column(
          children: [
            // Preview Strip (Simulates the System UI)
            Container(
              height: 24,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.wifi, size: 14, color: iconColor),
                  Icon(Icons.battery_full, size: 14, color: iconColor),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSelected) ...[
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.textTheme.bodyMedium?.color,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
          ),
          Text(
            value ?? '-',
            style: theme.textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }
}
