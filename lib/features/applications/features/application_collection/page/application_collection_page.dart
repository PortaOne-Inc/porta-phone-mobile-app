import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../models/models.dart';
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

    return BlocConsumer<ApplicationCollectionCubit, ApplicationCollectionState>(
      listener: (BuildContext context, ApplicationCollectionState state) {},
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppToolbar(
            isVisibleProgress: state.isProgress,
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            name: context.l10n.feature_applications_title,
            right: [
              Menu<ApplicationDetailProfile>(
                iconData: Icons.account_circle,
                items: ApplicationDetailProfile.values,
                callback: _onProfile,
              ),
            ],
          ),
          body: Stack(
            children: [
              Visibility(
                visible: !state.isProgress,
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (ctx, index) => index == 0
                      ? ItemOfListButton(
                          name: 'New application',
                          description: 'Create an application for initial configuration and style binding',
                          onTab: _onCreateApplication,
                        )
                      : ApplicationPreviewItem(
                          application: state.applications[index - 1],
                          onDelete: bloc.tryDeleteApplication,
                          onEdit: _onEditApplication,
                          onOpen: _onOpenApplication,
                          incrementVersion: _incrementApplicationVersion,
                        ),
                  itemCount: state.applications.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
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
          ),
        );
      },
    );
  }

  void _onEditApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationEdit.name, pathParameters: <String, String>{
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

  void _onProfile(BuildContext context, ApplicationDetailProfile profile) {
    switch (profile) {
      case ApplicationDetailProfile.logOut:
        BlocProvider.of<CommonBloc>(context).logout();
    }
  }
}
