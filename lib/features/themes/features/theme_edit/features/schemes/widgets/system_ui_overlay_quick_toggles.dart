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

  void _applyLight() => onChanged(const OverlayStyleModel(
        systemNavigationBarColor: '#FFFFFF',
        systemNavigationBarIconBrightness: 'dark',
        statusBarIconBrightness: 'dark',
        statusBarBrightness: 'light',
      ));

  void _applyDark() => onChanged(const OverlayStyleModel(
        systemNavigationBarColor: '#000000',
        systemNavigationBarIconBrightness: 'light',
        statusBarIconBrightness: 'light',
        statusBarBrightness: 'dark',
      ));

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FilledButton.tonal(onPressed: _applyLight, child: const Text('Light')),
        FilledButton.tonal(onPressed: _applyDark, child: const Text('Dark')),
        if (value != null)
          Text(
            'nav=${value!.systemNavigationBarColor ?? '-'} '
            'navIcon=${value!.systemNavigationBarIconBrightness ?? '-'} '
            'sbIcon=${value!.statusBarIconBrightness ?? '-'} '
            'sb=${value!.statusBarBrightness ?? '-'}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
      ],
    );
  }
}
