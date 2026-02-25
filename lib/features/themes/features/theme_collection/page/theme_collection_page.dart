import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../bloc/theme_collection_cubit.dart';
import '../widgets/widgets.dart';

import 'application_themes_screen.dart';

class ThemeCollectionDetailsPage extends StatefulWidget with MixinMessages {
  const ThemeCollectionDetailsPage({super.key});

  @override
  State<ThemeCollectionDetailsPage> createState() =>
      _ThemeCollectionDetailsPageState();
}

class _ThemeCollectionDetailsPageState extends State<ThemeCollectionDetailsPage>
    with MixinMessages {
  late final bloc = BlocProvider.of<ThemeCollectionCubit>(context);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<ThemeCollectionCubit, ThemeCollectionState>(
      listener: _listenThemesState,
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Themes',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              ThemeModeSwitcher(
                themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
                onThemeChange: (mode) => _onThemeModeChanged(context, mode),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
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
          body: ConditionalProgressBar(
            condition: !state.isProgress,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: ApplicationThemesScreen(
                themes: state.themes,
                crossAxisCount: 6,
                onNewBranding: () =>
                    _onNewTheme(context, state.application!.id!),
                onOpenBranding: (String themeId) => {},
                onMakeDefault: (it) {},
                onDelete: bloc.tryDeleteTheme,
                onShowInfo: (theme) =>
                    _showThemeInfo(context, state.application!.id!, theme),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listenThemesState(BuildContext context, ThemeCollectionState state) {
    if (state.status == ThemeCollectionStateStatus.error) {
      showFailureMessage(context, state.error ?? 'Unknown error');
    }

    if (state.status == ThemeCollectionStateStatus.deleted) {
      GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
    }

    if (state.deleteTheme != null) {
      showDialog<void>(
        context: context,
        builder: (context) => ConfirmationDialog(
          title: 'Remove application',
          description:
              'Are you sure to delete the application ${state.deleteApplication?.name}?',
          onConfirm: () {
            Navigator.pop(context);
            bloc.confirmDeleteTheme();
          },
          onDecline: () {
            Navigator.pop(context);
            bloc.declineDeleteTheme();
          },
        ),
      );
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

  Future<void> _showThemeInfo(
    BuildContext context,
    String applicationId,
    ThemeModel model,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) =>
          CredentialsDialog(themeId: model.id!, applicationId: applicationId),
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
}
