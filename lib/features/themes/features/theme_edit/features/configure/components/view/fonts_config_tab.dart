import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../../../../widgets/font_item.dart';
import '../../../../widgets/fonts_picker.dart';

class FontsConfigTab extends StatelessWidget {
  const FontsConfigTab({
    required this.fontFamily,
    required this.sourceFontsConfig,
    required this.callback,
    super.key,
  });

  final FontsConfig sourceFontsConfig;
  final String? fontFamily;
  final ObjectCallback<FontsConfig> callback;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Common Application Fonts',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          FontItem(
            fontName: fontFamily ?? sourceFontsConfig.fontFamily,
            onTap: () => _onChangeBaseFont(context),
          ),
        ],
      ),
    );
  }

  Future<void> _onChangeBaseFont(BuildContext context) async {
    final font = await showDialog<String?>(
      context: context,
      builder: (context) => Center(
        child: FontsPicker(
          onChoose: (String name) => Navigator.of(context).pop(name),
          onClose: () => Navigator.of(context).pop(),
        ),
      ),
      useRootNavigator: false,
    );

    if (font != null) {
      callback(sourceFontsConfig.copyWith(fontFamily: font));
    }
  }
}
