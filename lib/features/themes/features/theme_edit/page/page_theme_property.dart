import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';

import '../extension/extension.dart';
import '../model/models.dart';
import '../theme_edit.dart';
import '../utility/utility.dart';
import '../widgets/widgets.dart';

import 'page_theme_import_assets.dart';

class PageThemeProperty extends StatelessWidget with MixinMessages {
  const PageThemeProperty({
    super.key,
  });

  static const _marginBetweenComponent = 8.0;

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
              childrenPadding: const EdgeInsets.symmetric(vertical: 16),
              tilePadding: const EdgeInsets.only(left: 16, right: 8),
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) => bloc.add(
                          UpdateThemeSchemeEvent.updateTexts(bloc.state.theme?.texts?.copyWith(greeting: value)),
                        ),
                        initialValue: bloc.state.theme?.texts?.greeting,
                        decoration: InputDecoration(
                          hintText: context.l10n.feature_theme_greeting_message,
                          errorText: state.nameField?.errorL10n(context),
                          suffixIcon: Tooltip(
                            message: context.l10n.feature_theme_edit_greeting_info,
                            child: Icon(
                              Icons.info_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: _marginBetweenComponent),
                    Tooltip(
                      message: context.l10n.feature_theme_edit_open_screen,
                      child: IconButton(
                        icon: Icon(
                          Icons.open_in_new_sharp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () => bloc.add(const FocusScreenEvent(0)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) => bloc.add(
                          UpdateThemeSchemeEvent.updateTexts(bloc.state.theme?.texts?.copyWith(contactEmail: value)),
                        ),
                        initialValue: bloc.state.theme?.texts?.contactEmail,
                        decoration: InputDecoration(
                          hintText: context.l10n.feature_theme_contact_email,
                          errorText: state.nameField?.errorL10n(context),
                          suffixIcon: Tooltip(
                            message: context.l10n.feature_theme_edit_contact_us_info,
                            child: Icon(
                              Icons.info_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: _marginBetweenComponent,
                    ),
                    Tooltip(
                      message: context.l10n.feature_theme_edit_open_screen,
                      child: IconButton(
                        icon: Icon(
                          Icons.open_in_new_sharp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () => bloc.add(const FocusScreenEvent(1)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            ExpansionTile(
              title: Text(context.l10n.feature_theme_edit_TextStyle_title),
              childrenPadding: const EdgeInsets.symmetric(vertical: 16),
              tilePadding: const EdgeInsets.only(left: 16, right: 8),
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
              title: Text(context.l10n.configurator_color_template_title),
              childrenPadding: const EdgeInsets.symmetric(vertical: 16),
              tilePadding: const EdgeInsets.only(left: 16, right: 8),
              children: <Widget>[
                Column(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            PropertyIconTextButton(
                              text: 'Generate scheme by color seed',
                              icon: Icons.format_color_fill,
                              onTap: () => _selectColor(
                                context,
                                state.theme?.colors?.primary ?? Colors.white,
                                (color) => bloc.add(GenerateColorSchemeByColorSeedEvent(color)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_primary,
                            color: state.theme?.colors?.primary,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.primary(color)),
                            ),
                          ),
                        ),
                        const SizedBox(width: _marginBetweenComponent),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_on_primary,
                            color: state.theme?.colors?.onPrimary,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.onPrimary(color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    ColorField(
                      title: context.l10n.configurator_color_secondary,
                      color: state.theme?.colors?.secondary,
                      onTap: (color) async => _selectColor(
                        context,
                        color,
                        (color) => bloc.add(UpdateColorSchemeEvent.secondary(color)),
                      ),
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    ColorField(
                      title: context.l10n.configurator_color_outline,
                      color: state.theme?.colors?.outline,
                      onTap: (color) async => _selectColor(
                        context,
                        color,
                        (color) => bloc.add(UpdateColorSchemeEvent.outline(color)),
                      ),
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_secondary_container,
                            color: state.theme?.colors?.secondaryContainer,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.secondaryContainer(color)),
                            ),
                          ),
                        ),
                        const SizedBox(width: _marginBetweenComponent),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_on_secondary_container,
                            color: state.theme?.colors?.onSecondaryContainer,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.onSecondaryContainer(color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_tertiary,
                            color: state.theme?.colors?.tertiary,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.tertiary(color)),
                            ),
                          ),
                        ),
                        const SizedBox(width: _marginBetweenComponent),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_error,
                            color: state.theme?.colors?.error,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.error(color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_background,
                            color: state.theme?.colors?.background,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.background(color)),
                            ),
                          ),
                        ),
                        const SizedBox(width: _marginBetweenComponent),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.feature_theme_edit_Color_on_background,
                            color: state.theme?.colors?.onBackground,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.onBackground(color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_surface,
                            color: state.theme?.colors?.surface,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.surface(color)),
                            ),
                          ),
                        ),
                        const SizedBox(width: _marginBetweenComponent),
                        Expanded(
                          child: ColorField(
                            title: context.l10n.configurator_color_on_surface,
                            color: state.theme?.colors?.onSurface,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.onSurface(color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: _marginBetweenComponent),
                    GradientField(
                      title: context.l10n.configurator_color_gradient_tab,
                      colors: state.theme?.colorGradientCollection ?? [],
                      onAddColor: (colors) async => _addGradientColor(
                        context,
                        colors,
                        (colors) => bloc.add(UpdateColorSchemeEvent.gradientTab(colors)),
                      ),
                      onRemoveColor: (color) {
                        bloc.add(UpdateColorSchemeEvent.gradientTab(
                          (state.theme?.colorGradientCollection ?? [])
                              .where(
                                (element) => element != color,
                              )
                              .toList(),
                        ));
                      },
                    ),
                    const SizedBox(height: _marginBetweenComponent * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Launcher color scheme'),
                        Tooltip(
                          message:
                              'These colors are responsible for the icons that are displayed in the system and the system splash screen that is displayed before preparing the application. Currently, these colors are not displayed in the layout.',
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).colorScheme.tertiary.withOpacity(0.4)),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Icon(
                              Icons.info_outline,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: ColorField(
                            title: 'Adaptive icon background',
                            color: state.theme?.colors?.launch?.adaptiveIconBackground,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.launchAdaptiveIconColor(color)),
                            ),
                          ),
                        ),
                        const SizedBox(width: _marginBetweenComponent),
                        Expanded(
                          child: ColorField(
                            title: 'Native splash background',
                            color: state.theme?.colors?.launch?.splashBackground,
                            onTap: (color) async => _selectColor(
                              context,
                              color,
                              (color) => bloc.add(UpdateColorSchemeEvent.launchSplashBackgroundColor(color)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            ExpansionTile(
              title: Text(context.l10n.configurator_image_resources),
              childrenPadding: const EdgeInsets.symmetric(vertical: 16),
              tilePadding: const EdgeInsets.only(left: 16, right: 8),
              expandedAlignment: Alignment.centerLeft,
              children: [
                ExpansionTile(
                    title: const Text('Application icons'),
                    childrenPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    tilePadding: const EdgeInsets.only(left: 24, right: 8),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      ListTile(
                          title: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Auth flow',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                          subtitle: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              SelectedImage(
                                name: context.l10n.feature_theme_edit_Image_primary_onboarding_logo,
                                imageFilter: ImageFilterModel.svg(),
                                image: state.theme!.images.primaryOnboardingLogo,
                                onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                  final image = await UtilityImage.pickImage(format);
                                  if (image != null) {
                                    bloc.add(UpdateThemeSchemeEvent.updateInAppImages(
                                      bloc.state.theme?.images.copyWith(primaryOnboardingLogo: image),
                                    ));
                                  }
                                }),
                                onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateInAppImages(
                                  bloc.state.theme?.images.copyWith(primaryOnboardingLogo: const ImageModel()),
                                )),
                              ),
                              SelectedImage(
                                name: context.l10n.feature_theme_edit_Image_secondary_onboarding_logo,
                                imageFilter: ImageFilterModel.svg(),
                                image: state.theme!.images.secondaryOnboardingLogo,
                                onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                  final image = await UtilityImage.pickImage(format);
                                  if (image != null) {
                                    bloc.add(UpdateThemeSchemeEvent.updateInAppImages(
                                      bloc.state.theme?.images.copyWith(secondaryOnboardingLogo: image),
                                    ));
                                  }
                                }),
                                onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateInAppImages(
                                  bloc.state.theme?.images.copyWith(
                                    secondaryOnboardingLogo: const ImageModel(),
                                  ),
                                )),
                              ),
                            ],
                          )),
                    ]),
                ExpansionTile(
                    title: const Text('App branding assets'),
                    childrenPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    tilePadding: const EdgeInsets.only(left: 24, right: 8),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Card(
                        margin: const EdgeInsets.only(left: 16),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              PropertyIconTextButton(
                                text: 'Import from svg',
                                icon: Icons.import_export_outlined,
                                onTap: () => _onImportAssets(context, bloc),
                              ),
                              Container(
                                height: 16,
                                width: 1,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                              PropertyIconTextButton(
                                text: 'Remove all assets',
                                icon: Icons.clear,
                                onTap: () => _onClearAssets(context, bloc),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 16,
                      ),
                      ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Text(
                            'App launcher icons',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        subtitle: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            SelectedImage(
                              name: 'Adaptive icon foreground',
                              description:
                                  'The image asset which will be used for the icon foreground of the adaptive icon Note: Adaptive Icons will only be generated when both adaptive_icon_background and adaptive_icon_foreground are specifier',
                              imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.adaptiveIconForeground)),
                              image: state.theme!.systemAssets.adaptiveIconForeground,
                              onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                final image = await UtilityImage.pickImage(format);
                                if (image != null) {
                                  bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                    bloc.state.theme?.systemAssets.copyWith(adaptiveIconForeground: image),
                                  ));
                                }
                              }),
                              onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                bloc.state.theme?.systemAssets.copyWith(adaptiveIconForeground: const ImageModel()),
                              )),
                            ),
                            SelectedImage(
                              name: 'Android launcher icon',
                              imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.android)),
                              image: state.theme!.systemAssets.androidLauncherIcon,
                              onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                final image = await UtilityImage.pickImage(format);
                                if (image != null) {
                                  bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                    bloc.state.theme?.systemAssets.copyWith(androidLauncherIcon: image),
                                  ));
                                }
                              }),
                              onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                bloc.state.theme?.systemAssets.copyWith(androidLauncherIcon: const ImageModel()),
                              )),
                            ),
                            SelectedImage(
                              name: 'IOS launcher icon',
                              imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.ios)),
                              image: state.theme!.systemAssets.iosLauncherIcon,
                              onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                final image = await UtilityImage.pickImage(format);
                                if (image != null) {
                                  bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                    bloc.state.theme?.systemAssets.copyWith(iosLauncherIcon: image),
                                  ));
                                }
                              }),
                              onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                bloc.state.theme?.systemAssets.copyWith(iosLauncherIcon: const ImageModel()),
                              )),
                            ),
                            SelectedImage(
                              name: 'WEB launcher icon',
                              imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.web)),
                              image: state.theme!.systemAssets.webLauncherIcon,
                              onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                final image = await UtilityImage.pickImage(format);
                                if (image != null) {
                                  bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                    bloc.state.theme?.systemAssets.copyWith(webLauncherIcon: image),
                                  ));
                                }
                              }),
                              onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                bloc.state.theme?.systemAssets.copyWith(webLauncherIcon: const ImageModel()),
                              )),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Text(
                            'Splash screen',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        subtitle: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            SelectedImage(
                              name: 'Main splash central icon',
                              description:
                                  'This icon will be displayed on the home screen when the application initializes, usually this screen is visible for a short time',
                              imageFilter: ImageFilterModel.png(Size.square(ImageSizeConsts.splashImageSize)),
                              // TODO(dmitry): RENAME adaptiveIconBackground to splash icon
                              image: state.theme!.systemAssets.adaptiveIconBackground,
                              onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                final image = await UtilityImage.pickImage(format);
                                if (image != null) {
                                  bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                    bloc.state.theme?.systemAssets.copyWith(adaptiveIconBackground: image),
                                  ));
                                }
                              }),
                              onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                bloc.state.theme?.systemAssets.copyWith(adaptiveIconBackground: const ImageModel()),
                              )),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Text(
                            'System icons',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        subtitle: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            SelectedImage(
                              name: 'IOS callkeep notification icon',
                              imageFilter: ImageFilterModel.png(const Size.square(40)),
                              image: state.theme!.systemAssets.notificationLogo,
                              onTap: (ImageFilterModel format) => _catchExceptions(context, () async {
                                final image = await UtilityImage.pickImage(format);
                                if (image != null) {
                                  bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                    bloc.state.theme?.systemAssets.copyWith(notificationLogo: image),
                                  ));
                                }
                              }),
                              onRemove: () => bloc.add(UpdateThemeSchemeEvent.updateSystemAssetsImages(
                                bloc.state.theme?.systemAssets.copyWith(notificationLogo: const ImageModel()),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _catchExceptions(BuildContext context, Future<void> Function() function) async {
    try {
      await function.call();
    } on InvalidFormatImageException catch (e) {
      if (context.mounted) {
        showFailureMessage(context, context.l10n.feature_theme_edit_Validation_image_format(e.invalidFormat));
      }
    } on InvalidSizeImageException catch (e) {
      if (context.mounted) {
        showFailureMessage(context, context.l10n.feature_theme_edit_Validation_image_size(e.toString()));
      }
    }
  }

  Future<void> _onChangeBaseFont(BuildContext context, ThemePropertyCubit cubit) async {
    final font = await showDialog<String?>(
        context: context,
        builder: (context) => Center(
              child: FontsPicker(
                onChoose: (String name) => Navigator.of(context).pop(name),
                onClose: () => Navigator.of(context).pop(),
              ),
            ),
        useRootNavigator: false);
    if (font is String) cubit.add(UpdateThemeSchemeEvent.updateFont(font));
  }

  Future<void> _onImportAssets(BuildContext context, ThemePropertyCubit cubit) async {
    cubit.add(const UpdatePropertyStateScreen(ThemePropertyScreens.importSvg));

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => PageThemeImportAssets(
          themeModel: cubit.state.theme!,
        ),
      ),
    );
    cubit
      ..add(const ThemeDraftSchemeEvent.disableDraftTheme())
      ..add(const UpdatePropertyStateScreen(ThemePropertyScreens.property));
  }
}

Future<void> _onClearAssets(BuildContext context, ThemePropertyCubit cubit) async {
  BlocProvider.of<ThemePropertyCubit>(context).add(
    const UpdateThemeSchemeEvent.updateSystemAssetsImages(SystemAssetsModel()),
  );
}

Future<void> _selectColor(BuildContext context, Color color, void Function(Color) callback) async {
  final result = await showDialog<Color?>(
      context: context,
      builder: (context) => Center(
            child: ColorPicker(
              onDeclineColor: () => Navigator.of(context).pop(),
              onAcceptColor: (color) => Navigator.of(context).pop(color),
              initialColor: color,
            ),
          ),
      useRootNavigator: false);
  if (result is Color) callback(result);
}

Future<void> _addGradientColor(BuildContext context, List<Color> colors, void Function(List<Color>) callback) async {
  final result = await showDialog<Color?>(
      context: context,
      builder: (context) => Center(
            child: ColorPicker(
              onDeclineColor: () => Navigator.of(context).pop(),
              onAcceptColor: (color) => Navigator.of(context).pop(color),
            ),
          ),
      useRootNavigator: false);
  if (result is Color) callback([...colors, result]);
}
