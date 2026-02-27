import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:domain/models/resources/asset_model.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class SwitchScreenTab extends StatelessWidget {
  const SwitchScreenTab({required this.config, super.key});

  final LoginSwitchPageConfig config;

  @override
  Widget build(BuildContext context) {
    final currentConfig = context.select(
      (UpdateThemCubit cubit) => cubit.state.themePageConfig.login.switchPage,
    );
    final cubit = context.read<UpdateThemCubit>();

    return ListView(
      padding: const EdgeInsets.all(16),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        ThemeOverrideSelector(
          config: currentConfig.themeOverride,
          onChanged: (v) {
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                currentConfig.copyWith(themeOverride: v),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        AppBarSurfaceEditor(
          appBarBackgroundColor: currentConfig.appBarBackgroundColor,
          appBarBlurredSurface: currentConfig.appBarBlurredSurface,
          onAppBarBackgroundColorChanged: (v) {
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                currentConfig.copyWith(appBarBackgroundColor: v),
              ),
            );
          },
          onAppBarBlurredSurfaceChanged: (v) {
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                currentConfig.copyWith(appBarBlurredSurface: v),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        PageBackgroundEditor(
          value: currentConfig.background,
          onChanged: (v) {
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                currentConfig.copyWith(background: v),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        ImageRenderEditor(
          key: const ValueKey('switch_logo'),
          description:
              'Image displayed on the login, signup, or OTP verification screen switcher.',
          source: currentConfig.mainLogo,
          onPick: () => _pickAsset(context, cubit.state.assets),
          onChanged: (updated) {
            final freshConfig = cubit.state.themePageConfig.login.switchPage;
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                freshConfig.copyWith(mainLogo: updated),
              ),
            );
          },
          title: 'Switch Screen Logo',
        ),
        const SizedBox(height: 24),
        ButtonStyleConfigEditor(
          label: 'Segment Button Style',
          description:
              'Customize the login type switcher (e.g. corner radius, colors).',
          value: currentConfig.segmentButtonStyle,
          onChanged: (newStyle) {
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                currentConfig.copyWith(segmentButtonStyle: newStyle),
              ),
            );
          },
          onClear: () {
            cubit.add(
              ThemePageEvent.updateSwitchPage(
                currentConfig.copyWith(segmentButtonStyle: null),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (!context.mounted) return;

    final cubit = context.read<UpdateThemCubit>();

    if (picked != null) {
      final imageSource = ImageSource(id: picked.id, uri: picked.downloadUrl);

      final freshConfig = cubit.state.themePageConfig.login.switchPage;

      cubit.add(
        ThemePageEvent.updateSwitchPage(
          freshConfig.copyWith(mainLogo: imageSource),
        ),
      );
    }
  }
}
