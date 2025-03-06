import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/auth/auth.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../bloc/application_collection_cubit.dart';
import '../widgets/widgets.dart';

class ApplicationCollectionPage extends StatefulWidget {
  const ApplicationCollectionPage({
    super.key,
  });

  @override
  State<ApplicationCollectionPage> createState() => _ApplicationCollectionPageState();
}

class _ApplicationCollectionPageState extends State<ApplicationCollectionPage> with MixinMessages {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ApplicationCollectionCubit>(context);
    final textTheme = Theme.of(context).textTheme;

    return AuthReloginTrigger(
      onRelogin: bloc.load,
      child: BlocConsumer<ApplicationCollectionCubit, ApplicationCollectionState>(
        listener: (BuildContext context, ApplicationCollectionState state) {},
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
                  DrawerHeaderWidget(
                    user: state.user,
                  ),
                  const Spacer(),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Logout'),
                    onTap: () {
                      BlocProvider.of<CommonBloc>(context).logout();
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                if (state.error != null)
                  Center(
                    child: ErrorHolder(
                      error: state.error,
                      onRetry: bloc.load,
                    ),
                  ),
                if (state.error == null) ...[
                  Visibility(
                    visible: !state.isProgress,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        if (index == 0) {
                          return ItemOfListButton(
                            name: 'New application',
                            description: 'Create an application for initial configuration and style binding',
                            onTab: _onCreateApplication,
                          );
                        } else {
                          final application = state.applications[index - 1];
                          return ApplicationPreviewItem(
                            application: application.$1,
                            applicationValidateErrors: application.$2,
                            onDelete: bloc.tryDeleteApplication,
                            onEdit: _onEditApplication,
                            onOpen: _onOpenApplication,
                            incrementVersion: _incrementApplicationVersion,
                          );
                        }
                      },
                      itemCount: state.applications.length + 1,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.5,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: state.isProgress,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
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
              ],
            ),
          );
        },
      ),
    );
  }

  void _onEditApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).pushNamed(AppRoutInfo.applicationEdit.name, pathParameters: <String, String>{
      AppRoutInfo.keyApplicationId: applicationModel.id!,
    });
  }

  void _onCreateApplication() {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCreate.name);
  }

  void _incrementApplicationVersion(ApplicationModel applicationModel) {
    BlocProvider.of<ApplicationCollectionCubit>(context).incrementApplicationVersion(applicationModel);
  }

  void _onOpenApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.applicationDetails.name,
      pathParameters: <String, String>{AppRoutInfo.keyApplicationId: applicationModel.id!},
      extra: applicationModel,
    );
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
