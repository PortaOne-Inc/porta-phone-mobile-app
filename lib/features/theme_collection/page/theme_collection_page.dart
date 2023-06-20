import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/app/application.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/mixin/mixin.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../../common/common.dart';
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
          body: Align(
            alignment: (state.themes.length <= 2) ? Alignment.center : Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: (state.themes.length <= 2) ? 800 : MediaQuery.of(context).size.width - 16,
                minWidth: (state.themes.length <= 2) ? 200 : MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: state.isProgress,
                      child: const CircularProgressIndicator(),
                    ),
                    EmptyHolder(
                      visibility: state.themes.isEmpty && !state.isProgress,
                      onPressed: () => _onNewTheme(),
                      title: context.l10n.feature_theme_edit_Text_no_themes_yet_title,
                      description: context.l10n.feature_theme_edit_Text_no_themes_yet_description,
                      button: context.l10n.feature_theme_create,
                    ),
                    Visibility(
                      visible: state.themes.isNotEmpty && !state.isProgress,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (ctx, index) => ItemTheme(
                          themeMode: state.themes[index],
                          onTap: _openTheme,
                          onMakeDefault: _allMyThemesCubit.tryMakeThemeAsDefault,
                          onDelete: _allMyThemesCubit.tryDeleteTheme,
                          onInfo: _showThemeInfo,
                        ),
                        itemCount: state.themes.length,
                        gridDelegate: _prepareGridDelegate(state.themes),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                      visible: state.themes.isNotEmpty && !state.isProgress,
                      child: Button(
                        title: context.l10n.feature_theme_create,
                        onPressed: () => _onNewTheme(),
                      ),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _prepareGridDelegate(List<ThemeModel> apps) {
    var crossAxisCount = apps.length;
    if (apps.isEmpty) crossAxisCount = 1;
    if (apps.length > 4) crossAxisCount = 4;

    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: crossAxisCount == 1 ? 3 : 1.5);
  }

  void _listenThemesState(
    BuildContext context,
    ThemeCollectionState state,
  ) {
    if (state is ThemeCollectionStateError) {
      showFailureMessage(context, state.error!.message);
    }
    if (state is ThemeCollectionNavigateToEditTheme) {
      _openConfigurator(_allMyThemesCubit.applicationId, state.theme!.id ?? '');
    }
  }

  void _openConfigurator(String appId, String themeId) {
    GoRouter.of(context).goNamed(AppRoutInfo.themesEdit.name,
        pathParameters: <String, String>{AppRoutInfo.keyApplicationId: appId, AppRoutInfo.keyThemeId: themeId});
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

  void _openTheme(ThemeModel model) {
    GoRouter.of(context).goNamed(AppRoutInfo.themesEdit.name, pathParameters: <String, String>{
      AppRoutInfo.keyApplicationId: _allMyThemesCubit.applicationId,
      AppRoutInfo.keyThemeId: model.id!
    });
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
