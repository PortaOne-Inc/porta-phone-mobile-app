import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../../applications/widgets/google_services_preview.dart';
import '../../../../common/bloc/common_bloc.dart';
import '../bloc/theme_collection_cubit.dart';
import '../widgets/widgets.dart';
import 'theme_collection_create_dialog.dart';

class ThemeCollectionPage extends StatefulWidget {
  const ThemeCollectionPage({
    super.key,
  });

  @override
  State<ThemeCollectionPage> createState() => _ThemeCollectionPageState();
}

class _ThemeCollectionPageState extends State<ThemeCollectionPage> with MixinMessages {
  late final ThemeCollectionCubit _allMyThemesCubit = BlocProvider.of<ThemeCollectionCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCollectionCubit, ThemeCollectionState>(
      listener: _listenThemesState,
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state.isProgress,
            child: ThemesToolbar(
              themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
              onSwitchedLanguage: _onLanguageChanged,
              onNewTheme: () => _onNewTheme(),
              onLogout: () => _onLogout(context),
              onInfo: () => _onInfo(context),
              onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            ),
          ),
          body: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 8),
                    // color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    child: const Center(
                      child: Text('Application config'),
                    ),
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('Project name:'),
                        subtitle: SelectableText(state.application?.name ?? ''),
                      ),
                      ListTile(
                        title: const Text('Project id:'),
                        subtitle: SelectableText(
                          state.application?.id ?? '',
                        ),
                      ),
                      ListTile(
                        title: const Text('Platform identifier: '),
                        subtitle: SelectableText(state.application?.platformIdentifier ?? ''),
                      ),
                      ListTile(
                        title: const Text('Version:'),
                        subtitle: SelectableText(state.application?.version.toString() ?? '0'),
                      ),
                      ListTile(
                        title: const Text('Default theme:'),
                        trailing: InkWell(
                          child: Visibility(
                            visible: state.isApplicationHasDefaultThem,
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Open'),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.open_in_new_outlined),
                              ],
                            ),
                          ),
                          onTap: () => _openTheme(_allMyThemesCubit.applicationId, state.application?.theme ?? ''),
                        ),
                        subtitle: state.isApplicationHasDefaultThem
                            ? SelectableText(state.application?.theme ?? '')
                            : const Text('Not selected default theme yet'),
                      ),
                      ListTile(
                        title: const Text('Google services:'),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: state.isGoogleServicesAvailable
                              ? Row(
                                  children: [
                                    if (state.application?.googleServices?.androidUrl != null)
                                      GoogleServicesPreview(
                                        type: GoogleServicesPreviewType.download,
                                        platform: TargetPlatform.android,
                                        onTap: () {
                                          html.AnchorElement anchorElement =
                                              html.AnchorElement(href: state.application?.googleServices?.androidUrl);
                                          anchorElement.download = state.application?.googleServices?.androidUrl;
                                          anchorElement.click();
                                        },
                                      ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    if (state.application?.googleServices?.iosUrl != null)
                                      if (state.application?.googleServices?.iosUrl != null)
                                        GoogleServicesPreview(
                                          platform: TargetPlatform.iOS,
                                          type: GoogleServicesPreviewType.download,
                                          onTap: () {
                                            html.AnchorElement anchorElement =
                                                html.AnchorElement(href: state.application?.googleServices?.iosUrl);
                                            anchorElement.download = state.application?.googleServices?.iosUrl;
                                            anchorElement.click();
                                          },
                                        )
                                  ],
                                )
                              : const Text('Google services has not uploaded'),
                        ),
                      ),
                    ],
                  )
                ],
              )),
              Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 2,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(16),
                      // color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                      child: const Center(child: Text('Themes')),
                    ),
                    const Divider(),
                    Expanded(
                      child: ConditionalProgressBar(
                        condition: !state.isProgress,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Visibility(
                                  visible: !state.isProgress,
                                  child: GridView.builder(
                                    padding: const EdgeInsets.only(top: 24),
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      if (index == 0) {
                                        return ItemButton(
                                          name: 'New theme',
                                          description:
                                              'Create new theme for application and change this style when you want',
                                          onTab: _onNewTheme,
                                        );
                                      } else {
                                        return ItemTheme(
                                          themeMode: state.themes[index - 1],
                                          onTap: (theme) => _openTheme(_allMyThemesCubit.applicationId, theme.id!),
                                          onMakeDefault: _allMyThemesCubit.tryMakeThemeAsDefault,
                                          onDelete: _allMyThemesCubit.tryDeleteTheme,
                                          onInfo: _showThemeInfo,
                                        );
                                      }
                                    },
                                    itemCount: state.themes.length + 1,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: MediaQuery.of(context).size.width < 800 ? 1 : 2,
                                      mainAxisSpacing: 8.0,
                                      crossAxisSpacing: 8.0,
                                      childAspectRatio: 1.75,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const SizedBox(height: 16)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _listenThemesState(
    BuildContext context,
    ThemeCollectionState state,
  ) {
    if (state.status == ThemeCollectionStateStatus.error) {
      showFailureMessage(context, state.error!.message);
    }
  }

  void _onLanguageChanged() {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _onNewTheme() {
    showDialog(
      context: context,
      builder: (context) => ThemeCollectionCreateDialog(
        onCreateTheme: (String name, Color color) {
          _allMyThemesCubit.tryCreateTheme(name, color);
          GoRouter.of(context).pop();
        },
      ),
    );
  }

  void _onLogout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
  }

  void _onInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => InfoDialog(
        title: context.l10n.feature_theme_Tooltip_description_title,
        message: context.l10n.feature_theme_Tooltip_description_message,
      ),
    );
  }

  void _openTheme(String applicationId, String themeId) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.themesEdit.name,
      pathParameters: <String, String>{AppRoutInfo.keyApplicationId: applicationId, AppRoutInfo.keyThemeId: themeId},
    );
  }

  void _showThemeInfo(ThemeModel model) async {
    showDialog(
      context: context,
      builder: (context) => CredentialToolbar(
        themeId: model.id!,
        applicationId: _allMyThemesCubit.applicationId,
      ),
    );
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
