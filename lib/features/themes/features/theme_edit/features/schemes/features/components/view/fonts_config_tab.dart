import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';

import 'package:webtrit_configurator/exports/exports.dart';

import '../../../../../bloc/update_theme_cubit.dart';
import '../../../../../widgets/font_item.dart';
import '../../../../../widgets/fonts_picker.dart';

class FontsConfigTab extends StatelessWidget {
  const FontsConfigTab({
    required this.fontFamily,
    required this.sourceFontsConfig,
    super.key,
  });

  final FontsConfig sourceFontsConfig;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final effectiveFont = (fontFamily?.isNotEmpty ?? false)
        ? fontFamily!
        : (sourceFontsConfig.fontFamily?.isNotEmpty ?? false ? sourceFontsConfig.fontFamily : 'System');

    return Padding(
      padding: const EdgeInsets.all(16),
      child: BorderContainer(
        title: 'Fonts',
        descriptionWidget: DescriptionRow.info(
          'Choose a global font family used across the application.',
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Common application font', style: textTheme.titleMedium),
            const SizedBox(height: 8),
            FontItem(
              fontName: effectiveFont,
              onTap: () => _onChangeBaseFont(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onChangeBaseFont(BuildContext context) async {
    final selected = await showDialog<String?>(
      context: context,
      builder: (ctx) => Center(
        child: FontsPicker(
          onChoose: (name) => Navigator.of(ctx).pop(name),
          onClose: () => Navigator.of(ctx).pop(),
        ),
      ),
      useRootNavigator: false,
    );

    if (!context.mounted || selected == null || selected.isEmpty) return;

    context.read<UpdateThemCubit>().add(
          ThemeWidgetEvent.setGlobalFontFamily(selected),
        );
  }
}
