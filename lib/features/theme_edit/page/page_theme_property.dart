import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/utility/utility.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../theme_edit.dart';
import '../widgets/widgets.dart';
import '../extension/extension.dart';

class PageThemeProperty extends StatelessWidget {
  const PageThemeProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ThemePropertyCubit>();
    final focusBloc = context.watch<FocusGroupCubit>();

    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => BlocConsumer<ThemePropertyCubit, ThemePropertyState>(
            listener: (BuildContext context, ThemePropertyState state) => _listenConfiguratorState(state),
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
                        initialValue: bloc.state.nameField.value,
                        decoration: InputDecoration(
                          hintText: context.l10n.feature_theme_InputHint_app_name,
                          errorText: state.nameField.errorL10n(context),
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
                                  color: state.colorPrimary,
                                  onFocus: (isFocus) => focusBloc.updateFocusPrimary(isFocus),
                                  onTap: (color) async => _selectColor(
                                    context,
                                    color,
                                    bloc.updateColorPrimary,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.feature_theme_edit_Color_on_primary,
                                  color: state.colorOnPrimary,
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorOnPrimary),
                                ),
                              ),
                            ],
                          ),
                          ColorField(
                            title: context.l10n.configurator_color_secondary,
                            color: state.colorSecondary,
                            onFocus: (isFocus) => focusBloc.updateColorSecondary(isFocus),
                            onTap: (color) async => _selectColor(context, color, bloc.updateColorSecondary),
                          ),
                          ColorField(
                            title: context.l10n.configurator_color_outline,
                            color: state.colorOutline,
                            onTap: (color) async => _selectColor(context, color, bloc.updateColorOutline),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_secondary_container,
                                  color: state.colorSecondaryContainer,
                                  onTap: (color) async =>
                                      _selectColor(context, color, bloc.updateColorSecondaryContainer),
                                ),
                              ),
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_on_secondary_container,
                                  color: state.colorOnSecondaryContainer,
                                  onTap: (color) async =>
                                      _selectColor(context, color, bloc.updateColorOnSecondaryContainer),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_tertiary,
                                  color: state.colorTertiary,
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorTertiary),
                                ),
                              ),
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_error,
                                  color: state.colorError,
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorError),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.feature_theme_edit_Color_on_background,
                                  color: state.colorOnBackground,
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorOnBackground),
                                ),
                              ),
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_background,
                                  color: state.colorBackground,
                                  onFocus: (isFocus) {
                                    focusBloc.updateColorBackground(isFocus);
                                  },
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorBackground),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_surface,
                                  color: state.colorSurface,
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorSurface),
                                ),
                              ),
                              Expanded(
                                child: ColorField(
                                  title: context.l10n.configurator_color_on_surface,
                                  color: state.colorOnSurface,
                                  onTap: (color) async => _selectColor(context, color, bloc.updateColorOnSurface),
                                ),
                              ),
                            ],
                          ),
                          GradientField(
                            title: context.l10n.configurator_color_gradient_tab,
                            colors: state.gradientTabColor,
                            onAddColor: (colors) async => _addGradientColor(
                              context,
                              colors,
                              bloc.updateGradientTab,
                            ),
                            onRemoveColor: (color) {
                              bloc.updateGradientTab(
                                state.gradientTabColor
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
                            fontName: state.theme?.textStyles.generalFontName,
                            onTap: () => _onChangeBaseFont(context, bloc),
                          ),
                          const Divider(
                            indent: 8,
                            endIndent: 8,
                            color: Colors.black12,
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_display_large,
                            onLineHeight: (value) => bloc.setDisplayLargeStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setDisplayLargeStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setDisplayLargeStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_display_medium,
                            onLineHeight: (value) => bloc.setDisplayMediumStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setDisplayMediumStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setDisplayMediumStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_display_small,
                            onLineHeight: (value) => bloc.setDisplaySmallStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setDisplaySmallStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setDisplaySmallStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_headline_large,
                            onLineHeight: (value) => bloc.setHeadlineLargeStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setHeadlineLargeStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setHeadlineLargeStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_headline_medium,
                            onLineHeight: (value) => bloc.setHeadlineMediumStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setHeadlineMediumStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setHeadlineMediumStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_headline_small,
                            onLineHeight: (value) => bloc.setHeadlineSmallStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setHeadlineSmallStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setHeadlineSmallStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_title_large,
                            onLineHeight: (value) => bloc.setTitleLargeStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setTitleLargeStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setTitleLargeStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_title_medium,
                            onLineHeight: (value) => bloc.setTitleMediumStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setTitleMediumStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setTitleMediumStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_title_small,
                            onLineHeight: (value) => bloc.setTitleSmallStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setTitleSmallStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setTitleSmallStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_body_large,
                            onLineHeight: (value) => bloc.setBodyLargeStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setBodyLargeStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setBodyLargeStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_body_medium,
                            onLineHeight: (value) => bloc.setBodyMediumStyle(
                              style: TextStyleModel(
                                height: value,
                              ),
                            ),
                            onLaterSpacing: (value) => bloc.setBodyMediumStyle(
                              style: TextStyleModel(
                                letterSpacing: value,
                              ),
                            ),
                            onWordSpacing: (value) => bloc.setBodyMediumStyle(
                              style: TextStyleModel(
                                wordSpacing: value,
                              ),
                            ),
                          ),
                          TextStyleItem(
                            title: context.l10n.feature_theme_edit_TextStyle_body_small,
                            onLineHeight: (value) => bloc.setBodySmallStyle(
                              style: TextStyleModel(height: value),
                            ),
                            onLaterSpacing: (value) => bloc.setBodySmallStyle(
                              style: TextStyleModel(letterSpacing: value),
                            ),
                            onWordSpacing: (value) => bloc.setBodySmallStyle(
                              style: TextStyleModel(wordSpacing: value),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(context.l10n.configurator_image_resources),
                    childrenPadding: const EdgeInsets.all(16),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          SelectedImage(
                            name: context.l10n.configurator_image_resource_onboarding,
                            image: state.theme?.images.onboarding,
                            onTap: () async => _onChangeOnboarding(bloc),
                            onRemove: () => bloc.removeImageOnboarding(),
                          ),
                          SelectedImage(
                            name: context.l10n.feature_theme_edit_Image_logo,
                            image: state.theme?.images.logo,
                            onTap: () async => _onChangeLogo(bloc),
                            onRemove: () => bloc.removeImageLogo(),
                          ),
                          SelectedImage(
                            name: 'Push notification logo',
                            image: state.theme?.images.logo,
                            onTap: () async => _onChangeLogo(bloc),
                            onRemove: () => bloc.removeImageLogo(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onChangeBaseFont(
    BuildContext context,
    ThemePropertyCubit cubit,
  ) async {
    final result = await showDialog(
        context: context,
        builder: (context) => Center(
              child: FontsPicker(
                onChoose: (String name) => Navigator.of(context).pop(name),
                onClose: () => Navigator.of(context).pop(),
              ),
            ),
        useRootNavigator: false);
    if (result is String) cubit.updateCommonFont(result);
  }

  void _selectColor(
    BuildContext context,
    Color color,
    Function(Color) callback,
  ) async {
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

  void _addGradientColor(
    BuildContext context,
    List<Color> colors,
    Function(List<Color>) callback,
  ) async {
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

  void _onChangeLogo(ThemePropertyCubit bloc) async {
    final image = await _selectImage();
    bloc.updateImageLogo(image);
  }

  void _onChangeOnboarding(ThemePropertyCubit cubit) async {
    final image = await _selectImage();
    cubit.updateImageOnboarding(image);
  }

  Future<ImageModel> _selectImage() async {
    final imageInfo = await ImagePickerWeb.getImageInfo;
    final mime = UtilityImage.getMimeFromBase64(imageInfo?.base64WithScheme);
    final image = ImageModel(data: imageInfo?.base64 ?? '', name: imageInfo?.fileName ?? '', mime: mime ?? '');
    return image;
  }

  void _listenConfiguratorState(ThemePropertyState state) {
    if (state is ConfiguratorFailure) {
      // Navigator.of(context).pushNamed(ThemesEditPage.configuratorPageAlert, arguments: state.message);
    }
  }
}
