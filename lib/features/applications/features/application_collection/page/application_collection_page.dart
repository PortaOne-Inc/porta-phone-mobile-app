import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/core/core.dart';

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
    return BlocConsumer<ApplicationCollectionCubit, ApplicationCollectionState>(
      listener: (BuildContext context, ApplicationCollectionState state) {},
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state.isProgress,
            child: ApplicationCollectionToolbar(
              themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
              onLogout: () => _onLogout(context),
              onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            ),
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
                      ? ItemButton(
                          name: 'New application',
                          description: 'Create an application for initial configuration and style binding',
                          onTab: _createApplication,
                        )
                      : ApplicationPreviewItem(
                          application: state.applications[index - 1],
                          onDelete: BlocProvider.of<ApplicationCollectionCubit>(context).deleteApplication,
                          onEdit: _onEditApplication,
                          onOpen: _openApplication,
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
            ],
          ),
        );
      },
    );
  }

  void _onLogout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
  }

  void _onEditApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationEdit.name, pathParameters: <String, String>{
      AppRoutInfo.keyApplicationId: applicationModel.id!,
    });
  }

  void _createApplication() {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCreate.name);
  }

  void _incrementApplicationVersion(ApplicationModel applicationModel) {
    BlocProvider.of<ApplicationCollectionCubit>(context).incrementApplicationVersion(applicationModel);
  }

  void _openApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).pushNamed(
      AppRoutInfo.themes.name,
      extra: applicationModel,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationModel.id!,
      },
    );
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
