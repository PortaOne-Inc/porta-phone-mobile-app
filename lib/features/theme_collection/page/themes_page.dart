import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/config/app/application.dart';
import 'package:webtrit_configurator/core/mixin/mixin.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/share/share.dart';

import '../bloc/themes_cubit.dart';
import '../widgets/widgets.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({
    super.key,
  });

  @override
  State<ThemesPage> createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> with MixinMessages {
  late final ThemesCubit _allMyThemesCubit = BlocProvider.of<ThemesCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemesCubit, ThemesState>(
        listener: (context, state) => _listenThemesState(state, context),
        builder: (context, state) {
          return Scaffold(
            appBar: BaseToolBar(
              isVisibleProgress: state is ThemesProgress,
              child: ThemesToolbar(onSwitchedLanguage: _onLanguageChanged),
            ),
            body: (state is ThemesEmptyState)
                ? const EmptyState()
                : ListThemes(
                    themes: state.themes,
                    onOpen: _openTheme,
                    onMakeDefault: _allMyThemesCubit.tryMakeThemeAsDefault,
                    onDelete: _allMyThemesCubit.tryDeleteTheme,
                  ),
          );
        });
  }

  void _listenThemesState(ThemesState state, BuildContext context) {
    if (state is ThemesFailure) {
      showFailureMessage(context, state.message);
    }
  }

  void _onLanguageChanged() {
    showTopSnakeMessageInfo(context, context.l10n.common_not_implemented);
  }

  void _openTheme(ThemeModel model) {
    GoRouter.of(context).goNamed(AppRoutInfo.themesEdit.name, params: <String, String>{
      AppRoutInfo.keyAppId: _allMyThemesCubit.applicationId,
      AppRoutInfo.keyThemeId: model.id!
    });
  }
}
