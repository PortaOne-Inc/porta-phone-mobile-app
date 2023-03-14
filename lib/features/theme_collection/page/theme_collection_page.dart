import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/config/app/application.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

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
    return BlocConsumer<ThemeCollectionCubit, ThemesState>(
        listener: (context, state) => _listenThemesState(state, context),
        builder: (context, state) {
          return Scaffold(
            appBar: BaseToolBar(
              isVisibleProgress: state is ThemesProgress,
              child: ThemesToolbar(
                onSwitchedLanguage: _onLanguageChanged,
                onNewTheme: () => _onNewTheme(state),
              ),
            ),
            body: (state is ThemesEmptyState)
                ? const EmptyState()
                : GridView.builder(
                    padding: const EdgeInsets.only(top: 16),
                    itemBuilder: (ctx, index) {
                      return ItemTheme(
                        themeMode: state.themes[index],
                        onTap: _openTheme,
                        onMakeDefault: _allMyThemesCubit.tryMakeThemeAsDefault,
                        onDelete: _allMyThemesCubit.tryDeleteTheme,
                      );
                    },
                    itemCount: state.themes.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 2.0,
                    ),
                  ),
          );
        });
  }

  void _listenThemesState(ThemesState state, BuildContext context) {
    if (state is ThemesFailure) {
      showFailureMessage(context, state.message);
    }
    if (state is NavigateToConfigurator) {
      _openConfigurator(_allMyThemesCubit.applicationId, state.themeModel.id ?? '');
    }
  }

  void _openConfigurator(String appId, String themeId) {
    GoRouter.of(context).goNamed(AppRoutInfo.themesEdit.name,
        params: <String, String>{AppRoutInfo.keyAppId: appId, AppRoutInfo.keyThemeId: themeId});
  }

  void _onLanguageChanged() {
    showTopSnakeMessageInfo(context, context.l10n.common_not_implemented);
  }

  void _onNewTheme(ThemesState state) {
    showDialog(
      context: context,
      builder: (context) => ThemeCollectionCreateDialog(
        onCreateTheme: (String name, Color color) {
          _allMyThemesCubit.tryCreateTheme(name, color);
        },
      ),
    );
  }

  void _openTheme(ThemeModel model) {
    GoRouter.of(context).goNamed(AppRoutInfo.themesEdit.name, params: <String, String>{
      AppRoutInfo.keyAppId: _allMyThemesCubit.applicationId,
      AppRoutInfo.keyThemeId: model.id!
    });
  }
}
