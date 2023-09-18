import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/applications/features/application_details/page/application_themes_screen.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../../../../common/bloc/common_bloc.dart';
import '../bloc/application_details_cubit.dart';
import '../widgets/widgets.dart';

import 'application_details_screen.dart';

class ApplicationDetailsPage extends StatelessWidget with MixinMessages {
  const ApplicationDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationDetailsCubit>(context);
    return BlocConsumer<ApplicationDetailsCubit, ApplicationDetailsState>(
      listener: _listenThemesState,
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state.isProgress,
            child: ThemesToolbar(
              themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
              onSwitchedLanguage: () => _onLanguageChanged(context),
              onNewTheme: () => _onNewTheme(context, state.application!.id!),
              onLogout: () => _onLogout(context),
              onInfo: () => _onInfo(context),
              onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            ),
          ),
          body: FlexibleBinaryLayout(
            orientation: ResizableOrientation.horizontal,
            childPrimary: (context, dimension) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text('Config'),
                    ),
                  ),
                  const Divider(),
                  ApplicationDetailsScreen(
                    application: state.application,
                    onOpenDefaultTheme: (String applicationId, String themeId) => _openTheme(
                      context,
                      applicationId,
                      themeId,
                    ),
                  )
                ],
              );
            },
            childSecondary: (context, dimension) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    child: const Center(child: Text('Themes')),
                  ),
                  const Divider(),
                  Expanded(
                    child: ConditionalProgressBar(
                      condition: !state.isProgress,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: ApplicationThemesScreen(
                          themes: state.themes,
                          crossAxisCount: dimension < 500 ? 1 : 2,
                          onNewBranding: () => _onNewTheme(context, state.application!.id!),
                          onOpenBranding: (String themeId) => _openTheme(context, bloc.applicationId, themeId),
                          onMakeDefault: bloc.tryMakeThemeAsDefault,
                          onDelete: bloc.tryDeleteTheme,
                          onShowInfo: (theme) => _showThemeInfo(context, state.application!.id!, theme),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _listenThemesState(
    BuildContext context,
    ApplicationDetailsState state,
  ) {
    if (state.status == ApplicationDetailsStateStatus.error) {
      showFailureMessage(context, state.error!.message);
    }
  }

  void _onLanguageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _onNewTheme(BuildContext context, String applicationId) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.themesCreate.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
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

  void _openTheme(BuildContext context, String applicationId, String themeId) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.themesEdit.name,
      pathParameters: <String, String>{AppRoutInfo.keyApplicationId: applicationId, AppRoutInfo.keyThemeId: themeId},
    );
  }

  void _showThemeInfo(BuildContext context, String applicationId, ThemeModel model) async {
    showDialog(
      context: context,
      builder: (context) => CredentialToolbar(
        themeId: model.id!,
        applicationId: applicationId,
      ),
    );
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
