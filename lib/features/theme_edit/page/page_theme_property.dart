import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/mixin/mixin.dart';
import 'package:webtrit_configurator/share/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../consts/consts.dart';
import '../extension/extension.dart';
import '../model/image_filter_model.dart';
import '../theme_edit.dart';
import '../utility/utility.dart';
import '../widgets/widgets.dart';

class PageThemeProperty extends StatelessWidget with MixinMessages {
  const PageThemeProperty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ThemePropertyCubit>();
    return BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
      builder: (ctx, state) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text(context.l10n.feature_theme_edit_ExpansionTile_common_property),
              childrenPadding: const EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  onChanged: bloc.updateAppName,
                  initialValue: bloc.state.theme?.name,
                  decoration: InputDecoration(
                    hintText: context.l10n.feature_theme_InputHint_app_name,
                    errorText: state.nameField?.errorL10n(context),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(context.l10n.configurator_color_template_title),
              childrenPadding: const EdgeInsets.all(16),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_primary,
                            color: state.theme?.colors?.primary,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(primary: color)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.feature_theme_edit_Color_on_primary,
                            color: state.theme?.colors?.onPrimary,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(onPrimary: color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ColorField(
                      title: context.l10n.configurator_color_secondary,
                      color: state.theme?.colors?.secondary,
                      onTap: (color) async => _selectColor(
                        context,
                        color,
                        (color) => bloc.updateColor(state.theme?.colors?.copyWith(secondary: color)),
                      ),
                    ),
                    ColorField(
                      title: context.l10n.configurator_color_outline,
                      color: state.theme?.colors?.outline,
                      onTap: (color) async => _selectColor(
                        context,
                        color,
                        (color) => bloc.updateColor(state.theme?.colors?.copyWith(outline: color)),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_secondary_container,
                            color: state.theme?.colors?.secondaryContainer,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(secondaryContainer: color)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_on_secondary_container,
                            color: state.theme?.colors?.onSecondaryContainer,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(onSecondaryContainer: color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_tertiary,
                            color: state.theme?.colors?.tertiary,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(tertiary: color)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_error,
                            color: state.theme?.colors?.error,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(error: color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_background,
                            color: state.theme?.colors?.background,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(background: color)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.feature_theme_edit_Color_on_background,
                            color: state.theme?.colors?.onBackground,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(onBackground: color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_surface,
                            color: state.theme?.colors?.surface,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(surface: color)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_on_surface,
                            color: state.theme?.colors?.onSurface,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.updateColor(state.theme?.colors?.copyWith(onSurface: color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GradientField(
                      title: context.l10n.configurator_color_gradient_tab,
                      colors: state.theme?.colorGradientCollection ?? [],
                      onAddColor: (colors) async => _addGradientColor(
                        context,
                        colors,
                        bloc.updateGradientTab,
                      ),
                      onRemoveColor: (color) {
                        bloc.updateGradientTab(
                          (state.theme?.colorGradientCollection ?? [])
                              .where(
                                (element) => element != color,
                              )
                              .toList(),
                        );
                      },
                    ),
                    GradientField(
                      title: context.l10n.configurator_color_gradient_control_panel,
                      colors: [
                        Colors.purpleAccent.withOpacity(1.0),
                        Colors.purpleAccent.withOpacity(0.75),
                        Colors.purpleAccent.withOpacity(0.50),
                        Colors.purpleAccent.withOpacity(0.25),
                        Colors.purpleAccent.withOpacity(0),
                      ],
                      onAddColor: (colors) async => _addGradientColor(
                        context,
                        colors,
                        bloc.updateGradientTab,
                      ),
                      onRemoveColor: (Color color) {},
                    )
                  ],
                )
              ],
            ),
            ExpansionTile(
              title: Text(context.l10n.feature_theme_edit_TextStyle_title),
              childrenPadding: const EdgeInsets.all(16),
              children: [
                Column(
                  children: [
                    FontItem(
                      fontName: state.theme?.fontFamily,
                      onTap: () => _onChangeBaseFont(context, bloc),
                    ),
                  ],
                )
              ],
            ),
            ExpansionTile(
              title: Text(context.l10n.configurator_image_resources),
              childrenPadding: const EdgeInsets.all(8),
              expandedAlignment: Alignment.centerLeft,
              children: [
                ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Application images',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    subtitle: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SelectedImage(
                          name: context.l10n.configurator_image_resource_onboarding,
                          imageFilter: ImageFilterModel.svg(),
                          image: state.theme?.images?.onboarding,
                          onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                            final image = await UtilityImage.pickImage(format);
                            bloc.updateImageResources(
                              bloc.state.theme?.images?.copyWith(onboarding: image),
                            );
                          }),
                          onRemove: () => bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(
                              onboarding: ImageModel(),
                            ),
                          ),
                        ),
                        SelectedImage(
                          name: context.l10n.feature_theme_edit_Image_logo,
                          imageFilter: ImageFilterModel.svg(),
                          image: state.theme?.images?.applicationLogo,
                          onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                            final image = await UtilityImage.pickImage(format);
                            bloc.updateImageResources(
                              bloc.state.theme?.images?.copyWith(applicationLogo: image),
                            );
                          }),
                          onRemove: () => bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(
                              applicationLogo: ImageModel(),
                            ),
                          ),
                        ),
                      ],
                    )),
                ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(bottom: 8, top: 8),
                      child: Text(
                        'Application icons',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    subtitle: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SelectedImage(
                          name: 'Push notification icon',
                          imageFilter: ImageFilterModel.svg(),
                          image: state.theme?.images?.notificationLogo,
                          onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                            final image = await UtilityImage.pickImage(format);
                            bloc.updateImageResources(
                              bloc.state.theme?.images?.copyWith(notificationLogo: image),
                            );
                          }),
                          onRemove: () => bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(
                              notificationLogo: ImageModel(),
                            ),
                          ),
                        ),
                      ],
                    )),
                ListTile(
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Text(
                      'App launcher icons',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  subtitle: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SelectedImage(
                        name: 'Adaptive icon background',
                        imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.adaptiveIconBackground)),
                        image: state.theme?.images?.adaptiveIconBackground,
                        onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                          final image = await UtilityImage.pickImage(format);
                          bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(adaptiveIconBackground: image),
                          );
                        }),
                        onRemove: () => bloc.updateImageResources(
                          bloc.state.theme?.images?.copyWith(
                            adaptiveIconBackground: ImageModel(),
                          ),
                        ),
                      ),
                      SelectedImage(
                        name: 'Adaptive icon foreground',
                        imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.adaptiveIconForeground)),
                        image: state.theme?.images?.adaptiveIconForeground,
                        onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                          final image = await UtilityImage.pickImage(format);
                          bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(adaptiveIconForeground: image),
                          );
                        }),
                        onRemove: () => bloc.updateImageResources(
                          bloc.state.theme?.images?.copyWith(
                            adaptiveIconForeground: ImageModel(),
                          ),
                        ),
                      ),
                      SelectedImage(
                        name: 'Android launcher icon',
                        imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.android)),
                        image: state.theme?.images?.androidLauncherIcon,
                        onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                          final image = await UtilityImage.pickImage(format);
                          bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(androidLauncherIcon: image),
                          );
                        }),
                        onRemove: () => bloc.updateImageResources(
                          bloc.state.theme?.images?.copyWith(
                            androidLauncherIcon: ImageModel(),
                          ),
                        ),
                      ),
                      SelectedImage(
                        name: 'IOS launcher icon',
                        imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.ios)),
                        image: state.theme?.images?.iosLauncherIcon,
                        onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                          final image = await UtilityImage.pickImage(format);
                          bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(iosLauncherIcon: image),
                          );
                        }),
                        onRemove: () => bloc.updateImageResources(
                          bloc.state.theme?.images?.copyWith(
                            iosLauncherIcon: ImageModel(),
                          ),
                        ),
                      ),
                      SelectedImage(
                        name: 'WEB launcher icon',
                        imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.web)),
                        image: state.theme?.images?.webLauncherIcon,
                        onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                          final image = await UtilityImage.pickImage(format);
                          bloc.updateImageResources(
                            bloc.state.theme?.images?.copyWith(webLauncherIcon: image),
                          );
                        }),
                        onRemove: () => bloc.updateImageResources(
                          bloc.state.theme?.images?.copyWith(
                            webLauncherIcon: ImageModel(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _catchExceptions(BuildContext context, Function function) async {
    try {
      await function.call();
    } on InvalidFormatImageException catch (e) {
      showFailureMessage(context, context.l10n.feature_theme_edit_Validation_image_format(e.invalidFormat));
    } on InvalidSizeImageException catch (e) {
      showFailureMessage(context, context.l10n.feature_theme_edit_Validation_image_size(e.toString()));
    }
  }

  void _onChangeBaseFont(BuildContext context, ThemePropertyCubit cubit) async {
    final result = await showDialog(
        context: context,
        builder: (context) => Center(
              child: FontsPicker(
                onChoose: (String name) => Navigator.of(context).pop(name),
                onClose: () => Navigator.of(context).pop(),
              ),
            ),
        useRootNavigator: false);
    if (result is String) cubit.updateFont(result);
  }

  void _selectColor(BuildContext context, Color color, Function(Color) callback) async {
    final result = await showDialog(
        context: context,
        builder: (context) => Center(
              child: ColorPicker(
                onDeclineColor: () => Navigator.of(context).pop(),
                onAcceptColor: (color) => Navigator.of(context).pop(color),
                initialColor: Colors.black,
              ),
            ),
        useRootNavigator: false);
    if (result is Color) callback(result);
  }

  void _addGradientColor(BuildContext context, List<Color> colors, Function(List<Color>) callback) async {
    final result = await showDialog(
        context: context,
        builder: (context) => Center(
              child: ColorPicker(
                onDeclineColor: () => Navigator.of(context).pop(),
                onAcceptColor: (color) => Navigator.of(context).pop(color),
                initialColor: Colors.white,
              ),
            ),
        useRootNavigator: false);
    if (result is Color) callback([...colors, result]);
  }
}
