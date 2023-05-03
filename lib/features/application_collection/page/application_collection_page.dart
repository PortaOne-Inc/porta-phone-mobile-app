import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/app/application.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/mixin/mixin.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';
import 'package:webtrit_configurator/share/entity/entity.dart';

import '../../common/common.dart';
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
    return BlocConsumer<VendorCollectionCubit, ApplicationCollectionState>(
      listener: (BuildContext context, ApplicationCollectionState state) {},
      builder: (ctx, state) {
        return Scaffold(
          appBar: BaseToolBar(
            isVisibleProgress: state.isProgress,
            child: ApplicationCollectionToolbar(onLogout: () => _onLogout(context)),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
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
                      visibility: state.applications.isEmpty && !state.isProgress,
                      onPressed: () => _createApplication(),
                      title: context.l10n.feature_application_create_Text_no_applications_yet_title,
                      description: context.l10n.feature_application_create_Text_no_applications_yet_description,
                      button: context.l10n.feature_application_create,
                    ),
                    Visibility(
                      visible: state.applications.isNotEmpty && !state.isProgress,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (ctx, index) => ApplicationPreviewItem(
                          application: state.applications[index],
                          onDelete: BlocProvider.of<VendorCollectionCubit>(context).deleteApplication,
                          onEdit: _onEditApplication,
                          onOpen: _openApplication,
                          incrementVersion: _incrementApplicationVersion,
                        ),
                        itemCount: state.applications.length,
                        gridDelegate: _prepareGridDelegate(state.applications),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                      visible: state.applications.isNotEmpty && !state.isProgress,
                      child: Button(
                        title: context.l10n.feature_application_create,
                        onPressed: () => _createApplication(),
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

  SliverGridDelegateWithFixedCrossAxisCount _prepareGridDelegate(List<ApplicationModel> apps) {
    var crossAxisCount = 1;
    if (apps.length == 2) crossAxisCount = 2;
    if (apps.length > 2) crossAxisCount = 3;

    return SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: crossAxisCount == 1 ? 3 : 1.5);
  }

  void _onLogout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
  }

  void _onEditApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationEdit.name, params: <String, String>{
      AppRoutInfo.keyApplicationId: applicationModel.id!,
    });
  }

  void _createApplication() {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCreate.name);
  }

  void _incrementApplicationVersion(ApplicationModel applicationModel) {
    BlocProvider.of<VendorCollectionCubit>(context).incrementApplicationVersion(applicationModel);
  }

  void _openApplication(ApplicationModel applicationModel) {
    GoRouter.of(context).pushNamed(
      AppRoutInfo.themes.name,
      params: <String, String>{
        AppRoutInfo.keyApplicationId: applicationModel.id!,
      },
    );
  }
}
