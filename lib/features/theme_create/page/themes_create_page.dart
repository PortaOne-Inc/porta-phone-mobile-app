import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/core/config/app/application.dart';

import '../extension/extension.dart';
import '../bloc/themes_create_cubit.dart';
import '../widgets/widgets.dart';

class ThemesCreatePage extends StatefulWidget {
  const ThemesCreatePage({
    super.key,
  });

  @override
  State<ThemesCreatePage> createState() => _ThemesCreatePageState();
}

class _ThemesCreatePageState extends State<ThemesCreatePage> with MixinMessages {
  late final ThemesCreateCubit _bloc = BlocProvider.of<ThemesCreateCubit>(context);
  bool isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseToolBar(
        child: WelcomeToolbar(
          onSwitchedLanguage: () => _languageChanged(),
        ),
      ),
      body: Center(
        child: BlocConsumer<ThemesCreateCubit, ThemesCreateState>(
          listener: (BuildContext context, ThemesCreateState state) => _listenThemesCreateState(state),
          builder: (ctx, state) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      WelcomeQuickButton(
                        title: context.l10n.feature_theme_open_local,
                        onClick: () => _openLocalTheme(),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      WelcomeQuickButton(
                        title: context.l10n.feature_theme_all_theme,
                        onClick: () => _openAllTheme(),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      WelcomeQuickButton(
                        title: context.l10n.feature_theme_public_themes,
                        onClick: () => _openPublicThemes(),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ColorField(
                                title: context.l10n.configurator_color_primary,
                                color: state.colorPrimary,
                                onTap: (color) async => _selectColor(context, color),
                              ),
                            ),
                            GestureDetector(
                              onTap: _makeAsDefault,
                              child: Card(
                                elevation: isDefault ? 2 : 0.75,
                                // radius: 8,
                                margin: const EdgeInsets.only(left: 8),
                                child: Tooltip(
                                  message: context.l10n.feature_theme_as_default,
                                  child: SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: Icon(
                                      Icons.radio_button_checked,
                                      color: isDefault ? Colors.grey : Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          onChanged: (it) => _bloc.initThemesName,
                          initialValue: context.l10n.theme_name,
                          decoration: InputDecoration(
                            hintText: context.l10n.theme_name,
                            errorText: state.nameField.errorL10n(context),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Button(
                          title: context.l10n.theme_create,
                          onPressed: () => _bloc.validateAndTryCreate(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LastSavedThemes(
                    themes: state.themes,
                    onClick: _bloc.openTheme,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _listenThemesCreateState(ThemesCreateState state) {
    if (state is NavigateToConfigurator) {
      _openConfigurator(_bloc.applicationId, state.defaultTheme?.id ?? '');
    }

    if (state is ThemesCreateFailure) {
      showFailureMessage(context, state.message);
    }
  }

  void _openConfigurator(String appId, String themeId) {
    GoRouter.of(context).goNamed(AppRoutInfo.themesEdit.name,
        params: <String, String>{AppRoutInfo.keyAppId: appId, AppRoutInfo.keyThemeId: themeId});
  }

  void _openLocalTheme() {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _openPublicThemes() {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _openAllTheme() {
    GoRouter.of(context)
        .goNamed(AppRoutInfo.themes.name, params: <String, String>{AppRoutInfo.keyAppId: _bloc.applicationId});
  }

  void _selectColor(BuildContext context, Color color) async {
    final selectedColor = await _showColorPicker(context, color);
    _bloc.initPrimaryColor(selectedColor);
  }

  Future<Color> _showColorPicker(BuildContext context, Color color) async {
    final picker = ColorPicker(
        onDeclineColor: () => Navigator.of(context).pop(),
        onAcceptColor: (color) => Navigator.of(context).pop(color),
        initialColor: color);

    final colorResult =
        await showDialog<Color>(context: context, builder: (BuildContext context) => Center(child: picker));
    return colorResult ?? Colors.white;
  }

  void _makeAsDefault() {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _languageChanged() {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }
}
