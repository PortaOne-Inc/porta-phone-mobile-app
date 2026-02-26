import 'package:domain/models/resources/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../../../../../../../exports/exports.dart';
import '../../../../../../../bloc/update_theme_cubit.dart';

class WelcomeScreenTab extends StatelessWidget {
  const WelcomeScreenTab({required this.config, super.key});

  final LoginPageConfig config;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();

    final currentConfig = context.select(
      (UpdateThemCubit cubit) => cubit.state.themePageConfig.login.modeSelect,
    );

    return ListView(
      padding: const EdgeInsets.all(16),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        BorderContainer(
          title: 'Mode Select — System UI Overlay',
          descriptionWidget: DescriptionRow.info(
            'Controls status bar and navigation bar colors on the mode selection screen.',
          ),
          padding: const EdgeInsets.all(16),
          child: SystemUiOverlayQuickToggles(
            value: currentConfig.systemUiOverlayStyle,
            onChanged: (v) => cubit.add(
              ThemePageEvent.setLoginModeSelect(
                currentConfig.copyWith(systemUiOverlayStyle: v),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ImageRenderEditor(
          key: const ValueKey('login_logo'),
          description:
              'Image that displays on the login/signup mode selection screen.',
          source: currentConfig.mainLogo,
          onPick: () => _pickAsset(context, cubit.state.assets),
          onChanged: (updated) {
            cubit.add(ThemePageEvent.setLoginPicture(updated!));
          },
          title: 'login_logo',
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Login Mode Select Page Config',
          descriptionWidget: DescriptionRow.info(
            'Choose button styles for Login/Signup actions.',
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<ElevatedButtonStyleType>(
                initialValue: currentConfig.buttonLoginStyleType,
                decoration: const InputDecoration(
                  labelText: 'Login Button Style',
                ),
                items: ElevatedButtonStyleType.values
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type.toString().split('.').last),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    cubit.add(
                      ThemePageEvent.setLoginModeSelectButtonLoginStyle(value),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<ElevatedButtonStyleType>(
                initialValue: currentConfig.buttonSignupStyleType,
                decoration: const InputDecoration(
                  labelText: 'Signup Button Style',
                ),
                items: ElevatedButtonStyleType.values
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type.toString().split('.').last),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    cubit.add(
                      ThemePageEvent.setLoginModeSelectButtonSignupStyle(value),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickAsset(BuildContext context, List<AssetModel> assets) async {
    final picked = await context.pickAsset(assets);
    if (context.mounted && picked != null) {
      final imageSource = ImageSource(id: picked.id, uri: picked.downloadUrl);
      context.read<UpdateThemCubit>().add(
        ThemePageEvent.setLoginPicture(imageSource),
      );
    }
  }
}
