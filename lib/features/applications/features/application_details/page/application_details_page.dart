import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../bloc/application_details_cubit.dart';
import '../widgets/widgets.dart';

import 'application_details_screen.dart';
import 'application_themes_screen.dart';

class ApplicationDetailsPage extends StatefulWidget with MixinMessages {
  const ApplicationDetailsPage({
    super.key,
  });

  @override
  State<ApplicationDetailsPage> createState() => _ApplicationDetailsPageState();
}

class _ApplicationDetailsPageState extends State<ApplicationDetailsPage> with MixinMessages {
  late final bloc = BlocProvider.of<ApplicationDetailsCubit>(context);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<ApplicationDetailsCubit, ApplicationDetailsState>(
      listener: _listenThemesState,
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              context.l10n.feature_applications_title,
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            actions: [
              ThemeModeSwitcher(
                themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
                onThemeChange: (mode) => _onThemeModeChanged(context, mode),
              )
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    state.application?.name ?? '...',
                    style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.translate),
                  title: const Text('Translations'),
                  onTap: () => _openApplicationTranslations(context, bloc.applicationId),
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit'),
                  onTap: () => _openEditApplication(context, bloc.applicationId),
                ),
                ListTile(
                  iconColor: colorScheme.error,
                  textColor: colorScheme.error,
                  leading: const Icon(Icons.delete),
                  title: const Text('Delete'),
                  onTap: () => bloc.tryDeleteApplication(),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Applications'),
                  onTap: () => _openApplicationCollection(context),
                ),
                const Divider(),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),
          body: ResizableColumns(
            orientation: ResizableOrientation.horizontal,
            dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
            dividerThickness: 4,
            minChildSize: 100,
            children: [
              (context) => Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: ApplicationDetailsScreen(
                              application: state.application,
                              onOpenDefaultTheme: (String applicationId, String themeId) =>
                                  _openTheme(context, applicationId, themeId),
                              onDeploy: () => _navigateToDeployment(context, state.application!.id!),
                              onEnvironment: () => _navigateToChangeEnvConfiguration(context, state.application!.id!),
                            ),
                          )
                        ],
                      ),
                      FadeBackground(
                        visibility: state.deleteApplication != null,
                      ),
                      ConfirmationDialog(
                        visibility: state.deleteApplication != null,
                        title: 'Please Confirm',
                        description: 'Are you sure to delete the application?',
                        onConfirm: bloc.confirmDeleteApplication,
                        onDecline: bloc.declineDeleteApplication,
                      ),
                    ],
                  ),
              (context) => Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ConditionalProgressBar(
                              condition: !state.isProgress,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16, left: 16),
                                child: ApplicationThemesScreen(
                                  themes: state.themes,
                                  crossAxisCount: MediaQuery.of(context).size.width < 500 ? 1 : 2,
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
                      ),
                      FadeBackground(
                        visibility: state.deleteTheme != null,
                      ),
                      ConfirmationDialog(
                        visibility: state.deleteTheme != null,
                        title: 'Please Confirm',
                        description: 'Are you sure to delete the theme?',
                        onConfirm: bloc.confirmDeleteTheme,
                        onDecline: bloc.declineDeleteTheme,
                      ),
                    ],
                  ),
            ],
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
      showFailureMessage(context, state.error.toString());
    }

    if (state.status == ApplicationDetailsStateStatus.deleted) {
      GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
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

  Future<void> _showThemeInfo(BuildContext context, String applicationId, ThemeModel model) async {
    await showDialog<void>(
      context: context,
      builder: (context) => CredentialsDialog(
        themeId: model.id!,
        applicationId: applicationId,
      ),
    );
  }

  void _openApplicationTranslations(BuildContext context, String applicationId) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.translations.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
    );
  }

  void _openEditApplication(BuildContext context, String applicationId) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.applicationEdit.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
    );
  }

  void _logout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
    Navigator.pop(context);
  }

  void _openApplicationCollection(BuildContext context) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }

  Future<void> _navigateToChangeEnvConfiguration(BuildContext context, String applicationId) async {
    GoRouter.of(context).goNamed(
      AppRoutInfo.applicationDetailsEnv.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
    );
  }

  Future<void> _navigateToDeployment(BuildContext context, String applicationId) async {
    GoRouter.of(context).goNamed(
      AppRoutInfo.applicationDeployment.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
    );
  }
}
