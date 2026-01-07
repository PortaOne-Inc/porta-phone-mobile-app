import 'package:domain/models/resources/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../bloc/update_theme_cubit.dart';

class SwitchScreenTab extends StatelessWidget {
  const SwitchScreenTab({
    required this.config,
    super.key,
  });

  final LoginSwitchPageConfig config;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();

    return ListView(
      padding: const EdgeInsets.all(16),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        ImageRenderEditor(
          key: const ValueKey('switch_logo'),
          description:
              'Image displayed on the login, signup, or OTP verification screen switcher. The image is attached to the parent switch screen that contains all nested login pages',
          source: config.mainLogo,
          onPick: () => _pickAsset(context, cubit.state.assets),
          onChanged: (updated) {
            context.read<UpdateThemCubit>().add(ThemePageEvent.updateSwitchPage(config.copyWith(mainLogo: updated)));
          }, title: 'switch_logo',
        ),
      ],
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (context.mounted && picked != null) {
      final imageSource = ImageSource(id: picked.id, uri: picked.downloadUrl);
      context.read<UpdateThemCubit>().add(ThemePageEvent.updateSwitchPage(config.copyWith(mainLogo: imageSource)));
    }
  }
}
