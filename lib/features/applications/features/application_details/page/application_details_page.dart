import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/applications/features/application_details/page/application_themes_screen.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../bloc/application_details_cubit.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

import 'application_details_screen.dart';

class ApplicationDetailsPage extends StatelessWidget with MixinMessages {
  const ApplicationDetailsPage({
    super.key,
  });

  ApplicationDetailsCubit getBloc(BuildContext context) => BlocProvider.of<ApplicationDetailsCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationDetailsCubit, ApplicationDetailsState>(
      listener: _listenThemesState,
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppToolbar(
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            name: context.l10n.feature_application_details_Toolbar_title,
            left: [
              Menu<ApplicationDetailFile>(
                name: 'File',
                items: ApplicationDetailFile.values,
                callback: _onFileListener,
              ),
              Menu<ApplicationDetailNavigate>(
                name: 'Navigate',
                items: ApplicationDetailNavigate.values,
                callback: _onNavigateListener,
              )
            ],
            right: [
              Menu<ApplicationDetailProfile>(
                iconData: Icons.account_circle,
                items: ApplicationDetailProfile.values,
                callback: _onProfile,
              ),
            ],
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
                          onOpenBranding: (String themeId) =>
                              _openTheme(context, getBloc(context).applicationId, themeId),
                          onMakeDefault: getBloc(context).tryMakeThemeAsDefault,
                          onDelete: getBloc(context).tryDeleteTheme,
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

    if (state.status == ApplicationDetailsStateStatus.deleted) {
      GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
    }
  }

  void _onFileListener(BuildContext context, ApplicationDetailFile applicationDetailFile) {
    switch (applicationDetailFile) {
      case ApplicationDetailFile.newApplication:
        GoRouter.of(context).goNamed(AppRoutInfo.applicationCreate.name);
      case ApplicationDetailFile.editApplication:
        GoRouter.of(context).goNamed(AppRoutInfo.applicationEdit.name, pathParameters: <String, String>{
          AppRoutInfo.keyApplicationId: getBloc(context).applicationId,
        });
      case ApplicationDetailFile.deleteApplication:
        getBloc(context).tryDeleteApplication();
    }
  }

  void _onNavigateListener(BuildContext context, ApplicationDetailNavigate navigate) {
    switch (navigate) {
      case ApplicationDetailNavigate.application:
        GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
    }
  }

  void _onProfile(BuildContext context, ApplicationDetailProfile profile) {
    switch (profile) {
      case ApplicationDetailProfile.logOut:
        BlocProvider.of<CommonBloc>(context).logout();
    }
  }

  void _onNewTheme(BuildContext context, String applicationId) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.themesCreate.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
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
